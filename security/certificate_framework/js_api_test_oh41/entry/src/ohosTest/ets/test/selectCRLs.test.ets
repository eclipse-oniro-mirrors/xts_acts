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
  IS_CALLBACK,
  IS_PROMISE,
  PEM
} from './utils/common/commonParam';
import * as collectionFunc from "./utils/collection/collectionFunc";

export default function certFrameworkSelectCRLsJsAPIFunctionTestUnit() {
  describe("certFrameworkSelectCRLsJsAPIFunctionTestUnit", () => {
    console.info("##########start certFrameworkSelectCRLsJsAPIFunctionTestUnit##########");
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
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_0100
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_0100
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([], [1], PEM);
      }
      catch (err) {
        expect(null).assertFail();
      }
      try {
        await collection.selectCRLs(null);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_0200
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_0200
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([], [1], PEM);
      }
      catch (err) {
        expect(null).assertFail();
      }
      try {
        await collection.selectCRLs(undefined);
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_0300
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_0300
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [1, 2], {}, IS_CALLBACK);
        expect(crls != null).assertTrue();
        expect(crls.length === 2).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_0400
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_0400
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CRLMatchParameters = {
        issuer: [CRL_DATA_MAP_01.issuer, CRL_DATA_MAP_02.issuer]
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [1, 2], param, IS_PROMISE);
        expect(crls != null).assertTrue();
        expect(crls.length === 2).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_0500
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_0500
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CRLMatchParameters = {
        issuer: [CRL_DATA_MAP_01.issuer, CRL_DATA_MAP_02.issuer]
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [2], param, IS_PROMISE);
        expect(crls != null).assertTrue();
        expect(crls.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_0600
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_0600
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CRLMatchParameters = {
        issuer: [CRL_DATA_MAP_01.issuer]
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [2], param, IS_CALLBACK);
        expect(crls != null).assertTrue();
        expect(crls.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_0700
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_0700
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const param: cert.X509CRLMatchParameters = {
        issuer: [new Uint8Array([0x30, 0x5D, 0x31])]
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([], [2], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await crlFunc.selectCRLsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_0800
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_0800
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const param: cert.X509CRLMatchParameters = {
        issuer: []
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([], [2], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await crlFunc.selectCRLsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_0900
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_0900
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const certContent = CRL_CERT_DATA_02[0];
      try {
        const crls = await crlFunc.checkSelectCRLsX509Cert(PEM, [1, 2], certContent, IS_PROMISE);
        expect(crls != null).assertTrue();
        expect(crls.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_1000
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_1000
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const certContent = CRL_CERT_DATA_01[0];
      try {
        const crls = await crlFunc.checkSelectCRLsX509Cert(PEM, [2], certContent, IS_CALLBACK);
        expect(crls != null).assertTrue();
        expect(crls.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_1100
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_1100
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x509Cert: cert.X509Cert = {} as cert.X509Cert;
      try {
        x509Cert = await certFunc.createPEMCustomizedX509CertPromise(CRL_CERT_DATA_02[0]);
        expect(x509Cert != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        issuer: [CRL_DATA_MAP_02.issuer],
        x509Cert: x509Cert
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [2], param, IS_CALLBACK);
        expect(crls != null).assertTrue();
        expect(crls.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_1200
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_1200
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let x509Cert: cert.X509Cert = {} as cert.X509Cert;
      try {
        x509Cert = await certFunc.createPEMCustomizedX509CertPromise(CRL_CERT_DATA_01[0]);
        expect(x509Cert != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      const param: cert.X509CRLMatchParameters = {
        issuer: [CRL_DATA_MAP_02.issuer],
        x509Cert: x509Cert
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [2], param, IS_CALLBACK);
        expect(crls != null).assertTrue();
        expect(crls.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

  });
}
