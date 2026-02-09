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

export default function userCertJsAPIFunctionTestUnit() {
  describe('userCertJsAPIFunctionTestUnit', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(async () => {
    });

    /**
     * @tc.name   SUB_Security_CertManager_UserCertJsApi_getAllUserTrustedCertificates_Func_0300
     * @tc.number SUB_Security_CertManager_UserCertJsApi_getAllUserTrustedCertificates_Func_0300
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_UserCertJsApi_getAllUserTrustedCertificates_Func_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let result: certManager.CMResult = await certManager.getAllUserTrustedCertificates();
        console.log(`SUB_Security_CertManager_UserCertJsApi_getAllUserTrustedCertificates_Func_0300 result is: ${result}`)
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.log(`SUB_Security_CertManager_UserCertJsApi_getAllUserTrustedCertificates_Func_0300 get error is: ${err.code}`)
        expect(null).assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_UserCertJsApi_getUserTrustedCertificate_Func_0401
     * @tc.number SUB_Security_CertManager_UserCertJsApi_getUserTrustedCertificate_Func_0401
     * @tc.desc   use promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_UserCertJsApi_getUserTrustedCertificate_Func_0401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await certManager.getUserTrustedCertificate("");
        expect(null).assertFail();
      } catch (err) {
        console.error(`SUB_Security_CertManager_UserCertJsApi_getUserTrustedCertificate_Func_0401 get error is: ${err.code}`)
        expect(err.code).assertEqual(certManager.CMErrorCode.CM_ERROR_INVALID_PARAMS);
      }
      done();
    });

    /**
     * @tc.name   SUB_Security_CertManager_SysCertJsApi_Func_0900
     * @tc.number SUB_Security_CertManager_SysCertJsApi_Func_0900
     * @tc.desc   Use Promise Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_Security_CertManager_SysCertJsApi_Func_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let result: certManager.CMResult = await certManager.getAllSystemAppCertificates();
        console.log(`SUB_Security_CertManager_SysCertJsApi_Func_0900 result is: ${result}`)
        expect(result).assertEqual(undefined);
      } catch (err) {
        console.error(`SUB_Security_CertManager_SysCertJsApi_Func_0900 get error is: ${err.code}`)
        expect(null).assertFail();
      }
      done();
    });
  })
}