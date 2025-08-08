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

import { describe, it, expect, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver } from '@ohos.UiTest';

export default function refreshOnOffsetChangeTest() {

  describe('RefreshOnOffsetChangeTest', () => {

    /*
     * @tc.number: SUB_ARKUI_CAPI_REFRESH_ON_OFFSET_CHANGE_0100
     * @tc.name: testRefreshOnOffsetChange001
     * @tc.desc: testing onOffsetChange for Refresh with red value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRefreshOnOffsetChange001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'RefreshOnOffsetChangeTest';
      await Utils.pushPage(`refresh/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create();
      
      let rect = Utils.getComponentRect("RefreshOnOffsetChange");
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("RefreshOnOffsetChangeTest  x= " +  x  + ", y = " + y);
      await driver.swipe(Math.round(x - vp2px(30)), Math.round(y - vp2px(100)), Math.round(x + vp2px(30)), Math.round(y + vp2px(130)));
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('RefreshOnOffsetChange').$attrs.backgroundColor).assertEqual('#FFFFFF00');
      done();
    })
  })
}
