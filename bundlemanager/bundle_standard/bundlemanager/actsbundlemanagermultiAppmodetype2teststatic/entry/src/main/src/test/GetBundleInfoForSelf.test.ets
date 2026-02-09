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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import bundle from '@ohos.bundle.bundleManager';
import { BundleInfo } from 'bundleManager.BundleInfo';


let domain: int = 0x0000;
let tag: string = 'testTag';

export default function getBundleInfoForSelf() {
  describe('getBundleInfoForSelf', (): void => {

    /**
     * @tc.name   Test_MultiAppModeType_0100
     * @tc.number Test_MultiAppModeType_0100
     * @tc.desc   Test MultiAppModeType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Test_MultiAppModeType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'Test_MultiAppModeType_0100  ====> start');
        await bundle.getBundleInfoForSelf(bundle.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION |
        bundle.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE).then((data: BundleInfo) => {
          expect(data?.appInfo?.multiAppMode?.multiAppModeType).assertEqual(bundle.MultiAppModeType.MULTI_INSTANCE);
          hilog.info(domain, tag, 'Test_MultiAppModeType_0100  ====> end');
          done();
        }).catch(err => {
          hilog.info(domain, tag, 'Test_MultiAppModeType_0100  ====> err');
          expect(err).assertFail();
          done();
        })
      })












  })
}

