/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bundleManager from '@ohos.bundle.bundleManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';

export default function getSignatureInfo() {
  describe('getSignatureInfo', () => {
    /**
     * @tc.name   Sub_Bms_Framework_getSignatureInfo04
     * @tc.number Sub_Bms_Framework_getSignatureInfo04
     * @tc.desc   Test getSignatureInfo with error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Sub_Bms_Framework_getSignatureInfo04', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
      bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_METADATA
      bundleManager.getBundleInfoForSelf(bundleFlags).then((data) => {
        let datas = bundleManager.getSignatureInfo(data.appInfo.uid);
        expect().assertFail();
      }).catch((err: BusinessError) => {
        expect(err.code).assertEqual(201);
        done();
      });
    })
  })
}