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
import { BusinessError } from '@ohos.base';
import { cert } from "@kit.DeviceCertificateKit";
import { CMS_DIGEST,
  ECC_256_PRIVATE,
  ECC_256_PRIVATE2,
  ECC_256_PRIVATE_ENC, ECC_256_PUBKEY,
  RSA_PRIVATE,
  RSA_PUBKEY, CMS_SYM_CIPHER,
  CMS_RSA_PADDING } from "./utils/cms/envel";
import { createX509Cert } from "./utils/certificate/certPem";
import { createUint8Array } from "./utils/common/commonFunction";


export default function certFrameworkCertCmsTestUnit() {
  describe("certFrameworkCertCmsTestUnit", (): void => {

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_0100
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509Cert: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        for (let index = 0; index < CMS_SYM_CIPHER.length; index++) {
          cms.setRecipientEncryptionAlgorithm(CMS_SYM_CIPHER[index]);
          console.info("[XTS] set recipient encrypt cipher success:" + CMS_SYM_CIPHER[index]);
          for (let md of CMS_DIGEST) {
            let recipientInfo: cert.CmsRecipientInfo = {
              keyAgreeInfo: {
                cert: x509Cert,
                digestAlgorithm: md
              }
            };
            await cms.addRecipientInfo(recipientInfo);
            console.info("[XTS] add recipient success:" + md);
          };
          let envelopeData = await cms.doFinal(plainText, option);
          console.info("[XTS] doFinal success:" + envelopeData);
          if (envelopeData instanceof Uint8Array) {
            expect(null).assertFalse();
          }
          let cipherText = await cms.getEncryptedContentData();
          expect(cipherText.length).not().assertEqual(0);
        };
      } catch (error) {
        console.error(`[XTS] Cms_Func_0100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_0200
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        for (let index = 0; index < CMS_SYM_CIPHER.length; index++) {
          cms.setRecipientEncryptionAlgorithm(CMS_SYM_CIPHER[index]);
          console.info("[XTS] set recipient encrypt cipher success:" + CMS_SYM_CIPHER[index]);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA512
            },
            keyTransInfo: {
              cert: x509CertRsa
            }
          };
          await cms.addRecipientInfo(recipientInfo);
          console.info("[XTS] add recipient success:" + recipientInfo.keyAgreeInfo?.digestAlgorithm);
          let envelopeData = await cms.doFinal(plainText, option);
          console.info("[XTS] doFinal success:" + envelopeData);
          if (envelopeData instanceof Uint8Array) {
            expect(null).assertFalse();
          }
          let cipherText = await cms.getEncryptedContentData();
          expect(cipherText.length).not().assertEqual(0);
        };
      } catch (error) {
        console.error(`[XTS] Cms_Func_0200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_0300
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_0300
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let DATA_LEN: int[] = [
          1024 * 16, 1024 * 1024, 1024 * 1024 * 5
        ];
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        for (let index = 0; index < DATA_LEN.length; index++) {
          let plainText: Uint8Array = await createUint8Array(DATA_LEN[index]);
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
          console.info("[XTS] set recipient encrypt cipher success:" + cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA384
            },
            keyTransInfo: {
              cert: x509CertRsa
            }
          };
          await cms.addRecipientInfo(recipientInfo);
          console.info("[XTS] add recipient success:" + recipientInfo.keyAgreeInfo?.digestAlgorithm);
          let envelopeData = await cms.doFinal(plainText, option);
          console.info("[XTS] doFinal success:" + envelopeData);
          if (envelopeData instanceof Uint8Array) {
            expect(null).assertFalse();
          }
          let cipherText = await cms.getEncryptedContentData();
          expect(cipherText.length).not().assertEqual(0);
        };
      } catch (error) {
        console.error(`[XTS] Cms_Func_0300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_0400
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_0400
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509Cert: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.DER,
          isDetached: true,
          contentDataFormat: cert.CmsContentDataFormat.TEXT
        }
        for (let index = 0; index < CMS_SYM_CIPHER.length; index++) {
          cms.setRecipientEncryptionAlgorithm(CMS_SYM_CIPHER[index]);
          console.info("[XTS] set recipient encrypt cipher success:" + CMS_SYM_CIPHER[index]);
          for (let md of CMS_DIGEST) {
            let recipientInfo: cert.CmsRecipientInfo = {
              keyAgreeInfo: {
                cert: x509Cert,
                digestAlgorithm: md
              }
            };
            await cms.addRecipientInfo(recipientInfo);
            console.info("[XTS] add recipient success:" + md);
          };
          let envelopeData = cms.doFinalSync(plainText, option);
          console.info("[XTS] doFinal success:" + envelopeData);
          if (!(envelopeData instanceof Uint8Array)) {
            expect(null).assertFalse();
          }
          let cipherText = await cms.getEncryptedContentData();
          expect(cipherText.length).not().assertEqual(0);
        };
      } catch (error) {
        console.error(`[XTS] Cms_Func_0400 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_0500
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_0500
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.DER,
          isDetached: true,
          contentDataFormat: cert.CmsContentDataFormat.TEXT
        }
        for (let index = 0; index < CMS_SYM_CIPHER.length; index++) {
          cms.setRecipientEncryptionAlgorithm(CMS_SYM_CIPHER[index]);
          console.info("[XTS] set recipient encrypt cipher success:" + CMS_SYM_CIPHER[index]);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA512
            },
            keyTransInfo: {
              cert: x509CertRsa
            }
          };
          await cms.addRecipientInfo(recipientInfo);
          console.info("[XTS] add recipient success:" + recipientInfo.keyAgreeInfo?.digestAlgorithm);
          let envelopeData = cms.doFinalSync(plainText, option);
          console.info("[XTS] doFinal success:" + envelopeData);
          if (!(envelopeData instanceof Uint8Array)) {
            expect(null).assertFalse();
          }
          let cipherText = await cms.getEncryptedContentData();
          expect(cipherText.length).not().assertEqual(0);
        };
      } catch (error) {
        console.error(`[XTS] Cms_Func_0500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_0600
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_0600
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let DATA_LEN: int[] = [
          1024 * 16, 1024 * 1024, 1024 * 1024 * 6
        ];
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.DER,
          isDetached: true,
          contentDataFormat: cert.CmsContentDataFormat.TEXT // 5M数据Binary成功
        }
        for (let index = 0; index < DATA_LEN.length; index++) {
          let plainText: Uint8Array = await createUint8Array(DATA_LEN[index]);
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
          console.info("[XTS] set recipient encrypt cipher success:" + cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA384
            },
            keyTransInfo: {
              cert: x509CertRsa
            }
          };
          await cms.addRecipientInfo(recipientInfo);
          console.info("[XTS] add recipient success:" + recipientInfo.keyAgreeInfo?.digestAlgorithm);
          let envelopeData = cms.doFinalSync(plainText, option);
          console.info("[XTS] doFinal success:" + envelopeData);
          if (!(envelopeData instanceof Uint8Array)) {
            expect(null).assertFalse();
          }
          let cipherText = await cms.getEncryptedContentData();
          expect(cipherText.length).not().assertEqual(0);
        };
      } catch (error) {
        console.error(`[XTS] Cms_Func_0600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_0700
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_0700
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
        let recipientInfo: cert.CmsRecipientInfo = {
          keyAgreeInfo: {
            cert: x509CertEc,
            digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA384
          },
          keyTransInfo: {
            cert: x509CertRsa
          }
        };
        let recipientInfoKari: cert.CmsRecipientInfo = {
          keyAgreeInfo: {
            cert: x509CertEc,
            digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA384
          }
        };
        let recipientInfoKtri: cert.CmsRecipientInfo = {
          keyTransInfo: {
            cert: x509CertRsa
          }
        };
        /* 最大支持20个接收者 */
        for (let i = 0; i < 10; i++) {
          await cms.addRecipientInfo(recipientInfo);
        }
        try {
          await cms.addRecipientInfo(recipientInfoKtri);
        } catch (error) {
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        try {
          await cms.addRecipientInfo(recipientInfoKari);
        } catch (error) {
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
      } catch (error) {
        console.error(`[XTS] Cms_Func_0700 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_0900
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_0900
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
        let recipientInfoKari: cert.CmsRecipientInfo = {
          keyAgreeInfo: {
            cert: x509CertRsa, // 仅支持EC
            digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA384
          }
        };
        try {
          await cms.addRecipientInfo(recipientInfoKari);
        } catch (error) {
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
      } catch (error) {
        console.error(`[XTS] Cms_Func_0900 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_1000
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_1000
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
        let recipientInfoKtri: cert.CmsRecipientInfo = {
          keyTransInfo: {
            cert: x509CertEc, // 仅支持RSA
          }
        };
        try {
          await cms.addRecipientInfo(recipientInfoKtri);
        } catch (error) {
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
      } catch (error) {
        console.error(`[XTS] Cms_Func_1000 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_1200
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_1200
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
        /* 未添加接收者 */
        let envelopeData = await cms.doFinal(plainText, option);
        console.info("[XTS] doFinal success:" + envelopeData);
        if (envelopeData instanceof Uint8Array) {
          expect(null).assertFalse();
        }
        let cipherText = await cms.getEncryptedContentData();
        expect(cipherText.length).not().assertEqual(0);
      } catch (error) {
        console.error(`[XTS] Cms_Func_1200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_1300
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_1300
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array();
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
        await cms.doFinal(plainText, option);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cms_Func_1300 ${error}, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_1400
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_1400
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
        await cms.getEncryptedContentData()
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cms_Func_1400 ${error}, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_1500
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_1500
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
        let recipientInfo: cert.CmsRecipientInfo = {
          keyTransInfo: undefined,
          keyAgreeInfo: undefined
        }; // 接收者信息为空
        try {
          await cms.addRecipientInfo(recipientInfo);
        } catch (error) {
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_PARAMETER_CHECK_FAILED);
        }
      } catch (error) {
        console.error(`[XTS] Cms_Func_1500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_1600
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_1600
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        let recipientInfo: cert.CmsRecipientInfo = {
          keyAgreeInfo: {
            cert: x509CertEc
          }
        };
        try {
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
        } catch (error) {
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        try {
          await cms.addRecipientInfo(recipientInfo);
        } catch (error) {
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
      } catch (error) {
        console.error(`[XTS] Cms_Func_1600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_1700
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_1700
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
        let recipientInfo: cert.CmsRecipientInfo = {
          keyTransInfo: undefined,
          keyAgreeInfo: {
            cert: x509CertEc
          }
        };
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
        await cms.addRecipientInfo(recipientInfo);
        let envelopeData = await cms.doFinal(plainText, option);
        console.info("[XTS] doFinal success:" + envelopeData);
        if (envelopeData instanceof Uint8Array) {
          expect(null).assertFalse();
        }
        let cipherText = await cms.getEncryptedContentData();
        expect(cipherText.length).not().assertEqual(0);
      } catch (error) {
        console.error(`[XTS] Cms_Func_1700 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_1800
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_1800
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        let signerConfig: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addCert: false,
          rsaSignaturePadding: cert.CmsRsaSignaturePadding.PKCS1_PSS_PADDING
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: ECC_256_PRIVATE_ENC,
          password: "123456"
        }
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        cms.addSigner(x509CertEc, keyInfo, signerConfig);
        cms.addCert(x509CertEc);
        let signData = await cms.doFinal(plainText, option);
        if (signData instanceof Uint8Array) {
          expect(null).assertFalse();
        };
        console.info("[XTS] doFinal success:" + signData);
      } catch (error) {
        console.error(`[XTS] Cms_Func_1800 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_1900
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_1900
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        let signerConfig: cert.CmsSignerConfig = {
          mdName: "SHA256",
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: ECC_256_PRIVATE
        }
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        cms.addSigner(x509CertEc, keyInfo, signerConfig);
        let signData = await cms.doFinal(plainText, option);
        if (signData instanceof Uint8Array) {
          expect(null).assertFalse();
        };
        console.info("[XTS] doFinal success:" + signData);
      } catch (error) {
        console.error(`[XTS] Cms_Func_1900 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_2000
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_2000
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        let signerConfig: cert.CmsSignerConfig = {
          mdName: "SHA512",
          rsaSignaturePadding: cert.CmsRsaSignaturePadding.PKCS1_PSS_PADDING
        };
        let keyEcInfo: cert.PrivateKeyInfo = {
          key: ECC_256_PRIVATE
        }
        let keyRsaInfo: cert.PrivateKeyInfo = {
          key: RSA_PRIVATE
        }
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        cms.addSigner(x509CertEc, keyEcInfo, signerConfig);
        cms.addSigner(x509CertRsa, keyRsaInfo, signerConfig);
        let signData = await cms.doFinal(plainText, option);
        if (signData instanceof Uint8Array) {
          expect(null).assertFalse();
        };
        console.info("[XTS] doFinal success:" + signData);
      } catch (error) {
        console.error(`[XTS] Cms_Func_2000 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_2100
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_2100
     * @tc.desc   The PKCS7 CMS, Sync Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        let signerConfig: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addCert: false,
          rsaSignaturePadding: cert.CmsRsaSignaturePadding.PKCS1_PSS_PADDING
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: ECC_256_PRIVATE_ENC,
          password: "123456"
        }
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        cms.addSigner(x509CertEc, keyInfo, signerConfig);
        cms.addCert(x509CertEc);
        let signData = cms.doFinalSync(plainText, option);
        if (signData instanceof Uint8Array) {
          expect(null).assertFalse();
        };
        console.info("[XTS] doFinal success:" + signData);
      } catch (error) {
        console.error(`[XTS] Cms_Func_2100 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_2200
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_2200
     * @tc.desc   The PKCS7 CMS, Sync Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        let signerConfig: cert.CmsSignerConfig = {
          mdName: "SHA256",
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: ECC_256_PRIVATE
        }
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        cms.addSigner(x509CertEc, keyInfo, signerConfig);
        let signData = cms.doFinalSync(plainText, option);
        if (signData instanceof Uint8Array) {
          expect(null).assertFalse();
        };
        console.info("[XTS] doFinal success:" + signData);
      } catch (error) {
        console.error(`[XTS] Cms_Func_2200 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_2300
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_2300
     * @tc.desc   The PKCS7 CMS, Sync Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        let signerConfig: cert.CmsSignerConfig = {
          mdName: "SHA512",
          rsaSignaturePadding: cert.CmsRsaSignaturePadding.PKCS1_PSS_PADDING
        };
        let keyEcInfo: cert.PrivateKeyInfo = {
          key: ECC_256_PRIVATE
        }
        let keyRsaInfo: cert.PrivateKeyInfo = {
          key: RSA_PRIVATE
        }
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.PEM
        }
        cms.addSigner(x509CertEc, keyEcInfo, signerConfig);
        cms.addSigner(x509CertRsa, keyRsaInfo, signerConfig);
        let signData = cms.doFinalSync(plainText, option);
        if (signData instanceof Uint8Array) {
          expect(null).assertFalse();
        };
        console.info("[XTS] doFinal success:" + signData);
        try {
          await cms.getEncryptedContentData();
          expect(null).assertFail();
        } catch (error) {
          console.error(`[XTS] ${error}, error code: ${error.code}`);
          expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
      } catch (error) {
        console.error(`[XTS] Cms_Func_2300 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_2400
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_2400
     * @tc.desc   The PKCS7 CMS, Sync Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        let signerConfig: cert.CmsSignerConfig = {
          mdName: "SHA512",
        };
        let keyEcInfo: cert.PrivateKeyInfo = {
          key: ECC_256_PRIVATE2 // 与公钥证书不匹配
        }
        cms.addSigner(x509CertEc, keyEcInfo, signerConfig);
        expect(null).assertFail();
      } catch (error) {
        console.error(`[XTS] Cms_Func_2400 ${error}, error code: ${error.code}`);
        expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_2500
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_2500
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.DER
        }
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        cms.addCert(x509CertEc);
        let rawData = await cms.doFinal(plainText, option);
        if (!(rawData instanceof Uint8Array)) {
          expect(null).assertFail();
        }
        console.info("[XTS] doFinal success:" + rawData);
      } catch (error) {
        console.error(`[XTS] Cms_Func_2500 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_2600
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_2600
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.DER
        }
        let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        cms.addCert(x509CertEc);
        let rawData = cms.doFinalSync(plainText, option);
        if (!(rawData instanceof Uint8Array)) {
          expect(null).assertFail();
        }
        console.info("[XTS] doFinal success:" + rawData);
      } catch (error) {
        console.error(`[XTS] Cms_Func_2600 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_2700
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_2700
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.DER
        }
        let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
        let rawData = cms.doFinalSync(plainText, option);
        if (!(rawData instanceof Uint8Array)) {
          expect(null).assertFail();
        }
        console.info("[XTS] doFinal success:" + rawData);
      } catch (error) {
        console.error(`[XTS] Cms_Func_2700 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertCms_Func_2800
     * @tc.number SUB_Security_Cert_Framework_CertCms_Func_2800
     * @tc.desc   The PKCS7 CMS, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertCms_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
        let option: cert.CmsGeneratorOptions = {
          outFormat: cert.CmsFormat.DER
        }
        let keyInfo: cert.PrivateKeyInfo = {
          key: RSA_PRIVATE
        }
        for (let index = 0; index < CMS_RSA_PADDING.length; index++) {
          let signerConfig: cert.CmsSignerConfig = {
            mdName: "SHA512",
            addCert: true,
            rsaSignaturePadding: CMS_RSA_PADDING[index]
          };
          let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.SIGNED_DATA);
          cms.addSigner(x509CertRsa, keyInfo, signerConfig);
          let rawData = cms.doFinalSync(plainText, option);
          if (!(rawData instanceof Uint8Array)) {
            expect(null).assertFail();
          }
          console.info("[XTS] doFinal success:" + rawData);
        }
      } catch (error) {
        console.error(`[XTS] Cms_Func_2800 ${error}, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

  })
}