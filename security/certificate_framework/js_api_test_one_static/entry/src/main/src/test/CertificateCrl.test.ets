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
import { BusinessError } from '@ohos.base';
import cert from '@ohos.security.cert';
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import * as certPromise from "./utils/certificate/publicCertificatePromise";
import * as certCallback from "./utils/certificate/publicCertificateCallback";

export default function CertificateCrlJsunit() {
  describe("CertificateCrlJsunit", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   Security_crypto_framework_X509CRL_0100
     * @tc.number Security_crypto_framework_X509CRL_0100
     * @tc.desc   The X509 certificate FORMAT is FORMAT_DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_crypto_framework_X509CRL_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.createX509CrlInstancePromise("der");
        await certCallback.createX509CrlInstanceCallback("der");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.createX509CrlInstancePromise("pem");
        await certCallback.createX509CrlInstanceCallback("pem");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        let crlInstance: cert.X509CRL = await certPromise.createX509CrlInstancePromise("pem");
        let result: boolean = await certPromise.checkIsRevokedX509CrlPromise(crlInstance, "normal");
        expect(result).assertTrue();
        crlInstance = await certPromise.createX509CrlInstancePromise("pem");
        let result2: boolean = await certCallback.checkIsRevokedX509CrlCallback(crlInstance, "normal");
        expect(result2).assertTrue();
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        let crlInstance: cert.X509CRL = await certPromise.createX509CrlInstancePromise("pem");
        let result: boolean = await certPromise.checkIsRevokedX509CrlPromise(crlInstance, "error");
        expect(result).assertFalse();
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        let crlInstance: cert.X509CRL = await certPromise.createX509CrlInstancePromise("pem");
        await certPromise.checkIsRevokedX509CrlPromise(crlInstance, "NULL");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code == 401).assertTrue();
      }
      try {
        let crlInstance: cert.X509CRL = await certPromise.createX509CrlInstancePromise("pem");
        await certPromise.checkIsRevokedX509CrlPromise(crlInstance, "000");
        expect(null).assertFail();
      } catch (err: BusinessError) {
        expect(err.code == 401).assertTrue();
      }
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
    it("Security_crypto_framework_X509CRL_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CrlInfoPromise("pem", "getType");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.checkGetEncodedX509CrlPromise("pem");
        await certCallback.checkGetEncodedX509CrlCallback("pem");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CrlInfoPromise("pem", "getVersion");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CrlInfoPromise("pem", "getIssuerName");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CrlInfoPromise("pem", "getLastUpdate");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CrlInfoPromise("pem", "getNextUpdate");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certCallback.checkGetRevokedCertX509CrlCallback("pem");
        await certPromise.checkGetRevokedCertX509CrlPromise("pem");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        let crlInstance: cert.X509CRL = await certPromise.createX509CrlInstancePromise("pem");
        let result: cert.X509CRLEntry = await certPromise.checkGetRevokedCertWithCertX509CrlPromise(crlInstance, "normal");
        expect(result != null).assertTrue();
        let crlInstance2: cert.X509CRL = await certPromise.createX509CrlInstancePromise("pem")
        let result2: cert.X509CRLEntry = await certCallback.checkGetRevokedCertWithCertX509CrlCallback(crlInstance2, "normal");
        expect(result2 != null).assertTrue();
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        let data: string = await certCallback.checkGetRevokedCertsX509CrlCallback("pem");
        expect(data).assertEqual("get revoked certs success");
        await certPromise.checkGetRevokedCertsX509CrlPromise("pem");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CrlInfoPromise("pem", "getTbsInfo");
        await certCallback.getX509CrlInfoCallback("pem", "getTbsInfo");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CrlInfoPromise("pem", "getSignature");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CrlInfoPromise("pem", "getSignatureAlgName");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CrlInfoPromise("pem", "getSignatureAlgOid");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CrlInfoPromise("pem", "getSignatureAlgParams");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        let data: string = await certCallback.checkGetRevokedCertX509CrlCallback("pem");
        expect(data).assertEqual("check revoked success");
        await certPromise.checkGetRevokedCertX509CrlPromise("pem");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        let data: string = await certCallback.checkGetRevokedCertX509CrlCallback("der");
        expect(data).assertEqual("check revoked success");
        await certPromise.checkGetRevokedCertX509CrlPromise("der")
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        let data: string = await certCallback.checkGetRevokedCertX509CrlCallback("pem");
        expect(data).assertEqual("check revoked success");
        await certPromise.checkGetRevokedCertX509CrlPromise("der");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        let data: string = await certCallback.checkGetRevokedCertX509CrlCallback("der");
        expect(data).assertEqual("check revoked success");
        await certPromise.checkGetRevokedCertX509CrlPromise("pem")
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.verifyX509CrlPromise("pem");
        await certCallback.verifyX509CrlCallback("pem");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
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
    it("Security_crypto_framework_X509CRL_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): Promise<void> => {
      try {
        await certPromise.verifyX509CrlPromise("der");
        await certCallback.verifyX509CrlCallback("der");
      } catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

  });
}
