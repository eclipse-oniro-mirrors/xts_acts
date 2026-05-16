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
  CMS_DATA,
  CMS_KEK_DETACHED_DATA,
  CMS_ONLY_KEK_ATTACHED_DATA,
  ECC_256_PRIVATE,
  ECC_256_PRIVATE_ENC,
  ECC_256_PUBKEY, RSA_PRIVATE, RSA_PUBKEY } from "./utils/cms/envel";
import { compareUint8Array } from "./utils/common/commonFunction";
import { ECC_256_PRI_ENTRY_KEY, ECC_256_PUB_ROOT_CERT } from "./utils/cms/verify";


export default function certFrameworkCmsDecryptTestUnit() {
  describe("certFrameworkCmsDecryptTestUnit", (): void => {

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_0100
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_0100
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM
          };
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA256
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
          console.info("[XTS] cipherText success:" + cipherText);
          expect(cipherText.length).not().assertEqual(0);
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRIVATE
            },
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(envelopeData, cert.CmsFormat.PEM);
          let decPlainText: Uint8Array = await cmsDecrypt.decryptEnvelopedData(config);
          console.info("[XTS] Decrypt success:" + decPlainText);
          let ret: boolean = compareUint8Array(decPlainText, plainText);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_0100 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_0200
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_0200
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_0200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM
          };
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_CBC);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyTransInfo: {
              cert: x509CertRsa,
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
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: RSA_PRIVATE
            }
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(envelopeData, cert.CmsFormat.PEM);
          let decPlainText: Uint8Array = await cmsDecrypt.decryptEnvelopedData(config);
          console.info("[XTS] Decrypt success:" + decPlainText);
          let ret: boolean = compareUint8Array(decPlainText, plainText);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_0200 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_0300
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_0300
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_0300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          };
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_CBC);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA256
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
          console.info("[XTS] cipherText success:" + cipherText);
          expect(cipherText.length).not().assertEqual(0);
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRIVATE
            },
            encryptedContentData: cipherText,
            contentDataFormat: cert.CmsContentDataFormat.BINARY
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(envelopeData, cert.CmsFormat.PEM);
          let decPlainText: Uint8Array = await cmsDecrypt.decryptEnvelopedData(config);
          console.info("[XTS] Decrypt success:" + decPlainText);
          let ret: boolean = compareUint8Array(decPlainText, plainText);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_0300 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_0400
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_0400
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_0400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertRsa: cert.X509Cert = await createX509Cert(RSA_PUBKEY);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          };
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_CBC);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyTransInfo: {
              cert: x509CertRsa,
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
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: RSA_PRIVATE
            },
            encryptedContentData: cipherText,
            contentDataFormat: cert.CmsContentDataFormat.BINARY
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(envelopeData, cert.CmsFormat.PEM);
          let decPlainText: Uint8Array = await cmsDecrypt.decryptEnvelopedData(config);
          console.info("[XTS] Decrypt success:" + decPlainText);
          let ret: boolean = compareUint8Array(decPlainText, plainText);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_0400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_0500
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_0500
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_0500",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          // cipherText: 34 25 48 0c
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRIVATE
            },
            encryptedContentData: new Uint8Array([0x34, 0x25, 0x48, 0x0c]),
            contentDataFormat: cert.CmsContentDataFormat.BINARY
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(CMS_KEK_DETACHED_DATA, cert.CmsFormat.PEM);
          let decPlainText: Uint8Array = await cmsDecrypt.decryptEnvelopedData(config);
          console.info("[XTS] Decrypt success:" + decPlainText);
          let ret: boolean = compareUint8Array(decPlainText, plainText);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_0500 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_0600
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_0600
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_0600",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          // cipherText: 34 25 48 0c, plainText: 0x01, 0x02, 0x03, 0x04
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRIVATE
            }
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(CMS_KEK_DETACHED_DATA, cert.CmsFormat.PEM);
          await cmsDecrypt.decryptEnvelopedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_0600 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_0700
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_0700
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_0700",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04]);
          let config1: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRIVATE
            },
            encryptedContentData: new Uint8Array([0x34, 0x25, 0x48, 0x0c]),
            contentDataFormat: cert.CmsContentDataFormat.BINARY
          };
          let config2: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: RSA_PRIVATE
            },
            encryptedContentData: new Uint8Array([0x34, 0x25, 0x48, 0x0c]),
            contentDataFormat: cert.CmsContentDataFormat.BINARY
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(CMS_KEK_DETACHED_DATA, cert.CmsFormat.PEM);
          let decPlainText: Uint8Array = await cmsDecrypt.decryptEnvelopedData(config1);
          console.info("[XTS] Decrypt success:" + decPlainText);
          let ret: boolean = compareUint8Array(decPlainText, plainText);
          expect(ret).assertTrue();
          let decPlainText2: Uint8Array = await cmsDecrypt.decryptEnvelopedData(config2);
          ret = compareUint8Array(decPlainText2, plainText);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_0700 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_0800
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_0800
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_0800",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          // cipherText: b9 3f 8d 4c, plainText: 0x01, 0x02, 0x03, 0x04
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: new Uint8Array([
                0x00, 0xf4, 0x60, 0xd1, 0x99, 0x86, 0x99, 0x22, 0x51, 0x71, 0x2e, 0xd8, 0xec, 0xb3, 0xb4, 0x5d,
                0xda, 0xe0, 0x77, 0x1b, 0x34, 0x95, 0xba, 0xd8, 0xd3, 0x94, 0xcf, 0xf3, 0xc0, 0x50, 0xa3, 0x84
              ])
            }
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(CMS_ONLY_KEK_ATTACHED_DATA, cert.CmsFormat.PEM);
          await cmsDecrypt.decryptEnvelopedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_0800 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_0900
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_0900
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_0900",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
          let x509CertEcOther: cert.X509Cert = await createX509Cert(ECC_256_PUB_ROOT_CERT);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM
          };
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA256
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
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRIVATE
            },
            cert: x509CertEcOther
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(envelopeData, cert.CmsFormat.PEM);
          await cmsDecrypt.decryptEnvelopedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_0900 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_1000
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_1000
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_1000",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM
          };
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA256
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
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRI_ENTRY_KEY
            },
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(envelopeData, cert.CmsFormat.PEM);
          await cmsDecrypt.decryptEnvelopedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_1000 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_1100
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_1100
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_1100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM
          };
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA256
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
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRIVATE_ENC,
              password: "123654" // 123456
            },
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(envelopeData, cert.CmsFormat.PEM);
          await cmsDecrypt.decryptEnvelopedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_1100 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_1200
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_1200
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_1200",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let cipherText: Uint8Array = new Uint8Array([174,213,171,79,251,248,234]); // 密文被篡改
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRIVATE_ENC,
              password: "123456"
            },
            encryptedContentData: cipherText,
            contentDataFormat: cert.CmsContentDataFormat.BINARY
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(CMS_DATA, cert.CmsFormat.PEM);
          await cmsDecrypt.decryptEnvelopedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_1200 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_1300
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_1300
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_1300",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.PEM,
            isDetached: true
          };
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA256
            }
          };
          await cms.addRecipientInfo(recipientInfo);
          console.info("[XTS] add recipient success:" + recipientInfo.keyAgreeInfo?.digestAlgorithm);
          let envelopeData = await cms.doFinal(plainText, option);
          console.info("[XTS] doFinal success:" + envelopeData);
          if (envelopeData instanceof Uint8Array) {
            expect(null).assertFalse();
          }
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRIVATE_ENC,
              password: "123456"
            },
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(envelopeData, cert.CmsFormat.PEM);
          await cmsDecrypt.decryptEnvelopedData(config);
          expect(null).assertFail();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_1300 “${error}“, error code: ${error.code}`);
          expect(error.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        }
        done();
      });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Cms_Decrypt_Func_1400
     * @tc.number SUB_Security_Cert_Framework_Cms_Decrypt_Func_1400
     * @tc.desc   The CMS Decrypt, ECC, Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Cms_Decrypt_Func_1400",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        try {
          let plainText: Uint8Array = new Uint8Array([0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let expectPlainText: Uint8Array = new Uint8Array([
            0x43, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x2d, 0x54, 0x79, 0x70, 0x65, 0x3a, 0x20, 0x74, 0x65,
            0x78, 0x74, 0x2f, 0x70, 0x6c, 0x61, 0x69, 0x6e, 0x0d, 0x0a, 0x0d, 0x0a,
            0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07]);
          let x509CertEc: cert.X509Cert = await createX509Cert(ECC_256_PUBKEY);
          let cms: cert.CmsGenerator = cert.createCmsGenerator(cert.CmsContentType.ENVELOPED_DATA);
          let option: cert.CmsGeneratorOptions = {
            outFormat: cert.CmsFormat.DER,
            contentDataFormat: cert.CmsContentDataFormat.TEXT
          };
          cms.setRecipientEncryptionAlgorithm(cert.CmsRecipientEncryptionAlgorithm.AES_128_GCM);
          let recipientInfo: cert.CmsRecipientInfo = {
            keyAgreeInfo: {
              cert: x509CertEc,
              digestAlgorithm: cert.CmsKeyAgreeRecipientDigestAlgorithm.SHA256
            }
          };
          await cms.addRecipientInfo(recipientInfo);
          console.info("[XTS] add recipient success:" + recipientInfo.keyAgreeInfo?.digestAlgorithm);
          let envelopeData = await cms.doFinal(plainText, option);
          console.info("[XTS] doFinal success:" + envelopeData);
          let cipherText = await cms.getEncryptedContentData();
          expect(cipherText.length).not().assertEqual(0);
          let config: cert.CmsEnvelopedDecryptionConfig = {
            keyInfo: {
              key: ECC_256_PRIVATE_ENC,
              password: "123456"
            },
            encryptedContentData: cipherText,
            contentDataFormat: cert.CmsContentDataFormat.TEXT
          };
          let cmsDecrypt: cert.CmsParser = cert.createCmsParser();
          await cmsDecrypt.setRawData(envelopeData, cert.CmsFormat.DER);
          let decPlainText: Uint8Array = await cmsDecrypt.decryptEnvelopedData(config);
          console.info("[XTS] Decrypt success:" + decPlainText);
          let ret: boolean = compareUint8Array(decPlainText, expectPlainText);
          expect(ret).assertTrue();
        } catch (error: BusinessError) {
          console.error(`[XTS] Cms_Decrypt_Func_1400 “${error}“, error code: ${error.code}`);
          expect(null).assertFail();
        }
        done();
      });

  })
}