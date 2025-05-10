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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4400
     * @tc.name check CertCRLCollection.selectCerts with parameter subjectAlternativeNames correct
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: [
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x15, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61,
              0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x11, 0x74, 0x68, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69, 0x67,
              0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x12, 0x64, 0x65, 0x76, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x13, 0x69, 0x6E, 0x66, 0x6F, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73,
              0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x16, 0x61, 0x72, 0x63, 0x68, 0x69, 0x76, 0x65, 0x2E, 0x67, 0x6C, 0x6F, 0x62,
              0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x16, 0x73, 0x74, 0x61, 0x74, 0x69, 0x63, 0x31, 0x2E, 0x67, 0x6C, 0x6F, 0x62,
              0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x16, 0x73, 0x74, 0x61, 0x74, 0x69, 0x63, 0x32, 0x2E, 0x67, 0x6C, 0x6F, 0x62,
              0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x13, 0x62, 0x6C, 0x6F, 0x67, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73,
              0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x17, 0x73, 0x73, 0x6C, 0x63, 0x68, 0x65, 0x63, 0x6B, 0x2E, 0x67, 0x6C, 0x6F,
              0x62, 0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x15, 0x73, 0x79, 0x73, 0x74, 0x65, 0x6D, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61,
              0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x18, 0x6F, 0x70, 0x65, 0x72, 0x61, 0x74, 0x69, 0x6F, 0x6E, 0x2E, 0x67, 0x6C,
              0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x0E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63,
              0x6F, 0x6D])
          }
        ]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [12], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4500
     * @tc.name check CertCRLCollection.selectCerts with parameter subjectAlternativeNames mismatching
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: [{
          type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
          name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
            0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
        }]
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

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4600
     * @tc.name check CertCRLCollection.selectCerts with parameter subjectAlternativeNames, but cert has no subjectAlternativeNames
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: [{
          type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
          name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
            0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
        }]
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [0], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4700
     * @tc.name check CertCRLCollection.selectCerts with parameter subjectAlternativeNames empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: []
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4800
     * @tc.name check CertCRLCollection.selectCerts with parameter matchAllSubjectAltNames true, and subjectAlternativeNames match
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: [
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x15, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61,
              0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x11, 0x74, 0x68, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69, 0x67,
              0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x12, 0x64, 0x65, 0x76, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x13, 0x69, 0x6E, 0x66, 0x6F, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73,
              0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x16, 0x61, 0x72, 0x63, 0x68, 0x69, 0x76, 0x65, 0x2E, 0x67, 0x6C, 0x6F, 0x62,
              0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x16, 0x73, 0x74, 0x61, 0x74, 0x69, 0x63, 0x31, 0x2E, 0x67, 0x6C, 0x6F, 0x62,
              0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x16, 0x73, 0x74, 0x61, 0x74, 0x69, 0x63, 0x32, 0x2E, 0x67, 0x6C, 0x6F, 0x62,
              0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x13, 0x62, 0x6C, 0x6F, 0x67, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73,
              0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x17, 0x73, 0x73, 0x6C, 0x63, 0x68, 0x65, 0x63, 0x6B, 0x2E, 0x67, 0x6C, 0x6F,
              0x62, 0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x15, 0x73, 0x79, 0x73, 0x74, 0x65, 0x6D, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61,
              0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x18, 0x6F, 0x70, 0x65, 0x72, 0x61, 0x74, 0x69, 0x6F, 0x6E, 0x2E, 0x67, 0x6C,
              0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x0E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63,
              0x6F, 0x6D])
          }
        ],
        matchAllSubjectAltNames: true
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [12], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_4900
     * @tc.name check CertCRLCollection.selectCerts with parameter matchAllSubjectAltNames true, and subjectAlternativeNames mismatching
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: [{
          type: cert.GeneralNameType.GENERAL_NAME_TYPE_OTHER_NAME,
          name: new Uint8Array([0x30, 0x82, 0x01])
        }],
        matchAllSubjectAltNames: true
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_5000
     * @tc.name check CertCRLCollection.selectCerts with parameter matchAllSubjectAltNames false, and subjectAlternativeNames match
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: [
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x15, 0x73, 0x74, 0x61, 0x74, 0x75, 0x73, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61,
              0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x11, 0x74, 0x68, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69, 0x67,
              0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x12, 0x64, 0x65, 0x76, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x13, 0x69, 0x6E, 0x66, 0x6F, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73,
              0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x16, 0x61, 0x72, 0x63, 0x68, 0x69, 0x76, 0x65, 0x2E, 0x67, 0x6C, 0x6F, 0x62,
              0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x16, 0x73, 0x74, 0x61, 0x74, 0x69, 0x63, 0x31, 0x2E, 0x67, 0x6C, 0x6F, 0x62,
              0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x16, 0x73, 0x74, 0x61, 0x74, 0x69, 0x63, 0x32, 0x2E, 0x67, 0x6C, 0x6F, 0x62,
              0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x13, 0x62, 0x6C, 0x6F, 0x67, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73,
              0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x17, 0x73, 0x73, 0x6C, 0x63, 0x68, 0x65, 0x63, 0x6B, 0x2E, 0x67, 0x6C, 0x6F,
              0x62, 0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x15, 0x73, 0x79, 0x73, 0x74, 0x65, 0x6D, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61,
              0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x18, 0x6F, 0x70, 0x65, 0x72, 0x61, 0x74, 0x69, 0x6F, 0x6E, 0x2E, 0x67, 0x6C,
              0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x0E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69, 0x67, 0x6E, 0x2E, 0x63,
              0x6F, 0x6D])
          }
        ],
        matchAllSubjectAltNames: false
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [12], param, IS_CALLBACK);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_5100
     * @tc.name check CertCRLCollection.selectCerts with parameter authorityKeyIdentifier match
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        authorityKeyIdentifier: new Uint8Array([0x30, 0x61, 0xA1, 0x49, 0xA4, 0x47, 0x30, 0x45, 0x31, 0x0B, 0x30, 0x09,
          0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x41, 0x55, 0x31, 0x13, 0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x08,
          0x0C, 0x0A, 0x53, 0x6F, 0x6D, 0x65, 0x2D, 0x53, 0x74, 0x61, 0x74, 0x65, 0x31, 0x21, 0x30, 0x1F, 0x06, 0x03,
          0x55, 0x04, 0x0A, 0x0C, 0x18, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x6E, 0x65, 0x74, 0x20, 0x57, 0x69, 0x64, 0x67,
          0x69, 0x74, 0x73, 0x20, 0x50, 0x74, 0x79, 0x20, 0x4C, 0x74, 0x64, 0x82, 0x14, 0x66, 0xC7, 0xC4, 0x0E, 0x74,
          0xDB, 0x24, 0x07, 0x83, 0x04, 0x01, 0xC4, 0x44, 0x1E, 0x71, 0x83, 0x0E, 0x22, 0x0E, 0xAB])
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [10], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_5200
     * @tc.name check CertCRLCollection.selectCerts with parameter authorityKeyIdentifier mismatching
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        authorityKeyIdentifier: new Uint8Array([0x30, 0x61, 0xA1, 0x49, 0xA4, 0x47, 0x30, 0x45, 0x31, 0x0B, 0x30, 0x09,
          0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x41, 0x55, 0x31, 0x13, 0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x08,
          0x0C, 0x0A, 0x53, 0x6F, 0x6D, 0x65, 0x2D, 0x53, 0x74, 0x61, 0x74, 0x65, 0x31, 0x21, 0x30, 0x1F, 0x06, 0x03,
          0x55, 0x04, 0x0A, 0x0C, 0x18, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x6E, 0x65, 0x74, 0x20, 0x57, 0x69, 0x64, 0x67,
          0x69, 0x74, 0x73, 0x20, 0x50, 0x74, 0x79, 0x20, 0x4C, 0x74, 0x64, 0x82, 0x14, 0x66, 0xC7, 0xC4, 0x0E, 0x74,
          0xDB, 0x24, 0x07, 0x83, 0x04, 0x01, 0xC4, 0x44, 0x1E, 0x71, 0x83, 0x0E, 0x22, 0x0E, 0xAB])
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [2], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_5300
     * @tc.name check CertCRLCollection.selectCerts with parameter authorityKeyIdentifier, cert has no authorityKeyIdentifier
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        authorityKeyIdentifier: new Uint8Array([0x30, 0x61, 0xA1, 0x49, 0xA4, 0x47, 0x30, 0x45, 0x31, 0x0B, 0x30, 0x09,
          0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x41, 0x55, 0x31, 0x13, 0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x08,
          0x0C, 0x0A, 0x53, 0x6F, 0x6D, 0x65, 0x2D, 0x53, 0x74, 0x61, 0x74, 0x65, 0x31, 0x21, 0x30, 0x1F, 0x06, 0x03,
          0x55, 0x04, 0x0A, 0x0C, 0x18, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x6E, 0x65, 0x74, 0x20, 0x57, 0x69, 0x64, 0x67,
          0x69, 0x74, 0x73, 0x20, 0x50, 0x74, 0x79, 0x20, 0x4C, 0x74, 0x64, 0x82, 0x14, 0x66, 0xC7, 0xC4, 0x0E, 0x74,
          0xDB, 0x24, 0x07, 0x83, 0x04, 0x01, 0xC4, 0x44, 0x1E, 0x71, 0x83, 0x0E, 0x22, 0x0E, 0xAB])
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

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_5400
     * @tc.name check CertCRLCollection.selectCerts with parameter authorityKeyIdentifier empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        authorityKeyIdentifier: new Uint8Array()
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_5500
     * @tc.name check CertCRLCollection.selectCerts with parameter minPathLenConstraint=0, cert has no BaseConstraints extension
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: 0
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_5600
     * @tc.name check CertCRLCollection.selectCerts with parameter minPathLenConstraint=0, CA:true
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: 0
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [11], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_5700
     * @tc.name check CertCRLCollection.selectCerts with parameter minPathLenConstraint=0, CA:false
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: 0
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [2], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_5800
     * @tc.name check CertCRLCollection.selectCerts with parameter minPathLenConstraint=1, PathLenConstraint>1
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: 1
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [13], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_5900
     * @tc.name check CertCRLCollection.selectCerts with parameter minPathLenConstraint=1, PathLenConstraint<1
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: 1
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [2], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_6000
     * @tc.name check CertCRLCollection.selectCerts with parameter minPathLenConstraint = -2, cA:false
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_6000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: -2
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_6100
     * @tc.name check CertCRLCollection.selectCerts with parameter minPathLenConstraint = -2, cA:true
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: -2
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [11], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_6200
     * @tc.name check CertCRLCollection.selectCerts with parameter minPathLenConstraint = -2, cert has no BaseConstraints extension
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_6200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: -2
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_6300
     * @tc.name check CertCRLCollection.selectCerts with parameter minPathLenConstraint = -1
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_6300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: -1
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_6400
     * @tc.name check CertCRLCollection.selectCerts with parameter extendedKeyUsage match Signature CERT
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_6400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: CERT_DATA_PEM_PARAMETERS[1].extendedKeyUsage
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_6500
     * @tc.name check CertCRLCollection.selectCerts with parameter extendedKeyUsage mismatching Signature CERT
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_6500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: CERT_DATA_PEM_PARAMETERS[1].extendedKeyUsage
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [2], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_6600
     * @tc.name check CertCRLCollection.selectCerts with parameter extendedKeyUsage match Encipherment CERT
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_6600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: ['1.3.6.1.5.5.7.3.1','1.3.6.1.5.5.7.3.2']
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [12], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_6700
     * @tc.name check CertCRLCollection.selectCerts with parameter extendedKeyUsage mismatching Encipherment CERT
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_6700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: CERT_DATA_PEM_PARAMETERS[1].extendedKeyUsage
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [12], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_6800
     * @tc.name check CertCRLCollection.selectCerts with parameter extendedKeyUsage match Signature&Encipherment CERT
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_6800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: CERT_DATA_PEM_PARAMETERS[2].extendedKeyUsage
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [2], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_6900
     * @tc.name check CertCRLCollection.selectCerts with parameter extendedKeyUsage mismatching Signature&Encipherment CERT
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_6900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: ['1.3.6.1.5.5.7.3.4', '1.3.6.1.5.5.7.3.8', '1.3.6.1.4.1.311.2.1.21'],
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [6], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_7000
     * @tc.name check CertCRLCollection.selectCerts with parameter extendedKeyUsage, but cert has no extendedKeyUsage
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_7000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: CERT_DATA_PEM_PARAMETERS[1].extendedKeyUsage
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [6], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_7100
     * @tc.name check CertCRLCollection.selectCerts with parameter extendedKeyUsage empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_7100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: []
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_7200
     * @tc.name check CertCRLCollection.selectCerts with parameter nameConstraints match
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_7200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        nameConstraints: CERT_DATA_PEM_PARAMETERS[2].nameConstraints
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [2], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_7300
     * @tc.name check CertCRLCollection.selectCerts with parameter nameConstraints mismatching
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_7300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        nameConstraints: new Uint8Array([0x30, 0x1A, 0x31, 0x18, 0x30, 0x16, 0x06, 0x03, 0x55, 0x04, 0x03, 0x0C, 0x0F,
          0x45, 0x78, 0x61, 0x6D, 0x70, 0x6C, 0x65, 0x20, 0x52, 0x6F, 0x6F, 0x74, 0x20, 0x43, 0x41]),
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [2], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_7400
     * @tc.name check CertCRLCollection.selectCerts with parameter nameConstraints incorrect, but cert has no nameConstraints
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_7400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        nameConstraints: new Uint8Array([0x30, 0x1A, 0x31, 0x18, 0x30, 0x16, 0x06, 0x03, 0x55, 0x04, 0x03, 0x0C, 0x0F,
          0x45, 0x78, 0x61, 0x6D, 0x70, 0x6C, 0x65, 0x20, 0x52, 0x6F, 0x6F, 0x74, 0x20, 0x43, 0x41]),
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [5], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_7500
     * @tc.name check CertCRLCollection.selectCerts with parameter nameConstraints empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_7500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        nameConstraints: new Uint8Array()
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_7600
     * @tc.name check CertCRLCollection.selectCerts with parameter certPolicy match
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_7600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        certPolicy: CERT_DATA_PEM_PARAMETERS[1].certificatePolicies
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_7700
     * @tc.name check CertCRLCollection.selectCerts with parameter certPolicy mismatching
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_7700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        certPolicy: CERT_DATA_PEM_PARAMETERS[1].certificatePolicies
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [2], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_7800
     * @tc.name check CertCRLCollection.selectCerts with parameter certPolicy, but cert has no certPolicy
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_7800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        certPolicy: CERT_DATA_PEM_PARAMETERS[1].certificatePolicies
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [5], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_7900
     * @tc.name check CertCRLCollection.selectCerts with parameter certPolicy empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_7900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        certPolicy: []
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_8000
     * @tc.name check CertCRLCollection.selectCerts with parameter privateKeyValid match
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_8000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        privateKeyValid: '241121-00:00:00Z'
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_8100
     * @tc.name check CertCRLCollection.selectCerts with parameter privateKeyValid mismatching
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_8100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        privateKeyValid: '291121-00:00:00Z'
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

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_8200
     * @tc.name check CertCRLCollection.selectCerts with parameter privateKeyValid, but cert has no privateKeyValid
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_8200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        privateKeyValid: '241121-00:00:00Z'
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [5], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_8300
     * @tc.name check CertCRLCollection.selectCerts with parameter privateKeyValid empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_8300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        privateKeyValid: ''
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
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_8400
     * @tc.name check CertCRLCollection.selectCerts with parameter subjectKeyIdentifier match
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_8400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectKeyIdentifier: new Uint8Array([0x04,0x14,0xAF,0x32,0x84,0xC3,0x94,0x50,0x74,0x69,0x58,0x15,0xAC,0xD9,
          0x24,0x4B,0x54,0x12,0x99,0x87,0xF1,0xD7])
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [12], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 1).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_8500
     * @tc.name check CertCRLCollection.selectCerts with parameter subjectKeyIdentifier mismatching
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_8500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectKeyIdentifier: new Uint8Array([0x04,0x14,0xAF,0x32,0x84,0xC3,0x94,0x50,0x74,0x69,0x58,0x15,0xAC,0xD9,
          0x24,0x4B,0x54,0x12,0x99,0x87,0xF1,0xD7])
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [3], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_8600
     * @tc.name check CertCRLCollection.selectCerts with parameter subjectKeyIdentifier, but cert has no subjectKeyIdentifier
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_8600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectKeyIdentifier: new Uint8Array([0x04,0x14,0xAF,0x32,0x84,0xC3,0x94,0x50,0x74,0x69,0x58,0x15,0xAC,0xD9,
          0x24,0x4B,0x54,0x12,0x99,0x87,0xF1,0xD7])
      };
      try {
        const certs = await certFunc.checkSelectCerts(PEM, [5], param, IS_PROMISE);
        expect(certs != null).assertTrue();
        expect(certs.length === 0).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Select_Certs_Func_8700
     * @tc.name check CertCRLCollection.selectCerts with parameter subjectKeyIdentifier empty
     * @tc.desc Use Callback Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Select_Certs_Func_8700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectKeyIdentifier: new Uint8Array()
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
  });
}
