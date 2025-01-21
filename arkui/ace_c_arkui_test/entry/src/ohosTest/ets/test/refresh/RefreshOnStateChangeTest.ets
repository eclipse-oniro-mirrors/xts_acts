/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver } from '@ohos.UiTest';

export default function refreshOnStateChangeTest() {

  describe('RefreshOnStateChangeTest', () => {

    /*
     * @tc.number: SUB_ARKUI_CAPI_REFRESH_ONSTATECHANGE_0100
     * @tc.name: testRefreshOnStateChange001
     * @tc.desc: testing onStateChange for Refresh with red value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRefreshOnStateChange001', 0, async (done: Function) => {
      let PAGE_TAG = 'RefreshOnStateChangeTest';
      await Utils.pushPage(`refresh/${PAGE_TAG}`);
      await Utils.sleep(2000)
      let driver = Driver.create();
      await driver.swipe(200, 350, 200, 400);
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('RefreshOnStateChange').$attrs.backgroundColor).assertEqual('#FFFFFF00');
      done();
    })
  })
}
