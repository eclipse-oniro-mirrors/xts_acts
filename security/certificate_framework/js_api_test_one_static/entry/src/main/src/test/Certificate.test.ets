/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import cert from '@ohos.security.cert';
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import * as certPromise from "./utils/certificate/publicCertificatePromise";
import * as certCallback from "./utils/certificate/publicCertificateCallback";

export default function CertificateJsunit() {
  describe("CertificateJsunit", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_0100
     * @tc.number Security_crypto_framework_X509Cert_0100
     * @tc.desc   The X509 certificate FORMAT is FORMAT_DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: cert.X509Cert = await certPromise.createX509CertInstancePromise("der");
        expect(data != null).assertTrue();
        let data2: cert.X509Cert = await certCallback.createX509CertInstanceCallback("der");
        expect(data2 != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_0200
     * @tc.number Security_crypto_framework_X509Cert_0200
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data: cert.X509Cert = await certPromise.createX509CertInstancePromise("pem");
        expect(data != null).assertTrue();
        let data2: cert.X509Cert = await certCallback.createX509CertInstanceCallback("pem");
        expect(data2 != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_0300
     * @tc.number Security_crypto_framework_X509Cert_0300
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.verifyX509CertPromise("pem");
        await certCallback.verifyX509CertCallback("pem");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_0400
     * @tc.number Security_crypto_framework_X509Cert_0400
     * @tc.desc   The X509 certificate FORMAT is FORMAT_DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.verifyX509CertPromise("der");
        await certCallback.verifyX509CertCallback("der");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_0500
     * @tc.number Security_crypto_framework_X509Cert_0500
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.verifyX509CertPromise("pem", "NULL");
      } catch (err) {
        expect((err as BusinessError).code == 401).assertTrue();
      }
      try {
        await certCallback.verifyX509CertCallback("pem", "000");
      } catch (err) {
        expect((err as BusinessError).code == 401).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_0600
     * @tc.number Security_crypto_framework_X509Cert_0600
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.verifyX509CertPromise("pem", "wrong");
      } catch (err) {
        expect((err as BusinessError).code == 401).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_0700
     * @tc.number Security_crypto_framework_X509Cert_0700
     * @tc.desc   The X509 certificate FORMAT is FORMAT_DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.checkGetEncodedX509CertPromise("der");
        await certCallback.checkGetEncodedX509CertCallback("der");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_0800
     * @tc.number Security_crypto_framework_X509Cert_0800
     * @tc.desc   The X509 certificate FORMAT is FORMAT_DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.checkGetPublicKeyX509CertPromise("der");
        await certCallback.checkGetPublicKeyX509CertCallback("der");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_0900
     * @tc.number Security_crypto_framework_X509Cert_0900
     * @tc.desc   period of validity:2022/8/19/12:49:06 - 2032/8/16/12:49:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.checkValidityX509CertPromise("der", "20220830000000+0800");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_1000
     * @tc.number Security_crypto_framework_X509Cert_1000
     * @tc.desc   period of validity:2022/8/19/12:49:06 - 2032/8/16/12:49:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await certCallback.checkValidityX509CertCallback("der", "20330830000000+0800");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code == cert.CertResult.ERR_CERT_HAS_EXPIRED).assertTrue();
        }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_1100
     * @tc.number Security_crypto_framework_X509Cert_1100
     * @tc.desc   period of validity:2022/8/19/12:49:06 - 2032/8/16/12:49:06
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.checkValidityX509CertCallback("der", "NULL");
        expect(null).assertFail();
      } catch (err) {
        expect((err as BusinessError).code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
      }
      try {
        await certCallback.checkValidityX509CertCallback("der", "string");
        expect(null).assertFail();
      } catch (err) {
        expect((err as BusinessError).code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_1200
     * @tc.number Security_crypto_framework_X509Cert_1200
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.getX509CertInfoCallback("der", "getVersion");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_1300
     * @tc.number Security_crypto_framework_X509Cert_1300
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.getX509CertInfoCallback("der", "getSerialNumber");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_1400
     * @tc.number Security_crypto_framework_X509Cert_1400
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.getX509CertInfoCallback("der", "getIssuerName");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_1500
     * @tc.number Security_crypto_framework_X509Cert_1500
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CertInfoPromise("der", "getSubjectName");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_1600
     * @tc.number Security_crypto_framework_X509Cert_1600
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CertInfoPromise("der", "getNotBeforeTime");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_1700
     * @tc.number Security_crypto_framework_X509Cert_1700
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CertInfoPromise("der", "getNotAfterTime");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_1800
     * @tc.number Security_crypto_framework_X509Cert_1800
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CertInfoPromise("der", "getSignature");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_1900
     * @tc.number Security_crypto_framework_X509Cert_1900
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CertInfoPromise("der", "getSignatureAlgName");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_2000
     * @tc.number Security_crypto_framework_X509Cert_2000
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.getX509CertInfoCallback("der", "getSignatureAlgOid");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_2100
     * @tc.number Security_crypto_framework_X509Cert_2100
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.getX509CertInfoCallback("der", "getSignatureAlgParams");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_2400
     * @tc.number Security_crypto_framework_X509Cert_2400
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.getX509CertInfoCallback("der", "getKeyUsage");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_2500
     * @tc.number Security_crypto_framework_X509Cert_2500
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.getX509CertInfoCallback("der", "getExtKeyUsage");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_2600
     * @tc.number Security_crypto_framework_X509Cert_2600
     * @tc.desc   Use the Callback Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.getX509CertInfoCallback("der", "getBasicConstraints");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_2700
     * @tc.number Security_crypto_framework_X509Cert_2700
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CertInfoPromise("der", "getSubjectAltNames");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_X509Cert_2800
     * @tc.number Security_crypto_framework_X509Cert_2800
     * @tc.desc   Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509Cert_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CertInfoPromise("der", "getIssuerAltNames");
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_crypto_framework_CertChainValidator_0100
     * @tc.number Security_crypto_framework_CertChainValidator_0100
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_CertChainValidator_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await certPromise.checkValidateOfCertChainValidatorPromise("PKIX");
          await certCallback.checkValidateOfCertChainValidatorCallback("PKIX");
        } catch (err) {
          expect(null).assertFail();
        }
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_CertChainValidator_0200
     * @tc.number Security_crypto_framework_CertChainValidator_0200
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_CertChainValidator_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await certPromise.checkValidateOfCertChainValidatorPromise("PKI111");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code == 801).assertTrue();
        }
        done();
      }
    );

    /**
     * @tc.name   Security_crypto_framework_CertChainValidator_0300
     * @tc.number Security_crypto_framework_CertChainValidator_0300
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_CertChainValidator_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          await certPromise.checkValidateOfCertChainValidatorPromise("PKIX", "error");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        try {
          await certCallback.checkValidateOfCertChainValidatorCallback("PKIX", "error");
          expect(null).assertFail();
        } catch (err) {
          expect((err as BusinessError).code).assertEqual(401);
        }
        done();
      }
    );
  });
}
