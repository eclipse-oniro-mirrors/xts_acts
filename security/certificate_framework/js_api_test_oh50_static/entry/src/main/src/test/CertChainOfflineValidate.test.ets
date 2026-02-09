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
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import cert from '@ohos.security.cert';
import * as certChainFunc from "./utils/certchain/certChainFunc";
import * as certChainFunc3 from "./utils/certchain/certChainFunc3";
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let testAbilityContext:common.UIAbilityContext;


export default function certFrameworkCertChainOfflineValidateJsAPIFunctionTestUnit() {
  describe("certFrameworkCertChainOfflineValidateJsAPIFunctionTestUnit", () => {
    console.info("##########start certFrameworkCertChainOfflineValidateJsAPIFunctionTestUnit##########");
    let certChain0: cert.X509CertChain;
    let rootCaCert0: cert.X509Cert;
    let leafCert: cert.X509Cert;
    let parentCert0: cert.X509Cert;
    let otherCert: cert.X509Cert;
    console.info("##########start certFrameworkCertChainOfflineValidateJsAPIFunctionTestUnit##########");
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      // Create X509 certChain0-certChain2
      try {
        certChain0 = await certChainFunc.createX509CertChainPromise("pem", 0);
        expect(certChain0 != null).assertTrue();
      } catch (err: BusinessError) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }
      // Create Root X509 Cert, Leaf X509 Cert, Parent X509 Cert
      try {
        parentCert0 = await certChainFunc.createCustomizedX509CertPromise('pem', 3);
        rootCaCert0 = await certChainFunc.createCustomizedX509CertPromise('pem', 2);
        leafCert = await certChainFunc.createCustomizedX509CertPromise('pem', 0);
        otherCert = await certChainFunc.createCustomizedX509CertPromise('pem', 5);
        expect(parentCert0 != null).assertTrue();
        expect(rootCaCert0 != null).assertTrue();
        expect(leafCert != null).assertTrue();
        expect(otherCert != null).assertTrue();
      } catch (err: BusinessError) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_0100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_0100';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponses: certChainFunc3.TrustAnchors_DATA_MAP_02.ocspResponses,
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP
          ],
          ocspDigest: "SHA1",
        }
      }

      try {
        const validRes = await certChain1.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber().toString() == '6333067948887798706277381429131909282')
          .assertTrue();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(null).assertFail();
        done();
      }
    }); // crash

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_0200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_0200';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponses: new Uint8Array([0x30, 0x82, 0x01]),
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_0300
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_0300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_0300';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponses: new Uint8Array(),
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_0600
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_0600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_0600';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const x509Cert2: cert.X509Cert = await certChainFunc3.createX509Cert2();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponderCert: x509Cert2,
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CERT_SIGNATURE_FAILURE);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_0700
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_0700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_0700';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_0800
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_0800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_0800';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        revocationCheckParam: {
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK
          ],
        }
      }
      certChain0 = await certChainFunc.createX509CertChainPromise("pem", 0);
      expect(certChain0 != null).assertTrue();
      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_1000
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_1000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_1000';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponderURI: 'aaaaaa',
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_1100
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_1100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_1100';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponderURI: '',
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_1300
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_1300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_1300';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_1400
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_1400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_1400';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        revocationCheckParam: {
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK
          ],
        }
      }

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.log(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_1600
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_1600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_1600';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          crlDownloadURI: 'aaaaaa',
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_1700
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_1700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_1700';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponderURI: '',
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_1900
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_1900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_1900';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_2100
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_2100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_2100';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER
          ],
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_2200
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_2200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_2200';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponses: certChainFunc3.TrustAnchors_DATA_MAP_02.ocspResponses,
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP
          ],
          ocspDigest: "SHA1",
        }
      }

      try {
        const validRes = await certChain1.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber().toString() == '6333067948887798706277381429131909282')
          .assertTrue();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_2300
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_2300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_2300';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponses: new Uint8Array([0x30, 0x82, 0x01]),
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL
          ],
        }
      }

      try {
        const validRes = await certChain1.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber().toString() == '6333067948887798706277381429131909282')
          .assertTrue();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_2400
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_2400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_2400';
      const crl: cert.X509CRL = await certChainFunc.createX509CrlPromise(2);
      let certCrl: cert.CertCRLCollection = cert.createCertCRLCollection([], [crl]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        revocationCheckParam: {
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL
          ],
        }
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_2500
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_2500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_2500';
      const crl1: cert.X509CRL = await certChainFunc.createX509CrlPromise(1);
      const crl2: cert.X509CRL = await certChainFunc.createX509CrlPromise(2);
      let certCrl: cert.CertCRLCollection = cert.createCertCRLCollection([], [crl1, crl2]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_2600
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_2600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_2600';
      let param: cert.CertChainValidationParameters = {
        certCRLs: [],
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        revocationCheckParam: {
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL
          ],
        }
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_2900
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_2900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_2900';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponderURI: 'aaaa',
          crlDownloadURI: 'bbbb',
          ocspResponses: certChainFunc3.TrustAnchors_DATA_MAP_02.ocspResponses,
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL
          ],
        }
      }

      try {
        const validRes = await certChain1.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber().toString() == '6333067948887798706277381429131909282')
          .assertTrue();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_3000
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_3000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_3000';
      const crl: cert.X509CRL = await certChainFunc.createX509CrlPromise(2);
      let certCrl: cert.CertCRLCollection = cert.createCertCRLCollection([], [crl]);
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        certCRLs: [certCrl],
        revocationCheckParam: {
          ocspResponderURI: 'aaaaaa',
          crlDownloadURI: 'bbbbbb',
          ocspResponses: new Uint8Array([0x30, 0x82, 0x01]),
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL
          ],
        }
      }

      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_3100
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_3100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_3100';
      const crl1: cert.X509CRL = await certChainFunc.createX509CrlPromise(1);
      const crl2: cert.X509CRL = await certChainFunc.createX509CrlPromise(2);
      let certCrl: cert.CertCRLCollection = cert.createCertCRLCollection([], [crl1, crl2]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        revocationCheckParam: {
          ocspResponderURI: 'aaaaaa',
          crlDownloadURI: 'bbbbbb',
          ocspResponses: new Uint8Array([0x30, 0x82, 0x01]),
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL
          ],
        }
      }

      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_3400
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_3400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_3400';
      const crl: cert.X509CRL = await certChainFunc.createX509CrlPromise(2);
      let certCrl: cert.CertCRLCollection = cert.createCertCRLCollection([], [crl]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        revocationCheckParam: {
          ocspResponderURI: 'aaaaaa',
          crlDownloadURI: 'bbbbbb',
          ocspResponses: new Uint8Array([0x30, 0x82, 0x01]),
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL
          ],
        }
      }

      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_3500
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_3500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_3500';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspResponderURI: 'aaaa',
          crlDownloadURI: 'bbbb',
          ocspResponses: certChainFunc3.TrustAnchors_DATA_MAP_02.ocspResponses,
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL
          ],
        }
      }

      try {
        const validRes = await certChain1.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber().toString() == '6333067948887798706277381429131909282')
          .assertTrue();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_3600
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_3600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_3600';
      const crl1: cert.X509CRL = await certChainFunc.createX509CrlPromise(1);
      const crl2: cert.X509CRL = await certChainFunc.createX509CrlPromise(2);
      let certCrl: cert.CertCRLCollection = cert.createCertCRLCollection([], [crl1, crl2]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        revocationCheckParam: {
          ocspResponderURI: 'aaaaaa',
          crlDownloadURI: 'bbbbbb',
          ocspResponses: new Uint8Array([0x30, 0x82, 0x01]),
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_NO_PREFER,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_FALLBACK_LOCAL
          ],
        }
      }

      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_3700
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_3700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_3700';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          options: []
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_3800
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_3800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_3800';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspRequestExtension: []
        }
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_4000
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_4000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_4000';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        revocationCheckParam: {}
      }

      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(null).assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CertChain_Online_Func_4100
     * @tc.number SUB_Security_Cert_Framework_CertChain_Online_Func_4100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CertChain_Online_Func_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Online_Func_4100';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        revocationCheckParam: {
          ocspRequestExtension: [new Uint8Array([0x30, 0x82, 0x01])],
          options: [
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_PREFER_OCSP,
            cert.RevocationCheckOptions.REVOCATION_CHECK_OPTION_ACCESS_NETWORK
          ],
        }
      }
    
      try {
        await certChain1.validate(param);
        expect(null).assertFail();
        done();
      } catch (err: BusinessError) {
        console.error(`[XtsTestLog] X509CertChain validate error: ${err}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
        done();
      }
    });


  });
}