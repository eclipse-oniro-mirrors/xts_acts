/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, afterEach, it, expect } from "@ohos/hypium";
import * as certPromise from "./utils/certificate/publicCertificatePromise";
import * as certCallback from "./utils/certificate/publicCertificateCallback";

export default function CertificateCrlJsunit() {
  describe("CertificateCrlJsunit", function () {
    console.info("##########start CertificateCrlJsunit##########");
    beforeAll(function () {});
    afterEach(function () {});

    /**
     * @tc.number Security_crypto_framework_X509CRL_0100
     * @tc.name The X509 certificate list can be revoked for encryption and decryption.
     * @tc.desc The X509 certificate FORMAT is FORMAT_DER
     */
    it("Security_crypto_framework_X509CRL_0100", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_0200
     * @tc.name The X509 certificate list can be revoked for encryption and decryption.
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_0200", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_0300
     * @tc.name Check isRevoked success for X509 Crl
     * @tc.desc The X509 Crl FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_0300", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_0400
     * @tc.name Check isRevoked failed for X509 Crl
     * @tc.desc The X509 Crl FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_0400", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_0500
     * @tc.name Check isRevoked failed with invalid param for X509 Crl
     * @tc.desc The X509 Crl FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_0500", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_0600
     * @tc.name Check getEncoded for X509 Crl
     * @tc.desc The X509 Crl FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_0600", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_0700
     * @tc.name Check getEncoded for X509 Crl
     * @tc.desc The X509 Crl FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_0700", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_1200
     * @tc.name check getVersion for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509CRL_1200", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_1300
     * @tc.name check getIssuerName for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509CRL_1300", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_1400
     * @tc.name check getLastUpdate for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509CRL_1400", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_1500
     * @tc.name check getNextUpdate for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509CRL_1500", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_1600
     * @tc.name check getRevokedCert for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_1600", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_1700
     * @tc.name check getRevokedCert for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     * @tc.desc Use the Promise Style of Interface
     */
    it("Security_crypto_framework_X509CRL_1700", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_1800
     * @tc.name check getRevokedCerts for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_1800", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_1900
     * @tc.name check getTbsInfo for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_1900", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_2000
     * @tc.name check getSignature for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_2000", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_2100
     * @tc.name check getSignatureAlgName for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_2100", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_2200
     * @tc.name check getSignatureAlgOid for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_2200", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_2300
     * @tc.name check getSignatureAlgOid for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_2300", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_2400
     * @tc.name check getRevokedCerts for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_2400", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_2500
     * @tc.name check getRevokedCerts for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_2500", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_2600
     * @tc.name check getRevokedCerts for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_2600", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_2700
     * @tc.name check getRevokedCerts for X509 Crl
     * @tc.desc The X509 certificate FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_2700", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_0800
     * @tc.name Check verify for X509 Crl
     * @tc.desc The X509 Crl FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_0800", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_0900
     * @tc.name Check verify for X509 Crl
     * @tc.desc The X509 Crl FORMAT is FORMAT_DER
     */
    it("Security_crypto_framework_X509CRL_0900", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_1000
     * @tc.name Check verify for X509 Crl with invalid PublicKey
     * @tc.desc The X509 Crl FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_1000", 0, async function (done) {
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
     * @tc.number Security_crypto_framework_X509CRL_1100
     * @tc.name Check verify for X509 Crl with wrong PublicKey and right PublicKey
     * @tc.desc The X509 Crl FORMAT is FORMAT_PEM
     */
    it("Security_crypto_framework_X509CRL_1100", 0, async function (done) {
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
