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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver } from '@ohos.UiTest';

export default function refreshOffsetEventTest() {

  describe('RefreshOffsetEventTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_REFRESH_REFRESHOFFSET_0500
     * @tc.name: testRefreshOffset005
     * @tc.desc: testing Offset for Refresh with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRefreshOffset005', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'RefreshLessOffsetTest';
      await Utils.pushPage(`refresh/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create();
      let rect = Utils.getComponentRect("RefreshOffsetChangeLessThanOffset");
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("RefreshLessOffsetTest  x= " +  x  + ", y = " + y);
      await driver.swipe(Math.round(x - vp2px(30)), Math.round(y - vp2px(100)), Math.round(x + vp2px(30)), Math.round(y + vp2px(90)));
      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('RefreshOffsetChangeLessThanOffset').$attrs.backgroundColor).assertEqual('#FF0000FF');
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_REFRESH_REFRESHOFFSET_0600
     * @tc.name: testRefreshOffset006
     * @tc.desc: testing Offset for Refresh with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testRefreshOffset006', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'RefreshOverOffsetTest';
      await Utils.pushPage(`refresh/${PAGE_TAG}`);
      await Utils.sleep(1000)
      let driver = Driver.create();
      let rect = Utils.getComponentRect("RefreshOffsetChangeBigThanOffset");
      let x = Math.round(globalThis.winLeft + Utils.getRectHorizontalCenterX(rect));
      let y = Math.round(globalThis.winTop + Utils.getRectVerticalCenterY(rect));
      console.info("RefreshOverOffsetTest  x= " +  x  + ", y = " + y);
      await driver.swipe(Math.round(x - vp2px(30)), Math.round(y - vp2px(100)), Math.round(x + vp2px(30)), Math.round(y + vp2px(130)));

      await Utils.sleep(2000);
      expect(Utils.getComponentInfoByKey('RefreshOffsetChangeBigThanOffset').$attrs.backgroundColor).assertEqual('#FFFFFF00');
      done();
    })
  })
}
