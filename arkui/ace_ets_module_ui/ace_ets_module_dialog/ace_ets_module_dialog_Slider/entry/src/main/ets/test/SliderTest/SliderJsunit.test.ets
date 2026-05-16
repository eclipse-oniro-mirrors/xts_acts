/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


import { afterEach, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import router from '@ohos.router';

function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time * 1000);
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}


export default function sliderJsunit() {

  describe('SliderTest', () => {
    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/Slider_2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get Slider state success " + JSON.stringify(pages));
        if (!("Slider" == pages.name)) {
          console.info("get Slider state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push Slider page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Slider page error " + JSON.stringify(err));
      }
      await sleep(2);
      done();
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Slider after each called");
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1060
     * @tc.name testGetSliderAttr010
     * @tc.desc aceEtsTest
     */
    it('testGetSliderAttr010', Level.LEVEL1, async (done: Function) => {
      console.info('testGetSliderAttr1 START');
      let strJson = getInspectorByKey('slider1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is  Slider: " + JSON.stringify(obj));
      console.info("component obj is  Slider: " + JSON.stringify(obj.$attrs.constructor));
      expect(obj.$attrs.showTips).assertEqual("false");
      expect(obj.$attrs.showSteps).assertEqual("false");
      expect(obj.$attrs.constructor.value).assertEqual(40.000000.toFixed(6));
      expect(obj.$attrs.constructor.min).assertEqual(0.000000.toFixed(6));
      expect(obj.$attrs.constructor.max).assertEqual(100.000000.toFixed(6));
      expect(obj.$attrs.constructor.step).assertEqual(1.000000.toFixed(6));
      expect(obj.$attrs.style).assertEqual("SliderStyle.OutSet");
      console.info('testGetSliderAttr1 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_1070
     * @tc.name testGetSliderAttr020
     * @tc.desc aceEtsTest
     */
    it('testGetSliderAttr020', Level.LEVEL1, async (done: Function) => {
      console.info('testGetSliderAttr2 START');
      let strJson = getInspectorByKey('slider2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("component obj is  Slider: " + JSON.stringify(obj));
      expect(obj.$attrs.showTips).assertEqual("true")
      expect(obj.$attrs.showSteps).assertEqual("true")
      expect(obj.$attrs.style).assertEqual("SliderStyle.InSet")
      console.info('testGetSliderAttr2 END');
      done();
    });
  })
}
