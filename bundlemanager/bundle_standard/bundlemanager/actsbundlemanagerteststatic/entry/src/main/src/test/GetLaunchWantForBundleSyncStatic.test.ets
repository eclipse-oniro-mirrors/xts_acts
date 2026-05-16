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

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import bundleManager from '@ohos.bundle.bundleManager';
import { BusinessError } from '@ohos.base';

const TAG = 'testTag';
const TEST_SUITE_NAME = "testGetLaunchWantForBundleSyncStatic"

export default function GetLaunchWantForBundleSyncStatic() {
  describe('testGetLaunchWantForBundleSyncStatic', (): void => {
    /**
     * @tc.name   GetLaunchWantForBundleSyncStatic_0600
     * @tc.number GetLaunchWantForBundleSyncStatic_0600
     * @tc.desc   Test getLaunchWantForBundleSync without permission
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GetLaunchWantForBundleSyncStatic_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: () => void): Promise<void> => {
      const TEST_CASE_NAME = 'GetLaunchWantForBundleSyncStatic_0600';
      console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case start');
      try {
        let res = bundleManager.getLaunchWantForBundleSync('ohos.acts.bundle.test.static');
        expect().assertFail();
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      } catch (err) {
        err = err as BusinessError;
        console.error(TAG + `GetLaunchWantForBundleSyncStatic_0100 catch failed: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(201);
        expect(err.message).assertEqual("BusinessError 201: Permission denied. An attempt was made to GetLaunchWantForBundleSync forbidden by permission: ohos.permission.GET_BUNDLE_INFO_PRIVILEGED or (ohos.permission.GET_BUNDLE_INFO_PRIVILEGED and ohos.permission.INTERACT_ACROSS_LOCAL_ACCOUNTS).");
        console.info(TAG + `${TEST_SUITE_NAME}#${TEST_CASE_NAME}` + 'test case end');
        done();
      }
    });

  });
}