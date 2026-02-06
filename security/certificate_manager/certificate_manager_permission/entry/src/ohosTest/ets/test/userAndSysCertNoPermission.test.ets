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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import certManager from '@ohos.security.certManager';

export default function userAndSysCertNoPermissionJsTestUnit() {
  describe('userAndSysCertNoPermissionJsTestUnit', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_0500
     * @tc.name test getAllUserTrustedCertificates with no ohos.permission.ACCESS_CERT_MANAGER
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await certManager.getAllUserTrustedCertificates();
        expect(null).assertFail();
      } catch (err) {
        console.error(`SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_0500 get error: ${err.code}`);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_NO_PERMISSION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_0600
     * @tc.name test getUserTrustedCertificate with no ohos.permission.ACCESS_CERT_MANAGER
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await certManager.getUserTrustedCertificate("aabbcc");
        expect(null).assertFail();
      } catch (err) {
        console.error(`SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_0600 get error: ${err.code}`);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_NO_PERMISSION);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_SysCertJsApi_NoPermission_Func_0200
     * @tc.name Test getAllSystemAPPCertificates with no ohos.permission.ACCESS_CERT_MANAGER
     * @tc.desc Use Promise Type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_SysCertJsApi_NoPermission_Func_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await certManager.getAllSystemAppCertificates();
        expect(null).assertFail();
      } catch (err) {
        console.error(`SUB_Security_CertManager_SysCertJsApi_NoPermission_Func_0200 get error: ${err.code}`);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_NO_PERMISSION);
      }
      done();
    });
  })
}