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
import * as certFunc from "./utils/collection/certFunc";
import * as collectionFunc from "./utils/collection/collectionFunc";
import { CERT_DATA_PEM, CERT_DATA_PEM_PARAMETERS, IS_CALLBACK, IS_PROMISE, PEM } from './utils/common/commonParam';

export default function certFrameworkSelectCertsJsAPIFunctionTestUnit() {
  describe("certFrameworkSelectCertsJsAPIFunctionTestUnit", () => {
    console.info("##########start certFrameworkSelectCertsJsAPIFunctionTestUnit##########");
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0100
     * @tc.name check CertCRLCollection.selectCerts with parameter null
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0100", 0, async (done: Function) => {
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([1], [], PEM);
      }
      catch (err) {
        expect(null).assertFail();
      }
      try {
        await collection.selectCerts(null);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0200
     * @tc.name check CertCRLCollection.selectCerts with parameter null
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0200", 0, async (done: Function) => {
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([1], [], PEM);
      }
      catch (err) {
        expect(null).assertFail();
      }

      try {
        await collection.selectCerts(undefined);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0300
     * @tc.name check CertCRLCollection.selectCerts with parameter empty
     * @tc.desc The X509 CRL FORMAT is FORMAT_PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0300", 0, async (done: Function) => {
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 2], {}, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 2).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0400
     * @tc.name check CertCRLCollection.selectCerts with parameter x509Cert, the cert is in collection
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0400", 0, async (done: Function) => {
      let x509Cert: cert.X509Cert = {} as cert.X509Cert;
      try {
        x509Cert = await certFunc.createPEMCustomizedX509CertPromise(CERT_DATA_PEM[0]);
        expect(x509Cert != null).assertTrue();
      }
      catch (err) {
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
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0500
     * @tc.name check CertCRLCollection.selectCerts with parameter x509Cert, the cert is not in collection
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0500", 0, async (done: Function) => {
      let x509Cert: cert.X509Cert = {} as cert.X509Cert;
      try {
        x509Cert = await certFunc.createPEMCustomizedX509CertPromise(CERT_DATA_PEM[1]);
        expect(x509Cert != null).assertTrue();
      }
      catch (err) {
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
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0600
     * @tc.name check CertCRLCollection.selectCerts with parameter validDate, in incorrect format
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0600", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        validDate: '231129Z'
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([0], [], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await collection.selectCerts(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0700
     * @tc.name check CertCRLCollection.selectCerts with parameter validDate, in duration
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0700", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        validDate: '231122034700Z'
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0800
     * @tc.name check CertCRLCollection.selectCerts with parameter validDate, less than notBefore
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0800", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        validDate: '20231122034700Z'
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_0900
     * @tc.name check CertCRLCollection.selectCerts with parameter validDate, equal with notBefore
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_0900", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        validDate: CERT_DATA_PEM_PARAMETERS[0].notBeforeDate
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1000
     * @tc.name check CertCRLCollection.selectCerts with parameter validDate, equal with notAfterDate
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1000", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        validDate: CERT_DATA_PEM_PARAMETERS[0].notAfterDate
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1100
     * @tc.name check CertCRLCollection.selectCerts with parameter validDate, greater than notAfterDate
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1100", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        validDate: '20241122034700Z'
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1200
     * @tc.name check CertCRLCollection.selectCerts with parameter validDate empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1200", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        validDate: ''
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([0], [], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1300
     * @tc.name check CertCRLCollection.selectCerts with parameter issuer correct
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1300", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        issuer: CERT_DATA_PEM_PARAMETERS[0].issuer
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0, 3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });


    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1400
     * @tc.name check CertCRLCollection.selectCerts with parameter issuer incorrect
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1400", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        issuer: CERT_DATA_PEM_PARAMETERS[2].issuer
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0, 1], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1500
     * @tc.name check CertCRLCollection.selectCerts with parameter issuer, change country and province order
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1500", 0, async (done: Function) => {
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
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1600
     * @tc.name check CertCRLCollection.selectCerts with parameter issuer, change country order
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1600", 0, async (done: Function) => {
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
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1700
     * @tc.name check CertCRLCollection.selectCerts with parameter issuer not resolvable
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1700", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        issuer: new Uint8Array([0x30, 0x64, 0x31])
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([0, 2], [], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1800
     * @tc.name check CertCRLCollection.selectCerts with parameter issuer empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1800", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        issuer: new Uint8Array()
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([0, 2], [], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_1900
     * @tc.name check CertCRLCollection.selectCerts with parameter keyUsage all true, length 9
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_1900", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2000
     * @tc.name check CertCRLCollection.selectCerts with parameter keyUsage partly true, length 9
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2000", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, false, true, true, false, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2100
     * @tc.name check CertCRLCollection.selectCerts with parameter keyUsage all false, length 9
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2100", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [false, false, false, false, false, false, false, false, false]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2200
     * @tc.name check CertCRLCollection.selectCerts with parameter keyUsage all true, length 8, same as cert
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2200", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2300
     * @tc.name check CertCRLCollection.selectCerts with parameter keyUsage all true, length 8, not same as cert
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2300", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [8], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2400
     * @tc.name check CertCRLCollection.selectCerts with parameter keyUsage all true, length 10
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2400", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2500
     * @tc.name check CertCRLCollection.selectCerts with parameter keyUsage all false, length 10
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2500", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true, true, false]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [7], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2600
     * @tc.name check CertCRLCollection.selectCerts with parameter keyUsage empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2600", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: []
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([7], [], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2700
     * @tc.name check CertCRLCollection.selectCerts with parameter keyUsage all true, length 9, cert does not contain keyUsage
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2700", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        keyUsage: [true, true, true, true, true, true, true, true, true]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2800
     * @tc.name check CertCRLCollection.selectCerts with parameter serialNumber correct
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2800", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        serialNumber: CERT_DATA_PEM_PARAMETERS[1].serialNumber
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0, 1], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_2900
     * @tc.name check CertCRLCollection.selectCerts with parameter serialNumber incorrect
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_2900", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        serialNumber: BigInt(1234567)
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0, 1], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3000
     * @tc.name check CertCRLCollection.selectCerts with parameter subject correct
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3000", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subject: CERT_DATA_PEM_PARAMETERS[1].subject
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3100
     * @tc.name check CertCRLCollection.selectCerts with parameter subject incorrect
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3100", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subject: CERT_DATA_PEM_PARAMETERS[3].subject
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3200
     * @tc.name check CertCRLCollection.selectCerts with parameter subject, change country and province order
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3200", 0, async (done: Function) => {
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
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3300
     * @tc.name check CertCRLCollection.selectCerts with parameter subject, change country and province order
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3300", 0, async (done: Function) => {
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
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3400
     * @tc.name check CertCRLCollection.selectCerts with parameter subject not resolvable
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3400", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subject: new Uint8Array([0x30, 0x6c, 0x31])
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([1, 3], [], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await collection.selectCerts(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.ERR_CRYPTO_OPERATION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3500
     * @tc.name check CertCRLCollection.selectCerts with parameter subject empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3500", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subject: new Uint8Array()
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([1], [], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3600
     * @tc.name check CertCRLCollection.selectCerts with parameter publicKey correct
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3600", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        publicKey: CERT_DATA_PEM_PARAMETERS[1].publicKey
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3700
     * @tc.name check CertCRLCollection.selectCerts with parameter publicKey incorrect
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3700", 0, async (done: Function) => {
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
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3800
     * @tc.name check CertCRLCollection.selectCerts with parameter publicKey empty
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3800", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        publicKey: {
          data: new Uint8Array()
        }
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([1], [], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await collection.selectCerts(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_3900
     * @tc.name check CertCRLCollection.selectCerts with parameter publicKeyAlgID correct
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_3900", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        publicKeyAlgID: CERT_DATA_PEM_PARAMETERS[1].publicKeyAlgID
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4000
     * @tc.name check CertCRLCollection.selectCerts with parameter publicKeyAlgID incorrect
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4000", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        publicKeyAlgID: '1.2.3.4'
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [1, 3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4100
     * @tc.name check CertCRLCollection.selectCerts with parameter publicKeyAlgID empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4100", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        publicKeyAlgID: ''
      };
      let collection: cert.CertCRLCollection = {} as cert.CertCRLCollection;
      try {
        collection = await collectionFunc.createCollection([1], [], PEM);
      }
      catch (err) {
        console.error("createCollection error");
        expect(null).assertFail();
      }
      try {
        await certFunc.selectCertsCallback(collection, param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4200
     * @tc.name check CertCRLCollection.selectCerts with parameter all correct
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4200", 0, async (done: Function) => {
      let x509Cert: cert.X509Cert = {} as cert.X509Cert;
      try {
        x509Cert = await certFunc.createCustomizedX509CertPromise(PEM, 1);
        expect(x509Cert != null).assertTrue();
      }
      catch (err) {
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
      catch (err) {
        expect(null).assertFail();
      }

      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4300
     * @tc.name check CertCRLCollection.selectCerts with parameter partly incorrect
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4300", 0, async (done: Function) => {
      let x509Cert: cert.X509Cert = {} as cert.X509Cert;
      try {
        x509Cert = await certFunc.createCustomizedX509CertPromise(PEM, 1);
        expect(x509Cert != null).assertTrue();
      }
      catch (err) {
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
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

  });
}
