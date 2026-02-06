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

export default function CertificateCrlJsunit() {
  describe("CertificateCrlJsunit", function () {
    console.info("##########start CertificateCrlJsunit##########");
    beforeAll(function () {});
    afterEach(function () {});

    /**
     * @tc.name   Security_crypto_framework_X509CRL_0100
     * @tc.number Security_crypto_framework_X509CRL_0100
     * @tc.desc   The X509 certificate FORMAT is FORMAT_DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .createX509CrlInstancePromise("der")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });

      await certCallback
        .createX509CrlInstanceCallback("der")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_0200
     * @tc.number Security_crypto_framework_X509CRL_0200
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .createX509CrlInstancePromise("pem")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });

      await certCallback
        .createX509CrlInstanceCallback("pem")
        .then((data) => {
          expect(data != null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_0300
     * @tc.number Security_crypto_framework_X509CRL_0300
     * @tc.desc   The X509 Crl FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .createX509CrlInstancePromise("pem")
        .then((crlInstance) => {
          return certPromise.checkIsRevokedX509CrlPromise(
            crlInstance,
            "normal"
          );
        })
        .then((result) => {
          expect(result == true).assertTrue();
        })
        .catch((err) => {
          console.error("[promise] isRevoked failed! error is: " + err);
          expect(null).assertFail();
        });
      await certPromise
        .createX509CrlInstancePromise("pem")
        .then((crlInstance) => {
          return certCallback.checkIsRevokedX509CrlCallback(
            crlInstance,
            "normal"
          );
        })
        .then((result) => {
          expect(result == true).assertTrue();
        })
        .catch((err) => {
          console.error("[promise] isRevoked failed! error is: " + err);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_0400
     * @tc.number Security_crypto_framework_X509CRL_0400
     * @tc.desc   The X509 Crl FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .createX509CrlInstancePromise("pem")
        .then((crlInstance) => {
          return certPromise.checkIsRevokedX509CrlPromise(crlInstance, "error");
        })
        .then((result) => {
          expect(result == false).assertTrue();
        })
        .catch((err) => {
          console.error("[promise] isRevoked failed! error is: " + err);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_0500
     * @tc.number Security_crypto_framework_X509CRL_0500
     * @tc.desc   The X509 Crl FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .createX509CrlInstancePromise("pem")
        .then((crlInstance) => {
          return certPromise.checkIsRevokedX509CrlPromise(crlInstance, "NULL");
        })
        .then((result) => {
          expect(result == 401).assertTrue();
        })
        .catch((err) => {
          console.error("[promise] isRevoked failed! error is: " + err);
          expect(null).assertFail();
        });
      await certPromise
        .createX509CrlInstancePromise("pem")
        .then((crlInstance) => {
          return certPromise.checkIsRevokedX509CrlPromise(crlInstance, "000");
        })
        .then((result) => {
          expect(result == 401).assertTrue();
        })
        .catch((err) => {
          console.error("[promise] isRevoked failed! error is: " + err);
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_0600
     * @tc.number Security_crypto_framework_X509CRL_0600
     * @tc.desc   The X509 Crl FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CrlInfoPromise("pem", "getType")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_0700
     * @tc.number Security_crypto_framework_X509CRL_0700
     * @tc.desc   The X509 Crl FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .checkGetEncodedX509CrlPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certCallback
        .checkGetEncodedX509CrlCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_1200
     * @tc.number Security_crypto_framework_X509CRL_1200
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CrlInfoPromise("pem", "getVersion")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_1300
     * @tc.number Security_crypto_framework_X509CRL_1300
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CrlInfoPromise("pem", "getIssuerName")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_1400
     * @tc.number Security_crypto_framework_X509CRL_1400
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CrlInfoPromise("pem", "getLastUpdate")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_1500
     * @tc.number Security_crypto_framework_X509CRL_1500
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CrlInfoPromise("pem", "getNextUpdate")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_1600
     * @tc.number Security_crypto_framework_X509CRL_1600
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .checkGetRevokedCertX509CrlCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certPromise
        .checkGetRevokedCertX509CrlPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_1700
     * @tc.number Security_crypto_framework_X509CRL_1700
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .createX509CrlInstancePromise("pem")
        .then((crlInstance) => {
          return certPromise.checkGetRevokedCertWithCertX509CrlPromise(
            crlInstance,
            "normal"
          );
        })
        .then((result) => {
          expect(result != null).assertTrue();
        })
        .catch((err) => {
          console.error(
            "[promise] checkgetRevokedCertWithCertX509CrlPromis failed! error is: " +
              err
          );
          expect(null).assertFail();
        });
      await certPromise
        .createX509CrlInstancePromise("pem")
        .then((crlInstance) => {
          return certCallback.checkGetRevokedCertWithCertX509CrlCallback(
            crlInstance,
            "normal"
          );
        })
        .then((result) => {
          expect(result != null).assertTrue();
        })
        .catch((err) => {
          console.error(
            "[callback] checkgetRevokedCertWithCertX509CrlCallback failed! error is: " +
              err
          );
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_1800
     * @tc.number Security_crypto_framework_X509CRL_1800
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .checkGetRevokedCertsX509CrlCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certPromise
        .checkGetRevokedCertsX509CrlPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_1900
     * @tc.number Security_crypto_framework_X509CRL_1900
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CrlInfoPromise("pem", "getTbsInfo")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certCallback
        .getX509CrlInfoCallback("pem", "getTbsInfo")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_2000
     * @tc.number Security_crypto_framework_X509CRL_2000
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CrlInfoPromise("pem", "getSignature")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_2100
     * @tc.number Security_crypto_framework_X509CRL_2100
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CrlInfoPromise("pem", "getSignatureAlgName")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_2200
     * @tc.number Security_crypto_framework_X509CRL_2200
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CrlInfoPromise("pem", "getSignatureAlgOid")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_2300
     * @tc.number Security_crypto_framework_X509CRL_2300
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .getX509CrlInfoPromise("pem", "getSignatureAlgParams")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_2400
     * @tc.number Security_crypto_framework_X509CRL_2400
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .checkGetRevokedCertX509CrlCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certPromise
        .checkGetRevokedCertX509CrlPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_2500
     * @tc.number Security_crypto_framework_X509CRL_2500
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .checkGetRevokedCertX509CrlCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certPromise
        .checkGetRevokedCertX509CrlPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_2600
     * @tc.number Security_crypto_framework_X509CRL_2600
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .checkGetRevokedCertX509CrlCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certPromise
        .checkGetRevokedCertX509CrlPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_2700
     * @tc.number Security_crypto_framework_X509CRL_2700
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certCallback
        .checkGetRevokedCertX509CrlCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      await certPromise
        .checkGetRevokedCertX509CrlPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_0800
     * @tc.number Security_crypto_framework_X509CRL_0800
     * @tc.desc   The X509 Crl FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .verifyX509CrlPromise("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });

      await certCallback
        .verifyX509CrlCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_0900
     * @tc.number Security_crypto_framework_X509CRL_0900
     * @tc.desc   The X509 Crl FORMAT is FORMAT_DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .verifyX509CrlPromise("der")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });

      await certCallback
        .verifyX509CrlCallback("der")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_1000
     * @tc.number Security_crypto_framework_X509CRL_1000
     * @tc.desc   The X509 Crl FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .verifyX509CrlPromise("der", "NULL")
        .then((data) => {
          expect(data == 401).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });

      await certCallback
        .verifyX509CrlCallback("der", "000")
        .then((data) => {
          expect(data == 401).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_1100
     * @tc.number Security_crypto_framework_X509CRL_1100
     * @tc.desc   The X509 Crl FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
      await certPromise
        .verifyX509CrlPromise("pem", "error")
        .then((data) => {
          expect(data == 401).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });

      await certCallback
        .verifyX509CrlCallback("pem")
        .then((data) => {
          expect(data == null).assertTrue();
        })
        .catch((err) => {
          expect(null).assertFail();
        });
      done();
    });
  });
}
