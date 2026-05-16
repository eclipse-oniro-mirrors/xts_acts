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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import certManager from '@ohos.security.certManager';

export default function certManagerNotSystemAPPTestUnit() {
  describe('certManagerNotSystemAPPTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   Security_CertManager_NotSystemApp_Func_0100
     * @tc.number Security_CertManager_NotSystemApp_Func_0100
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Security_CertManager_NotSystemApp_Func_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await certManager.getAllAppPrivateCertificates();
        expect(null).assertFail();
      } catch (err) {
        console.error(`Security_CertManager_NotSystemApp_Func_0100 get error1: ${err.code}`);
        expect(err.code).assertEqual(202);
      }
      done();
    })

    /**
     * @tc.name   Security_CertManager_NotSystemApp_Func_0200
     * @tc.number Security_CertManager_NotSystemApp_Func_0200
     * @tc.desc   use asynccallback type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('Security_CertManager_NotSystemApp_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let result: certManager.CMResult = await new Promise((resolve, reject) => {
          certManager.getAllAppPrivateCertificates((err, cmResult) => {
            if (err) {
              console.error(`Security_CertManager_NotSystemApp_Func_0200 get error1: ${err.code}`);
              reject(err);
            } else {
              resolve(cmResult);
            }
          });
        })
        expect(null).assertFail();
      } catch (err) {
        expect(err.code).assertEqual(202);
      }
      done();
    })

    /**
     * @tc.name   SUB_Security_CertManager_SysCertJsApi_NotSystemApp_Func_0200
     * @tc.number SUB_Security_CertManager_SysCertJsApi_NotSystemApp_Func_0200
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Security_CertManager_SysCertJsApi_NotSystemApp_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        await certManager.getAllSystemAppCertificates();
        expect(null).assertFail();
      } catch (err) {
        console.error(`SUB_Security_CertManager_SysCertJsApi_NotSystemApp_Func_0200 get error: ${err.code}`);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_NOT_SYSTEM_APP);
      }
      done();
    });
  })
}

