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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, TestType, Size, Level, expect } from "@ohos/hypium";
import cert from '@ohos.security.cert';
import * as crlFunc from "./utils/collection/crlFunc";
import * as certFunc from "./utils/collection/certFunc";
import {
  CRL_CERT_DATA_01,
  CRL_CERT_DATA_02,
  CRL_DATA_MAP_01,
  CRL_DATA_MAP_02,
  EXPECT_RESULT_FALSE,
  EXPECT_RESULT_TRUE,
  PEM
} from './utils/common/commonParam';

export default function certFrameworkCRLMatchJsAPIFunctionTestUnit() {
  describe("certFrameworkCRLMatchJsAPIFunctionTestUnit", () => {
    console.info("##########start certFrameworkCRLMatchJsAPIFunctionTestUnit##########");
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0100
     * @tc.name check X509CRL match for parameter null
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      try {
        x509CRL.match(null);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0200
     * @tc.name check X509CRL match for parameter undefined
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      try {
        x509CRL.match(undefined);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0300
     * @tc.name check X509CRL match for parameter empty
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      try {
        const result = x509CRL.match({});
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0400
     * @tc.name check X509CRL match for parameter issuer all match
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        issuer: [CRL_DATA_MAP_02.issuer]
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0500
     * @tc.name check X509CRL match for parameter issuer partly match
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        issuer: [CRL_DATA_MAP_01.issuer, CRL_DATA_MAP_02.issuer]
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0600
     * @tc.name check X509CRL match for parameter issuer not match
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        issuer: [CRL_DATA_MAP_01.issuer]
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0700
     * @tc.name check X509CRL match for parameter issuer not resolvable
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        issuer: [new Uint8Array([0x30, 0x5D, 0x31])]
      };
      try {
        const result = x509CRL.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0800
     * @tc.name check X509CRL match for parameter issuer empty
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        issuer: []
      };
      try {
        const result = x509CRL.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0900
     * @tc.name check X509CRL match for parameter x509Cert, which is in CRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const certContent = CRL_CERT_DATA_02[0];
      try {
        const result = await crlFunc.checkCRLMatchPEMX509Cert(PEM, 2, certContent);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1000
     * @tc.name check X509CRL match for parameter x509Cert, which is not in CRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const certContent = CRL_CERT_DATA_01[0];
      try {
        const result = await crlFunc.checkCRLMatchPEMX509Cert(PEM, 2, certContent);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1100
     * @tc.name check X509CRL match for parameter crl number
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x509Cert: cert.X509Cert = {} as cert.X509Cert;
      try {
        x509Cert = await certFunc.createPEMCustomizedX509CertPromise(CRL_CERT_DATA_02[0]);
        expect(x509Cert != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        issuer: [CRL_DATA_MAP_02.issuer],
        x509Cert: x509Cert
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1200
     * @tc.name check X509CRL match for parameter crl number
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x509Cert: cert.X509Cert = {} as cert.X509Cert;
      try {
        x509Cert = await certFunc.createPEMCustomizedX509CertPromise(CRL_CERT_DATA_01[0]);
        expect(x509Cert != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        issuer: [CRL_DATA_MAP_02.issuer],
        x509Cert: x509Cert
      };
      try {
        const result = x509CRL.match(param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

  });
}
