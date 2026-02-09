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

export default function scrollDraggingFling() {
  describe('scrollDraggingFling', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollDraggingFling beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Scroll/scrollDraggingFling",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollDraggingFling state pages:" + JSON.stringify(pages));
        if (!("scrollDraggingFling" == pages.name)) {
          console.info("get scrollDraggingFling pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollDraggingFling page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollDraggingFling page error:" + err);
      }
      console.info("scrollDraggingFling beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btnEvent: Component = await driver.findComponent(ON.id('scroll_dragging_reset'));
      await btnEvent.click();
      await CommonFunc.sleep(1500);
      console.info("scrollDraggingFling after each called");
    });

    /**
     * @tc.name   scrollDraggingFling_0100
     * @tc.number scrollDraggingFling_001
     * @tc.desc   Callback triggered when the component scrolls using the mouse wheel.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scrollDraggingFling_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[scrollDraggingFling_0100] START');
      let driver = await Driver.create()
      let dragScroll = CommonFunc.getComponentRectOnScreen('scroll_dragging_fling');
      let top = dragScroll.top;
      let right = dragScroll.right;
      let left = dragScroll.left;
      let bottom = dragScroll.bottom;
      console.info("scrollDraggingFling_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.mouseScroll({x:Math.round(left + width/2), y:Math.round(top + height*0.4)}, true, 2);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('scroll_startDragging');
      console.info("[scrollDraggingFling_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onWillStartDragging');

      let strJson2 = getInspectorByKey('scroll_stopDragging');
      console.info("[scrollDraggingFling_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onDidStopDragging willFling: false');

      let strJson3 = getInspectorByKey('scroll_startFling');
      console.info("[scrollDraggingFling_0100] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('start');

      let strJson4 = getInspectorByKey('scroll_stopFling');
      console.info("[scrollDraggingFling_0100] content4: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('start');
      console.info('[scrollDraggingFling_0100] END');
      done();
    });

    /**
     * @tc.name   scrollDraggingFling_0200
     * @tc.number scrollDraggingFling_002
     * @tc.desc   The callback triggered when the scrolling component slides.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('scrollDraggingFling_0200', Level.LEVEL2, async (done: Function) => {
      console.info('[scrollDraggingFling_0200] START');
      let driver = await Driver.create()
      let dragScroll = CommonFunc.getComponentRectOnScreen('scroll_dragging_fling');
      let top = dragScroll.top;
      let right = dragScroll.right;
      let left = dragScroll.left;
      let bottom = dragScroll.bottom;
      console.info("scrollDraggingFling_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.8),Math.round(left + width/2),Math.round(top + height*0.2),1000);
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('scroll_startDragging');
      console.info("[scrollDraggingFling_0200] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onWillStartDragging');

      let strJson2 = getInspectorByKey('scroll_stopDragging');
      console.info("[scrollDraggingFling_0200] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onDidStopDragging willFling: true');

      let strJson3 = getInspectorByKey('scroll_startFling');
      console.info("[scrollDraggingFling_0200] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('onWillStartFling');

      let strJson4 = getInspectorByKey('scroll_stopFling');
      console.info("[scrollDraggingFling_0200] content4: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('onDidStopFling');
      console.info('[scrollDraggingFling_0200] END');
      done();
    });
  })
}
