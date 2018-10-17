import {Injectable} from '@angular/core';
import {Observable} from 'rxjs';
import {CertificateRo} from './certificate-ro.model';
import {HttpClient} from '@angular/common/http';

@Injectable()
export class CertificateService {

  constructor(private http: HttpClient) {}

  uploadCertificate$(payload, username: string): Observable<CertificateRo> {
    return this.http.put<CertificateRo>(`rest/user/${username}/certificate`, payload);
  }



  onUpload(file) {

    return this.http.post<CertificateRo>('rest/user/certdata',file, )
  }
}
