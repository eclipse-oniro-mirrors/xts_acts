/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import cert from '@ohos.security.cert';
import * as certChainFunc from "./utils/certchain/certChainFunc";
import { CERT_CHAIN_DATA_PEM_PARAMETERS, CERT_CHAIN_PEM_DATA0 } from './utils/common/commonParam';
import { stringTouInt8Array } from './utils/common/commonFunction';

export default function certFrameworkCertChainJsAPIFunctionTestUnit() {
  describe("certFrameworkCertChainJsAPIFunctionTestUnit", () => {
    let certChain0: cert.X509CertChain = {} as cert.X509CertChain;
    let rootCaCert0: cert.X509Cert = {} as cert.X509Cert;
    let leafCert: cert.X509Cert = {} as cert.X509Cert;
    let parentCert0: cert.X509Cert = {} as cert.X509Cert;
    let otherCert: cert.X509Cert = {} as cert.X509Cert;
    console.info("##########start certFrameworkCertChainJsAPIFunctionTestUnit##########");
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
     * @tc.number SUB_Security_Cert_Framework_CertChain_Func_0100
     * @tc.name check createX509CertChain with empty param
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0100", 0, async (done: Function) => {
      const param: cert.EncodingBlob = {} as cert.EncodingBlob;

      try {
        await cert.createX509CertChain(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CertChain_Func_0200
     * @tc.name check createX509CertChain with empty data
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0200", 0, async (done: Function) => {
      const param: cert.EncodingBlob = {
        data: new Uint8Array(),
        encodingFormat: cert.EncodingFormat.FORMAT_PEM
      };

      try {
        await cert.createX509CertChain(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0300
     * @tc.name check createX509CertChain with abnormal encodingFormat
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0300", 0, async (done: Function) => {
      const param: cert.EncodingBlob = {
        data: stringTouInt8Array(CERT_CHAIN_PEM_DATA0),
        encodingFormat: 3
      };

      try {
        await cert.createX509CertChain(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0400
     * @tc.name check createX509CertChain with normal der param
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0400", 0, async (done: Function) => {
      try {
        const createdRes = await certChainFunc.createX509CertChainPromise("der", 0);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0500
     * @tc.name check createX509CertChain with abnormal der param
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0500", 0, async (done: Function) => {
      try {
        await certChainFunc.createX509CertChainPromise("der", 1);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0600
     * @tc.name check createX509CertChain with normal pem param
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0600", 0, async (done: Function) => {
      try {
        const createdRes = await certChainFunc.createX509CertChainCallback("pem", 0);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0700
     * @tc.name check createX509CertChain with abnormal pem param
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0700", 0, async (done: Function) => {
      try {
        await certChainFunc.createX509CertChainCallback("pem", 5);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0800
     * @tc.name check createX509CertChain with normal pkcs7 param
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0800", 0, async (done: Function) => {
      try {
        const createdRes = await certChainFunc.createX509CertChainCallback("pkcs7", 0);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_0900
     * @tc.name check createX509CertChain with abnormal pkcs7 param
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_0900", 0, async (done: Function) => {
      try {
        await certChainFunc.createX509CertChainCallback("pkcs7", 1);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1000
     * @tc.name check createX509CertChain with empty param
     * @tc.desc createX509CertChain(certs: Array<X509Cert>)
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1000", 0, async (done: Function) => {
      try {
        cert.createX509CertChain([]);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1100
     * @tc.name check createX509CertChain with 1 cert(not CA)
     * @tc.desc createX509CertChain(certs: Array<X509Cert>)
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1100", 0, async (done: Function) => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      try {
        const createdRes = cert.createX509CertChain([cert1]);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(certs: Array<X509Cert>) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1200
     * @tc.name check createX509CertChain with 2 same cert(not CA)
     * @tc.desc createX509CertChain(certs: Array<X509Cert>)
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1200", 0, async (done: Function) => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      try {
        const createdRes = cert.createX509CertChain([cert1, cert1]);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(certs: Array<X509Cert>) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1300
     * @tc.name check createX509CertChain with 2 different certs(not CA)
     * @tc.desc createX509CertChain(certs: Array<X509Cert>)
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1300", 0, async (done: Function) => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      const cert3 = await certChainFunc.createCustomizedX509CertPromise('PEM', 5);
      try {
        const createdRes = cert.createX509CertChain([cert1, cert3]);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(certs: Array<X509Cert>) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1400
     * @tc.name check createX509CertChain with 257 certs
     * @tc.desc createX509CertChain(certs: Array<X509Cert>)
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1400", 0, async (done: Function) => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      let certs: cert.X509Cert[] = [];
      for (let i = 0; i < 257; i++) {
        certs.push(cert1);
      }
      try {
        cert.createX509CertChain(certs);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1500
     * @tc.name check createX509CertChain with 3 certs(CA and entity)
     * @tc.desc createX509CertChain(certs: Array<X509Cert>)
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1500", 0, async (done: Function) => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      const cert2 = await certChainFunc.createCustomizedX509CertPromise('PEM', 1);
      const cert3 = await certChainFunc.createCustomizedX509CertPromise('PEM', 2);
      try {
        const createdRes = cert.createX509CertChain([cert1, cert2, cert3]);
        expect(createdRes != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(certs: Array<X509Cert>) error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1600
     * @tc.name check getCertList() with 3 certs(CA and entity)
     * @tc.desc X509CertChain.getCertList()
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1600", 0, async (done: Function) => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      const cert2 = await certChainFunc.createCustomizedX509CertPromise('PEM', 1);
      const cert3 = await certChainFunc.createCustomizedX509CertPromise('PEM', 2);
      const createdRes = cert.createX509CertChain([cert1, cert2, cert3]);
      expect(createdRes != null).assertTrue();

      try {
        const getListRes = createdRes.getCertList();
        expect(getListRes != null).assertTrue();
        expect(getListRes.length === 3).assertTrue();
      } catch (err) {
        console.error("X509CertChain.getCertList() error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1700
     * @tc.name check getCertList() with 2 same certs
     * @tc.desc X509CertChain.getCertList()
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1700", 0, async (done: Function) => {
      const cert1 = await certChainFunc.createCustomizedX509CertPromise('PEM', 0);
      const createdRes = cert.createX509CertChain([cert1, cert1]);
      expect(createdRes != null).assertTrue();

      try {
        const getListRes = createdRes.getCertList();
        expect(getListRes != null).assertTrue();
        expect(getListRes.length === 2).assertTrue();
      } catch (err) {
        console.error("X509CertChain.getCertList() error", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1800
     * @tc.name check X509CertChain validate with param null
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1800", 0, async (done: Function) => {
      try {
        await certChain0.validate(null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_1900
     * @tc.name check X509CertChain validate with param undefined
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_1900", 0, async (done: Function) => {
      try {
        await certChain0.validate(undefined);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2000
     * @tc.name check X509CertChain validate with abnormal param date, 20231224000000Z-20241223235959Z
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2000", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        date: "abc",
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2100
     * @tc.name check X509CertChain validate with abnormal param date, 20231224000000Z-20241223235959Z
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2100", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        date: "20230101000000Z",
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2200
     * @tc.name check X509CertChain validate with abnormal param date, between lower limit, 20231224000000Z-20241223235959Z
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2200", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        date: "20231223235959Z",
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CERT_NOT_YET_VALID);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2300
     * @tc.name check X509CertChain validate with normal param date, equal to lower limit, 20231224000000Z-20241223235959Z
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2300", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        date: "20231224000000Z",
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2400
     * @tc.name check X509CertChain validate with normal param date, between the limits, 20231224000000Z-20241223235959Z
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2400", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        date: "20231224000001Z",
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }

      param = {
        date: "20241223235958Z",
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2500
     * @tc.name check X509CertChain validate with abnormal param date, equal to upper limit, 20231224000000Z-20241223235959Z
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2500", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        date: "20241223235959Z",
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2600
     * @tc.name check X509CertChain validate with abnormal param date, between the limits, 20231224000000Z-20241223235959Z
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2600", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        date: "20241224000000Z",
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2700
     * @tc.name check X509CertChain validate with abnormal param date, greater than upper limit, 20231224000000Z-20241223235959Z
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2700", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        date: "20300101000000Z",
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CERT_HAS_EXPIRED);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2800
     * @tc.name check X509CertChain validate with abnormal param empty
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2800", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{}]
      };

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_2900
     * @tc.name check X509CertChain validate with abnormal param with no cert and no publicKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_2900", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject
        }]
      };

      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3000
     * @tc.name check X509CertChain validate with normal param trustAnchors cert
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3000", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };

      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3100
     * @tc.name check X509CertChain validate with normal param trustAnchors parent cert
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3100", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: parentCert0
        }]
      };
      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == parentCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3200
     * @tc.name check X509CertChain validate with normal param trustAnchors parent cert (root)
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3200", 0, async (done: Function) => {
      let certChain2: cert.X509CertChain = {} as cert.X509CertChain;
      try {
        certChain2 = await certChainFunc.createX509CertChainPromise("pem", 3);
        expect(certChain2 != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }

      let parentCert2: cert.X509Cert = {} as cert.X509Cert;
      try {
        parentCert2 = await certChainFunc.createCustomizedX509CertPromise('pem', 4);
        expect(parentCert2 != null).assertTrue();
      } catch (err) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: parentCert2
        }]
      };
      try {
        const validRes = await certChain2.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == parentCert2.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3300
     * @tc.name check X509CertChain validate with abnormal param trustAnchors grandparent nodes
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3300", 0, async (done: Function) => {
      let grandparentCert: cert.X509Cert = {} as cert.X509Cert;
      try {
        grandparentCert = await certChainFunc.createCustomizedX509CertPromise('pem', 4);
        expect(grandparentCert != null).assertTrue();
      } catch (err) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: grandparentCert
        }]
      };
      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3400
     * @tc.name check X509CertChain validate with abnormal param trustAnchors leaf cert
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3400", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: leafCert
        }]
      };
      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3500
     * @tc.name check X509CertChain validate with abnormal param trustAnchors cert not in certChain
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3500", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: otherCert
        }]
      };
      try {
        await certChain0.validate(param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3600
     * @tc.name check X509CertChain validate with normal param trustAnchors root cert
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3600", 0, async (done: Function) => {
      let certChain3: cert.X509CertChain = {} as cert.X509CertChain;
      try {
        certChain3 = await certChainFunc.createX509CertChainPromise("pem", 4);
        expect(certChain3 != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }

      let rootCert3: cert.X509Cert = {} as cert.X509Cert;
      try {
        rootCert3 = await certChainFunc.createCustomizedX509CertPromise('pem', 4);
        expect(rootCert3 != null).assertTrue();
      } catch (err) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCert3
        }]
      };
      try {
        const validRes = await certChain3.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCert3.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3700
     * @tc.name check X509CertChain validate with abnormal param trustAnchors not root cert
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3700", 0, async (done: Function) => {
      let certChain3: cert.X509CertChain = {} as cert.X509CertChain;
      try {
        certChain3 = await certChainFunc.createX509CertChainPromise("pem", 4);
        expect(certChain3 != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain3, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3800
     * @tc.name check X509CertChain validate with normal param trustAnchors one cert
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3800", 0, async (done: Function) => {
      let oneCert: cert.X509Cert = {} as cert.X509Cert;
      let certChainOne: cert.X509CertChain = {} as cert.X509CertChain;
      try {
        oneCert = await certChainFunc.createCustomizedX509CertPromise('pem', 5);
        expect(oneCert != null).assertTrue();
      } catch (err) {
        console.error("createX509Cert error", err);
        expect(null).assertFail();
      }
      try {
        certChainOne = await certChainFunc.createX509CertChainPromise("pem", 1);
        expect(certChainOne != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: oneCert
        }]
      };
      try {
        const validRes = await certChainOne.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == oneCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == oneCert.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_3900
     * @tc.name check X509CertChain validate with normal param trustAnchors cert and abnormal pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_3900", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CACert: rootCaCert0,
            CAPubKey: new Uint8Array([0x30, 0x67, 0x31])
          }
        ]
      };
      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CACert != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4000
     * @tc.name check X509CertChain validate with normal param root pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4000", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey
        }]
      };
      try {
        const validRes = await certChain0.validate(param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CAPubKey != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CAPubKey?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey?.toString())
          .assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4100
     * @tc.name check X509CertChain validate with normal param parent pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4100", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[1].publicKey
        }]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CAPubKey != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CAPubKey?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[1].publicKey?.toString())
          .assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4200
     * @tc.name check X509CertChain validate with abnormal param grandparent pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4200", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[0].publicKey
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4300
     * @tc.name check X509CertChain validate with abnormal param leaf pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4300", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[3].publicKey
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4400
     * @tc.name check X509CertChain validate with abnormal param other cert pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4400", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[4].publicKey
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4500
     * @tc.name check X509CertChain validate with abnormal param empty pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4500", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CAPubKey: new Uint8Array()
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4600
     * @tc.name check X509CertChain validate with abnormal param subject and no pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4600", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4700
     * @tc.name check X509CertChain validate with normal param subject and pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4700", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
          }
        ]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CAPubKey != null).assertTrue();
        expect(validRes.trustAnchor.CASubject != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CAPubKey?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey?.toString())
          .assertTrue();
        expect(validRes.trustAnchor.CASubject?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject?.toString())
          .assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4800
     * @tc.name check X509CertChain validate with abnormal param subject and parent pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4800", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[1].publicKey,
          }
        ]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_4900
     * @tc.name check X509CertChain validate with normal param parent subject and pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_4900", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[1].subject,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[1].publicKey,
          }
        ]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CAPubKey != null).assertTrue();
        expect(validRes.trustAnchor.CASubject != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CAPubKey?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[1].publicKey?.toString())
          .assertTrue();
        expect(validRes.trustAnchor.CASubject?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[1].subject?.toString())
          .assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5000
     * @tc.name check X509CertChain validate with abnormal param grandparent subject and pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5000", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[0].subject,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
          }
        ]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5100
     * @tc.name check X509CertChain validate with abnormal param leaf subject and pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5100", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[3].subject,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
          }
        ]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5200
     * @tc.name check X509CertChain validate with abnormal param empty subject and pubKey
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5200", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CASubject: new Uint8Array(),
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
          }
        ]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5300
     * @tc.name check X509CertChain validate with normal params root ca and other cert
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5300", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CACert: rootCaCert0,
          },
          {
            CACert: otherCert
          }
        ]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CACert != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5400
     * @tc.name check X509CertChain validate with normal params root ca and parent cert
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5400", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        trustAnchors: [
          {
            CACert: rootCaCert0,
          },
          {
            CACert: parentCert0
          }
        ]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CACert != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5500
     * @tc.name check X509CertChain validate with abnormal param certCRLs root crl
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5500", 0, async (done: Function) => {
      const crl = await certChainFunc.createX509CrlPromise(0);
      let certCrl = cert.createCertCRLCollection([], [crl]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5600
     * @tc.name check X509CertChain validate with abnormal param certCRLs leaf crl
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5600", 0, async (done: Function) => {
      const crl = await certChainFunc.createX509CrlPromise(1);
      let certCrl = cert.createCertCRLCollection([], [crl]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5700
     * @tc.name check X509CertChain validate with normal param certCRLs crl
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5700", 0, async (done: Function) => {
      const crl = await certChainFunc.createX509CrlPromise(2);
      let certCrl = cert.createCertCRLCollection([], [crl]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5800
     * @tc.name check X509CertChain validate with abnormal param certCRLs crls
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5800", 0, async (done: Function) => {
      const crl1 = await certChainFunc.createX509CrlPromise(1);
      const crl2 = await certChainFunc.createX509CrlPromise(2);
      let certCrl = cert.createCertCRLCollection([], [crl1, crl2]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_5900
     * @tc.name check X509CertChain validate with abnormal param empty certCRLs
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_5900", 0, async (done: Function) => {
      let param: cert.CertChainValidationParameters = {
        certCRLs: [],
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_6000
     * @tc.name check X509CertChain validate with normal param certCRLs with no crl
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_6000", 0, async (done: Function) => {
      let certCrl = cert.createCertCRLCollection([rootCaCert0]);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_6100
     * @tc.name check X509CertChain validate with normal param certCRLs with empty crl
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_6100", 0, async (done: Function) => {
      let certCrl = cert.createCertCRLCollection([rootCaCert0], []);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [{
          CACert: rootCaCert0
        }]
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_6200
     * @tc.name check X509CertChain validate with normal param all right
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_6200", 0, async (done: Function) => {
      let certCrl = cert.createCertCRLCollection([rootCaCert0], []);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [
          {
            CACert: rootCaCert0,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject,
          }
        ],
        date: '20231231000000Z'
      };
      try {
        const validRes = await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(validRes != null).assertTrue();
        expect(validRes.entityCert != null).assertTrue();
        expect(validRes.trustAnchor != null).assertTrue();
        expect(validRes.trustAnchor.CACert != null).assertTrue();
        expect(validRes.trustAnchor.CAPubKey != null).assertTrue();
        expect(validRes.trustAnchor.CASubject != null).assertTrue();
        expect(validRes.entityCert.getCertSerialNumber() == leafCert.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CACert?.getCertSerialNumber() == rootCaCert0.getCertSerialNumber()).assertTrue();
        expect(validRes.trustAnchor.CAPubKey?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey?.toString())
          .assertTrue();
        expect(validRes.trustAnchor.CASubject?.toString() == CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject?.toString())
          .assertTrue();
      } catch (err) {
        console.error("[Promise]X509CertChain validate error: ", err);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_6300
     * @tc.name check X509CertChain validate with normal param part right
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_6300", 0, async (done: Function) => {
      let certCrl = cert.createCertCRLCollection([rootCaCert0], []);
      let param: cert.CertChainValidationParameters = {
        certCRLs: [certCrl],
        trustAnchors: [
          {
            CACert: otherCert,
            CAPubKey: CERT_CHAIN_DATA_PEM_PARAMETERS[2].publicKey,
            CASubject: CERT_CHAIN_DATA_PEM_PARAMETERS[2].subject,
          }
        ],
        date: '20231231000000Z'
      };
      try {
        await certChainFunc.certChainValidateCallback(certChain0, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Certificate_Func_6400
     * @tc.name check X509CertChain validate with abnormal param invalid certChain
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CertChain_Func_6400", 0, async (done: Function) => {
      let certChainInvalid: cert.X509CertChain = {} as cert.X509CertChain;
      try {
        certChainInvalid = await certChainFunc.createX509CertChainPromise("pem", 2);
        expect(certChainInvalid != null).assertTrue();
      } catch (err) {
        console.error("createX509CertChain(inStream: EncodingBlob) error", err);
        expect(null).assertFail();
      }

      let param: cert.CertChainValidationParameters = {
        trustAnchors: [{
          CACert: rootCaCert0
        }],
        date: '20231231000000Z'
      };
      try {
        await certChainFunc.certChainValidateCallback(certChainInvalid, param);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });
  });
}