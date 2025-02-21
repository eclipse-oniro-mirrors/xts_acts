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

export default function certManagerPubCertJsAPIFunctionTestUnit() {
  describe('certManagerPubCertJsAPIFunctionTestUnit', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    });
    afterEach(() => {
    });
    afterAll(async () => {
    });

    /**
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0400
     * @tc.name test getPublicCertificate with parameter keyUri empty
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0400', 0, async (done: Function) => {
      try {
        await certManager.getPublicCertificate('');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0500
     * @tc.name test getPublicCertificate with parameter keyUri invalid
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0500', 0, async (done: Function) => {
      try {
        await certManager.getPublicCertificate('aabb');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_0900
     * @tc.name test isAuthorizedApp with parameter keyUri empty
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_0900', 0, async (done: Function) => {
      try {
        await certManager.isAuthorizedApp('');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.number SUB_Security_CertManager_PubCertJsApi_Func_1000
     * @tc.name test isAuthorizedApp with parameter keyUri invalid
     * @tc.desc use promise type
     * @tc.size SmallTest
     * @tc.level Level2
     * @tc.type Function
     */
    it('SUB_Security_CertManager_PubCertJsApi_Func_1000', 0, async (done: Function) => {
      try {
        await certManager.isAuthorizedApp('aabb');
        expect(null).assertFail();
      }
      catch (err) {
        expect(err.code).assertEqual(401);
      }
      done();
    });
  })
}