/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '@ohos/hypium'
import * as certPromise from "./utils/certificate/publicCertificatePromise";
import * as certCallback from "./utils/certificate/publicCertificateCallback";

export default function certificateCRLJsunit() {
  describe('certificateCRLJsunit', () => {
    console.info("##########start certificateCRLJsunit##########");
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
     * @tc.number Security_Cert_Framework_CRL_Func_0100
     * @tc.name create X509CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_Cert_Framework_CRL_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .createX509CRLInstancePromise("der")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_Cert_Framework_CRL_Func_0200
     * @tc.name create X509CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_Cert_Framework_CRL_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certCallback
        .createX509CRLInstanceCallback("der")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_Cert_Framework_CRL_Func_0300
     * @tc.name create X509CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .createX509CRLInstancePromise("pem")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_0400
     * @tc.name create X509CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certCallback
        .createX509CRLInstanceCallback("pem")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_Cert_Framework_CRL_Func_0500
     * @tc.name Check isRevoked success for X509 CRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .createX509CRLInstancePromise("pem")
        .then((crlInstance) => {
          return certPromise.checkIsRevokedX509CRLPromise(crlInstance, "normal");
        })
        .then((result) => {
          expect(result == true).assertTrue();
        })
        .catch((err: Error) => {
          console.error("[promise] isRevoked failed! error is: " + err);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_Cert_Framework_CRL_Func_0600
     * @tc.name Check isRevoked failed for X509 CRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .createX509CRLInstancePromise("pem")
        .then((crlInstance) => {
          return certPromise.checkIsRevokedX509CRLPromise(crlInstance, "error");
        })
        .then((result) => {
          expect(result == false).assertTrue();
        })
        .catch((err: Error) => {
          console.error("[promise] isRevoked failed! error is: " + err);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_Cert_Framework_CRL_Func_0700
     * @tc.name Check getType for X509 CRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .getX509CRLInfoPromise("pem", "getType")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_0800
     * @tc.name Check getEncoded for X509 CRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .checkGetEncodedX509CRLPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_Cert_Framework_CRL_Func_0900
     * @tc.name Check getEncoded for X509 CRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certCallback
        .checkGetEncodedX509CRLCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_1000
     * @tc.name check getVersion for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM, Use the Promise Style of Interface
     */
    it("Security_Cert_Framework_CRL_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .getX509CRLInfoPromise("pem", "getVersion")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_1100
     * @tc.name check getIssuerName for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM, Use the Promise Style of Interface
     */
    it("Security_Cert_Framework_CRL_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .getX509CRLInfoPromise("pem", "getIssuerName")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_1200
     * @tc.name check getLastUpdate for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM, Use the Promise Style of Interface
     */
    it("Security_Cert_Framework_CRL_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .getX509CRLInfoPromise("pem", "getLastUpdate")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_1300
     * @tc.name check getNextUpdate for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM,Use the Promise Style of Interface
     */
    it("Security_Cert_Framework_CRL_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .getX509CRLInfoPromise("pem", "getNextUpdate")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_1400
     * @tc.name check getRevokedCert for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certCallback
        .checkGetRevokedCertX509CRLCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_1500
     * @tc.name check getRevokedCertWithCert for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM, Use the Promise Style of Interface
     */
    it("Security_Cert_Framework_CRL_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .createX509CRLInstancePromise("pem")
        .then((crlInstance) => {
          return certPromise.checkGetRevokedCertWithCertX509CRLPromise(crlInstance, "normal");
        })
        .then((result) => {
          expect(result != null).assertTrue();
        })
        .catch((err: Error) => {
          console.error("[promise] checkgetRevokedCertWithCertX509CRLPromis failed! error is: " +
            err);
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_1600
     * @tc.name check getRevokedCerts for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .checkGetRevokedCertsX509CRLPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_1700
     * @tc.name check getRevokedCerts for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certCallback
        .checkGetRevokedCertsX509CRLCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_1800
     * @tc.name check getTbsInfo for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .getX509CRLInfoPromise("pem", "getTbsInfo")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_Cert_Framework_CRL_Func_1900
     * @tc.name check getSignature for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .getX509CRLInfoPromise("pem", "getSignature")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_2000
     * @tc.name check getSignatureAlgName for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .getX509CRLInfoPromise("pem", "getSignatureAlgName")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_2100
     * @tc.name check getSignatureAlgOid for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .getX509CRLInfoPromise("pem", "getSignatureAlgOid")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_2200
     * @tc.name check getSignatureAlgParams for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .getX509CRLInfoPromise("pem", "getSignatureAlgParams")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_2300
     * @tc.name check getRevokedCert for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certCallback
        .checkGetRevokedCertX509CRLCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_2400
     * @tc.name Check verify for X509 CRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .verifyX509CRLPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_2500
     * @tc.name Check verify for X509 CRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certCallback
        .verifyX509CRLCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_2600
     * @tc.name Check verify for X509 CRL with invalid PublicKey
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certPromise
        .verifyX509CRLPromise("der", "NULL")
        .then((data) => {
          expect(data == 401).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_2700
     * @tc.name Check verify for X509 CRL with invalid PublicKey
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certCallback
        .verifyX509CRLCallback("der", "000")
        .then((data) => {
          expect(data == 401).assertTrue();
        })
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_2800
     * @tc.name check getSerialNumber for X509 CRL Entry
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certCallback
        .checkX509CRLEntryGetSerialNumberCallback("pem")
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
    /**
     * @tc.number Security_Cert_Framework_CRL_Func_2900
     * @tc.name check getRevokedCert for X509 CRL
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_Cert_Framework_CRL_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await certCallback
        .checkX509CRLGetRevokedCertCallback()
        .catch((err: Error) => {
          expect(null).assertFail();
        });
      done();
    });
  });
}