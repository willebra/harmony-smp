import {Component, Inject, ViewChild} from '@angular/core';
import {MAT_DIALOG_DATA, MatDialogRef, MatSlideToggleChange} from '@angular/material';
import {FormBuilder, FormControl, FormGroup, ValidationErrors, ValidatorFn, Validators} from '@angular/forms';
import {UserService} from '../user.service';
import {Role} from '../../security/role.model';
import {UserRo} from '../user-ro.model';
import {SearchTableEntityStatus} from '../../common/search-table/search-table-entity-status.model';
import {AlertService} from '../../alert/alert.service';
import {CertificateService} from '../certificate.service';
import {CertificateRo} from "../certificate-ro.model";
import {DatePipe} from "../../custom-date/date.pipe";

@Component({
  selector: 'user-details-dialog',
  templateUrl: './user-details-dialog.component.html',
  styleUrls: ['user-details-dialog.component.css']
})
export class UserDetailsDialogComponent {

  static readonly NEW_MODE = 'New User';
  static readonly EDIT_MODE = 'User Edit';

  readonly emailPattern = '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}';
  readonly passwordPattern = '^(?=.*[A-Z])(?=.*[ !#$%&\'()*+,-./:;<=>?@\\[^_`{|}~\\\]"])(?=.*[0-9])(?=.*[a-z]).{8,32}$';
  readonly dateFormat: string = 'yyyy-MM-dd HH:mm:ssZ';

  editMode: boolean;
  formTitle: string;
  userRoles = [];
  existingRoles = [];
  userForm: FormGroup;
  current: UserRo;

  @ViewChild('fileInput')
  private fileInput;

  private passwordConfirmationValidator: ValidatorFn = (control: FormGroup): ValidationErrors | null => {
    const userToggle = control.get('userToggle');
    const password = control.get('password');
    const confirmation = control.get('confirmation');
    return userToggle && password && confirmation && userToggle.value && password.value !== confirmation.value ? { confirmationMatch: true } : null;
  };

  private atLeastOneToggleCheckedValidator: ValidatorFn = (control: FormGroup): ValidationErrors | null => {
    const userToggle = control.get('userToggle');
    const certificateToggle = control.get('certificateToggle');
    return userToggle && certificateToggle && !userToggle.value && !certificateToggle.value ? { userDetailsOrCertificateRequired: true} : null;
  };

  private certificateValidator: ValidatorFn = (control: FormGroup): ValidationErrors | null => {
    const certificateToggle = control.get('certificateToggle');
    const subject = control.get('subject');
    const validFrom = control.get('validFrom');
    const validTo = control.get('validTo');
    const issuer = control.get('issuer');
    const serialNumber = control.get('serialNumber');
    return certificateToggle && subject && validFrom && validTo && issuer && serialNumber
        && certificateToggle.value && !(subject.value && validFrom.value && validTo.value && issuer.value && serialNumber.value) ? { certificateDetailsRequired: true} : null;
  };

  constructor(private dialogRef: MatDialogRef<UserDetailsDialogComponent>,
              private userService: UserService,
              private certificateService: CertificateService,
              private alertService: AlertService,
              private datePipe: DatePipe,
              @Inject(MAT_DIALOG_DATA) public data: any,
              private fb: FormBuilder) {
    this.editMode = data.edit;
    this.formTitle = this.editMode ?  UserDetailsDialogComponent.EDIT_MODE: UserDetailsDialogComponent.NEW_MODE;

    this.current = this.editMode
      ? {
        ...data.row,
        password: '', // ensures the user password is cleared before editing
        confirmation: '',
        certificate: {
          subject: data.row.subject,
          validFrom: data.row.validFrom,
          validTo: data.row.validTo,
          issuer: data.row.issuer,
          serialNumber: data.row.serialNumber,
        }
      }: {
        active: true,
        username: '',
        emailAddress: '',
        password: '',
        confirmation: '',
        role: '',
        status: SearchTableEntityStatus.NEW,
        statusPassword: SearchTableEntityStatus.NEW,
        certificate: {},
      };

    const userDetailsToggled: boolean = this.current && !!this.current.username;
    const passwordToggle: boolean = !this.editMode;


    this.userForm = fb.group({
      // common values
      'active': new FormControl({ value: this.current.active},[]),
      'emailAddress': new FormControl({ value:this.current.emailAddress },[ Validators.pattern(this.emailPattern)]),
      'role': new FormControl({ value: this.current.role }, Validators.required),
      // username/password authentication
      'userToggle': new FormControl(userDetailsToggled),
      'passwordToggle': new FormControl(passwordToggle),
      'username': new FormControl({ value: this.current.username, disabled: this.editMode || !userDetailsToggled }, this.editMode ? Validators.nullValidator : null),
      'password': new FormControl({ value: this.current.password, disabled: !userDetailsToggled && !passwordToggle},
        [Validators.required, Validators.pattern(this.passwordPattern)]),
      'confirmation': new FormControl({ value: this.current.password, disabled: !userDetailsToggled  && !passwordToggle},
        Validators.pattern(this.passwordPattern)),
      // certificate authentication
      'certificateToggle': new FormControl(this.current && this.current.certificate && !!this.current.certificate.subject),
      'subject': new FormControl({ value: this.current.certificate.subject, disabled: true }, Validators.required),
      'validFrom': new FormControl({ value: this.current.certificate.validFrom, disabled: true }, Validators.required),
      'validTo': new FormControl({ value: this.current.certificate.validTo, disabled: true }, Validators.required),
      'issuer': new FormControl({ value: this.current.certificate.issuer, disabled: true }, Validators.required),
      'serialNumber': new FormControl({ value: this.current.certificate.serialNumber, disabled: true }, Validators.required),
      'certificateId': new FormControl({ value: this.current.certificate.serialNumber, disabled: true }, Validators.required),
    }, {
      validator: [this.passwordConfirmationValidator, this.atLeastOneToggleCheckedValidator, this.certificateValidator]
    });


    this.userService.getUserRoles$().subscribe(userRoles => {
      this.userRoles = userRoles.json();
      this.existingRoles = this.editMode
        ? this.getAllowedRoles(this.userRoles, this.current.role)
        : this.userRoles;
    });
  }

  submitForm() {
    this.dialogRef.close(true);
  }

  uploadCertificate(event) {
    const file = event.target.files[0];

    const reader = new FileReader();
    reader.onload = (e) => {
      this.certificateService.uploadCertificate$(reader.result).subscribe((res: CertificateRo) => {
            this.userForm.patchValue({
              'subject': res.subject,
              'validFrom': this.datePipe.transform(res.validFrom.toString(), this.dateFormat),
              'validTo': this.datePipe.transform(res.validTo.toString(), this.dateFormat),
              'issuer': res.issuer,
              'serialNumber': res.serialNumber
            });
          },
          err => {
            this.alertService.exception('Error uploading certificate file ' + file.name, err);
          }
        );
    };
    reader.onerror = (err) => {
      this.alertService.exception('Error reading certificate file ' + file.name, err);
    };

    reader.readAsBinaryString(file);
  }

  onUserToggleChanged({checked}: MatSlideToggleChange) {
    const action = checked ? 'enable' : 'disable';
    this.userForm.get('username')[checked && !this.editMode ? 'enable' : 'disable']();
    //this.userForm.get('role')[action]();
    //this.userForm.get('password')[action]();
    //this.userForm.get('confirmation')[action]();
  }

  onPasswordToggleChanged({checked}: MatSlideToggleChange) {
    const action = checked ? 'enable' : 'disable';
    this.userForm.get('password')[action]();
    this.userForm.get('confirmation')[action]();
  }



  getCurrent(): UserRo {
    // update data
    return this.current;
  }

  // filters out roles so that the user cannot change from system administrator to the other roles or vice-versa
  private getAllowedRoles(allRoles, userRole) {
    if (userRole === Role.SYSTEM_ADMIN) {
      return [Role.SYSTEM_ADMIN];
    } else {
      return allRoles.filter(role => role !== Role.SYSTEM_ADMIN);
    }
  }
}
