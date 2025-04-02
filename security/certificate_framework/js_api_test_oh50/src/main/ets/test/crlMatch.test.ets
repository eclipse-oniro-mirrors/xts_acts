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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1300
     * @tc.name check X509CRL match for parameter updateDateTime match
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1300", 0, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        updateDateTime: '231123033300Z'
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1400
     * @tc.name check X509CRL match for parameter updateDateTime mismatching
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1400", 0, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        updateDateTime: '281123033300Z'
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1500
     * @tc.name check X509CRL match for parameter updateDateTime empty
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1500", 0, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        updateDateTime: ''
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1600
     * @tc.name check X509CRL match for parameter maxCRL > CRLNumber
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1600", 0, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        maxCRL: BigInt(10)
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1700
     * @tc.name check X509CRL match for parameter maxCRL < CRLNumber
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1700", 0, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        maxCRL: BigInt(0)
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1800
     * @tc.name check X509CRL match for parameter maxCRL invalid
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1800", 0, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        maxCRL: BigInt(-1)
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1900
     * @tc.name check X509CRL match for parameter minCRL < CRLNumber
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1900", 0, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(0)
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_2000
     * @tc.name check X509CRL match for parameter minCRL > CRLNumber
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_2000", 0, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(10)
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_2100
     * @tc.name check X509CRL match for parameter minCRL invalid
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_2100", 0, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(-1)
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
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_2200
     * @tc.name check X509CRL match for parameter minCRL>maxCRL
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_2200", 0, async (done: Function) => {
      let x509CRL: cert.X509CRL = {} as cert.X509CRL;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(3),
        maxCRL: BigInt(1)
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
  });
}
