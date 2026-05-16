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
import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils';
import { Driver, ON } from '@ohos.UiTest';


export default function SliderAttrs() {
  describe('SliderAttrs', () => {
    beforeEach(async (done: Function) => {
      console.info("SliderAttrs beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/SliderAttrs',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SliderAttrs state success " + JSON.stringify(pages));
        if (!("SliderAttrs" == pages.name)) {
          console.info("get SliderAttrs state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push SliderAttrs page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SliderAttrs page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("SliderAttrs after each called");
    });


    /**
     * @tc.name   SliderAttrs_001
     * @tc.number SliderAttrs_001
     * @tc.desc   Test selectedBorderRadius, minResponsiveDistance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SliderAttrs_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAttrs_001] START');
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('SliderAttrs_slider1');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SliderAttrs_001] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.selectedBorderRadius).assertEqual('2.00vp');
      expect(obj1.$attrs.minResponsiveDistance).assertEqual('50.000000');

      console.info('[SliderAttrs_001] END');
      done();
    });



    /**
     * @tc.name   SliderAttrs_002
     * @tc.number SliderAttrs_002
     * @tc.desc   Test SliderInteraction.SLIDE_AND_CLICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SliderAttrs_002', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAttrs_002] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('SliderAttrs_slider2'));
      let point = await slider.getBoundsCenter();
      await driver.click(point.x, point.y)
      await Utils.sleep(2000);

      let strJson1 = getInspectorByKey('SliderAttrs_slider2');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SliderAttrs_002] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.sliderInteractionMode).assertEqual('SliderInteraction.SLIDE_AND_CLICK');

      let strJson2 = getInspectorByKey('SliderAttrs_text2');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[SliderAttrs_002] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('true');

      console.info('[SliderAttrs_002] END');
      done();
    });



    /**
     * @tc.name   SliderAttrs_003
     * @tc.number SliderAttrs_003
     * @tc.desc   Test SliderInteraction.SLIDE_ONLY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SliderAttrs_003', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAttrs_003] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('SliderAttrs_slider3'));
      let point = await slider.getBoundsCenter();
      await driver.click(point.x, point.y)
      await Utils.sleep(2000);

      let strJson1 = getInspectorByKey('SliderAttrs_slider3');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SliderAttrs_003] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.sliderInteractionMode).assertEqual('SliderInteraction.SLIDE_ONLY');

      let strJson2 = getInspectorByKey('SliderAttrs_text3');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[SliderAttrs_003] obj2 is: " + JSON.stringify(obj2));
      expect(obj2.$attrs.content).assertEqual('0');

      console.info('[SliderAttrs_003] END');
      done();
    });




  })
}


