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
import util from '@ohos.util';
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

    /**
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_0100
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0100
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL | undefined;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_0200
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0200
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL | undefined;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_0300
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0300
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL | undefined;
      try {
        x509CRL = await crlFunc.createCustomizedX509CRLPromise(PEM, 2);
        expect(x509CRL != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      try {
        const result = x509CRL!.match({});
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_0400
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0400
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL | undefined;
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
        const result = x509CRL!.match(param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_0500
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0500
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL | undefined;
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
        const result = x509CRL!.match(param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_0600
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0600
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL | undefined;
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
        const result = x509CRL!.match(param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_0700
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0700
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL | undefined;
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
        const result = x509CRL!.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_0800
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0800
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let x509CRL: cert.X509CRL | undefined;
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
        const result = x509CRL!.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        err = err as BusinessError;
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_0900
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_0900
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_1000
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1000
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_1100
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1100
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509Cert: cert.X509Cert | undefined;
      try {
        x509Cert = await certFunc.createPEMCustomizedX509CertPromise(CRL_CERT_DATA_02[0]);
        expect(x509Cert != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      let x509CRL: cert.X509CRL | undefined;
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
        const result = x509CRL!.match(param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_CRL_Match_Func_1200
     * @tc.number SUB_Security_Cert_Framework_CRL_Match_Func_1200
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_CRL_Match_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509Cert: cert.X509Cert | undefined;
      try {
        x509Cert = await certFunc.createPEMCustomizedX509CertPromise(CRL_CERT_DATA_01[0]);
        expect(x509Cert != null).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      let x509CRL: cert.X509CRL | undefined;
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
        const result = x509CRL!.match(param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

  });
}
