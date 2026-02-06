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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { cert } from '@kit.DeviceCertificateKit';
import {
  caPemZh,
  certCrlPemEn,
  certCrlPemZh,
  certCrlRevokedPemZh,
  certErrorCNPem,
  certNoIssuerPem,
  certNoSubjectPem,
  certPemEn, certPemMultipleCNZh, certPemZh,
  chainCrlPemEn,
  chainCrlPemZh,
  chainPemZh,
  createX509Cert,
  DNEn, DNZh,
  getRevokedCerts,
  interPemZh,
  subPemZh } from "./utils/certificate/certPem";
import { compareString, stringTouInt8Array } from "./utils/common/commonFunction";
import {
  certCrlDerEn,
  certCrlDerZh,
  certCrlRevokedDerEn,
  certCrlRevokedDerZh,
  certDerEn, certDerMultipleCNZh, certDerZh,
  certNoIssuerDer,
  certNoSubjectDer,
  chainCrlDerEn,
  chainCrlDerZh,
  p12CertDer } from "./utils/certificate/certDer";
import { util } from "@kit.ArkTS";
import { BusinessError } from '@ohos.base';

export default function certFrameworkCertResolutionTestUnit() {
  describe("certFrameworkCertResolutionTestUnit", () => {
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_0100
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let encodingBlobPem: cert.EncodingBlob = {
          data: stringTouInt8Array(certPemZh),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let encodingBlobDer: cert.EncodingBlob = {
          data: new Uint8Array(certDerZh),
          encodingFormat: cert.EncodingFormat.FORMAT_DER
        };
        let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
        let issuerPem: string = x509CertPem.getIssuerName(cert.EncodingType.ENCODING_UTF8);
        let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
        let issuerDer: string = x509CertDer.getIssuerName(cert.EncodingType.ENCODING_UTF8);
        let issuer: cert.DataBlob = x509CertPem.getIssuerName();
        // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
        // const issuerName = encoder.decodeWithStream(issuer.data)
        // expect(issuerName).not().assertEqual(issuerPem);
        expect(issuerPem).assertEqual(issuerDer);
        expect(issuerPem).assertEqual("C=CN,ST=陕西 HAI 13<..>,L=Hello 321 西安,O=Hello 测试,CN=中文测试 Test");
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_CertResolution_Func_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_0200
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certPemEn),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let issuerPem: string = x509CertPem.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
          let issuerDer: string = x509CertDer.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          // let issuer: cert.DataBlob = x509CertPem.getIssuerName();
          // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
          // const issuerNamePem = encoder.decodeWithStream(issuer.data)
          // issuer = x509CertDer.getIssuerName();
          // const issuerNameDer = encoder.decodeWithStream(issuer.data)
          // expect(issuerNamePem).assertEqual(issuerNameDer);
          expect(issuerPem).assertEqual(issuerDer);
          expect(issuerPem).assertEqual("C=CN,ST=shan xi,L=xi an,O=o 11 test,CN=test321");
          // expect(issuerNameDer).assertEqual("/C=CN/ST=shan xi/L=xi an/O=o 11 test/CN=test321");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_0200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_0300
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_0300
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certPemEn),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
          let certDer: string = x509CertDer.toString(cert.EncodingType.ENCODING_UTF8);
          let certPem: string = x509CertPem.toString(cert.EncodingType.ENCODING_UTF8);
          let certString: string = x509CertPem.toString();
          expect(certDer).assertEqual(certPem);
          expect(certDer).assertEqual(certString);
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_0300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_0400
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_0400
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
          let certDer: string = x509CertDer.toString(cert.EncodingType.ENCODING_UTF8);
          let certPem: string = x509CertPem.toString(cert.EncodingType.ENCODING_UTF8);
          let certString: string = x509CertPem.toString();
          expect(certDer).assertEqual(certPem);
          expect(certDer).not().assertEqual(certString);
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_0400 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_0500
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_0500
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
          let X500NamePem: cert.X500DistinguishedName = x509CertPem.getIssuerX500DistinguishedName();
          let X500NameDer: cert.X500DistinguishedName = x509CertDer.getIssuerX500DistinguishedName();
          let issuerNamePem: string = X500NamePem.getName(cert.EncodingType.ENCODING_UTF8);
          let issuerNameDer: string = X500NameDer.getName(cert.EncodingType.ENCODING_UTF8);
          let issuerName: string = X500NamePem.getName();
          expect(issuerNamePem).assertEqual(issuerNameDer);
          expect(issuerNamePem).not().assertEqual(issuerName);
          expect(issuerNamePem).assertEqual("C=CN,ST=陕西 HAI 13<..>,L=Hello 321 西安,O=Hello 测试,CN=中文测试 Test");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_0500 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_0600
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_0600
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certPemEn),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
          let X500NamePem: cert.X500DistinguishedName = x509CertPem.getIssuerX500DistinguishedName();
          let X500NameDer: cert.X500DistinguishedName = x509CertDer.getIssuerX500DistinguishedName();
          let issuerNamePem: string = X500NamePem.getName(cert.EncodingType.ENCODING_UTF8);
          let issuerNameDer: string = X500NameDer.getName(cert.EncodingType.ENCODING_UTF8);
          let issuerName: string = X500NamePem.getName();
          expect(issuerNamePem).assertEqual(issuerNameDer);
          expect(issuerNamePem).not().assertEqual(issuerName);
          expect(issuerNamePem).assertEqual("C=CN,ST=shan xi,L=xi an,O=o 11 test,CN=test321");
          expect(issuerName).assertEqual("/C=CN/ST=shan xi/L=xi an/O=o 11 test/CN=test321");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_0600 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_0700
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_0700
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certPemEn),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
          let X500NamePem: cert.X500DistinguishedName = x509CertPem.getSubjectX500DistinguishedName();
          let X500NameDer: cert.X500DistinguishedName = x509CertDer.getSubjectX500DistinguishedName();
          let subjectNamePem: string = X500NamePem.getName(cert.EncodingType.ENCODING_UTF8);
          let subjectNameDer: string = X500NameDer.getName(cert.EncodingType.ENCODING_UTF8);
          let subjectName: string = X500NamePem.getName();
          let subjectNameType: string[] = X500NamePem.getName("CN");
          expect(subjectNamePem).assertEqual(subjectNameDer);
          expect(subjectNamePem).assertEqual("C=CN,ST=shan xi,L=xi an,O=o 11 test,CN=test321");
          expect(subjectName).assertEqual("/C=CN/ST=shan xi/L=xi an/O=o 11 test/CN=test321");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_0700 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_0800
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_0800
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
          let X500NamePem: cert.X500DistinguishedName = x509CertPem.getSubjectX500DistinguishedName();
          let X500NameDer: cert.X500DistinguishedName = x509CertDer.getSubjectX500DistinguishedName();
          let subjectNamePem: string = X500NamePem.getName(cert.EncodingType.ENCODING_UTF8);
          let subjectNameDer: string = X500NameDer.getName(cert.EncodingType.ENCODING_UTF8);
          let subjectName: string = X500NamePem.getName();
          let subjectNameType: string[] = X500NamePem.getName("CN");
          expect(subjectNamePem).assertEqual(subjectNameDer);
          expect(subjectNamePem).not().assertEqual(subjectName);
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_0800 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_0900
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_0900
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certPemMultipleCNZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certDerMultipleCNZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
          let X500NamePem: cert.X500DistinguishedName = x509CertPem.getSubjectX500DistinguishedName();
          let X500NameDer: cert.X500DistinguishedName = x509CertDer.getSubjectX500DistinguishedName();
          let subjectNamePem: string = X500NamePem.getName(cert.EncodingType.ENCODING_UTF8);
          let subjectNameDer: string = X500NameDer.getName(cert.EncodingType.ENCODING_UTF8);
          let subjectName: string = X500NamePem.getName();
          let subjectNameType: string[] = X500NamePem.getName("CN");
          expect(subjectNameType[0]).assertEqual("xE4xB8xADxE6x96x87xE6xB5x8BxE8xAFx95 Test");
          expect(subjectNameType[1]).assertEqual("xE4xB8xADxE6x96x87xE6xB5x8BxE8xAFx95 Test1");
          expect(subjectNameType[2]).assertEqual("xE4xB8xADxE6x96x87xE6xB5x8BxE8xAFx95 Test2");
          expect(subjectNamePem).assertEqual(subjectNameDer);
          expect(subjectNameDer).assertEqual("C=CN,ST=陕西 HAI 13<..>,L=Hello 321 西安,O=Hello 测试,CN=中文测试 Test,CN=中文测试 Test1,CN=中文测试 Test2")
          expect(subjectNamePem).not().assertEqual(subjectName);
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_0900 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_1000
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_1000
     * @tc.desc   The X500DistinguishedName string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let X500NameZhObj: cert.X500DistinguishedName = await cert.createX500DistinguishedName(DNZh);
          let X500NameEnObj: cert.X500DistinguishedName = await cert.createX500DistinguishedName(DNEn);
          let X500NameZh: string = X500NameZhObj.getName(cert.EncodingType.ENCODING_UTF8);
          let X500NameEn: string = X500NameEnObj.getName(cert.EncodingType.ENCODING_UTF8);
          let X500Name: string = X500NameEnObj.getName();
          expect(X500NameEn).assertEqual("CN=TEST,OU=TEST,O=TEST,L=TEST,ST=TEST,C=US,CN=TEST,CN=TEST")
          expect(X500Name).assertEqual("/CN=TEST/OU=TEST/O=TEST/L=TEST/ST=TEST/C=US/CN=TEST/CN=TEST");
          X500Name = X500NameZhObj.getName();
          expect(X500Name).not().assertEqual(DNZh);
          expect(X500NameZh).assertEqual("CN=中文TEST,OU=中文TEST,O=中文TEST,L=中文TEST,ST=中文TEST,C=CN,CN=中文TEST,CN=中文TEST")
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_1000 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_1100
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_1100
     * @tc.desc   The chain string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(chainPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let chain: cert.X509CertChain  = await cert.createX509CertChain(encodingBlobPem);
          let x509Certs: cert.X509Cert[] = chain.getCertList();
          let caIssuerName = x509Certs[0].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let interIssuerName = x509Certs[1].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let subIssuerName = x509Certs[2].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          expect(caIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(subIssuerName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          let caIssuerNameObj = x509Certs[0].getIssuerX500DistinguishedName();
          let interIssuerNameObj = x509Certs[1].getIssuerX500DistinguishedName();
          let subIssuerNameObj = x509Certs[2].getIssuerX500DistinguishedName();
          caIssuerName = caIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          interIssuerName = interIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          subIssuerName = subIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          expect(caIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(subIssuerName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          let caSubjectNameObj = x509Certs[0].getSubjectX500DistinguishedName();
          let interSubjectNameObj = x509Certs[1].getSubjectX500DistinguishedName();
          let subSubjectNameObj = x509Certs[2].getSubjectX500DistinguishedName();
          let caSubjectName = caSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          let interSubjectName = interSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          let subSubjectName = subSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          expect(caSubjectName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interSubjectName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          expect(subSubjectName).assertEqual("C=CN,ST=Beijing 北京,L=Beijing 北京,O=Example Corp 嗨,CN=example.com 例");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_1100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_1200
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_1200
     * @tc.desc   The collection crl string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(chainPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let chain: cert.X509CertChain  = await cert.createX509CertChain(encodingBlobPem);
          let x509Certs: cert.X509Cert[] = chain.getCertList();
          let caIssuerName = x509Certs[0].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let interIssuerName = x509Certs[1].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let subIssuerName = x509Certs[2].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          expect(caIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(subIssuerName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          let caIssuerNameObj = x509Certs[0].getIssuerX500DistinguishedName();
          let interIssuerNameObj = x509Certs[1].getIssuerX500DistinguishedName();
          let subIssuerNameObj = x509Certs[2].getIssuerX500DistinguishedName();
          caIssuerName = caIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          interIssuerName = interIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          subIssuerName = subIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          expect(caIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(subIssuerName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          let caSubjectNameObj = x509Certs[0].getSubjectX500DistinguishedName();
          let interSubjectNameObj = x509Certs[1].getSubjectX500DistinguishedName();
          let subSubjectNameObj = x509Certs[2].getSubjectX500DistinguishedName();
          let caSubjectName = caSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          let interSubjectName = interSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          let subSubjectName = subSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          expect(caSubjectName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interSubjectName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          expect(subSubjectName).assertEqual("C=CN,ST=Beijing 北京,L=Beijing 北京,O=Example Corp 嗨,CN=example.com 例");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_1200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_1300
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_1300
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certErrorCNPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let certPem: string = x509CertPem.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          expect(certPem).assertEqual("C=C1N,ST=shan xi,L=xi an,O=o 11 test,CN=test321");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_1300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_1400
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_1400
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlob: cert.EncodingBlob = {
            data: stringTouInt8Array(chainCrlPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let x509Crl = await cert.createX509CRL(encodingBlob);
          let ca = await createX509Cert(caPemZh);
          let inter = await createX509Cert(interPemZh);
          let sub = await createX509Cert(subPemZh);
          let collection = cert.createCertCRLCollection([ca, inter, sub], [x509Crl]);
          let param: cert.CertChainBuildParameters = {
            certMatchParameters: {},
            maxLength: 2,
            validationParameters: {
              date: '250514062055Z',
              trustAnchors: [{CACert: ca}, {CACert: inter}, {CACert: sub}],
              certCRLs: [collection]
            }
          }
          let chain = await cert.buildX509CertChain(param);
          let x509Certs: cert.X509Cert[] = chain.certChain.getCertList();
          let caIssuerName = x509Certs[2].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let interIssuerName = x509Certs[1].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let subIssuerName = x509Certs[0].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          expect(caIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(subIssuerName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          let caIssuerNameObj = x509Certs[2].getIssuerX500DistinguishedName();
          let interIssuerNameObj = x509Certs[1].getIssuerX500DistinguishedName();
          let subIssuerNameObj = x509Certs[0].getIssuerX500DistinguishedName();
          caIssuerName = caIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          interIssuerName = interIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          subIssuerName = subIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          expect(caIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(subIssuerName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          let caSubjectNameObj = x509Certs[2].getSubjectX500DistinguishedName();
          let interSubjectNameObj = x509Certs[1].getSubjectX500DistinguishedName();
          let subSubjectNameObj = x509Certs[0].getSubjectX500DistinguishedName();
          let caSubjectName = caSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          let interSubjectName = interSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          let subSubjectName = subSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          expect(caSubjectName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interSubjectName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          expect(subSubjectName).assertEqual("C=CN,ST=Beijing 北京,L=Beijing 北京,O=Example Corp 嗨,CN=example.com 例");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_1400 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_1500
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_1500
     * @tc.desc   The PKCS12 Cert DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let p12_cert: Uint8Array = new Uint8Array(p12CertDer);
        let conf: cert.Pkcs12ParsingConfig = {
          password: "123456",
          needsOtherCerts: true,
        };
        let p12: cert.Pkcs12Data = cert.parsePkcs12(p12_cert, conf);
        if (p12.otherCerts && p12.cert) {
          let otherCerts: cert.X509Cert[] = p12.otherCerts as cert.X509Cert[];
          let subCert: cert.X509Cert = p12.cert as cert.X509Cert;
          let caIssuerName = otherCerts[1].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let interIssuerName = otherCerts[0].getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let subIssuerName = subCert.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          expect(caIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(subIssuerName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          let caIssuerNameObj = otherCerts[1].getIssuerX500DistinguishedName();
          let interIssuerNameObj = otherCerts[0].getIssuerX500DistinguishedName();
          let subIssuerNameObj = subCert.getIssuerX500DistinguishedName();
          caIssuerName = caIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          interIssuerName = interIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          subIssuerName = subIssuerNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          let data:string[] = caIssuerNameObj.getName("CNN");
          console.info("########################## data:" + data) // return :undefined
          expect(caIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interIssuerName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(subIssuerName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          let caSubjectNameObj = otherCerts[1].getSubjectX500DistinguishedName();
          let interSubjectNameObj = otherCerts[0].getSubjectX500DistinguishedName();
          let subSubjectNameObj = subCert.getSubjectX500DistinguishedName();
          let caSubjectName = caSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          let interSubjectName = interSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          let subSubjectName = subSubjectNameObj.getName(cert.EncodingType.ENCODING_UTF8);
          expect(caSubjectName).assertEqual("C=CN,O=Root CA Corp 根,CN=Root CA 根");
          expect(interSubjectName).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          expect(subSubjectName).assertEqual("C=CN,ST=Beijing 北京,L=Beijing 北京,O=Example Corp 嗨,CN=example.com 例");
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`SUB_Security_Cert_Framework_CertResolution_Func_1500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_1600
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_1600
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certNoSubjectPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certNoSubjectDer),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
          let certIssuerPem: string = x509CertPem.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let certIssuerDer: string = x509CertDer.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          expect(certIssuerPem).assertEqual(certIssuerDer);
          expect(certIssuerPem).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
          expect(x509CertPem.toString(cert.EncodingType.ENCODING_UTF8)).not().assertEqual(x509CertPem.toString())
          try {
            x509CertPem.getSubjectX500DistinguishedName();
          } catch (error) {
            console.error(`x509CertPem ${error}, error code: ${error.code}`);
            expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
          }
          try {
            x509CertDer.getSubjectX500DistinguishedName();
          } catch (error) {
            console.error(`x509CertDer ${error}, error code: ${error.code}`);
            expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
          }
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_1600 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_1700
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_1700
     * @tc.desc   The X509 Cert Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certNoIssuerPem),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certNoIssuerDer),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobPem);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobDer);
          try {
            x509CertPem.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          } catch (error) {
            console.error(`PEM Issuer New getIssuerName ${error}, error code: ${error.code}`);
            expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
          }
          try {
            x509CertDer.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          } catch (error) {
            console.error(`DER Issuer New getIssuerName ${error}, error code: ${error.code}`);
            expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
          }
          try {
            x509CertPem.getIssuerName();
          } catch (error) {
            console.error(`PEM Issuer Old getIssuerName ${error}, error code: ${error.code}`);
            expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
          }
          try {
            x509CertDer.getIssuerName();
          } catch (error) {
            console.error(`DER Issuer Old getIssuerName ${error}, error code: ${error.code}`);
            expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
          }
          try {
            x509CertPem.getIssuerX500DistinguishedName();
          } catch (error) {
            console.error(`x509CertPem ${error}, error code: ${error.code}`);
            expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
          }
          try {
            x509CertDer.getIssuerX500DistinguishedName();
          } catch (error) {
            console.error(`x509CertDer ${error}, error code: ${error.code}`);
            expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
          }
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_1700 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_1800
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_1800
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(chainCrlPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(chainCrlDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPem: string = x509CRLPem.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = x509CRLDer.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let issuer: cert.DataBlob = x509CRLDer.getIssuerName();
          // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
          // const issuerName = encoder.decodeWithStream(issuer.data)
          expect(issuerDer).assertEqual(issuerPem);
          // expect(issuerDer).not().assertEqual(issuerName);
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_1800 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_1900
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_1900
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(chainCrlPemEn),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(chainCrlDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPem: string = x509CRLPem.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = x509CRLDer.getIssuerName(cert.EncodingType.ENCODING_UTF8);
          let issuer: cert.DataBlob = x509CRLDer.getIssuerName();
          // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
          // const issuerName = encoder.decodeWithStream(issuer.data)
          expect(issuerDer).assertEqual(issuerPem);
          // expect(issuerDer).not().assertEqual(issuerName);
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_1900 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_2000
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_2000
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(chainCrlPemEn),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(chainCrlDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPem: string = x509CRLPem.toString(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = x509CRLDer.toString(cert.EncodingType.ENCODING_UTF8);
          let issuer: string = x509CRLDer.toString();
          expect(issuerDer).assertEqual(issuerPem);
          expect(issuerDer).assertEqual(issuer);
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_2000 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_2100
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_2100
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(chainCrlPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(chainCrlDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPem: string = x509CRLPem.toString(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = x509CRLDer.toString(cert.EncodingType.ENCODING_UTF8);
          let issuer: string = x509CRLDer.toString();
          expect(issuerDer).assertEqual(issuerPem);
          expect(issuerDer).not().assertEqual(issuer);
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_2100 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_2200
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_2200
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(chainCrlPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(chainCrlDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPemObj: cert.X500DistinguishedName = x509CRLPem.getIssuerX500DistinguishedName();
          let issuerDerObj: cert.X500DistinguishedName = x509CRLDer.getIssuerX500DistinguishedName();
          let issuerPem: string = issuerPemObj.getName(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = issuerDerObj.getName(cert.EncodingType.ENCODING_UTF8);
          let issuer: string = issuerDerObj.getName();
          expect(issuerDer).assertEqual(issuerPem);
          expect(issuerDer).not().assertEqual(issuer);
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_2200 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_2300
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_2300
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(chainCrlPemEn),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(chainCrlDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPemObj: cert.X500DistinguishedName = x509CRLPem.getIssuerX500DistinguishedName();
          let issuerDerObj: cert.X500DistinguishedName = x509CRLDer.getIssuerX500DistinguishedName();
          let issuerPem: string = issuerPemObj.getName(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = issuerDerObj.getName(cert.EncodingType.ENCODING_UTF8);
          let issuer: string = issuerDerObj.getName();
          expect(issuerDer).assertEqual(issuerPem);
          expect(issuer).assertEqual("/C=CN/L=Beijing/O=Intermediate CA Corp/CN=Intermediate CA");
          expect(issuerDer).assertEqual("C=CN,L=Beijing,O=Intermediate CA Corp,CN=Intermediate CA");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_2300 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_2400
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_2400
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(chainCrlPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(chainCrlDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPemObj: cert.X509CRLEntry = x509CRLPem.getRevokedCert(BigInt("518638034225090170767223274550174193224537768978"));
          let issuerDerObj: cert.X509CRLEntry = x509CRLDer.getRevokedCert(BigInt("518638034225090170767223274550174193224537768978"));
          let issuerPem: string = issuerPemObj.getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = issuerDerObj.getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuer: cert.DataBlob = issuerDerObj.getCertIssuer();
          // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
          // const issuerName = encoder.decodeWithStream(issuer.data);
          expect(issuerDer).assertEqual(issuerPem);
          // expect(issuerName).assertEqual("/C=CN/O=Intermediate CA Corp \\xE6\\xA0\\xB9/CN=Intermediate CA \\xE6\\xA0\\xB9");
          expect(issuerDer).assertEqual("C=CN,O=Intermediate CA Corp 根,CN=Intermediate CA 根");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_2400 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_2500
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_2500
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certCrlPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certCrlDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let encodingBlobCertPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certCrlRevokedPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobCertDer: cert.EncodingBlob = {
            data: new Uint8Array(certCrlRevokedDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobCertPem);
          let x509CertDer: cert.X509Cert = await cert.createX509Cert(encodingBlobCertDer);
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPemObj: cert.X509CRLEntry = x509CRLPem.getRevokedCertWithCert(x509CertPem);
          let issuerDerObj: cert.X509CRLEntry = x509CRLDer.getRevokedCertWithCert(x509CertDer);
          let issuerPem: string = issuerPemObj.getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = issuerDerObj.getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuer: cert.DataBlob = issuerDerObj.getCertIssuer();
          // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
          // const issuerName = encoder.decodeWithStream(issuer.data);
          expect(issuerDer).assertEqual(issuerPem);
          // expect(issuerName).assertEqual("/C=CN/L=Beijing/L=\\xE4\\xBD\\xA0\\xE5\\xA5\\xBD China/L=\\xE4\\xBD\\xA0\\xE5\\xA5\\xBD Beijing/O=\\xE5\\x97\\xA8 Intermediate CA Corp/CN=\\xE5\\x97\\xA8 Intermediate CA");
          expect(issuerDer).assertEqual("C=CN,L=Beijing,L=你好 China,L=你好 Beijing,O=嗨 Intermediate CA Corp,CN=嗨 Intermediate CA");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_2500 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_2600
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_2600
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certCrlPemEn),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certCrlDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let encodingBlobCert: cert.EncodingBlob = {
            data: new Uint8Array(certCrlRevokedDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CertPem: cert.X509Cert = await cert.createX509Cert(encodingBlobCert);
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPemObj: cert.X509CRLEntry = x509CRLPem.getRevokedCertWithCert(x509CertPem);
          let issuerDerObj: cert.X509CRLEntry = x509CRLDer.getRevokedCertWithCert(x509CertPem);
          let issuerPem: string = issuerPemObj.getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = issuerDerObj.getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuer: cert.DataBlob = issuerDerObj.getCertIssuer();
          // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
          // const issuerName = encoder.decodeWithStream(issuer.data);
          expect(issuerDer).assertEqual(issuerPem);
          // expect(issuerName).assertEqual("/C=CN/L=Beijing/O=Intermediate CA Corp/CN=Intermediate CA");
          expect(issuerDer).assertEqual("C=CN,L=Beijing,O=Intermediate CA Corp,CN=Intermediate CA");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_2600 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_2700
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_2700
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certCrlPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certCrlDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPemObj: cert.X509CRLEntry[] = await x509CRLPem.getRevokedCerts();
          let issuerDerObj: cert.X509CRLEntry[] = await x509CRLDer.getRevokedCerts();
          expect(issuerDerObj.length).assertEqual(issuerPemObj.length);
          expect(issuerDerObj.length).assertEqual(1);
          let issuerPem: string = issuerPemObj[0].getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = issuerDerObj[0].getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuer: cert.DataBlob = issuerDerObj[0].getCertIssuer();
          // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
          // const issuerName = encoder.decodeWithStream(issuer.data);
          expect(issuerDer).assertEqual(issuerPem);
          // expect(issuerName).assertEqual("/C=CN/L=Beijing/L=\\xE4\\xBD\\xA0\\xE5\\xA5\\xBD China/L=\\xE4\\xBD\\xA0\\xE5\\xA5\\xBD Beijing/O=\\xE5\\x97\\xA8 Intermediate CA Corp/CN=\\xE5\\x97\\xA8 Intermediate CA");
          expect(issuerDer).assertEqual("C=CN,L=Beijing,L=你好 China,L=你好 Beijing,O=嗨 Intermediate CA Corp,CN=嗨 Intermediate CA");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_2700 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_2800
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_2800
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certCrlPemEn),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certCrlDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPemObj: cert.X509CRLEntry[] = await x509CRLPem.getRevokedCerts();
          let issuerDerObj: cert.X509CRLEntry[] = await x509CRLDer.getRevokedCerts();
          expect(issuerDerObj.length).assertEqual(issuerPemObj.length);
          expect(issuerDerObj.length).assertEqual(1);
          let issuerPem: string = issuerPemObj[0].getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = issuerDerObj[0].getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuer: cert.DataBlob = issuerDerObj[0].getCertIssuer();
          // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
          // const issuerName = encoder.decodeWithStream(issuer.data);
          expect(issuerDer).assertEqual(issuerPem);
          // expect(issuerName).assertEqual("/C=CN/L=Beijing/O=Intermediate CA Corp/CN=Intermediate CA");
          expect(issuerDer).assertEqual("C=CN,L=Beijing,O=Intermediate CA Corp,CN=Intermediate CA");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_2800 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_2900
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_2900
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certCrlPemZh),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certCrlDerZh),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPemObj: cert.X509CRLEntry[] = await getRevokedCerts(x509CRLPem);
          let issuerDerObj: cert.X509CRLEntry[] = await getRevokedCerts(x509CRLDer);
          expect(issuerDerObj.length).assertEqual(issuerPemObj.length);
          expect(issuerDerObj.length).assertEqual(1);
          let issuerPem: string = issuerPemObj[0].getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = issuerDerObj[0].getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuer: cert.DataBlob = issuerDerObj[0].getCertIssuer();
          // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
          // const issuerName = encoder.decodeWithStream(issuer.data);
          expect(issuerDer).assertEqual(issuerPem);
          // expect(issuerName).assertEqual("/C=CN/L=Beijing/L=\\xE4\\xBD\\xA0\\xE5\\xA5\\xBD China/L=\\xE4\\xBD\\xA0\\xE5\\xA5\\xBD Beijing/O=\\xE5\\x97\\xA8 Intermediate CA Corp/CN=\\xE5\\x97\\xA8 Intermediate CA");
          expect(issuerDer).assertEqual("C=CN,L=Beijing,L=你好 China,L=你好 Beijing,O=嗨 Intermediate CA Corp,CN=嗨 Intermediate CA");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_2900 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertResolution_Func_3000
     * @tc.number SUB_Security_Cert_Framework_CertResolution_Func_3000
     * @tc.desc   The X509 Cert CRL Format is PEM\DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_Security_Cert_Framework_CertResolution_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        try {
          let encodingBlobPem: cert.EncodingBlob = {
            data: stringTouInt8Array(certCrlPemEn),
            encodingFormat: cert.EncodingFormat.FORMAT_PEM
          };
          let encodingBlobDer: cert.EncodingBlob = {
            data: new Uint8Array(certCrlDerEn),
            encodingFormat: cert.EncodingFormat.FORMAT_DER
          };
          let x509CRLPem: cert.X509CRL = await cert.createX509CRL(encodingBlobPem);
          let x509CRLDer: cert.X509CRL = await cert.createX509CRL(encodingBlobDer);
          let issuerPemObj: cert.X509CRLEntry[] = await getRevokedCerts(x509CRLPem);
          let issuerDerObj: cert.X509CRLEntry[] = await getRevokedCerts(x509CRLDer);
          expect(issuerDerObj.length).assertEqual(issuerPemObj.length);
          expect(issuerDerObj.length).assertEqual(1);
          let issuerPem: string = issuerPemObj[0].getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuerDer: string = issuerDerObj[0].getCertIssuer(cert.EncodingType.ENCODING_UTF8);
          let issuer: cert.DataBlob = issuerDerObj[0].getCertIssuer();
          // let encoder = util.TextDecoder.create('utf8', {ignoreBOM: false});
          // const issuerName = encoder.decodeWithStream(issuer.data);
          expect(issuerDer).assertEqual(issuerPem);
          // expect(issuerName).assertEqual("/C=CN/L=Beijing/O=Intermediate CA Corp/CN=Intermediate CA");
          expect(issuerDer).assertEqual("C=CN,L=Beijing,O=Intermediate CA Corp,CN=Intermediate CA");
        } catch (error) {
          console.error(`SUB_Security_Cert_Framework_CertResolution_Func_3000 ${error}, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  });
}