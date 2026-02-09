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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import certManager from '@ohos.security.certManager';
import hilog from '@ohos.hilog';
let domain: int = 0x0000;
let tag: string = 'testTag';

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
     * @tc.name   SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_static_0500
     * @tc.number SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_static_0500
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await certManager.getAllUserTrustedCertificates();
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_static_0500 get error: ${err.code}`);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_NO_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_static_0600
     * @tc.number SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_static_0600
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await certManager.getUserTrustedCertificate("aabbcc");
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_UserCertJsApi_NoPermission_Func_static_0600 get error: ${err.code}`);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_NO_PERMISSION);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SysCertJsApi_NoPermission_Func_static_0200
     * @tc.number SUB_Security_CertManager_SysCertJsApi_NoPermission_Func_static_0200
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_SysCertJsApi_NoPermission_Func_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        await certManager.getAllSystemAppCertificates();
        expect(null).assertFail();
      } catch (err) {
        err = err as BusinessError;
        hilog.error(domain, tag, '%{public}s', `SUB_Security_CertManager_SysCertJsApi_NoPermission_Func_static_0200 get error: ${err.code}`);
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_NO_PERMISSION);
      }
      done();
    });
  })
}