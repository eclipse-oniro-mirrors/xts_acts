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


export default function SliderAttrs2() {
  describe('SliderAttrs2', () => {
    beforeEach(async (done: Function) => {
      console.info("SliderAttrs2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Slider/SliderAttrs2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SliderAttrs2 state success " + JSON.stringify(pages));
        if (!("SliderAttrs2" == pages.name)) {
          console.info("get SliderAttrs2 state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push SliderAttrs2 page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SliderAttrs2 page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("SliderAttrs2 after each called");
    });


   /**
    * @tc.number      SliderAttrs2_001
    * @tc.name        SliderAttrs2_001
    * @tc.desc        Test SliderInteraction.SLIDE_AND_CLICK_UP
    * @tc.level       Level 2
    */
    it('SliderAttrs2_001', Level.LEVEL1, async (done: Function) => {
      console.info('[SliderAttrs2_001] START');
      await Utils.sleep(1000);

      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('SliderAttrs2_slider2'));
      let point = await slider.getBoundsCenter();
      await driver.click(point.x, point.y)
      await Utils.sleep(2000);

      let strJson1 = getInspectorByKey('SliderAttrs2_text2');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SliderAttrs2_001] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('true');

      console.info('[SliderAttrs2_001] END');
      done();
    });


  })
}


