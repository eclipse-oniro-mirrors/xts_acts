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

import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import { cert } from "@kit.DeviceCertificateKit";
import { createX509Cert } from "./utils/certificate/certPem";
import {
  CMS_ENVELOPE,
  CMS_EXPIRED_DATA,
  CMS_EXPIRED_ENTRY_CERT,
  CMS_EXPIRED_INTER_CERT,
  CMS_EXPIRED_ROOT_CERT,
  CMS_NOT_EFFECT_DATA,
  CMS_NOT_EFFECT_ENTRY_CERT,
  CMS_NOT_EFFECT_INTER_CERT,
  CMS_NOT_EFFECT_ROOT_CERT,
  CMS_SIGN_ATTACHED_NO_DATA,
  CMS_SIGN_BINARY_DETACHED_NO_DATA,
  CMS_SIGN_DETACHED_DATA,
  CMS_SIGN_DETACHED_NO_DATA,
  CMS_SIGN_TEXT_ATTACHED_DATA,
  CMS_SIGN_TEXT_DETACHED_DATA,
  CMS_SIGN_TEXT_DETACHED_NO_DATA,
  CMS_SIGN_WITH_SHA224,
  CMS_SIGN_WITH_SHA224_INTER_CERT,
  CMS_SIGN_WITH_SHA224_PUB_CERT,
  CMS_SIGN_WITH_SHA224_ROOT_CERT,
  CMS_S_MIME_DATA,
  DSA_CMS_SIGN,
  DSA_PUB_CERT,
  DSA_PUB_INTER_CERT,
  DSA_PUB_ROOT_CERT,
  ECC_256_PRI_ENTRY_KEY, ECC_256_PUB_ENTRY_CERT, ECC_256_PUB_INTER_CERT,
  ECC_256_PUB_ROOT_CERT,
  RSA_PRI_ENTRY_KEY,
  RSA_PUB_ENTRY_CERT,
  RSA_PUB_INTER_CERT,
  RSA_PUB_ROOT_CERT,
  TEST_MAX_50_PUB_INTER_CERT,
  TEST_MAX_50_PUB_ROOT_CERT,
  TEST_MAX_50_SIGNERS,
  TEST_MAX_50_SIGNERS_CERT} from "./utils/cms/verify";
import { compareUint8Array } from "./utils/common/commonFunction";


export default function certFrameworkCmsVerifyTestUnit() {
  describe("certFrameworkCmsVerifyTestUnit", (): void => {

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_0100
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_0100
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(ECC_256_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
          };
          let keyInfo: cert.PrivateKeyInfo = {
            key: ECC_256_PRI_ENTRY_KEY
          }
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM
          }
          cms.addSigner(x509CertEntry, keyInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_0100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_0200
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_0200
     * @tc.desc   The CMS Verify, RSA, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(RSA_PUB_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(RSA_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(RSA_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
          };
          let keyInfo: cert.PrivateKeyInfo = {
            key: RSA_PRI_ENTRY_KEY
          };
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM
          }
          cms.addSigner(x509CertEntry, keyInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_0200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_0300
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_0300
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(ECC_256_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
          };
          let keyInfo: cert.PrivateKeyInfo = {
            key: ECC_256_PRI_ENTRY_KEY
          }
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          }
          cms.addSigner(x509CertEntry, keyInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
            contentData: plainText
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_0300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_0400
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_0400
     * @tc.desc   The CMS Verify, RSA, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(RSA_PUB_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(RSA_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(RSA_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
          };
          let keyInfo: cert.PrivateKeyInfo = {
            key: RSA_PRI_ENTRY_KEY
          };
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          }
          cms.addSigner(x509CertEntry, keyInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
            contentData: plainText
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_0400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_0500
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_0500
     * @tc.desc   The CMS Verify, RSA, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertRsaEntry: cert.X509Cert = await createX509Cert(RSA_PUB_ENTRY_CERT);
          let x509CertRsaInter: cert.X509Cert = await createX509Cert(RSA_PUB_INTER_CERT);
          let x509CertRsaRoot: cert.X509Cert = await createX509Cert(RSA_PUB_ROOT_CERT);
          let x509CertEcEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let x509CertEcInter: cert.X509Cert = await createX509Cert(ECC_256_PUB_INTER_CERT);
          let x509CertEcRoot: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
          };
          let keyRsaInfo: cert.PrivateKeyInfo = {
            key: RSA_PRI_ENTRY_KEY
          };
          let keyEcInfo: cert.PrivateKeyInfo = {
            key: ECC_256_PRI_ENTRY_KEY
          };
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          }
          cms.addSigner(x509CertRsaEntry, keyRsaInfo, signerConfig);
          cms.addSigner(x509CertEcEntry, keyEcInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRsaRoot, x509CertRsaInter, x509CertEcRoot, x509CertEcInter],
            contentData: plainText
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_0500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_0600
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_0600
     * @tc.desc   The CMS Verify, RSA, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(RSA_PUB_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(RSA_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(RSA_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
            addCert: false
          };
          let keyInfo: cert.PrivateKeyInfo = {
            key: RSA_PRI_ENTRY_KEY
          };
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          }
          cms.addSigner(x509CertEntry, keyInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_0600 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_0700
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_0700
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(ECC_256_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
            addCert: false
          };
          let keyInfo: cert.PrivateKeyInfo = {
            key: ECC_256_PRI_ENTRY_KEY
          }
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          }
          cms.addSigner(x509CertEntry, keyInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_0700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_0800
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_0800
     * @tc.desc   The CMS Verify, RSA, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertRsaEntry: cert.X509Cert = await createX509Cert(RSA_PUB_ENTRY_CERT);
          let x509CertRsaInter: cert.X509Cert = await createX509Cert(RSA_PUB_INTER_CERT);
          let x509CertRsaRoot: cert.X509Cert = await createX509Cert(RSA_PUB_ROOT_CERT);
          let x509CertEcEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let x509CertEcInter: cert.X509Cert = await createX509Cert(ECC_256_PUB_INTER_CERT);
          let x509CertEcRoot: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
            addCert: false
          };
          let keyRsaInfo: cert.PrivateKeyInfo = {
            key: RSA_PRI_ENTRY_KEY
          };
          let keyEcInfo: cert.PrivateKeyInfo = {
            key: ECC_256_PRI_ENTRY_KEY
          };
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          }
          cms.addSigner(x509CertRsaEntry, keyRsaInfo, signerConfig);
          cms.addSigner(x509CertEcEntry, keyEcInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRsaRoot, x509CertRsaInter, x509CertEcRoot, x509CertEcInter],
            contentData: plainText,
            signerCerts: [x509CertRsaEntry, x509CertEcEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_0800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_0900
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_0900
     * @tc.desc   The CMS Verify, RSA, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertRsaEntry: cert.X509Cert = await createX509Cert(RSA_PUB_ENTRY_CERT);
          let x509CertRsaInter: cert.X509Cert = await createX509Cert(RSA_PUB_INTER_CERT);
          let x509CertRsaRoot: cert.X509Cert = await createX509Cert(RSA_PUB_ROOT_CERT);
          let x509CertEcEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let x509CertEcInter: cert.X509Cert = await createX509Cert(ECC_256_PUB_INTER_CERT);
          let x509CertEcRoot: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
          };
          let keyRsaInfo: cert.PrivateKeyInfo = {
            key: RSA_PRI_ENTRY_KEY
          };
          let keyEcInfo: cert.PrivateKeyInfo = {
            key: ECC_256_PRI_ENTRY_KEY
          };
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.DER,
          }
          cms.addSigner(x509CertRsaEntry, keyRsaInfo, signerConfig);
          cms.addSigner(x509CertEcEntry, keyEcInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRsaRoot, x509CertRsaInter, x509CertEcRoot, x509CertEcInter],
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.DER);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_0900 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_1000
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_1000
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          }
          cms.addCert(x509CertEntry);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [],
            contentData: plainText,
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_1000 “${error}“, error code: ${error.code}`);
          // [Openssl]: engine fail, error code = 385876103, error string = error:17000087:CMS routines::no signers
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_1100
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_1100
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          }
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [],
            contentData: plainText,
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_1100 “${error}“, error code: ${error.code}`);
          // [Openssl]: engine fail, error code = 385876103, error string = error:17000087:CMS routines::no signers
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_1200
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_1200
     * @tc.desc   The CMS Verify, RSA, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertRsaEntry: cert.X509Cert = await createX509Cert(RSA_PUB_ENTRY_CERT);
          let x509CertRsaInter: cert.X509Cert = await createX509Cert(RSA_PUB_INTER_CERT);
          let x509CertRsaRoot: cert.X509Cert = await createX509Cert(RSA_PUB_ROOT_CERT);
          let x509CertEcEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let x509CertEcInter: cert.X509Cert = await createX509Cert(ECC_256_PUB_INTER_CERT);
          let x509CertEcRoot: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
            addCert: false
          };
          let keyRsaInfo: cert.PrivateKeyInfo = {
            key: RSA_PRI_ENTRY_KEY
          };
          let keyEcInfo: cert.PrivateKeyInfo = {
            key: ECC_256_PRI_ENTRY_KEY
          };
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          }
          for (let index = 0; index < 10; index++) {
            cms.addSigner(x509CertRsaEntry, keyRsaInfo, signerConfig);
          }
          for (let index = 0; index < 10; index++) {
            cms.addSigner(x509CertEcEntry, keyEcInfo, signerConfig);
          }
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };

          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRsaRoot, x509CertRsaInter, x509CertEcRoot, x509CertEcInter],
            contentData: plainText,
            signerCerts: [x509CertRsaEntry, x509CertEcEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_1200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_1300
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_1300
     * @tc.desc   The CMS Verify, RSA, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(TEST_MAX_50_SIGNERS_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(TEST_MAX_50_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(TEST_MAX_50_PUB_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(TEST_MAX_50_SIGNERS, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          let contentData: Uint8Array = await verify.getContentData();
          let ret: boolean = compareUint8Array(contentData, plainText);
          expect(ret).assertTrue();
          let contentType: cert.CmsContentType = verify.getContentType();
          expect(contentType).assertEqual(cert.CmsContentType.SIGNED_DATA);
          let signerCerts: cert.X509Cert[] = await verify.getCerts(cert.CmsCertType.SIGNER_CERTS);
          expect(signerCerts.length).assertEqual(0);
          console.info("[XTS] getCert 1 success:" + contentType);
          let allCerts: cert.X509Cert[] = await verify.getCerts(cert.CmsCertType.ALL_CERTS);
          console.info("[XTS] getCert 2 success:" + contentType);
          expect(allCerts.length).assertEqual(0);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_1300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();

      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_1400
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_1400
     * @tc.desc   The CMS Verify, DSA, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(DSA_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(DSA_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(DSA_PUB_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(DSA_CMS_SIGN, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_1400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_1500
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_1500
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_1500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(ECC_256_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
            addCert: false
          };
          let keyInfo: cert.PrivateKeyInfo = {
            key: ECC_256_PRI_ENTRY_KEY
          }
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM
          }
          cms.addSigner(x509CertEntry, keyInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
            signerCerts: [x509CertInter] // 与签名者证书不匹配
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_1500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_1600
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_1600
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_1600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(ECC_256_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
          };
          let keyInfo: cert.PrivateKeyInfo = {
            key: ECC_256_PRI_ENTRY_KEY
          }
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          }
          cms.addSigner(x509CertEntry, keyInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          };
          /* 传入的contentData与实际签名的不一致 */
          plainText[1]--;
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
            contentData: plainText
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_1600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_1700
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_1700
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_1700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let config: cert.CmsVerificationConfig = {
            trustCerts: [],
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_ENVELOPE, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_1700 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_1800
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_1800
     * @tc.desc   The CMS Verify, RSA, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_1800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_WITH_SHA224, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_1800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_1900
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_1900
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_1900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_S_MIME_DATA, cert.CmsFormat.PEM);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_1900 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_2000
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_2000
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_2000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array();
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_ATTACHED_NO_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_2000 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_2100
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_2100
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_2100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array();
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_DETACHED_NO_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_2100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_2200
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_2200
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_2200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05]); // 不匹配
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_DETACHED_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_2200 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_2300
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_2300
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_2300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_DETACHED_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_2300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_2400
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_2400
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_2400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_DETACHED_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_2400 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_2500
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_2500
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_2500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let verify: cert.CmsParser;
      try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(RSA_PUB_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          verify= cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_DETACHED_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_2500 1 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_UNABLE_TO_GET_ISSUER_CERT_LOCALLY);
        } finally {
          try {
            await verify.getContentData();
            expect(null).assertFail();
          } catch (error: BusinessError) {
            console.error(`[XTS] Cms_Verify_Func_2500 2 “${error}“, error code: ${error.code}`);
            expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
          }
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_2600
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_2600
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_2600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_DETACHED_DATA, cert.CmsFormat.PEM);
          await verify.getContentData();
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_2600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_2700
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_2700
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_2700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_DETACHED_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          await verify.getContentData();
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_2700 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_2800
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_2800
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_2800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([
            0x43, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x2d, 0x54, 0x79, 0x70, 0x65, 0x3a, 0x20, 0x74, 0x65,
            0x78, 0x74, 0x2f, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x0d, 0x0a, 0x0d, 0x0a, 0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_TEXT_ATTACHED_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          let data: Uint8Array = await verify.getContentData();
          let ret: boolean = compareUint8Array(plainText, data);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_2800 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_2900
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_2900
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_2900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([
            0x43, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x2d, 0x54, 0x79, 0x70, 0x65, 0x3a, 0x20, 0x74, 0x65,
            0x78, 0x74, 0x2f, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x0d, 0x0a, 0x0d, 0x0a, 0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_TEXT_DETACHED_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_2900 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_3000
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_3000
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_3000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_TEXT_DETACHED_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_3000 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_3100
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_3100
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_3100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([
            0x43, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x2d, 0x54, 0x79, 0x70, 0x65, 0x3a, 0x20, 0x74, 0x65,
            0x78, 0x74, 0x2f, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x0d, 0x0a, 0x0d, 0x0a]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_TEXT_DETACHED_NO_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_3100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_3200
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_3200
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_3200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array();
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_PUB_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_SIGN_WITH_SHA224_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertInter, x509CertRoot],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_SIGN_BINARY_DETACHED_NO_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_3200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_3300
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_3300
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_3300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(ECC_256_PUB_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(ECC_256_PUB_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA256",
          };
          let keyInfo: cert.PrivateKeyInfo = {
            key: ECC_256_PRI_ENTRY_KEY
          }
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM
          }
          cms.addSigner(x509CertEntry, keyInfo, signerConfig);
          let signData = cms.doFinalSync(plainText, option);
          if (signData instanceof Uint8Array) {
            expect(null).assertFalse();
          }
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(signData, cert.CmsFormat.PEM);
          try {
            config.contentDataFormat = undefined;
            await verify.verifySignedData(config);
          } catch (error: BusinessError) {
            console.error(`[XTS] verifySignedData 2 “${error}“, error code: ${error.code}`);
            expect(null).assertFail();
          }
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_3300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_3400
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_3400
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_3400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_EXPIRED_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_EXPIRED_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_EXPIRED_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_EXPIRED_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_3400 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Verify_Func_3500
     * @tc.number SUB_Security_Cert_Framework_Cms_Verify_Func_3500
     * @tc.desc   The CMS Verify, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Verify_Func_3500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let x509CertEntry: cert.X509Cert = await createX509Cert(CMS_NOT_EFFECT_ENTRY_CERT);
          let x509CertInter: cert.X509Cert = await createX509Cert(CMS_NOT_EFFECT_INTER_CERT);
          let x509CertRoot: cert.X509Cert = await createX509Cert(CMS_NOT_EFFECT_ROOT_CERT);
          let config: cert.CmsVerificationConfig = {
            trustCerts: [x509CertRoot, x509CertInter],
            contentData: plainText,
            signerCerts: [x509CertEntry]
          };
          let verify: cert.CmsParser = cert.createCmsParser();
          await verify.setRawData(CMS_NOT_EFFECT_DATA, cert.CmsFormat.PEM);
          await verify.verifySignedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Verify_Func_3500 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
        }
        done();
      });

  })
}