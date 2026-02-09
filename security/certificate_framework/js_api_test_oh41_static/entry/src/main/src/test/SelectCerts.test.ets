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
import util from '@ohos.util';
import * as certFunc from "./utils/collection/certFunc";
import * as crlFunc from "./utils/collection/crlFunc";
import { CERT_DATA_PEM, CERT_DATA_PEM_PARAMETERS, IS_CALLBACK, IS_PROMISE, PEM } from './utils/common/commonParam';

export default function certFrameworkSelectCertsJsAPIFunctionTestUnit() {
  describe("certFrameworkSelectCertsJsAPIFunctionTestUnit", () => {
    console.info("##########start certFrameworkSelectCertsJsAPIFunctionTestUnit##########");
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_0100
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0100
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([1], [], PEM);
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_0200
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0200
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([1], [], PEM);
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_0300
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0300
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 2], {}, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 2).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_0400
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0400
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509Cert: cert.X509Cert;
      try {
        x509Cert = await certFunc.createPEMCustomizedX509CertPromise(CERT_DATA_PEM[0]);
        expect(x509Cert != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CertMatchParameters = {
        x509Cert
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0, 1], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_0500
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0500
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509Cert: cert.X509Cert;
      try {
        x509Cert = await certFunc.createPEMCustomizedX509CertPromise(CERT_DATA_PEM[1]);
        expect(x509Cert != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CertMatchParameters = {
        x509Cert
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_0600
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        validDate: '231129Z'
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([0], [], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await collection.selectCerts(param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_0700
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0700
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        validDate: '231122034700Z'
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_0800
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        validDate: '20231122034700Z'
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_0900
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        validDate: CERT_DATA_PEM_PARAMETERS[0].notBeforeDate
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_1000
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1000
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        validDate: CERT_DATA_PEM_PARAMETERS[0].notAfterDate
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_1100
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1100
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        validDate: '20241122034700Z'
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_1200
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1200
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        validDate: ''
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([0], [], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_1300
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        issuer: CERT_DATA_PEM_PARAMETERS[0].issuer
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0, 3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });


    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_1400
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1400
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        issuer: CERT_DATA_PEM_PARAMETERS[2].issuer
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0, 1], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_1500
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1500
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        issuer: new Uint8Array([0x30, 0x64, 0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x08, 0x13, 0x07, 0x4a, 0x69,
          0x61, 0x6e, 0x67, 0x73, 0x75, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x43, 0x4e,
          0x31, 0x10, 0x30, 0x0e, 0x06, 0x03, 0x55, 0x04, 0x07, 0x13, 0x07, 0x4e, 0x61, 0x6e, 0x6a, 0x69, 0x6e, 0x67,
          0x31, 0x0f, 0x30, 0x0d, 0x06, 0x03, 0x55, 0x04, 0x0a, 0x13, 0x06, 0x74, 0x65, 0x73, 0x74, 0x43, 0x61, 0x31,
          0x0f, 0x30, 0x0d, 0x06, 0x03, 0x55, 0x04, 0x0b, 0x13, 0x06, 0x74, 0x65, 0x73, 0x74, 0x43, 0x61, 0x31, 0x0f,
          0x30, 0x0d, 0x06, 0x03, 0x55, 0x04, 0x03, 0x13, 0x06, 0x74, 0x65, 0x73, 0x74, 0x43, 0x61])
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0, 3], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_1600
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        issuer: new Uint8Array([0x30, 0x74, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x43, 0x4e,
          0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x55, 0x53, 0x31, 0x13, 0x30, 0x11, 0x06,
          0x03, 0x55, 0x04, 0x08, 0x13, 0x0a, 0x57, 0x61, 0x73, 0x68, 0x69, 0x6e, 0x67, 0x74, 0x6f, 0x6e, 0x31, 0x13,
          0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x07, 0x13, 0x0a, 0x57, 0x61, 0x73, 0x68, 0x69, 0x6e, 0x67, 0x74, 0x6f,
          0x6e, 0x31, 0x0e, 0x30, 0x0c, 0x06, 0x03, 0x55, 0x04, 0x0a, 0x13, 0x05, 0x74, 0x73, 0x31, 0x31, 0x30, 0x31,
          0x0e, 0x30, 0x0c, 0x06, 0x03, 0x55, 0x04, 0x0b, 0x13, 0x05, 0x74, 0x73, 0x31, 0x31, 0x30, 0x31, 0x0e, 0x30,
          0x0c, 0x06, 0x03, 0x55, 0x04, 0x03, 0x13, 0x05, 0x74, 0x73, 0x31, 0x31, 0x30])
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [9], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_1700
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1700
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        issuer: new Uint8Array([0x30, 0x64, 0x31])
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([0, 2], [], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_1800
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1800
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        issuer: new Uint8Array()
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([0, 2], [], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_1900
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_2000
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, false, true, true, false, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_2100
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2100
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [false, false, false, false, false, false, false, false, false]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_2200
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2200
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_2300
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2300
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [8], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_2400
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2400
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_2500
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2500
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true, true, false]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_2600
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2600
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: []
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([7], [], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_2700
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2700
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_2800
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        serialNumber: CERT_DATA_PEM_PARAMETERS[1].serialNumber
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0, 1], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_2900
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2900
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        serialNumber: BigInt(1234567)
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0, 1], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_3000
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        subject: CERT_DATA_PEM_PARAMETERS[1].subject
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_3100
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3100
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        subject: CERT_DATA_PEM_PARAMETERS[3].subject
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_3200
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3200
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        subject: new Uint8Array([0x30, 0x6c, 0x31, 0x0e, 0x30, 0x0c, 0x06, 0x03, 0x55, 0x04, 0x08, 0x13, 0x05, 0x74,
          0x65, 0x73, 0x74, 0x31, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x43, 0x4e, 0x31,
          0x0e, 0x30, 0x0c, 0x06, 0x03, 0x55, 0x04, 0x07, 0x13, 0x05, 0x74, 0x65, 0x73, 0x74, 0x32, 0x31, 0x13, 0x30,
          0x11, 0x06, 0x03, 0x55, 0x04, 0x0a, 0x13, 0x0a, 0x74, 0x65, 0x73, 0x74, 0x45, 0x6e, 0x74, 0x69, 0x74, 0x79,
          0x31, 0x13, 0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x0b, 0x13, 0x0a, 0x74, 0x65, 0x73, 0x74, 0x45, 0x6e, 0x74,
          0x69, 0x74, 0x79, 0x31, 0x13, 0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x03, 0x13, 0x0a, 0x74, 0x65, 0x73, 0x74,
          0x45, 0x6e, 0x74, 0x69, 0x74, 0x79])
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_3300
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3300
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        subject: new Uint8Array([0x30, 0x6c, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x45, 0x4e,
          0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x43, 0x4e, 0x31, 0x10, 0x30, 0x0e, 0x06,
          0x03, 0x55, 0x04, 0x08, 0x13, 0x07, 0x4a, 0x69, 0x61, 0x6e, 0x67, 0x73, 0x75, 0x31, 0x10, 0x30, 0x0e, 0x06,
          0x03, 0x55, 0x04, 0x07, 0x13, 0x07, 0x4e, 0x61, 0x6e, 0x6a, 0x69, 0x6e, 0x67, 0x31, 0x0b, 0x30, 0x09, 0x06,
          0x03, 0x55, 0x04, 0x0a, 0x13, 0x02, 0x74, 0x73, 0x31, 0x0b, 0x30, 0x09, 0x06, 0x03, 0x55, 0x04, 0x0b, 0x13,
          0x02, 0x74, 0x73, 0x31, 0x12, 0x30, 0x10, 0x06, 0x03, 0x55, 0x04, 0x03, 0x13, 0x09, 0x31, 0x32, 0x37, 0x2e,
          0x30, 0x2e, 0x30, 0x2e, 0x31])
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [9], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_3400
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3400
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        subject: new Uint8Array([0x30, 0x6c, 0x31])
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([1, 3], [], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await collection.selectCerts(param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_3500
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3500
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        subject: new Uint8Array()
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([1], [], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_3600
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3600
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        publicKey: CERT_DATA_PEM_PARAMETERS[1].publicKey
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_3700
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3700
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        publicKey: {
          data: new Uint8Array([0x30, 0x82, 0x01])
        }
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 3], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_3800
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3800
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        publicKey: {
          data: new Uint8Array()
        }
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([1], [], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await collection.selectCerts(param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_3900
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        publicKeyAlgID: CERT_DATA_PEM_PARAMETERS[1].publicKeyAlgID
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_4000
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4000
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        publicKeyAlgID: '1.2.3.4'
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_4100
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4100
     * @tc.desc   Use Callback Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const param: cert.X509CertMatchParameters = {
        publicKeyAlgID: ''
      };
      let collection: cert.CertCRLCollection;
      try {
        collection = await crlFunc.createCollection([1], [], PEM);
      }
      catch (err: BusinessError) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err: BusinessError) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_4200
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509Cert: cert.X509Cert;
      try {
        x509Cert = await certFunc.createCustomizedX509CertPromise(PEM, 1);
        expect(x509Cert != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CertMatchParameters = {
        x509Cert,
        validDate: CERT_DATA_PEM_PARAMETERS[1].notAfterDate,
        issuer: CERT_DATA_PEM_PARAMETERS[1].issuer,
        keyUsage: [false, false, false, false, false, false, true, true, true],
        serialNumber: CERT_DATA_PEM_PARAMETERS[1].serialNumber,
        subject: CERT_DATA_PEM_PARAMETERS[1].subject,
        publicKey: CERT_DATA_PEM_PARAMETERS[1].publicKey,
        publicKeyAlgID: CERT_DATA_PEM_PARAMETERS[1].publicKeyAlgID
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.name   SUB_Security_Cert_Framework_Select_Certs_Func_4300
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4300
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let x509Cert: cert.X509Cert;
      try {
        x509Cert = await certFunc.createCustomizedX509CertPromise(PEM, 1);
        expect(x509Cert != null).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      const param: cert.X509CertMatchParameters = {
        x509Cert,
        validDate: CERT_DATA_PEM_PARAMETERS[1].notAfterDate,
        issuer: CERT_DATA_PEM_PARAMETERS[1].issuer,
        keyUsage: [true, true, true, true, true, true, true, true, true],
        serialNumber: CERT_DATA_PEM_PARAMETERS[1].serialNumber,
        subject: CERT_DATA_PEM_PARAMETERS[1].subject,
        publicKey: CERT_DATA_PEM_PARAMETERS[1].publicKey,
        publicKeyAlgID: CERT_DATA_PEM_PARAMETERS[1].publicKeyAlgID
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err: BusinessError) {
        expect(null).assertFail();
      }
      done();
    });

  });
}
