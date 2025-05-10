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
import * as certChainFunc3 from "./utils/certchain/certChainFunc3";
import * as certChainFunc from "./utils/certchain/certChainFunc";

export default function certFrameworkCertChainPolicyJsAPIFunctionTestUnit() {
  describe("certFrameworkCertChainPolicyJsAPIFunctionTestUnit", () => {
    console.info("##########start certFrameworkCertChainPolicyJsAPIFunctionTestUnit##########");
    let certChain0: cert.X509CertChain = {} as cert.X509CertChain;
    let rootCaCert0: cert.X509Cert = {} as cert.X509Cert;
    let leafCert: cert.X509Cert = {} as cert.X509Cert;
    let parentCert0: cert.X509Cert = {} as cert.X509Cert;
    let otherCert: cert.X509Cert = {} as cert.X509Cert;
    console.info("##########start certFrameworkCertChainPolicyJsAPIFunctionTestUnit##########");
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      // Create X509 certChain0-certChain2
      try {
        certChain0 = await certChainFunc.createX509CertChainPromise("pem", 0);
        expect(certChain0 != null).assertTrue();
      } catch (err) {
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
      } catch (err) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_0100
     * @tc.name check X509CertChain validate with POLICY_X509
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_0100';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        policy: cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_X509
      };
      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_0200
     * @tc.name check X509CertChain validate with POLICY_SSL (param sslHostname matches Cert's Subject CN)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_0200';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        policy: cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_SSL,
        sslHostname: '*.163.com'
      }

      try {
        const validRes = await certChain1.validate(param);
        console.log(`${caseName} X509CertChain validate success: ${JSON.stringify(validRes.entityCert.getNotBeforeTime())}`);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getNotBeforeTime() == '230323000000Z').assertTrue();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_0300
     * @tc.name check X509CertChain validate with POLICY_SSL (param sslHostname doesn't match Cert's Subject CN)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_0300';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        policy: cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_SSL,
        sslHostname: '*.164.com'
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_0400
     * @tc.name check X509CertChain validate with POLICY_SSL (normal param sslHostname,Cert doesn't contain Subject CN)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_0400';
      const param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        policy: cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_SSL,
        sslHostname: '.163.com'
      }

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_0500
     * @tc.name check X509CertChain validate with POLICY_SSL (param sslHostname matches Cert's dnsName)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_0500';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        policy: cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_SSL,
        sslHostname: '111.163.com'
      }

      try {
        const validRes = await certChain1.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getNotBeforeTime() == '230323000000Z').assertTrue();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_0600
     * @tc.name check X509CertChain validate with POLICY_SSL (param sslHostname doesn't match Cert's dnsName)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_0600';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        policy: cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_SSL,
        sslHostname: '111.164.com'
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_0700
     * @tc.name check X509CertChain validate with POLICY_SSL (normal param sslHostname,Cert doesn't contain dnsName)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_0700';
      const param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        policy: cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_SSL,
        sslHostname: 'test.com'
      }

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_0800
     * @tc.name check X509CertChain validate with POLICY_SSL (empty param sslHostname)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_0800';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        policy: cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_SSL,
        sslHostname: ''
      }

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_0900
     * @tc.name check X509CertChain validate withPOLICY_X509 & param sslHostname
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_0900';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        policy: cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_X509,
        sslHostname: 'testLeaf2'
      }

      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_1000
     * @tc.name check X509CertChain validate without POLICY_SSL, but has param sslHostname
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_1000';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        sslHostname: 'testLeaf2'
      }

      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_1100
     * @tc.name check X509CertChain validate without sslHostname, but has param POLICY_SSL
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_1100';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        policy: cert.ValidationPolicyType.VALIDATION_POLICY_TYPE_SSL
      }

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_1200
     * @tc.name check X509CertChain validate with KeyUsageType (param keyUsage matches Cert)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_1200';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        keyUsage: [
          cert.KeyUsageType.KEYUSAGE_DIGITAL_SIGNATURE,
          cert.KeyUsageType.KEYUSAGE_KEY_ENCIPHERMENT
        ]
      }

      try {
        const validRes = await certChain1.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getNotBeforeTime() == '230323000000Z').assertTrue();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_1300
     * @tc.name check X509CertChain validate with KeyUsageType (param keyUsage types don't match Cert)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_1300';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        keyUsage: [
          cert.KeyUsageType.KEYUSAGE_DATA_ENCIPHERMENT,
          cert.KeyUsageType.KEYUSAGE_KEY_AGREEMENT
        ]
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_1400
     * @tc.name check X509CertChain validate with KeyUsageType (param keyUsage length < Cert)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_1400';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        keyUsage: [
          cert.KeyUsageType.KEYUSAGE_DIGITAL_SIGNATURE
        ]
      }

      try {
        const validRes = await certChain1.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getNotBeforeTime() == '230323000000Z').assertTrue();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_1500
     * @tc.name check X509CertChain validate with KeyUsageType (param keyUsage length > Cert)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_1500';
      const certChain1: cert.X509CertChain = await certChainFunc3.createX509CertChain1();
      const param: cert.CertChainValidationParameters = {
        date: '20231212080000Z',
        trustAnchors: certChainFunc3.TrustAnchors_DATA_MAP_01,
        keyUsage: [
          cert.KeyUsageType.KEYUSAGE_DIGITAL_SIGNATURE,
          cert.KeyUsageType.KEYUSAGE_NON_REPUDIATION,
          cert.KeyUsageType.KEYUSAGE_KEY_ENCIPHERMENT,
          cert.KeyUsageType.KEYUSAGE_DATA_ENCIPHERMENT,
          cert.KeyUsageType.KEYUSAGE_KEY_AGREEMENT,
          cert.KeyUsageType.KEYUSAGE_KEY_CERT_SIGN,
          cert.KeyUsageType.KEYUSAGE_CRL_SIGN,
          cert.KeyUsageType.KEYUSAGE_ENCIPHER_ONLY,
          cert.KeyUsageType.KEYUSAGE_DECIPHER_ONLY
        ]
      }

      try {
        await certChain1.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.ERR_CRYPTO_OPERATION).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_1600
     * @tc.name check X509CertChain validate with KeyUsageType (empty param keyUsage)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_1600';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        keyUsage: []
      }

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_1700
     * @tc.name check X509CertChain validate with param policy (invalid value)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_1700';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        policy: 2
      }

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Policy_Func_1800
     * @tc.name check X509CertChain validate with param keyUsage (invalid value)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Policy_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let caseName = 'SUB_Security_Cert_Framework_CertChain_Policy_Func_1800';
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        keyUsage: [9, 10]
      }

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        console.error(`${caseName} X509CertChain validate error: ${JSON.stringify(err)}`);
        expect(err.code == cert.CertResult.INVALID_PARAMS).assertTrue();
      }
      done();
    });
  });
}