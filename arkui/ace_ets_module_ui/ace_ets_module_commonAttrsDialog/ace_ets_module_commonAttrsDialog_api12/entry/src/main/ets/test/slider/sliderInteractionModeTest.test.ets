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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function sliderInteractionModeTest() {
  describe('sliderInteractionModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("sliderInteractionModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/slider/sliderInteractionModeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get sliderInteractionModeTest state pages: " + JSON.stringify(pages));
        if (!("sliderInteractionModeTest" == pages.name)) {
          console.info("get sliderInteractionModeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push sliderInteractionModeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push sliderInteractionModeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   sliderInteractionModeTest_0100
     * @tc.number sliderInteractionModeTest_0100
     * @tc.desc   To test that Setting the interaction mode between the user and the slider widget(SliderInteraction.SLIDE_AND_CLICK).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sliderInteractionModeTest_0100', Level.LEVEL0, async (done: Function) => {
      console.info('sliderInteractionModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('slider1'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let slider = getInspectorByKey('slider1');
      console.info("[sliderInteractionModeTest_0100] sliderInteractionModeTest_0100 JSON.parse(slider) is: " + JSON.stringify(slider));
      console.info("[sliderInteractionModeTest_0100] component JSON.parse(slider) is: " + JSON.stringify(JSON.parse(slider)));
      console.info("[sliderInteractionModeTest_0100] title: " + JSON.stringify(JSON.parse(slider).$attrs.sliderInteractionMode));
      expect(JSON.parse(slider).$attrs.sliderInteractionMode).assertEqual('SliderInteraction.SLIDE_AND_CLICK');
      await CommonFunc.sleep(1000);
      console.info('[sliderInteractionModeTest_0100] END');
      done();
    });

    /**
     * @tc.name   sliderInteractionModeTest_0200
     * @tc.number sliderInteractionModeTest_0200
     * @tc.desc   To test that Setting the interaction mode between the user and the slider widget(SliderInteraction.SLIDE_ONLY).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sliderInteractionModeTest_0200', Level.LEVEL0, async (done: Function) => {
      console.info('sliderInteractionModeTest_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('slider2'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let slider = getInspectorByKey('slider2');
      console.info("[sliderInteractionModeTest_0200] sliderInteractionModeTest_0200 JSON.parse(slider) is: " + JSON.stringify(slider));
      console.info("[sliderInteractionModeTest_0200] component JSON.parse(slider) is: " + JSON.stringify(JSON.parse(slider)));
      console.info("[sliderInteractionModeTest_0200] title: " + JSON.stringify(JSON.parse(slider).$attrs.sliderInteractionMode));
      expect(JSON.parse(slider).$attrs.sliderInteractionMode).assertEqual('SliderInteraction.SLIDE_ONLY');
      await CommonFunc.sleep(1000);
      console.info('[sliderInteractionModeTest_0200] END');
      done();
    });

    /**
     * @tc.name   sliderInteractionModeTest_0300
     * @tc.number sliderInteractionModeTest_0300
     * @tc.desc   To test that Setting the interaction mode between the user and the slider widget(SliderInteraction.SLIDE_AND_CLICK_UP).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('sliderInteractionModeTest_0300', Level.LEVEL0, async (done: Function) => {
      console.info('sliderInteractionModeTest_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('slider3'));
      await btn1.click()
      await CommonFunc.sleep(1000);
      let slider = getInspectorByKey('slider3');
      console.info("[sliderInteractionModeTest_0300] sliderInteractionModeTest_0300 JSON.parse(slider) is: " + JSON.stringify(slider));
      console.info("[sliderInteractionModeTest_0300] component JSON.parse(slider) is: " + JSON.stringify(JSON.parse(slider)));
      console.info("[sliderInteractionModeTest_0300] title: " + JSON.stringify(JSON.parse(slider).$attrs.sliderInteractionMode));
      expect(JSON.parse(slider).$attrs.sliderInteractionMode).assertEqual('SliderInteraction.SLIDE_AND_CLICK_UP');
      await CommonFunc.sleep(1000);
      console.info('[sliderInteractionModeTest_0300] END');
      done();
    });
  })
}

