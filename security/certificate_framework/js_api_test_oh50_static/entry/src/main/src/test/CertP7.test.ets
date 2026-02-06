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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import cert from '@ohos.security.cert';
import {
  cert1,
  cmsSignerTest,
  cmsSignerWithPasswordTest,
  damaged_pri,
  ecc_ca_cert,
  ecc_enc_p1_pem,
  ecc_enc_p8_pem,
  ecc_p256_cert,
  ecc_p256_pem,
  expired_cert,
  expired_pri,
  mdSpec,
  private2,
  rsa_other_cert_1,
  rsa_other_cert_2,
  rsa_other_self_sign_cert_zh,
  rsa_p1_cert_pem,
  rsa_p1_der,
  rsa_p1_enc_der,
  rsa_p1_enc_pem,
  rsa_p1_pem,
  rsa_p8_der,
  rsa_p8_enc_der,
  rsa_p8_enc_pem, rsa_p8_enc_pem_cert,
  rsa_p1_enc_pem_zh,
  rsa_p8_pem,
  rsa_p8_pem_cert,
  rsa_p1_pem_cert_zh,
  rsa_password_is_empty,
  rsa_password_is_empty_cert,
  rsa_pri_passwd_len_1,
  rsa_pri_passwd_len_1_cert,
  key_usage_enc_cert,
  key_usage_pri_enc,
  rsa_bits_1000_pri,
  rsa_bits_1000_cert,
  certDataPassword_Pri,
  certDataPassword,
  luanma_pri,
  luanma_cert,
  rsa_password_is_empty_cert2,
  privateKeyPasswordDerIsEmpty2
} from './utils/cms/cms';
import { stringToUint8Array } from './utils/certificate/p12';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;

export default function certFrameworkCertPkcs7ExtCMSFunctionTestUnit() {
  describe("certFrameworkCertPkcs7ExtCMSFunctionTestUnit", () => {
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      // Create X509 certChain0-certChain2
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_0100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_pem
        };
        let key_cert: string = rsa_p8_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        for (let i = 0; i < 20; i++) {
          generator.addSigner(x509Cert, keyInfo, signer);
        }
        expect(null).assertNull();
        let p7 = generator.doFinalSync(new Uint8Array([0x99, 0x88]), {outFormat: cert.CmsFormat.PEM});
        if (p7 instanceof Uint8Array) {
          console.info("################# p7:" + p7)
        } else {
          console.info("################# p7:" + p7.toString())
        }
        try {
          generator.addSigner(x509Cert, keyInfo, signer);
        } catch (error) {
          console.error(`addSigner catch error: ${error}`);
          expect((error as BusinessError).code).assertEqual(19030001);
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_0100 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_0200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_pem
        };
        let key_cert: string = rsa_p8_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        for (let i = 0; i < 20; i++) {
          generator.addSigner(x509Cert, keyInfo, signer);
        }
        expect(null).assertNull();
        try {
          generator.addSigner(x509Cert, keyInfo, signer);
        } catch (error) {
          console.error(`addSigner catch error: ${error}`);
          expect((error as BusinessError).code).assertEqual(19030001);
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_0200 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_0300
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_0300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_pem
        };
        let key_cert: string = rsa_p8_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        for (let mdName of mdSpec) {
          signer.mdName = mdName;
          generator.addSigner(x509Cert, keyInfo, signer);
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_0300 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_0400
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_0400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: true,
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (typeof p7 == "string") {
          console.info("################# p7:" + p7.toString())
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_0400 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_0500
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_0500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.DER
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          console.info("################# p7:" + p7)
        }
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_0500 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_0600
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_0600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.DER
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_0600 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_0700
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_0700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA512",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p1_enc_pem_zh,
          password: "哈哈123456"
        };
        let key_cert: string = rsa_p1_pem_cert_zh;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.DER
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_0700 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_0800
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_0800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p1_pem,
        };
        let key_cert: string = rsa_p1_cert_pem;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_0800 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_0900
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_0900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p1_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p1_cert_pem;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_0900 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1000
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p1_pem,
          password: ""
        };
        let key_cert: string = rsa_p1_cert_pem;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1000 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1100
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_password_is_empty,
          password: ""
        };
        let key_cert: string = rsa_password_is_empty_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          console.info("########################## p7" + p7.toString())
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1100 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1200
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_pri_passwd_len_1,
          password: "1"
        };
        let key_cert: string = rsa_pri_passwd_len_1_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.DER
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1200 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1300
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_p1_der),
        };
        let key_cert: string = rsa_p1_cert_pem;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.DER
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1300 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1400
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_p8_der),
        };
        let key_cert: string = rsa_p1_cert_pem;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.DER
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1400 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1500
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_p1_enc_der),
          password: "123456"
        };
        let key_cert: string = rsa_p1_cert_pem;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.DER
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1500 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1600
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_p8_enc_der),
          password: "123456"
        };
        let key_cert: string = rsa_p1_cert_pem;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.DER
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1600 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1601
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1601
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1601", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",

          addCert: false,
          addAttr: true,
          addSmimeCapAttr: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(rsa_p8_enc_der),
          password: "1234567"
        };
        let key_cert: string = rsa_p1_cert_pem;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1601 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_MAYBE_WRONG_PASSWORD);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1700
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1700 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1800
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_pem,
        };
        let key_cert: string = rsa_p8_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1800 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_1900
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_1900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addAttr: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_pem,
        };
        let key_cert: string = rsa_p8_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_1900 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_2000
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_2000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addSmimeCapAttr: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_pem,
        };
        let key_cert: string = rsa_p8_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_2000 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_2100
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_2100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addSmimeCapAttr: false,
          addCert: false,
          addAttr: false,
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_pem,
        };
        let key_cert: string = rsa_p8_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_2100 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_2200
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_2200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_pem,
        };
        let key_cert: string = rsa_p8_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);

        let encodingBlobOther: cert.EncodingBlob = {
          data: stringToUint8Array(rsa_other_self_sign_cert_zh),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CertOther: cert.X509Cert = await cert.createX509Cert(encodingBlobOther);

        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509CertOther);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_2200 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_2300
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_2300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_pem,
        };
        let key_cert: string = rsa_p8_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);

        let encodingBlobOther: cert.EncodingBlob = {
          data: stringToUint8Array(rsa_other_cert_1),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CertOther: cert.X509Cert = await cert.createX509Cert(encodingBlobOther);

        let encodingBlobOther2: cert.EncodingBlob = {
          data: stringToUint8Array(rsa_other_cert_2),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CertOther2: cert.X509Cert = await cert.createX509Cert(encodingBlobOther2);

        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509CertOther);
        generator.addCert(x509CertOther2);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_2300 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_2400
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_2400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_pem,
        };
        let key_cert: string = rsa_p8_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);

        let encodingBlobOther: cert.EncodingBlob = {
          data: stringToUint8Array(ecc_p256_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CertOther: cert.X509Cert = await cert.createX509Cert(encodingBlobOther);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509CertOther);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_2400 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_2500
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_2500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.DER
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_2500 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_2600
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_2600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: true,
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
          outFormat: cert.CmsFormat.DER
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_2600 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_2700
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_2700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_2700 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_2800
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_2800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = generator.doFinalSync(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_2800 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_2900
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_2900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: true,
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = generator.doFinalSync(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_2900 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_3000
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_3000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA1",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
        }
        let p7 = generator.doFinalSync(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertNull();
        } else {
          expect(null).assertFail();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_3000 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_3100
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_3100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addCert: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: ecc_enc_p8_pem,
          password: "123456"
        };
        let key_cert: string = ecc_ca_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_3100 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_3200
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_3200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: ecc_enc_p1_pem,
          password: "123456"
        };
        let key_cert: string = ecc_ca_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_3200 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_3300
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_3300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
          addCert: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: ecc_p256_pem,
        };
        let key_cert: string = ecc_ca_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_3300 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_3500
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_3500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "1234567"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_3500 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(cert.CertResult.ERR_MAYBE_WRONG_PASSWORD);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_3600
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_3600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_3600 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_3700
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_3700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SM3",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        expect(null).assertFail();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_3700 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_3800
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_3800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let addCert: boolean = true;
        let addAttr: boolean = true;
        let addSmime: boolean = true;
        let priKey: string = damaged_pri;
        let password: string = "123abc";
        let priCert: string = rsa_p8_pem_cert;
        let mdName: string = "SHA256";
        let ret: boolean = await cmsSignerWithPasswordTest(mdName, addCert, addAttr, addSmime,
          priCert, priKey, password, 19030001);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_3800 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_4200
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_4200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let addCert: boolean = true;
        let addAttr: boolean = true;
        let addSmime: boolean = true;
        let priKey: string = private2;
        let priCert: string = cert1;
        let mdName: string = "SHA256";
        let ret: boolean = await cmsSignerTest(mdName, addCert, addAttr, addSmime,
          priCert, priKey, 19030001);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_4200 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_4300
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_4300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let addCert: boolean = false;
        let addAttr: boolean = true;
        let addSmime: boolean = true;
        let priKey: string = private2;
        let priCert: string = cert1;
        let mdName: string = "SHA256";
        let ret: boolean = await cmsSignerTest(mdName, addCert, addAttr, addSmime,
          priCert, priKey, 19030001);
        expect(ret).assertFalse();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_4300 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_4400
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_4400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let addCert: boolean = true;
        let addAttr: boolean = true;
        let addSmime: boolean = true;
        let priKey: string = expired_pri;
        let priCert: string = expired_cert;
        let mdName: string = "SHA256";
        let ret: boolean = await cmsSignerTest(mdName, addCert, addAttr, addSmime,
          priCert, priKey, 0);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_4400 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_4500
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_4500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let addCert: boolean = true;
        let addAttr: boolean = true;
        let addSmime: boolean = true;
        let priKey: string = ecc_p256_pem;
        let priCert: string = ecc_p256_cert;
        let mdName: string = "SHA384";
        let ret: boolean = await cmsSignerTest(mdName, addCert, addAttr, addSmime,
          priCert, priKey, 0);
        expect(ret).assertTrue();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_4500 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_4600
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_4600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);

        let encodingBlob1: cert.EncodingBlob = {
          data: stringToUint8Array(rsa_other_cert_1),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert1: cert.X509Cert = await cert.createX509Cert(encodingBlob1);
        generator.addCert(x509Cert1);
        expect(null).assertNull();
        generator.addCert(x509Cert1);
      } catch (error) {
        console.error(`CertP7ExtCms_Func_4600 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_4700
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_4700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        generator.addCert(x509Cert);
      } catch (error) {
        console.error(`CertP7ExtCms_Func_4700 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_4900
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_4900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: false
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_p8_enc_pem,
          password: "123456"
        };
        let key_cert: string = rsa_p8_enc_pem_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);

        let encodingBlobExpired: cert.EncodingBlob = {
          data: stringToUint8Array(expired_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509CertExpired: cert.X509Cert = await cert.createX509Cert(encodingBlobExpired);
        generator.addCert(x509CertExpired);
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_4900 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_5000
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_5000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        generator.doFinalSync(new Uint8Array([0x99, 0x88, 0x77]), options);
      } catch (error) {
        console.error(`CertP7ExtCms_Func_5000 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_5100
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_5100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
      } catch (error) {
        console.error(`CertP7ExtCms_Func_5100 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_5200
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_5200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let key_cert: string = rsa_other_cert_2;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addCert(x509Cert);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
      } catch (error) {
        console.error(`CertP7ExtCms_Func_5200 catch error: ${error}`);
        expect((error as BusinessError).code).assertEqual(19030001);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_5300
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_5300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: key_usage_pri_enc,
          password: "123456"
        };
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_usage_enc_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_5300 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_5400
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_5400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: rsa_bits_1000_pri,
          password: "123456"
        };
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(rsa_bits_1000_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_5400 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_5500
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_5500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA384",
          addCert: true
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(certDataPassword_Pri),
          password: "123456"
        };
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(certDataPassword),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.TEXT,
          outFormat: cert.CmsFormat.PEM
        }
        await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        expect(null).assertNull();
      } catch (error) {
        console.error(`CertP7ExtCms_Func_5500 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_5600
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_5600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: luanma_pri,
          password: "123456"
        };
        let key_cert: string = luanma_cert;
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(key_cert),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          console.info("################ p7:" + p7.toString())
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_5600 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertP7ExtCms_Func_5700
     * @tc.number SUB_Security_Cert_Framework_CertP7ExtCms_Func_5700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertP7ExtCms_Func_5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let cmsContentType: cert.CmsContentType = cert.CmsContentType.SIGNED_DATA;
        let generator: cert.CmsGenerator = cert.createCmsGenerator(cmsContentType);
        let signer: cert.CmsSignerConfig = {
          mdName: "SHA256",
        };
        let keyInfo: cert.PrivateKeyInfo = {
          key: new Uint8Array(privateKeyPasswordDerIsEmpty2),
          password: ""
        };
        let encodingBlob: cert.EncodingBlob = {
          data: stringToUint8Array(rsa_password_is_empty_cert2),
          encodingFormat: cert.EncodingFormat.FORMAT_PEM
        };
        let x509Cert: cert.X509Cert = await cert.createX509Cert(encodingBlob);
        generator.addSigner(x509Cert, keyInfo, signer);
        let options: cert.CmsGeneratorOptions = {
          isDetached: false,
          contentDataFormat: cert.CmsContentDataFormat.BINARY,
          outFormat: cert.CmsFormat.PEM
        }
        let p7 = await generator.doFinal(new Uint8Array([0x99, 0x88, 0x77]), options);
        if (p7 instanceof Uint8Array) {
          expect(null).assertFail();
        } else {
          console.info("################ p7:" + p7.toString())
          expect(null).assertNull();
        }
      } catch (error) {
        console.error(`CertP7ExtCms_Func_5700 catch error: ${error}`);
        expect(null).assertFail();
      }
      done();
    });


  })
}