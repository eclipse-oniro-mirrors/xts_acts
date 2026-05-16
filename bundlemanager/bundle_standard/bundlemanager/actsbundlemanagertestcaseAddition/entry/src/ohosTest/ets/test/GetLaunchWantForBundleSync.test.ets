/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import bundleManager from '@ohos.bundle.bundleManager';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,Size, Level, TestType } from '@ohos/hypium';
import hilog from '@ohos.hilog';

const TAG = 'GetLaunchWantForBundleSync ErrcodeTest';

export default function testGetLaunchWantForBundleSync() {
  describe('testGetLaunchWantForBundleSync', () => {
    /**
     * @tc.name testGetLaunchWantForBundleSyncUnPermission
     * @tc.number Sub_Bms_Framework_Query_AbilityInfo_7280
     * @tc.desc test getLaunchWantForBundleSync without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGetLaunchWantForBundleSyncUnPermission', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) =>  {
      console.info(TAG + "test case start");
      try {
        bundleManager.getLaunchWantForBundleSync("ohos.acts.bundlemanagererrcode.test");
        expect().assertFail();
        console.info(TAG + 'test case end')
        done();
      } catch (err) {
        expect(err.code).assertEqual(201);
        expect(err.message).assertEqual("BusinessError 201: Permission denied. An attempt was made to GetLaunchWantForBundleSync forbidden by permission: ohos.permission.GET_BUNDLE_INFO_PRIVILEGED or (ohos.permission.GET_BUNDLE_INFO_PRIVILEGED and ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS).");
        console.info(TAG + 'test case end')
        done();
      }
    });
  });
}
