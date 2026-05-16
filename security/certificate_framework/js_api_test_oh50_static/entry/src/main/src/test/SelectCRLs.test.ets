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

export default function certFrameworkSelectCRLsJsAPIFunctionTestUnit() {
  describe("certFrameworkSelectCRLsJsAPIFunctionTestUnit", () => {
    console.info("##########start certFrameworkSelectCRLsJsAPIFunctionTestUnit##########");
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_1300
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_1300
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CRLMatchParameters = {
        updateDateTime: '231123033300Z'
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [1, 2], param, IS_PROMISE);
        expect(crls != null).assertTrue();
        expect(crls.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_1400
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_1400
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CRLMatchParameters = {
        updateDateTime: '281123033300Z'
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [1, 2], param, IS_PROMISE);
        expect(crls != null).assertTrue();
        expect(crls.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_1500
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_1500
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.X509CRLMatchParameters = {
        updateDateTime: ''
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([], [2], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await crlFunc.selectCRLsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_1600
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_1600
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CRLMatchParameters = {
        maxCRL: BigInt(10)
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [1, 2], param, IS_PROMISE);
        expect(crls != null).assertTrue();
        expect(crls.length === 2).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_1700
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_1700
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CRLMatchParameters = {
        maxCRL: BigInt(0)
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [1, 2], param, IS_PROMISE);
        expect(crls != null).assertTrue();
        expect(crls.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_1800
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_1800
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CRLMatchParameters = {
        maxCRL: BigInt(-1)
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([], [2], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await crlFunc.selectCRLsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_1900
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_1900
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(0)
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [7], param, IS_PROMISE);
        expect(crls != null).assertTrue();
        expect(crls.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_2000
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_2000
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(10)
      };
      try {
        const crls = await crlFunc.checkSelectCRLs(PEM, [7], param, IS_PROMISE);
        expect(crls != null).assertTrue();
        expect(crls.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_2100
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_2100
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(-1)
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([], [2], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await crlFunc.selectCRLsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_CRLs_Func_2200
     * @tc.number SUB_Security_Cert_Framework_Select_CRLs_Func_2200
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_CRLs_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CRLMatchParameters = {
        minCRL: BigInt(3),
        maxCRL: BigInt(1)
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([], [2], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await crlFunc.selectCRLsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });
  });
}
