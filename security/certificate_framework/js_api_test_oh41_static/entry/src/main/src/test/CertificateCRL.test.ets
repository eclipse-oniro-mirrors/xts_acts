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
import * as certPromise from "./utils/certificate/publicCertificatePromise";
import * as certCallback from "./utils/certificate/publicCertificateCallback";

export default function certificateCRLJsunit() {
  describe('certificateCRLJsunit', () => {
    console.info("##########start certificateCRLJsunit##########");
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_0100
     * @tc.number Security_Cert_Framework_CRL_Func_0100
     * @tc.desc   The X509 certificate FORMAT is FORMAT_DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.createX509CRLInstancePromise("der")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_0200
     * @tc.number Security_Cert_Framework_CRL_Func_0200
     * @tc.desc   The X509 certificate FORMAT is FORMAT_DER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.createX509CRLInstanceCallback("der")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_0300
     * @tc.number Security_Cert_Framework_CRL_Func_0300
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.createX509CRLInstancePromise("pem")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_0400
     * @tc.number Security_Cert_Framework_CRL_Func_0400
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.createX509CRLInstanceCallback("pem")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_0500
     * @tc.number Security_Cert_Framework_CRL_Func_0500
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let crlInstance:cert.X509CRL = await certPromise.createX509CRLInstancePromise("pem")
        certPromise.checkIsRevokedX509CRLPromise(crlInstance, "normal");
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_0600
     * @tc.number Security_Cert_Framework_CRL_Func_0600
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let crlInstance:cert.X509CRL = await certPromise.createX509CRLInstancePromise("pem")
        certPromise.checkIsRevokedX509CRLPromise(crlInstance, "error");
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_0700
     * @tc.number Security_Cert_Framework_CRL_Func_0700
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CRLInfoPromise("pem", "getType")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_0800
     * @tc.number Security_Cert_Framework_CRL_Func_0800
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.checkGetEncodedX509CRLPromise("pem")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_0900
     * @tc.number Security_Cert_Framework_CRL_Func_0900
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.checkGetEncodedX509CRLCallback("pem")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_1000
     * @tc.number Security_Cert_Framework_CRL_Func_1000
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM, Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CRLInfoPromise("pem", "getVersion")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_1100
     * @tc.number Security_Cert_Framework_CRL_Func_1100
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM, Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CRLInfoPromise("pem", "getIssuerName")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_1200
     * @tc.number Security_Cert_Framework_CRL_Func_1200
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM, Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CRLInfoPromise("pem", "getLastUpdate")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_1300
     * @tc.number Security_Cert_Framework_CRL_Func_1300
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM,Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CRLInfoPromise("pem", "getNextUpdate")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_1400
     * @tc.number Security_Cert_Framework_CRL_Func_1400
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.checkGetRevokedCertX509CRLCallback("pem")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_1500
     * @tc.number Security_Cert_Framework_CRL_Func_1500
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM, Use the Promise Style of Interface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let crlInstance: cert.X509CRL = await certPromise.createX509CRLInstancePromise("pem")
        let result: cert.X509CRLEntry = await certPromise.checkGetRevokedCertWithCertX509CRLPromise(crlInstance, "normal");
        expect(result != null).assertTrue();
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_1600
     * @tc.number Security_Cert_Framework_CRL_Func_1600
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.checkGetRevokedCertsX509CRLPromise("pem")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_1700
     * @tc.number Security_Cert_Framework_CRL_Func_1700
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.checkGetRevokedCertsX509CRLCallback("pem")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_1800
     * @tc.number Security_Cert_Framework_CRL_Func_1800
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CRLInfoPromise("pem", "getTbsInfo")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_1900
     * @tc.number Security_Cert_Framework_CRL_Func_1900
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CRLInfoPromise("pem", "getSignature")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_2000
     * @tc.number Security_Cert_Framework_CRL_Func_2000
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CRLInfoPromise("pem", "getSignatureAlgName")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_2100
     * @tc.number Security_Cert_Framework_CRL_Func_2100
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CRLInfoPromise("pem", "getSignatureAlgOid")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_2200
     * @tc.number Security_Cert_Framework_CRL_Func_2200
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.getX509CRLInfoPromise("pem", "getSignatureAlgParams")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_2300
     * @tc.number Security_Cert_Framework_CRL_Func_2300
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.checkGetRevokedCertX509CRLCallback("pem")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_2400
     * @tc.number Security_Cert_Framework_CRL_Func_2400
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.verifyX509CRLPromise("pem")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_2600
     * @tc.number Security_Cert_Framework_CRL_Func_2600
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certPromise.verifyX509CRLPromise("der", "NULL")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code == 401).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_2700
     * @tc.number Security_Cert_Framework_CRL_Func_2700
     * @tc.desc   The X509 CRL FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.verifyX509CRLCallback("der", "000")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(error.code == 401).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_2800
     * @tc.number Security_Cert_Framework_CRL_Func_2800
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.checkX509CRLEntryGetSerialNumberCallback("pem")
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
    /**
     * @tc.name   Security_Cert_Framework_CRL_Func_2900
     * @tc.number Security_Cert_Framework_CRL_Func_2900
     * @tc.desc   The X509 certificate FORMAT is FORMAT_PEM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("Security_Cert_Framework_CRL_Func_2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await certCallback.checkX509CRLGetRevokedCertCallback()
      } catch (error: BusinessError) {
        console.error(`“${error}“, error code: ${error.code}`);
        expect(null).assertFail();
      }
      done();
    });
  });
}