/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, afterEach, afterAll, beforeAll } from '@ohos/hypium';
import networkSecurity from '@ohos.net.networkSecurity';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import  buffer from '@ohos.buffer';

interface contentType1{
  data: string,
  type: number
}

interface contentType2{
  data: ArrayBuffer,
  type: number
}

const ExpectTrue = (n: boolean) => {
  try {
    expect(n).assertTrue();
  } catch (err) {
    console.info("expectInfo",`test failed`)
  }
}

let cc = "-----BEGIN CERTIFICATE-----\n" +
  "MIIDyTCCArGgAwIBAgIBATANBgkqhkiG9w0BAQwFADCBiDELMAkGA1UEBhMCRlIx\n" +
  "DzANBgNVBAgMBlJhZGl1czESMBAGA1UEBwwJU29tZXdoZXJlMRUwEwYDVQQKDAxF\n" +
  "eGFtcGxlIEluYy4xIDAeBgkqhkiG9w0BCQEWEWFkbWluQGV4YW1wbGUub3JnMRsw\n" +
  "GQYDVQQDDBJyYWRpdXMuZXhhbXBsZS5jb20wIBcNMjMwNDI4MDMyMTI2WhgPMjEy\n" +
  "MzA0MDQwMzIxMjZaMHQxCzAJBgNVBAYTAkZSMQ8wDQYDVQQIDAZSYWRpdXMxFTAT\n" +
  "BgNVBAoMDEV4YW1wbGUgSW5jLjEbMBkGA1UEAwwScmFkaXVzLmV4YW1wbGUuY29t\n" +
  "MSAwHgYJKoZIhvcNAQkBFhFhZG1pbkBleGFtcGxlLm9yZzCCASIwDQYJKoZIhvcN\n" +
  "AQEBBQADggEPADCCAQoCggEBAMDpntqbFIi7KVnYwFK6QYILAeFnbHGZRwGKos8p\n" +
  "c5Ci2uxwOhr+R02GyC9m1FNlikSKOHjaqrlHfM5sncfJV8JapGlDcNs5VE9CUrMp\n" +
  "NaqcV0RUT7+Xk6uNsUHSVRyhdOgQhzvkG8a/wvPL/6qGijk4RsbEDPTSheKh1Yoy\n" +
  "GPB6fyLDc8Lh+SlLl/4UCFrXHqXMH5xFxz0ivBu8eMdwJ/rw5RYXn8EoOYhDESSl\n" +
  "dElndJyIn3mZC5pLbYO9C7K09T8BS9u8E2l408LC3cQdp/TyJFNDNsFcyv0Vb0uw\n" +
  "Jvh9zBoFJfnC3gHLzDap/S9wNJU6kVIZQw5T1M/cOh4AvjsCAwEAAaNPME0wEwYD\n" +
  "VR0lBAwwCgYIKwYBBQUHAwEwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL3d3dy5l\n" +
  "eGFtcGxlLmNvbS9leGFtcGxlX2NhLmNybDANBgkqhkiG9w0BAQwFAAOCAQEAtv7J\n" +
  "AhPENiW4oTp2BFJ3WcAy2EujWYeo8xHFqDWPptL4FgeEJoiBzDXjHtkJsdnqHpp8\n" +
  "NjEAwHPEXf7mUjxfABhhMOdqJIw367poWA5UI7DvRaniDGELijJ4uKS6gBvYCOFf\n" +
  "sGT3YxQR8UnV5o/JyrTXzZQrPBkBSsOdSUpIHmNEBEOv4JefTQaEXwJVKZ/db0tP\n" +
  "AzXvco5BuFWidGuURWC4kaUpQi0fwWp+jTBmdoL7z0wwlV/iHsOcVRn0OgBXXA/G\n" +
  "A2GFkAXVDIJ5fgBV5tAtqNmflDzfN/CZh/lRtuoxdJAZNEGjyNX05IokS0XsO1oF\n" +
  "ep/9Ibvk/wgTdMATLg==\n" +
  "-----END CERTIFICATE-----"

let cert1: contentType1 = {
  data: cc,
  type: networkSecurity.CertType.CERT_TYPE_PEM
}

let cert:contentType1 = {
  data: "-----BEGIN CERTIFICATE-----\n" +
  "MIIDXzCCAkegAwIBAgILBAAAAAABIVhTCKIwDQYJKoZIhvcNAQELBQAwTDEgMB4G\n" +
  "A1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNp\n" +
  "Z24xEzARBgNVBAMTCkdsb2JhbFNpZ24wHhcNMDkwMzE4MTAwMDAwWhcNMjkwMzE4\n" +
  "MTAwMDAwWjBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEG\n" +
  "A1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjCCASIwDQYJKoZI\n" +
  "hvcNAQEBBQADggEPADCCAQoCggEBAMwldpB5BngiFvXAg7aEyiie/QV2EcWtiHL8\n" +
  "RgJDx7KKnQRfJMsuS+FggkbhUqsMgUdwbN1k0ev1LKMPgj0MK66X17YUhhB5uzsT\n" +
  "gHeMCOFJ0mpiLx9e+pZo34knlTifBtc+ycsmWQ1z3rDI6SYOgxXG71uL0gRgykmm\n" +
  "KPZpO/bLyCiR5Z2KYVc3rHQU3HTgOu5yLy6c+9C7v/U9AOEGM+iCK65TpjoWc4zd\n" +
  "QQ4gOsC0p6Hpsk+QLjJg6VfLuQSSaGjlOCZgdbKfd/+RFO+uIEn8rUAVSNECMWEZ\n" +
  "XriX7613t2Saer9fwRPvm2L7DWzgVGkWqQPabumDk3F2xmmFghcCAwEAAaNCMEAw\n" +
  "DgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8wHQYDVR0OBBYEFI/wS3+o\n" +
  "LkUkrk1Q+mOai97i3Ru8MA0GCSqGSIb3DQEBCwUAA4IBAQBLQNvAUKr+yAzv95ZU\n" +
  "RUm7lgAJQayzE4aGKAczymvmdLm6AC2upArT9fHxD4q/c2dKg8dEe3jgr25sbwMp\n" +
  "jjM5RcOO5LlXbKr8EpbsU8Yt5CRsuZRj+9xTaGdWPoO4zzUhw8lo/s7awlOqzJCK\n" +
  "6fBdRoyV3XpYKBovHd7NADdBj+1EbddTKJd+82cEHhXXipa0095MJ6RMG3NzdvQX\n" +
  "mcIfeg7jLQitChws/zyrVQ4PkX4268NXSb7hLi18YIvDQVETI53O9zJrlAGomecs\n" +
  "Mx86OyXShkDOOyyGeMlhLxS67ttVb9+E7gUJTb0o2HLO02JQZR7rkpeDMdmztcpH\n" +
  "WD9f\n" +
  "-----END CERTIFICATE-----\n",
  type:networkSecurity.CertType.CERT_TYPE_PEM
}

let caCert: contentType2 = {
  data: new ArrayBuffer(10),
  type: networkSecurity.CertType.CERT_TYPE_DER
}

let certError:contentType1 = {
  data: "-----BEGIN CERTIFICATE-----\n" +
  "MIIDXzCCAkegAwIBAgILBAAAAAABIVhTCKIwDQYJKoZIhvcNAQELBQAwTDEgMB4G\n" +
  "A1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNp\n" +
  "Z24xEzARBgNVBAMTCkdsb2JhbFNpZ24wHhcNMDkwMzE4MTAwMDAwWhcNMjkwMzE4\n" +
  "MTAwMDAwWjBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEG\n" +
  "A1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjCCASIwDQYJKoZI\n" +
  "hvcNAQEBBQADggEPADCCAQoCggEBAMwldpB5BngiFvXAg7aEyiie/QV2EcWtiHL8\n" +
  "RgJDx7KKnQRfJMsuS+FggkbhUqsMgUdwbN1k0ev1LKMPgj0MK66X17YUhhB5uzsT\n" +
  "gHeMCOFJ0mpiLx9e+pZo34knlTifBtc+ycsmWQ1z3rDI6SYOgxXG71uL0gRgykmm\n" +
  "KPZpO/bLyCiR5Z2KYVc3rHQU3HTgOu5yLy6c+9C7v/U9AOEGM+iCK65TpjoWc4zd\n" +
  "QQ4gOsC0p6Hpsk+QLjJg6VfLuQSSaGjlOCZgdbKfd/+RFO+uIEn8rUAVSNECMWEZ\n" +
  "RUm7lgAJQayzE4aGKAczymvmdLm6AC2upArT9fHxD4q/c2dKg8dEe3jgr25sbwMp\n" +
  "Mx86OyXShkDOOyyGeMlhLxS67ttVb9+E7gUJTb0o2HLO02JQZR7rkpeDMdmztcpH\n" +
  "WD9f\n" +
  "-----END CERTIFICATE-----",
  type: networkSecurity.CertType.CERT_TYPE_PEM
}

export default function NetworkManagerMulticastSSLTest() {
  describe("NetworkManagerMulticastSSLTest", ()=>{

    beforeAll(async ()=>{
      let pathDir = "/data/storage/el2/base/files/";
      let filePath = pathDir + "GlobalSign.der";
      console.info('readxx' + filePath);
      try {
        let file = await fs.open(filePath, fs.OpenMode.READ_WRITE);
        console.info(`readxx the file is ${JSON.stringify(file.fd)}`);
        let buf = new ArrayBuffer(4096);
        let readLen = await fs.read(file.fd, buf);
        console.info("readxx file data succeed");
        console.info("readxx"+ String.fromCharCode(...new Uint8Array(buf.slice(0, readLen))));
        caCert.data = buffer.from(buf.slice(0, readLen)).buffer
        console.info('readxx', "success buffer");
        fs.closeSync(file);
      } catch (err) {
        console.info(`readxx Open failed errInfo is ${JSON.stringify(err)}`);
      }
    })

    afterEach(async () => {
      await sleep(1000);
    })
    type sleepFn = (a: number) => Promise<null>;
    const sleep: sleepFn = (timeout) => {
      return new Promise(resolve => {
        setTimeout(() => {
          resolve(null);
        }, timeout)
      })
    }

    let expectFalse = ()=> {
      try {
        expect().assertFail();
      } catch (err) {
        console.info('assertion failure');
      }
    }

    /**
     * @tc.number: SUB_Telephony_Netstack_SSL_CertVerify_Xts_0100
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 0
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_SSL_CertVerify_Xts_0100", 0, async (done:Function)=>{
      let caseName = "SUB_Telephony_Netstack_SSL_CertVerify_Xts_0100";
      console.info('certpem', JSON.stringify(cert), JSON.stringify(caCert));
      try {
        networkSecurity.certVerification(cert).then((result: number) => {
          console.info(`${caseName} certVerification success, data: ${JSON.stringify(result)}`);
          expect(result == 0).assertTrue();
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} certVerification failed, error: ${JSON.stringify(error)}`);
          expectFalse();
          done();
        })
      } catch (error) {
        console.info(`${caseName} certVerification failed, error: ${JSON.stringify(error)}`);
      }
    })

    /**
     * @tc.number: SUB_Telephony_Netstack_SSL_CertVerify_Xts_0200
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_SSL_CertVerify_Xts_0200", 0, async (done:Function)=>{
      let caseName = "SUB_Telephony_Netstack_SSL_CertVerify_Xts_0200";
      networkSecurity.certVerification(null).then((result: number) => {
        console.info(`${caseName} certVerification success, data: ${JSON.stringify(result)}`);
        expectFalse();
        done();
      }).catch((error: BusinessError) => {
        console.info(`${caseName} certVerification failed, error: ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      })
    })

    /**
     * @tc.number: SUB_Telephony_Netstack_SSL_CertVerify_Xts_0300
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_SSL_CertVerify_Xts_0300", 0, async (done:Function)=>{
      let caseName = "SUB_Telephony_Netstack_SSL_CertVerify_Xts_0300";
      networkSecurity.certVerification(undefined).then((result: number) => {
        console.info(`${caseName} certVerification success, data: ${JSON.stringify(result)}`);
        expectFalse();
        done();
      }).catch((error: BusinessError) => {
        console.info(`${caseName} certVerification failed, error: ${JSON.stringify(error)}`);
        expect(error.code === 401).assertTrue();
        done();
      })
    })

    /**
     * @tc.number: SUB_Telephony_Netstack_SSL_CertVerify_Xts_0400
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_SSL_CertVerify_Xts_0400", 0, async (done:Function)=>{
      let caseName = "SUB_Telephony_Netstack_SSL_CertVerify_Xts_0400";
      networkSecurity.certVerification(certError).then((result: number) => {
        console.info(`${caseName} certVerification success, data: ${JSON.stringify(result)}`);
        expectFalse();
        done();
      }).catch((error: BusinessError) => {
        console.info(`${caseName} certVerification failed, error: ${JSON.stringify(error)}`);
        expect(error.code == 2305001).assertTrue();
        done();
      })
    })

    /**
     * @tc.number: SUB_Telephony_Netstack_SSL_CertVerify_Xts_0500
     * @tc.name: websocket::connect
     * @tc.desc: Test connect property
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_Telephony_Netstack_SSL_CertVerify_Xts_0500", 0, async (done:Function)=>{
      let caseName = "SUB_Telephony_Netstack_SSL_CertVerify_Xts_0500";
      console.info('xxxxxxx', `${JSON.stringify(networkSecurity.CertType.CERT_TYPE_DER)}`);
      try {
        let result = networkSecurity.certVerificationSync(caCert);
        console.info(`${caseName} certVerification success, data: ${JSON.stringify(result)}`);
        expect(result == 0).assertTrue();
        done();
      } catch (error) {
        console.info(`${caseName} certVerification failed, error: ${JSON.stringify(error)}`);
        expectFalse();
        done();
      }
    })
  })
}

