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
import * as certFunc from "./utils/collection/certFunc";
import * as crlFunc from "./utils/collection/crlFunc";
import * as collectionFunc from "./utils/collection/collectionFunc";
import cert from '@ohos.security.cert';

export default function certFrameworkCreateCollectionJsAPIFunctionTestUnit() {
  describe("certFrameworkCreateCollectionJsAPIFunctionTestUnit", () => {
    console.info("##########start certFrameworkCreateCollectionJsAPIFunctionTestUnit##########");
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
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_0100
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_0100
     * @tc.desc   crl not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        cert.createCertCRLCollection(null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_0200
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_0200
     * @tc.desc   set crl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        cert.createCertCRLCollection(null, null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_0300
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_0300
     * @tc.desc   set crl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let collectRes = cert.createCertCRLCollection([]);
        expect(collectRes != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_0400
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_0400
     * @tc.desc   set crl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const crl1 = await crlFunc.createCustomizedX509CRLPromise("pem", 1);
        const crl2 = await crlFunc.createCustomizedX509CRLPromise("pem", 2);

        let collectRes = cert.createCertCRLCollection([], [crl1, crl2]);
        expect(collectRes != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_0500
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_0500
     * @tc.desc   crl not set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const cert1 = await certFunc.createCustomizedX509CertPromise("pem", 1);
        let collectRes = collectionFunc.createCertCRLCollectionWithOneParam([cert1]);
        expect(collectRes != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_0600
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_0600
     * @tc.desc   set crl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        const x509Cert = await certFunc.createCustomizedX509CertPromise("pem", 1);
        cert.createCertCRLCollection([x509Cert], null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_0700
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_0700
     * @tc.desc   set crl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const x509Cert = await certFunc.createCustomizedX509CertPromise("pem", 1);
        let collectRes = cert.createCertCRLCollection([x509Cert], []);
        expect(collectRes != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_0800
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_0800
     * @tc.desc   set crl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const x509Cert = await certFunc.createCustomizedX509CertPromise("pem", 1);
        const crl = await crlFunc.createCustomizedX509CRLPromise("pem", 1);
        let collectRes = collectionFunc.createCertCRLCollectionWithTwoParam([x509Cert], [crl]);
        expect(collectRes != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_0900
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_0900
     * @tc.desc   set crl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const cert1 = await certFunc.createCustomizedX509CertPromise("pem", 1);
        const crl1 = await crlFunc.createCustomizedX509CRLPromise("pem", 1);
        const crl2 = await crlFunc.createCustomizedX509CRLPromise("pem", 2);

        let collectRes = collectionFunc.createCertCRLCollectionWithTwoParam([cert1], [crl1, crl2]);
        expect(collectRes != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_1000
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_1000
     * @tc.desc   set crl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const cert1 = await certFunc.createCustomizedX509CertPromise("der", 1);
        const crl1 = await crlFunc.createCustomizedX509CRLPromise("der", 1);
        let collectRes = collectionFunc.createCertCRLCollectionWithTwoParam([cert1], [crl1]);
        expect(collectRes != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_1100
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_1100
     * @tc.desc   set crl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const cert1 = await certFunc.createCustomizedX509CertPromise("der", 1);
        const crl1 = await crlFunc.createCustomizedX509CRLPromise("der", 1);
        const crl2 = await crlFunc.createCustomizedX509CRLPromise("der", 2);

        let collectRes = collectionFunc.createCertCRLCollectionWithTwoParam([cert1], [crl1, crl2]);
        expect(collectRes != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Create_Collection_Func_1200
     * @tc.number SUB_Security_Cert_Framework_Create_Collection_Func_1200
     * @tc.desc   set crl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Create_Collection_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const cert1 = await certFunc.createCustomizedX509CertPromise("pem", 1);
        const cert2 = await certFunc.createCustomizedX509CertPromise("pem", 2);
        const cert3 = await certFunc.createCustomizedX509CertPromise("der", 1);
        const cert4 = await certFunc.createCustomizedX509CertPromise("der", 2);
        const crl1 = await crlFunc.createCustomizedX509CRLPromise("pem", 1);
        const crl2 = await crlFunc.createCustomizedX509CRLPromise("pem", 2);
        const crl3 = await crlFunc.createCustomizedX509CRLPromise("der", 1);
        const crl4 = await crlFunc.createCustomizedX509CRLPromise("der", 2);

        let collectRes = collectionFunc.createCertCRLCollectionWithTwoParam([cert1, cert2, cert3, cert4], [crl1, crl2, crl3, crl4]);
        expect(collectRes != null).assertTrue();
      } catch (err) {
        expect(null).assertFail();
      }
      done();
    });
  });
}
