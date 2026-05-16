/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from "@ohos/hypium";
import cert from '@ohos.security.cert';
import { cryptoFramework } from '@kit.CryptoArchitectureKit';
import {
  p12_ecc_cert,
  p12_expired_cert,
  p12_max_other,
  p12_priKey_usage_ex,
  p12_rsa_cert,
  p12_rsa_error_format,
  vectorP12Data } from './utils/certificate/p12';
import { BusinessError } from '@kit.BasicServicesKit';
import { taskpool, util } from '@kit.ArkTS';


@Concurrent
async function doPkcs12Stub(p12: number[]): Promise<boolean> {
  let timeFlag: boolean = false;
  let timeoutId:number = 0;
  let intervalTime = 10000;
  let ret: boolean = true;
  setInterval(() => {
    timeFlag = true;
  }, 3600000 * 6 * 3);
  while (!timeFlag) {
    try {
      let p12_cert: Uint8Array = new Uint8Array(p12_max_other);
      let conf: cert.Pkcs12ParsingConfig = {
        password: "123456",
        needsOtherCerts: true
      };
      let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
      if (p12.privateKey) {
        console.info("#################### pri:" + p12.privateKey.toString())
      }
      if (p12.cert) {
        console.info("#################### cert:" + p12.cert.toString())
      }
      if (p12.otherCerts) {
        console.info("#################### other:" + p12.otherCerts.length)
      }
      await new Promise<void>((resolve, reject) => {
        timeoutId = setTimeout(() => {
          resolve()
        }, intervalTime)
      }).then(undefined, (error: Object) =>{});
      clearTimeout(timeoutId);
    } catch (error) {
      console.error(`doPkcs12Stub “${error}“, error code: ${error.code}`);
      return false;
    }
  }

  return ret;
}

export default function certFrameworkParseP12CertTestUnit() {
  describe("certFrameworkParseP12CertTestUnit", () => {
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
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_0100
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_0100
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12Cert: vectorP12Data = p12_rsa_cert;
        let p12_cert: Uint8Array = new Uint8Array(p12Cert.p12Cert);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
        };
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        let priKey = p12.privateKey;
        expect(priKey).assertEqual(p12Cert.priKey);
        if (p12.cert) {
          let pub: cryptoFramework.PubKey = p12.cert.getPublicKey();
          await p12.cert.verify(pub).then(() => {
            expect(null).assertNull();
          }).catch((error: BusinessError) => {
            console.error('verify failed, errCode: ' + error.code + ', errMsg: ' + error.message);
            expect(null).assertTrue();
          });
        }
        expect(p12.otherCerts).assertEqual(undefined);
      } catch (error) {
        console.error(`ParseP12Cert_Func_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_0200
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_0200
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_ecc_cert);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsCert: true,
          needsPrivateKey: false,
          needsOtherCerts: false,
        };
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        if (p12.cert) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`ParseP12Cert_Func_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_0300
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_0300
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_rsa_cert.p12Cert);
        let type = cert.EncodingBaseFormat.PEM;
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsCert: false,
          needsPrivateKey: true,
          privateKeyFormat: type,
          needsOtherCerts: false,
        };
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        if (p12.privateKey) {
          expect(p12.privateKey).assertEqual(p12_rsa_cert.priKey);
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`ParseP12Cert_Func_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_0400
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_0400
     * @tc.desc   The X509 Cert Format is DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_rsa_cert.p12Cert);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsCert: false,
          needsPrivateKey: true,
          privateKeyFormat: cert.EncodingBaseFormat.DER,
          needsOtherCerts: false,
        };
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        let base64 = new util.Base64Helper();
        if (p12.privateKey instanceof Uint8Array) {
          let priKeyString = base64.encodeToStringSync(p12.privateKey);
          expect(priKeyString).assertEqual(p12_rsa_cert.priDer);
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`ParseP12Cert_Func_0400 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_0500
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_0500
     * @tc.desc   The X509 Cert Format is DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_rsa_cert.p12Cert);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsCert: false,
          needsPrivateKey: false,
          privateKeyFormat: cert.EncodingBaseFormat.DER,
          needsOtherCerts: true,
        };
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        if (!p12.otherCerts) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`ParseP12Cert_Func_0500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_0600
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_0600
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_max_other);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsCert: false,
          needsPrivateKey: false,
          privateKeyFormat: cert.EncodingBaseFormat.PEM,
          needsOtherCerts: true,
        };
        let otherCertsNumber: number = 36;
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        if (p12.otherCerts) {
          expect(p12.otherCerts.length).assertEqual(otherCertsNumber);
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`ParseP12Cert_Func_0600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_0700
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_0700
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_rsa_error_format);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsCert: true,
          needsPrivateKey: true,
          needsOtherCerts: true,
        };
        cert.parsePkcs12(p12_cert, conf);
      } catch (error) {
        console.error(`ParseP12Cert_Func_0700 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_0800
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_0800
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_max_other);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsCert: true
        };
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        if (p12.cert) {
          p12.cert.getKeyUsage()
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`ParseP12Cert_Func_0800 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_0900
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_0900
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_priKey_usage_ex);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsCert: true
        };
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        if (p12.cert) {
          let key_usage: cert.DataBlob = p12.cert.getKeyUsage();
          expect(key_usage.data.byteLength).assertEqual(4);
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`ParseP12Cert_Func_0900 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_1000
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_1000
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_expired_cert);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsCert: true
        };
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        if (p12.cert) {
          let data = "241125160000Z";
          p12.cert.checkValidityWithDate(data);
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`ParseP12Cert_Func_1000 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030004);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_1100
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_1100
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_expired_cert);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "654321"
        };
        cert.parsePkcs12(p12_cert, conf);
      } catch (error) {
        console.error(`ParseP12Cert_Func_1100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_1200
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_1200
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_expired_cert);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsCert: true
        };
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        if (p12.privateKey) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`ParseP12Cert_Func_1200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_1300
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_1300
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12_expired_cert);
        cert.parsePkcs12(p12_cert, '');
      } catch (error) {
        console.error(`ParseP12Cert_Func_1300 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_ParseP12Cert_Func_1400
     * @tc.number SUB_Security_Cert_Framework_ParseP12Cert_Func_1400
     * @tc.desc   The X509 Cert Format is PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_ParseP12Cert_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let p12_cert: Uint8Array = new Uint8Array();
        cert.parsePkcs12(p12_cert, '123456');
      } catch (error) {
        console.error(`ParseP12Cert_Func_1300 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

  });
}
