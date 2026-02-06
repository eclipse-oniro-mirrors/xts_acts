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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function uiScrollEvent() {
  describe('uiScrollEvent', () => {
    beforeEach(async (done: Function) => {
      console.info("uiScrollEvent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/uiScrollEvent",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get uiScrollEvent state pages:" + JSON.stringify(pages));
        if (!("uiScrollEvent" == pages.name)) {
          console.info("get uiScrollEvent pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push uiScrollEvent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push uiScrollEvent page error:" + err);
      }
      console.info("uiScrollEvent beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("uiScrollEvent after each called");
    });

    /**
     * @tc.name   uiScrollEvent_0100
     * @tc.number uiScrollEvent_001
     * @tc.desc   Monitor the start and end of scrolling events.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('uiScrollEvent_0100', Level.LEVEL0, async (done: Function) => {
      console.info('uiScrollEvent_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('scrollEvent_uiId_on'));
      await btn.click();
      console.log('uiScrollEvent_0100 000')
      await CommonFunc.sleep(1000);
      let swipeAnimation = CommonFunc.getComponentRectOnScreen('testId_uiScroll');
      let top = swipeAnimation.top;
      let right = swipeAnimation.right;
      let left = swipeAnimation.left;
      let bottom = swipeAnimation.bottom;
      console.info("uiScrollEvent_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.2),Math.round(bottom - height/5),Math.round(left + width*0.2),Math.round(bottom - height/2));
      await CommonFunc.sleep(3000);
      let strJson = getInspectorByKey('scrollEvent_ui2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[uiScrollEvent_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('message2:scrollEvent');
      let btn1: Component = await driver.findComponent(ON.id('scrollEvent_uiId_off'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      console.info('[uiScrollEvent_0100] END');
      done();
    });
  })
}
