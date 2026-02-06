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

import { describe, beforeAll, afterEach, it, TestType, Size, Level, expect } from "@ohos/hypium";
import * as certPromise from "./utils/certificate/publicCertificatePromise";
import * as certCallback from "./utils/certificate/publicCertificateCallback";

export default function CertificateJsunit() {
  describe("CertificateJsunit", function () {
    console.info("##########start CertificateJsunit##########");
    beforeAll(function () {});
    afterEach(function () {});

    /**
     * @tc.number Security_crypto_framework_X509Cert_0100
     * @tc.name The X509 certificate list can be created for encryption and decryption.
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_crypto_framework_X509Cert_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .createX509CertInstancePromise("der")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });

      await certCallback
        .createX509CertInstanceCallback("der")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_0200
     * @tc.name The X509 certificate list can be created for encryption and decryption.
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509Cert_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .createX509CertInstancePromise("pem")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });

      await certCallback
        .createX509CertInstanceCallback("pem")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_0300
     * @tc.name verify RSA algorithm for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509Cert_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .verifyX509CertPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certCallback
        .verifyX509CertCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_0400
     * @tc.name verify ECC algorithm for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_crypto_framework_X509Cert_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .verifyX509CertPromise("der")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certCallback
        .verifyX509CertCallback("der")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_0500
     * @tc.name verify RSA algorithm for X509 certificate with invalid pubKey
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509Cert_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .verifyX509CertPromise("pem", "NULL")
        .then((data) => {
          expect(data == 401).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certCallback
        .verifyX509CertCallback("pem", "000")
        .then((data) => {
          expect(data == 401).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_0600
     * @tc.name verify RSA algorithm for X509 certificate with not matched pubKey
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509Cert_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .verifyX509CertPromise("pem", "wrong")
        .then((data) => {
          expect(data == 401).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_0700
     * @tc.name check getEncoded interface
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_crypto_framework_X509Cert_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .checkGetEncodedX509CertPromise("der")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certCallback
        .checkGetEncodedX509CertCallback("der")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_0800
     * @tc.name check getPublicKey interface
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_crypto_framework_X509Cert_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .checkGetPublicKeyX509CertPromise("der")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certCallback
        .checkGetPublicKeyX509CertCallback("der")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_0900
     * @tc.name check validity of the date for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER,date format:20220922145628+0800(YmdHMSz)
     * @tc.desc Use the Promise Style of Interface;
     * @tc.desc period of validity:2022/8/19/12:49:06 - 2032/8/16/12:49:06
     */
    it("Security_crypto_framework_X509Cert_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .checkValidityX509CertPromise("der", "20220830000000+0800")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_1000
     * @tc.name check validity of the date for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER,date format:20330830000000+0800(YmdHMSz)
     * @tc.desc period of validity:2022/8/19/12:49:06 - 2032/8/16/12:49:06
     */
    it("Security_crypto_framework_X509Cert_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .checkValidityX509CertCallback("der", "20330830000000+0800")
        .then((data) => {
          expect(data == 19030004).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_1100
     * @tc.name check validity of the date for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER,date format: NULL or Exception parameters
     * @tc.desc period of validity:2022/8/19/12:49:06 - 2032/8/16/12:49:06
     */
    it("Security_crypto_framework_X509Cert_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .checkValidityX509CertCallback("der", "NULL")
        .then((data) => {
          expect(data == 19030001).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certCallback
        .checkValidityX509CertCallback("der", "string")
        .then((data) => {
          expect(data == 19030001).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_1200
     * @tc.name getVersion for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_X509Cert_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .getX509CertInfoCallback("der", "getVersion")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_1300
     * @tc.name getSerialNumber for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_X509Cert_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .getX509CertInfoCallback("der", "getSerialNumber")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_1400
     * @tc.name getIssuerName for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_X509Cert_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .getX509CertInfoCallback("der", "getIssuerName")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_1500
     * @tc.name getSubjectName for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509Cert_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CertInfoPromise("der", "getSubjectName")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_1600
     * @tc.name getNotBeforeTime for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509Cert_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CertInfoPromise("der", "getNotBeforeTime")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_1700
     * @tc.name getNotAfterTime for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509Cert_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CertInfoPromise("der", "getNotAfterTime")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_1800
     * @tc.name getSignature for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509Cert_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CertInfoPromise("der", "getSignature")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_1900
     * @tc.name getSignatureAlgName for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509Cert_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CertInfoPromise("der", "getSignatureAlgName")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_2000
     * @tc.name getSignatureAlgOid for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_X509Cert_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .getX509CertInfoCallback("der", "getSignatureAlgOid")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_2100
     * @tc.name getSignatureAlgParams for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_X509Cert_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .getX509CertInfoCallback("der", "getSignatureAlgParams")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_2400
     * @tc.name getKeyUsage for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_X509Cert_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .getX509CertInfoCallback("der", "getKeyUsage")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_2500
     * @tc.name getExtKeyUsage for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_X509Cert_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .getX509CertInfoCallback("der", "getExtKeyUsage")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_2600
     * @tc.name getBasicConstraints for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Callback Style of Interface
     */
    it("Security_crypto_framework_X509Cert_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .getX509CertInfoCallback("der", "getBasicConstraints")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_2700
     * @tc.name getSubjectAltNames for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509Cert_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CertInfoPromise("der", "getSubjectAltNames")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_X509Cert_2800
     * @tc.name getIssuerAltNames for X509 certificate
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509Cert_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CertInfoPromise("der", "getIssuerAltNames")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.number Security_crypto_framework_CertChainValidator_0100
     * @tc.name check validate interface for CertChainValidator
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it(
      "Security_crypto_framework_CertChainValidator_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async function (done) {
        await certPromise
          .checkValidateOfCertChainValidatorPromise("PKIX")
          .then((data) => {
            expect(data == null).assertTrue();
          })
          .catch((err) => {
            expect(null).assertFail();
          });
        await certCallback
          .checkValidateOfCertChainValidatorCallback("PKIX")
          .then((data) => {
            expect(data == null).assertTrue();
          })
          .catch((err) => {
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_CertChainValidator_0200
     * @tc.name check validate interface for CertChainValidator with invalid param
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it(
      "Security_crypto_framework_CertChainValidator_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async function (done) {
        await certPromise
          .checkValidateOfCertChainValidatorPromise("PKI111")
          .then((data) => {
            expect(data == 801).assertTrue();
          })
          .catch((err) => {
            expect(null).assertFail();
          });
        done();
      }
    );

    /**
     * @tc.number Security_crypto_framework_CertChainValidator_0300
     * @tc.name check validate interface for CertChainValidator with invalid Certs
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it(
      "Security_crypto_framework_CertChainValidator_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async function (done) {
        await certPromise
          .checkValidateOfCertChainValidatorPromise("PKIX", "error")
          .then((data) => {
            expect(data == 401).assertTrue();
          })
          .catch((err) => {
            expect(null).assertFail();
          });
        await certCallback
          .checkValidateOfCertChainValidatorCallback("PKIX", "error")
          .then((data) => {
            expect(data == 401).assertTrue();
          })
          .catch((err) => {
            expect(null).assertFail();
          });
        done();
      }
    );
  });
}
