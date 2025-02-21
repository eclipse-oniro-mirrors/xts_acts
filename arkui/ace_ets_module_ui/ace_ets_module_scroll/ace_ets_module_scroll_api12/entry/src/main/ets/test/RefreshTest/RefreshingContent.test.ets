/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';

export default function RefreshingContent() {
  describe('RefreshingContent', () => {
    beforeEach(async (done: Function) => {
      console.info("RefreshingContent beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/RefreshingContent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RefreshingContent state pages: " + JSON.stringify(pages));
        if (!("RefreshingContent" == pages.name)) {
          console.info("get RefreshingContent state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RefreshingContent success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RefreshingContent page error: " + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info(" RefreshingContent after each called");
    });

    /* *
    * @tc.number: RefreshingContent_0100
    * @tc.name  : RefreshingContent_0100
    * @tc.desc  : RefreshingContent_test
    * @tc.level : Level 2
    * @tc.type :
    * @tc.size :
    */
    it('RefreshingContent_0100', 0, async (done: Function) => {
      console.info('RefreshingContent_0100 START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let swiperOffset = CommonFunc.getComponentRectOnScreen('refresh_content');
      let top = swiperOffset.top;
      let right = swiperOffset.right;
      let left = swiperOffset.left;
      let bottom = swiperOffset.bottom;
      console.info("RefreshingContent_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.2),Math.round(top + height/10),Math.round(left + width*0.2),Math.round(bottom - height/10));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('RefreshingContent');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[scrollRefreshingContent_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('onRefreshing test');
      console.info('[RefreshingContent_0100] END');
      done();
    });
  })
}