/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium";
import { cert } from "@kit.DeviceCertificateKit";
import { stringToUint8Array,
  X500DISTINGUISHED_NAME_ISSUER_DER,
  X500DISTINGUISHED_NAME_ISSUER_RSA_PRIVATE_KEY_PEM,
  X500D_NAME_UTF8_CERT_1_PEM,
  X500D_NAME_UTF8_CERT_2_PEM, X500D_NAME_UTF8_CERT_3_PEM,
  X500D_NAME_UTF8_CERT_4_PEM,
  X500D_NAME_UTF8_CERT_5_PEM} from "./utils/x509/x509";
import { keyUsage, basicConstraints, unstructuredName, challengePassword } from './utils/csr/csr';


export default function certFrameworkX500NNameTestUnit() {
  describe("certFrameworkX500NNameTestUnit", () => {

    /**
     * @tc.name   SUB_Security_Cert_X500NName_Utf8_Func_0100
     * @tc.number SUB_Security_Cert_X500NName_Utf8_Func_0100
     * @tc.desc   X500DistinguishedName utf8 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_X500NName_Utf8_Func_0100",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(X500D_NAME_UTF8_CERT_1_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let x500DIssuer: cert.X500DistinguishedName = x509Cert.getIssuerX500DistinguishedName();
          let x500DSubject: cert.X500DistinguishedName = x509Cert.getSubjectX500DistinguishedName();
          let namesSubject: string[] = x500DSubject.getName("OU", cert.EncodingType.ENCODING_UTF8);
          expect(namesSubject.length).assertEqual(3);
          expect(namesSubject[0]).assertEqual("intermediate 中文");
          expect(namesSubject[1]).assertEqual("intermediate 中文 2");
          expect(namesSubject[2]).assertEqual("intermediate 中文 3");
          let namesIssuer: string[] = x500DIssuer.getName("O", cert.EncodingType.ENCODING_UTF8);
          expect(namesIssuer.length).assertEqual(1);
          expect(namesIssuer[0]).assertEqual("intermediate 测试");
        } catch (error) {
          console.error(`X500NName_Utf8_Func_0100 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_X500NName_Utf8_Func_0200
     * @tc.number SUB_Security_Cert_X500NName_Utf8_Func_0200
     * @tc.desc   X500DistinguishedName utf8 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_X500NName_Utf8_Func_0200",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(X500D_NAME_UTF8_CERT_2_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let x500DSubject: cert.X500DistinguishedName = x509Cert.getSubjectX500DistinguishedName();
          let names: string[] = x500DSubject.getName("OU", cert.EncodingType.ENCODING_UTF8);
          expect(names.length).assertEqual(3);
          expect(names[0]).assertEqual("intermediate 中文");
          expect(names[1]).assertEqual("intermediate 中文 2");
          expect(names[2]).assertEqual("intermediate 中文 3");
        } catch (error) {
          console.error(`X500NName_Utf8_Func_0200 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_X500NName_Utf8_Func_0300
     * @tc.number SUB_Security_Cert_X500NName_Utf8_Func_0300
     * @tc.desc   X500DistinguishedName utf8 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_X500NName_Utf8_Func_0300",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(X500D_NAME_UTF8_CERT_3_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let x500DIssuer: cert.X500DistinguishedName = x509Cert.getIssuerX500DistinguishedName();
          let names: string[] = x500DIssuer.getName("OU", cert.EncodingType.ENCODING_UTF8);
          expect(names.length).assertEqual(3);
          expect(names[0]).assertEqual("intermediate 中文");
          expect(names[1]).assertEqual("intermediate 中文 2");
          expect(names[2]).assertEqual("intermediate 中文 3");
        } catch (error) {
          console.error(`X500NName_Utf8_Func_0300 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_X500NName_Utf8_Func_0400
     * @tc.number SUB_Security_Cert_X500NName_Utf8_Func_0400
     * @tc.desc   X500DistinguishedName utf8 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_X500NName_Utf8_Func_0400",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(X500D_NAME_UTF8_CERT_4_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let x500DSubject: cert.X500DistinguishedName = x509Cert.getSubjectX500DistinguishedName();
          let names1: string[] = x500DSubject.getName("O", cert.EncodingType.ENCODING_UTF8);
          expect(names1.length).assertEqual(1);
          expect(names1[0]).assertEqual("intermediate 测试");
          let names2: string[] = x500DSubject.getName("emailAddress", cert.EncodingType.ENCODING_UTF8);
          expect(names2.length).assertEqual(1);
          expect(names2[0]).assertEqual("intermediate1@example.com");
        } catch (error) {
          console.error(`X500NName_Utf8_Func_0400 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_X500NName_Utf8_Func_0500
     * @tc.number SUB_Security_Cert_X500NName_Utf8_Func_0500
     * @tc.desc   X500DistinguishedName utf8 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_X500NName_Utf8_Func_0500",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(X500D_NAME_UTF8_CERT_5_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let x500DIssuer: cert.X500DistinguishedName = x509Cert.getIssuerX500DistinguishedName();
          let names1: string[] = x500DIssuer.getName("description", cert.EncodingType.ENCODING_UTF8);
          expect(names1.length).assertEqual(1);
          expect(names1[0]).assertEqual("X500D 中文测试");
          let names2: string[] = x500DIssuer.getName("CN", cert.EncodingType.ENCODING_UTF8);
          expect(names2.length).assertEqual(1);
          expect(names2[0]).assertEqual("test T");
        } catch (error) {
          console.error(`X500NName_Utf8_Func_0500 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_X500NName_Utf8_Func_0600
     * @tc.number SUB_Security_Cert_X500NName_Utf8_Func_0600
     * @tc.desc   X500DistinguishedName utf8 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_X500NName_Utf8_Func_0600",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x500DDer: Uint8Array = new Uint8Array(X500DISTINGUISHED_NAME_ISSUER_DER);
           let x500D: cert.X500DistinguishedName = await cert.createX500DistinguishedName(x500DDer);
           let names: string[] = x500D.getName("description", cert.EncodingType.ENCODING_UTF8);
           expect(names.length).assertEqual(1);
           expect(names[0]).assertEqual("X500D 中文测试");
        } catch (error) {
          console.error(`X500NName_Utf8_Func_0600 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_X500NName_Utf8_Func_0700
     * @tc.number SUB_Security_Cert_X500NName_Utf8_Func_0700
     * @tc.desc   X500DistinguishedName utf8 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_X500NName_Utf8_Func_0700",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let x500DString: string = "/C=CN/ST=intermediate 好/L=xi an/O=intermediate 测试/OU=intermediate 中文" +
            "/CN=test T/emailAddress=intermediate1@example.com/description=X500D 中文测试";
          let x500D: cert.X500DistinguishedName = await cert.createX500DistinguishedName(x500DString);
          let names: string[] = x500D.getName("ST", cert.EncodingType.ENCODING_UTF8);
          expect(names.length).assertEqual(1);
          expect(names[0]).assertEqual("intermediate 好");
          let keyInfo: cert.PrivateKeyInfo = {
            key: X500DISTINGUISHED_NAME_ISSUER_RSA_PRIVATE_KEY_PEM
          };
          let attributes: cert.CsrAttribute[] = [
            keyUsage, basicConstraints, unstructuredName, challengePassword,
          ];
          let conf: cert.CsrGenerationConfig = {
            subject: x500D,
            mdName: "SHA256",
            attributes: attributes,
            outFormat: cert.EncodingBaseFormat.DER
          }
          let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf);
          if (!(csr instanceof Uint8Array)) {
            expect(null).assertFail();
          }
        } catch (error) {
          console.error(`X500NName_Utf8_Func_0700 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_X500NName_Utf8_Func_0800
     * @tc.number SUB_Security_Cert_X500NName_Utf8_Func_0800
     * @tc.desc   X500DistinguishedName utf8 test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_X500NName_Utf8_Func_0800",
      TestType.RELIABILITY | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringToUint8Array(X500D_NAME_UTF8_CERT_2_PEM),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
          let x500DSubject: cert.X500DistinguishedName = x509Cert.getSubjectX500DistinguishedName();
          let keyInfo: cert.PrivateKeyInfo = {
            key: X500DISTINGUISHED_NAME_ISSUER_RSA_PRIVATE_KEY_PEM
          };
          let attributes: cert.CsrAttribute[] = [
            keyUsage, basicConstraints, unstructuredName, challengePassword,
          ];
          let conf: cert.CsrGenerationConfig = {
            subject: x500DSubject,
            mdName: "SHA256",
            attributes: attributes,
            outFormat: cert.EncodingBaseFormat.PEM
          }
          let csr: string | Uint8Array = cert.generateCsr(keyInfo, conf);
          if (csr instanceof Uint8Array) {
            expect(null).assertFail();
          }
        } catch (error) {
          console.error(`X500NName_Utf8_Func_0800 1.1 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  })
}