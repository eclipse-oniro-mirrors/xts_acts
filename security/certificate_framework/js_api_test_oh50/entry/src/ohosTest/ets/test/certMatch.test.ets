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
import * as certFunc from "./utils/collection/certFunc";
import {
  CERT_DATA_PEM,
  CERT_DATA_PEM_PARAMETERS,
  EXPECT_RESULT_FALSE,
  EXPECT_RESULT_TRUE,
  PEM
} from './utils/common/commonParam';

export default function certFrameworkCertMatchJsAPIFunctionTestUnit() {
  describe("certFrameworkCertMatchJsAPIFunctionTestUnit", () => {
    let pemCert0: cert.X509Cert = {} as cert.X509Cert;
    let pemCert1: cert.X509Cert = {} as cert.X509Cert;
    let pemCert7: cert.X509Cert = {} as cert.X509Cert;
    console.info("##########start certFrameworkCertMatchJsAPIFunctionTestUnit##########");
    beforeAll(async () => {
      try {
        pemCert0 = await certFunc.createCustomizedX509CertPromise(PEM, 0);
        pemCert1 = await certFunc.createCustomizedX509CertPromise(PEM, 1);
        pemCert7 = await certFunc.createCustomizedX509CertPromise(PEM, 7);
      }
      catch (err) {
        console.error("createCustomizedX509CertPromise error");
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
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_4400
     * @tc.name check X509Cert.match for parameter subjectAlternativeNames match
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_4400", 0, async (done: Function) => {
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
        const result = await certFunc.checkCertMatchParam(PEM, 12, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_4500
     * @tc.name check X509Cert.match for parameter subjectAlternativeNames mismatch
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_4500", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: [
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_REGISTERED_ID,
            name: new Uint8Array([0x30, 0x82, 0x01])
          }
        ]
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_4600
     * @tc.name check X509Cert.match for parameter subjectAlternativeNames, cert has no subjectAlternativeNames
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_4600", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: [
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          }
        ]
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 1, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_4700
     * @tc.name check X509Cert.match for parameter subjectAlternativeNames empty
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_4700", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: []
      };
      try {
        pemCert1.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_4800
     * @tc.name check X509Cert.match for parameter matchAllSubjectAltNames true, and subjectAlternativeNames match
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_4800", 0, async (done: Function) => {
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
        const result = await certFunc.checkCertMatchParam(PEM, 12, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_4900
     * @tc.name check X509Cert.match for parameter matchAllSubjectAltNames true, and subjectAlternativeNames mismatch
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_4900", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectAlternativeNames: [
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_OTHER_NAME,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_RFC822_NAME,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DNS_NAME,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_X400_ADDRESS,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_DIRECTORY_NAME,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_EDI_PARTY_NAME,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_UNIFORM_RESOURCE_ID,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_IP_ADDRESS,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          },
          {
            type: cert.GeneralNameType.GENERAL_NAME_TYPE_REGISTERED_ID,
            name: new Uint8Array([0x82, 0x12, 0x77, 0x77, 0x77, 0x2E, 0x67, 0x6C, 0x6F, 0x62, 0x61, 0x6C, 0x73, 0x69,
              0x67, 0x6E, 0x2E, 0x63, 0x6F, 0x6D])
          }
        ],
        matchAllSubjectAltNames: true
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_5000
     * @tc.name check X509Cert.match for parameter matchAllSubjectAltNames false, and subjectAlternativeNames match
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_5000", 0, async (done: Function) => {
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
          }
        ],
        matchAllSubjectAltNames: false
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 12, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_5100
     * @tc.name check X509Cert.match for parameter authorityKeyIdentifier match
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_5100", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        authorityKeyIdentifier: new Uint8Array([0x30, 0x61, 0xA1, 0x49, 0xA4, 0x47, 0x30, 0x45, 0x31, 0x0B, 0x30, 0x09,
          0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x41, 0x55, 0x31, 0x13, 0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x08,
          0x0C, 0x0A, 0x53, 0x6F, 0x6D, 0x65, 0x2D, 0x53, 0x74, 0x61, 0x74, 0x65, 0x31, 0x21, 0x30, 0x1F, 0x06, 0x03,
          0x55, 0x04, 0x0A, 0x0C, 0x18, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x6E, 0x65, 0x74, 0x20, 0x57, 0x69, 0x64, 0x67,
          0x69, 0x74, 0x73, 0x20, 0x50, 0x74, 0x79, 0x20, 0x4C, 0x74, 0x64, 0x82, 0x14, 0x66, 0xC7, 0xC4, 0x0E, 0x74,
          0xDB, 0x24, 0x07, 0x83, 0x04, 0x01, 0xC4, 0x44, 0x1E, 0x71, 0x83, 0x0E, 0x22, 0x0E, 0xAB])
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 10, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_5200
     * @tc.name check X509Cert.match for parameter authorityKeyIdentifier mismatch
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_5200", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        authorityKeyIdentifier: new Uint8Array([0x30, 0x61, 0xA1, 0x49, 0xA4, 0x47, 0x30, 0x45, 0x31, 0x0B, 0x30, 0x09,
          0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x41, 0x55, 0x31, 0x13, 0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x08,
          0x0C, 0x0A, 0x53, 0x6F, 0x6D, 0x65, 0x2D, 0x53, 0x74, 0x61, 0x74, 0x65, 0x31, 0x21, 0x30, 0x1F, 0x06, 0x03,
          0x55, 0x04, 0x0A, 0x0C, 0x18, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x6E, 0x65, 0x74, 0x20, 0x57, 0x69, 0x64, 0x67,
          0x69, 0x74, 0x73, 0x20, 0x50, 0x74, 0x79, 0x20, 0x4C, 0x74, 0x64, 0x82, 0x14, 0x66, 0xC7, 0xC4, 0x0E, 0x74,
          0xDB, 0x24, 0x07, 0x83, 0x04, 0x01, 0xC4, 0x44, 0x1E, 0x71, 0x83, 0x0E, 0x22, 0x0E, 0xAB])
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_5300
     * @tc.name check X509Cert.match for parameter authorityKeyIdentifier, cert has no authorityKeyIdentifier
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_5300", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        authorityKeyIdentifier: new Uint8Array([0x30, 0x61, 0xA1, 0x49, 0xA4, 0x47, 0x30, 0x45, 0x31, 0x0B, 0x30, 0x09,
          0x06, 0x03, 0x55, 0x04, 0x06, 0x13, 0x02, 0x41, 0x55, 0x31, 0x13, 0x30, 0x11, 0x06, 0x03, 0x55, 0x04, 0x08,
          0x0C, 0x0A, 0x53, 0x6F, 0x6D, 0x65, 0x2D, 0x53, 0x74, 0x61, 0x74, 0x65, 0x31, 0x21, 0x30, 0x1F, 0x06, 0x03,
          0x55, 0x04, 0x0A, 0x0C, 0x18, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x6E, 0x65, 0x74, 0x20, 0x57, 0x69, 0x64, 0x67,
          0x69, 0x74, 0x73, 0x20, 0x50, 0x74, 0x79, 0x20, 0x4C, 0x74, 0x64, 0x82, 0x14, 0x66, 0xC7, 0xC4, 0x0E, 0x74,
          0xDB, 0x24, 0x07, 0x83, 0x04, 0x01, 0xC4, 0x44, 0x1E, 0x71, 0x83, 0x0E, 0x22, 0x0E, 0xAB])
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 1, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_5400
     * @tc.name check X509Cert.match for parameter authorityKeyIdentifier empty
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_5400", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        authorityKeyIdentifier: new Uint8Array()
      };
      try {
        pemCert1.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_5500
     * @tc.name check X509Cert.match for parameter minPathLenConstraint = 0, cert has no BaseConstraints extension
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_5500", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: 0
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 1, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_5600
     * @tc.name check X509Cert.match for parameter minPathLenConstraint = 0, and CA:true
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_5600", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: 0
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 11, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_5700
     * @tc.name check X509Cert.match for parameter minPathLenConstraint = 0
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_5700", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: 0
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 1, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_5800
     * @tc.name check X509Cert.match for parameter minPathLenConstraint = 1,  cert PathLenConstraint>1
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_5800", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: 1
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 13, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_5900
     * @tc.name check X509Cert.match for parameter minPathLenConstraint = 1,  cert PathLenConstraint<1
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_5900", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: 1
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 1, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_6000
     * @tc.name check X509Cert.match for parameter minPathLenConstraint = -2, cert match
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_6000", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: -2
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_6100
     * @tc.name check X509Cert.match for parameter minPathLenConstraint = -2, cert mismatch
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_6100", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: -2
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 11, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_6200
     * @tc.name check X509Cert.match for parameter minPathLenConstraint = -2, cert ha no BaseConstraints extension
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_6200", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: -2
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 1, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_6300
     * @tc.name check X509Cert.match for parameter minPathLenConstraint invalid
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_6300", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        minPathLenConstraint: -1
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_6400
     * @tc.name check X509Cert.match for parameter extendedKeyUsage match Signature cert
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_6400", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: CERT_DATA_PEM_PARAMETERS[1].extendedKeyUsage
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 1, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_6500
     * @tc.name check X509Cert.match for parameter extendedKeyUsage mismatch Signature cert
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_6500", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: [
          'xxxxxxxxxx'
        ]
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 1, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_6600
     * @tc.name check X509Cert.match for parameter extendedKeyUsage match Encipherment cert
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_6600", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: ['1.3.6.1.5.5.7.3.1','1.3.6.1.5.5.7.3.2']
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 12, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_6700
     * @tc.name check X509Cert.match for parameter extendedKeyUsage mismatch Encipherment cert
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_6700", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: [
          'xxxxxxxxxx'
        ]
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 12, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_6800
     * @tc.name check X509Cert.match for parameter extendedKeyUsage match Signature&Encipherment cert
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_6800", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: CERT_DATA_PEM_PARAMETERS[2].extendedKeyUsage
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_6900
     * @tc.name check X509Cert.match for parameter extendedKeyUsage mismatch Signature&Encipherment cert
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_6900", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: [
          'xxxxxxxxxx'
        ]
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_7000
     * @tc.name check X509Cert.match for parameter extendedKeyUsage, cert has no extendedKeyUsage
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_7000", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: CERT_DATA_PEM_PARAMETERS[1].extendedKeyUsage
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 6, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_7100
     * @tc.name check X509Cert.match for parameter extendedKeyUsage empty
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_7100", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        extendedKeyUsage: []
      };
      try {
        pemCert1.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_7200
     * @tc.name check X509Cert.match for parameter nameConstraints match
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_7200", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        nameConstraints: CERT_DATA_PEM_PARAMETERS[2].nameConstraints
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_7300
     * @tc.name check X509Cert.match for parameter nameConstraints mismatch
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_7300", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        nameConstraints: new Uint8Array([0x30, 0x82, 0x01])
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_7400
     * @tc.name check X509Cert.match for parameter nameConstraints, cert has no nameConstraints
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_7400", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        nameConstraints: new Uint8Array([0x30, 0x1A, 0x31, 0x18, 0x30, 0x16, 0x06, 0x03, 0x55, 0x04, 0x03, 0x0C, 0x0F,
          0x45, 0x78, 0x61, 0x6D, 0x70, 0x6C, 0x65, 0x20, 0x52, 0x6F, 0x6F, 0x74, 0x20, 0x43, 0x41])
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 5, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_7500
     * @tc.name check X509Cert.match for parameter nameConstraints empty
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_7500", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        nameConstraints: new Uint8Array()
      };
      try {
        pemCert1.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_7600
     * @tc.name check X509Cert.match for parameter certPolicy match
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_7600", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        certPolicy: ['1.3.6.1.4.1.4146.1.1']
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 12, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_7700
     * @tc.name check X509Cert.match for parameter certPolicy mismatch
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_7700", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        certPolicy: ['xxxxxxxxxx']
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_7800
     * @tc.name check X509Cert.match for parameter certPolicy, cert has no certPolicy
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_7800", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        certPolicy: CERT_DATA_PEM_PARAMETERS[1].certificatePolicies
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 2, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_7900
     * @tc.name check X509Cert.match for parameter certPolicy empty
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_7900", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        certPolicy: []
      };
      try {
        pemCert1.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_8000
     * @tc.name check X509Cert.match for parameter privateKeyValid match
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_8000", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        privateKeyValid: '241121-00:00:00Z'
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 1, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_8100
     * @tc.name check X509Cert.match for parameter privateKeyValid mismatch
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_8100", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        privateKeyValid: '291121-00:00:00Z'
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 1, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_8200
     * @tc.name check X509Cert.match for parameter privateKeyValid, cet has no privateKeyValid
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_8200", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        privateKeyValid: '241121-00:00:00Z'
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 5, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_8300
     * @tc.name check X509Cert.match for parameter privateKeyValid empty
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_8300", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        privateKeyValid: ''
      };
      try {
        pemCert1.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_8400
     * @tc.name check X509Cert.match for parameter subjectKeyIdentifier match
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_8400", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectKeyIdentifier: new Uint8Array([0x04,0x14,0xAF,0x32,0x84,0xC3,0x94,0x50,0x74,0x69,0x58,0x15,0xAC,0xD9,
          0x24,0x4B,0x54,0x12,0x99,0x87,0xF1,0xD7])
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 12, param);
        expect(result).assertTrue();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_8500
     * @tc.name check X509Cert.match for parameter subjectKeyIdentifier mismatch
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_8500", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectKeyIdentifier: new Uint8Array([0x04,0x14,0xAF,0x32,0x84,0xC3,0x94,0x50,0x74,0x69,0x58,0x15,0xAC,0xD9,
          0x24,0x4B,0x54,0x12,0x99,0x87,0xF1,0xD7])
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 3, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_8600
     * @tc.name check X509Cert.match for parameter subjectKeyIdentifier, cert has no subjectKeyIdentifier
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level1
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_8600", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectKeyIdentifier: new Uint8Array([0x04,0x14,0xAF,0x32,0x84,0xC3,0x94,0x50,0x74,0x69,0x58,0x15,0xAC,0xD9,
          0x24,0x4B,0x54,0x12,0x99,0x87,0xF1,0xD7])
      };
      try {
        const result = await certFunc.checkCertMatchParam(PEM, 5, param);
        expect(result).assertFalse();
      }
      catch (err) {
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_Security_Cert_Framework_Cert_Match_Func_8700
     * @tc.name check X509Cert.match for parameter subjectKeyIdentifier empty
     * @tc.desc The X509 Cert Format is PEM
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it("SUB_Security_Cert_Framework_Cert_Match_Func_8700", 0, async (done: Function) => {
      const param: cert.X509CertMatchParameters = {
        subjectKeyIdentifier: new Uint8Array()
      };
      try {
        pemCert1.match(param);
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(cert.CertResult.INVALID_PARAMS);
      }
      done();
    });
  });
}
