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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import certManager from '@ohos.security.certManager';
import { BusinessError } from '@ohos.base';

export default function pubCertJsAPINoPermissionTestUnit() {
  describe('pubCertJsAPINoPermissionTestUnit', () => {

    /**
     * @tc.number SUB_Security_CertManager_PubCertJsApi_NoPermission_Func_0100
     * @tc.name test getPublicCertificate interface permission
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_PubCertJsApi_NoPermission_Func_0100', 0, async (done: Function) => {
      let keyUri: string = 'aabb';
      certManager.getPublicCertificate(keyUri).then((data) => {
        expect(null).assertFail();
        done();
      }).catch((err: BusinessError) => {
        console.error("[Promise]getPublicCertificate err: " + JSON.stringify(err));
        expect(err.code == certManager.CMErrorCode.CM_ERROR_NO_PERMISSION).assertTrue();
        done();
      });
    });

    /**
     * @tc.number SUB_Security_CertManager_PubCertJsApi_NoPermission_Func_0200
     * @tc.name test isAuthorizedApp interface permission
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_PubCertJsApi_NoPermission_Func_0200', 0, async (done: Function) => {
      let keyUri: string = 'aabb';
      certManager.isAuthorizedApp(keyUri).then((data) => {
        expect(null).assertFail();
        done();
      }).catch((err: BusinessError) => {
        console.error("[Promise]isAuthorizedApp err: " + JSON.stringify(err));
        expect(err.code == certManager.CMErrorCode.CM_ERROR_NO_PERMISSION).assertTrue();
        done();
      });
    });
  })
}