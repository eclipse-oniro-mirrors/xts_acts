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
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
export default function observerScrollTest() {
  describe('observerScrollTest', () => {
    beforeEach(async (done: Function) => {
      console.info("observerScrollTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/observer/observerScroll',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get observerScrollTest state pages: " + JSON.stringify(pages));
        if (!("observerScroll" == pages.name)) {
          console.info("get observerScrollTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push observerScrollTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push observerScrollTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.number    ListScroll
     * @tc.name      observerScrollTest_0100
     * @tc.desc      api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('observerScrollTest_0100', 0, async (done: Function) => {
      console.info('observerScrollTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('scrollEvent_3'));
      await btn.click();
      console.log('observerScrollTest_0100 000')
      await CommonFunc.sleep(1000);
      let swiperAnimation = CommonFunc.getComponentRectOnScreen('scrollEvent_4');
      let top = swiperAnimation.top;
      let right = swiperAnimation.right;
      let left = swiperAnimation.left;
      let bottom = swiperAnimation.bottom;
      console.info("observerScrollTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.2),Math.round(bottom - height/4),Math.round(left + width*0.2),Math.round(bottom - height/2));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('scrollEvent_1');
      let strJson1 = getInspectorByKey('scrollEvent_2');
      let obj: ESObject = JSON.parse(strJson);
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[observerScrollTest_0100] component obj is: " + JSON.stringify(obj));
      console.info("[observerScrollTest_0100] component obj1 is: " + JSON.stringify(obj1));
      expect(obj.$attrs.content).assertEqual('message1:SCROLL_START');
      expect(obj1.$attrs.content).assertEqual('message2:SCROLL_STOP');
      let btn1: Component = await driver.findComponent(ON.id('scrollEvent_5'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      console.info('[observerScrollTest_0100] END');
      done();
    });
  })
}

