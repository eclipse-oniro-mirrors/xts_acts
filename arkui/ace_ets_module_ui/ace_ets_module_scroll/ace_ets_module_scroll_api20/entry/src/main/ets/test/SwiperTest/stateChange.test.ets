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
import events_emitter from '@ohos.events.emitter';

export default function stateChange() {
  describe('stateChange', () => {
    beforeEach(async (done: Function) => {
      console.info("stateChange beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/stateChange",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get stateChange state pages:" + JSON.stringify(pages));
        if (!("stateChange" == pages.name)) {
          console.info("get stateChange pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push stateChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stateChange page error:" + err);
      }
      console.info("stateChange beforeEach end");
      done();
    });

    /**
     * @tc.number    stateChange_001
     * @tc.name      stateChange_0100
     * @tc.desc      Trigger Swiper onScrollStateChanged event callback when following hand sliding changes.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('stateChange_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[stateChange_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let swipeRect = CommonFunc.getComponentRectOnScreen('swiper_stateChange');
      let top = swipeRect.top;
      let right = swipeRect.right;
      let left = swipeRect.left;
      let bottom = swipeRect.bottom;
      console.info("stateChange_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('stateChange_test');
      console.info("[stateChange_0100] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[stateChange_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("scrollState: 120");
      await CommonFunc.sleep(1000);

      let btnReset: Component = await driver.findComponent(ON.id('stateChange_reset'));
      await btnReset.click();
      await CommonFunc.sleep(1500);
      console.info('[stateChange_0100] END');
      done();
    });

    /**
     * @tc.number    stateChange_002
     * @tc.name      stateChange_0200
     * @tc.desc      Flipping to the next page triggers Swiper onScrollStateChanged event callback.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('stateChange_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[stateChange_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_next = await driver.findComponent(ON.id('stateChange_showNext'));
      await btn_next.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('stateChange_test');
      console.info("[stateChange_0200] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[stateChange_0200] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("scrollState: 20");
      await CommonFunc.sleep(1000);

      let btnReset: Component = await driver.findComponent(ON.id('stateChange_reset'));
      await btnReset.click();
      await CommonFunc.sleep(1500);
      console.info('[stateChange_0200] END');
      done();
    });

    /**
     * @tc.number    stateChange_003
     * @tc.name      stateChange_0300
     * @tc.desc      Flipping to the previous page triggers Swiper onScrollStateChanged event callback.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('stateChange_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[stateChange_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_next = await driver.findComponent(ON.id('stateChange_showPrevious'));
      await btn_next.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('stateChange_test');
      console.info("[stateChange_0300] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[stateChange_0300] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("scrollState: 20");
      await CommonFunc.sleep(1000);

      let btnReset: Component = await driver.findComponent(ON.id('stateChange_reset'));
      await btnReset.click();
      await CommonFunc.sleep(1500);
      console.info('[stateChange_0300] END');
      done();
    });

    /**
     * @tc.number    stateChange_004
     * @tc.name      stateChange_0400
     * @tc.desc      Flipping to a specified page with animation and trigger the Swiper onScrollStateChanged event.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('stateChange_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[stateChange_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_next = await driver.findComponent(ON.id('stateChange_6'));
      await btn_next.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('stateChange_test');
      console.info("[stateChange_0400] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[stateChange_0400] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("scrollState: 20");
      await CommonFunc.sleep(1000);

      let btnReset: Component = await driver.findComponent(ON.id('stateChange_reset'));
      await btnReset.click();
      await CommonFunc.sleep(1500);
      console.info('[stateChange_0400] END');
      done();
    });

    /**
     * @tc.number    stateChange_005
     * @tc.name      stateChange_0500
     * @tc.desc      Flip to the specified page without animation and trigger the Swiper onScrollStateChanged event.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('stateChange_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[stateChange_0500] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn_next = await driver.findComponent(ON.id('stateChange_1'));
      await btn_next.click();
      await CommonFunc.sleep(1500);
      let strJson = getInspectorByKey('stateChange_test');
      console.info("[stateChange_0500] $attrs: " + JSON.stringify(JSON.parse(strJson).$attrs));
      console.info("[stateChange_0500] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual("scrollState: ");
      await CommonFunc.sleep(1000);

      let btnReset: Component = await driver.findComponent(ON.id('stateChange_reset'));
      await btnReset.click();
      await CommonFunc.sleep(1500);
      console.info('[stateChange_0500] END');
      done();
    });
  })
}
