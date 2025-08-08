/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import cert from '@ohos.security.cert';
import { cryptoFramework } from "@kit.CryptoArchitectureKit";
import { crlCert, crlPem,
  crlRevokedCert,
  crlSignPubKey,
  revokedCertPem, rsaPem4096, rsaPem4096_other, } from "./utils/certificate/certX509Pem";
import { stringTouInt8Array } from "./utils/common/commonFunction";

export default function certFrameworkResultCodeTestUnit() {
  describe("certFrameworkResultCodeTestUnit", () => {
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0100
     * @tc.name parse cert and verify, Promise style.
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0100", 0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let pubKey: cryptoFramework.PubKey = {} as cryptoFramework.PubKey;
        await x509Cert.verify(pubKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0100
     * @tc.name parse cert and verify, CallBack style.
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0200", 0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        let pubKey: cryptoFramework.PubKey = {} as cryptoFramework.PubKey;
        x509Cert.verify(pubKey, (err) => {});
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0200 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0300
     * @tc.name parse cert and verify, CallBack style.
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0300", 0, async (done: Function) => {
      try {
        let encodingBlob1: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob1);
        let encodingBlob2: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096_other),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
        let pubKey: cryptoFramework.PubKey = x509Cert2.getPublicKey();
        x509Cert1.verify(pubKey, (err) => {
          if (err) {
            console.error('verify failed, errCode: ' + err.code + ', errMsg: ' + err.message);
            expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
          } else {
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0300 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0400
     * @tc.name parse cert and verify, Promise style.
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0400", 0, async (done: Function) => {
      try {
        let encodingBlob1: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob1);

        let encodingBlob2: cert.EncodingBlob = {
          data: stringTouInt8Array(rsaPem4096_other),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert2: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
        let pubKey: cryptoFramework.PubKey = x509Cert2.getPublicKey();
        await x509Cert1.verify(pubKey);
        expect(null).assertFail();
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0400 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0500
     * @tc.name parse crl, Promise style.
     * @tc.desc The X509 Crl Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0500", 0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(crlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl: cert.X509Crl = await cert.createX509Crl(encodingBlob);
        let serialNumber = 1000;
        let crlEntry: cert.X509CrlEntry = x509Crl.getRevokedCert(serialNumber);
        let data: cert.EncodingBlob = await crlEntry.getEncoded();
        console.info("########### data:" + data.data);
        console.info("########### format:" + data.encodingFormat);
        expect(null).assertNull();
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0600
     * @tc.name parse crl, Callback style.
     * @tc.desc The X509 Crl Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0600", 0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(crlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl: cert.X509Crl = await cert.createX509Crl(encodingBlob);
        let serialNumber = 1000;
        let crlEntry: cert.X509CrlEntry = x509Crl.getRevokedCert(serialNumber);
        let serialNumberRes = crlEntry.getSerialNumber();
        let issuer: cert.DataBlob = crlEntry.getCertIssuer();
        console.info("########### issuer:" + issuer.data);
        crlEntry.getEncoded( (err, data) => {
          console.info("########### data:" + data.data);
          console.info("########### format:" + data.encodingFormat);
        });
        expect(serialNumber).assertEqual(serialNumberRes);
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0700
     * @tc.name parse CRL, Callback style.
     * @tc.desc The X509 CRL Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0700", 0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(crlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        let serialNumber = BigInt('0x03e8');
        let crlEntry: cert.X509CRLEntry = x509Crl.getRevokedCert(serialNumber);
        let serialNumberRes = crlEntry.getSerialNumber();
        let issuer: cert.DataBlob = crlEntry.getCertIssuer();
        console.info("########### issuer:" + issuer.data);
        crlEntry.getEncoded( (err, data) => {
          console.info("########### data:" + data.data);
          console.info("########### format:" + data.encodingFormat);
        });
        expect(serialNumber).assertEqual(serialNumberRes);
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0700 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0800
     * @tc.name parse CRL, Promise style.
     * @tc.desc The X509 CRL Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0800", 0, async (done: Function) => {
      try {
        let encodingBlob: cert.EncodingBlob = {
          data: stringTouInt8Array(crlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl: cert.X509CRL = await cert.createX509CRL(encodingBlob);
        let crlEntrys: cert.X509CRLEntry[] = await x509Crl.getRevokedCerts();
        for (let crlEntry of crlEntrys) {
          let issuer: cert.DataBlob = crlEntry.getCertIssuer();
          console.info("########### issuer:" + issuer.data);
          let data: cert.EncodingBlob = await crlEntry.getEncoded();
          console.info("########### data:" + data.data);
          console.info("########### format:" + data.encodingFormat);
        }
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0800 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_0900
     * @tc.name parse Crl, Promise style.
     * @tc.desc The X509 Crl Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_0900", 0, async (done: Function) => {
      try {
        let encodingBlob1: cert.EncodingBlob = {
          data: stringTouInt8Array(crlPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl: cert.X509Crl = await cert.createX509Crl(encodingBlob1);
        let encodingBlob2: cert.EncodingBlob = {
          data: stringTouInt8Array(revokedCertPem),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
        let ret: boolean = x509Crl.isRevoked(x509Cert);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_0900 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_1000
     * @tc.name parse Crl, Promise style.
     * @tc.desc The X509 Crl Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_1000", 0, async (done: Function) => {
      try {
        let encodingBlob1: cert.EncodingBlob = {
          data: stringTouInt8Array(crlCert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl: cert.X509Crl = await cert.createX509Crl(encodingBlob1);
        let encodingBlob2: cert.EncodingBlob = {
          data: stringTouInt8Array(crlRevokedCert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
        let ret: boolean = x509Crl.isRevoked(x509Cert);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_1000 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_1100
     * @tc.name parse Crl, Promise style.
     * @tc.desc The X509 Crl Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_1100", 0, async (done: Function) => {
      try {
        let encodingBlob1: cert.EncodingBlob = {
          data: stringTouInt8Array(crlCert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl: cert.X509Crl = await cert.createX509Crl(encodingBlob1);
        let encodingBlob2: cert.EncodingBlob = {
          data: stringTouInt8Array(crlSignPubKey),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
        let pubKey: cryptoFramework.PubKey = x509Cert.getPublicKey();
        await x509Crl.verify(pubKey);
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_1100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_ErrorCode_Func_1200
     * @tc.name parse Crl, Callback style.
     * @tc.desc The X509 Crl Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_ErrorCode_Func_1200", 0, async (done: Function) => {
      try {
        let encodingBlob1: cert.EncodingBlob = {
          data: stringTouInt8Array(crlCert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Crl: cert.X509Crl = await cert.createX509Crl(encodingBlob1);
        let encodingBlob2: cert.EncodingBlob = {
          data: stringTouInt8Array(crlSignPubKey),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob2);
        let pubKey: cryptoFramework.PubKey = x509Cert.getPublicKey();
        x509Crl.verify(pubKey, (err) => {
          if (err) {
            console.info("#################### filed.")
            expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
          } else {
            expect(null).assertFail();
          }
        });
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_ErrorCode_Func_1200 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

  });
}