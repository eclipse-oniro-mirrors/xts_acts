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
import {
  rsa_pkcs1_pem,
  rsa_pkcs1_csr_pem,
  rsa_pkcs1_der,
  rsa_pkcs8_pem,
  rsa_pkcs8_csr_pem,
  rsa_pkcs8_der,
  rsa_pkcs1_enc_pem,
  rsa_pkcs1_enc_der,
  rsa_pkcs8_enc_pem,
  rsa_pkcs8_enc_error_pem,
  rsa_pkcs8_enc_error,
  rsa_pkcs8_enc_der,
  dsa_pkcs8_enc_pem,
  dsa_pkcs8_pem,
  dsa_pkcs1_enc_pem,
  dsa_pkcs1_pem,
  subj_zh,
  subj,
  unstructuredName,
  challengePassword,
  basicConstraints,
  keyUsage,
  keyUsageError,
  unstructuredName_ZH,
  rsa_pkcs8_enc_aes256_to_aes128_pem,
  invalidType,
  rsa_pkcs1_enc_pem_csr,
  compareUint8Array
} from './utils/csr/csr';


export default function certFrameworkCertCsrTestUnit() {
  describe("certFrameworkCertCsrTestUnit", () => {
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
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_0100
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs1_pem
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, basicConstraints
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.PEM
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (!(csr instanceof Uint8Array)) {
          expect(csr.toString()).assertEqual(rsa_pkcs1_csr_pem)
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertCsr_Func_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_0200
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs8_pem
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj_zh);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, basicConstraints, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA256",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.PEM

        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (!(csr instanceof Uint8Array)) {
          expect(csr.toString()).assertEqual(rsa_pkcs8_csr_pem)
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertCsr_Func_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_0300
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_0300
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_pkcs1_der)
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA384",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (csr instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertCsr_Func_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_0400
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_0400
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_pkcs8_der)
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA512",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (!(csr instanceof Uint8Array)) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertCsr_Func_0400 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_0500
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_0500
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs1_enc_pem,
          password: "123abc"
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (csr instanceof Uint8Array) {
          let exp_csr: Uint8Array = new Uint8Array(rsa_pkcs1_enc_pem_csr);
          let ret: boolean = compareUint8Array(csr, exp_csr);
          expect(ret).assertTrue();
        } else {
          expect(null).assertFail();
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertCsr_Func_0500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_0600
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_0600
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs8_enc_pem,
          password: "123abc"
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (!(csr instanceof Uint8Array)) {
          expect(null).assertFail();
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertCsr_Func_0600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_0700
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_0700
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_pkcs8_enc_der),
          password: "123456"
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA256",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (!(csr instanceof Uint8Array)) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertCsr_Func_0700 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_0800
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_0800
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_pkcs1_enc_der),
          password: "123abc"
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA512",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.PEM
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (!(csr instanceof Uint8Array)) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertCsr_Func_0800 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_0900
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_0900
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs1_pem
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          outFormat: cert.EncodingBaseFormat.PEM,
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (!(csr instanceof Uint8Array)) {
          console.info("##################### csr:" + csr.toString())
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertCsr_Func_0900 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1000
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1000
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs1_pem
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.PEM
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1000 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1100
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1100
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs1_pem
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          challengePassword, unstructuredName_ZH
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.PEM
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (!(csr instanceof Uint8Array)) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertCsr_Func_1100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1200
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1200
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: dsa_pkcs1_enc_pem,
          password: "123456"
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          challengePassword, unstructuredName
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1200 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1201
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1201
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: dsa_pkcs8_enc_pem,
          password: "123456"
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          challengePassword, unstructuredName
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1201 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1300
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1300
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: dsa_pkcs8_pem,
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          challengePassword, unstructuredName
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1300 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1301
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1301
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1301", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: dsa_pkcs1_pem,
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          challengePassword, unstructuredName
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1301 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1400
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1400
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs1_enc_pem,
          password: "123Abc"
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1400 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1500
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1500
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs8_enc_error_pem,
          password: "123abc"
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1500 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1501
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1501
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1501", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs8_enc_aes256_to_aes128_pem,
          password: "123abc"
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1501 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1502
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1502
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1502", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs8_enc_error,
          password: "123abc"
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1502 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1600
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1600
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pkcs8_enc_pem,
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA1",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.DER
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1600 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1700
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1700
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_pkcs1_der),
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "MD5",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.PEM
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1700 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1701
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1701
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1701", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_pkcs1_der),
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsage, unstructuredName, challengePassword,
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SM3",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.PEM
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_1701 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1800
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1800
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_pkcs8_der),
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          unstructuredName, challengePassword, challengePassword
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA256",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.PEM
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (!(csr instanceof Uint8Array)) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertCsr_Func_1800 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_1900
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_1900
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_pkcs8_der),
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          keyUsageError, challengePassword
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA256",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.PEM
        }
        let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf)
        if (!(csr instanceof Uint8Array)) {
          console.info("##################### csr:" + csr.toString())
        } else {
          console.info("##################### csr:" + csr)
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertCsr_Func_1900 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_2000
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_2000
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_pkcs8_der),
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          invalidType, challengePassword
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA256",
          attributes: attributes,
          outFormat: cert.EncodingBaseFormat.PEM
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_2000 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCsr_Func_2100
     * @tc.number SUB_Security_Cert_Framework_CertCsr_Func_2100
     * @tc.desc   The X509 CSR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCsr_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_pkcs8_der),
        };
        let subject: cert.X500DistinguishedName = await cert.createX500DistinguishedName(subj);
        let attributes: cert.CsrAttribute[] = [
          challengePassword
        ];
        let conf: cert.CsrGenerationConfig = {
          subject: subject,
          mdName: "SHA256",
          attributes: attributes,
          outFormat: 3
        }
        cert.generateCsr(keyInfo, conf)
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertCsr_Func_2100 ${error}, error code: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    });

  })
}