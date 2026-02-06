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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function setListEvent() {
  describe('setListEvent', () => {
    beforeEach(async (done: Function) => {
      console.info("setListEvent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/setListEvent",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setListEvent state pages:" + JSON.stringify(pages));
        if (!("setListEvent" == pages.name)) {
          console.info("get setListEvent pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push setListEvent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setListEvent page error:" + err);
      }
      console.info("setListEvent beforeEach end");
      done();
    });

    /**
     * @tc.name   setListEvent_0100
     * @tc.number setListEvent_001
     * @tc.desc   Set scrolling events for the List component.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setListEvent_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[setListEvent_0100] START');
      let driver = await Driver.create()
      let btnEvent: Component = await driver.findComponent(ON.id('List_addCommonEvent_02'));
      await btnEvent.click();
      await CommonFunc.sleep(1500);

      let swipeScroll = CommonFunc.getComponentRectOnScreen('key_listItem_set');
      let top = swipeScroll.top;
      let right = swipeScroll.right;
      let left = swipeScroll.left;
      let bottom = swipeScroll.bottom;
      console.info("setListEvent_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.8),Math.round(left + width/2),Math.round(top + height*0.2));
      await CommonFunc.sleep(2000);
      let btn: Component = await driver.findComponent(ON.id('List_setOnReach_02'));
      await btn.click();
      await CommonFunc.sleep(1500);

      let btn1: Component = await driver.findComponent(ON.id('List_setOnWill_02'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('List_setOnWill_02');
      console.info("[setListEvent_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('setOnWillScroll_setOnDidScroll');

      let btn2: Component = await driver.findComponent(ON.id('List_setOnScroll_02'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      let strJson2 = getInspectorByKey('List_setOnScroll_02');
      console.info("[setListEvent_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('setOnScrollStart_setOnScrollStop');

      let btn3: Component = await driver.findComponent(ON.id('List_setOnScrollIndex_02'));
      await btn3.click();
      await CommonFunc.sleep(1500);
      let strJson3 = getInspectorByKey('List_setOnScrollIndex_02');
      console.info("[setListEvent_0100] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('setOnScrollFrameBegin_setOnScrollIndex');

      let btn4: Component = await driver.findComponent(ON.id('Scroll_VisibleChange_02'));
      await btn4.click();
      await CommonFunc.sleep(1500);
      let strJson4 = getInspectorByKey('Scroll_VisibleChange_02');
      console.info("[setListEvent_0100] content4: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('setOnScrollVisibleContentChange');
      console.info('[setListEvent_0100] END');
      done();
    });
  })
}
