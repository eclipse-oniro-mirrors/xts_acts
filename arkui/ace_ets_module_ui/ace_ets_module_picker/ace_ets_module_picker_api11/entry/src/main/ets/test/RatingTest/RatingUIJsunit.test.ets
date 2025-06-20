/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import {MessageManager,Callback} from '../../MainAbility/utils/MessageManager';


export default function RatingUIJsunit() {
  describe('RatingUIJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("RatingUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Rating/RatingPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RatingUIJsunit state pages: " + JSON.stringify(pages));
        if (!("RatingPage" == pages.name)) {
          console.info("get RatingUIJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RatingUIJsunit success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RatingUIJsunit page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('RatingUIJsunit_0100', Level.LEVEL1, async (done: Function) => {
      // Get the information of the Rating component
      console.info('[RatingUIJsunit_0100] START');
      let strJson = getInspectorByKey('rating1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[RatingUIJsunit_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.rating).assertEqual('3.500000');
      expect(obj.$attrs.indicator).assertEqual('true');
      expect(obj.$attrs.stars).assertEqual('5');
      expect(obj.$attrs.stepSize).assertEqual('0.500000');
      expect(obj.$attrs.starStyle).assertEqual('{"backgroundUri":"resources/base/media/star_1.png","foregroundUri":"resources/base/media/star_2.png","secondaryUri":"resources/base/media/star_3.png"}');
      console.info('[RatingUIJsunit_0100] END');
      done();
    });

    it('RatingUIJsunit_0200', Level.LEVEL1, async (done: Function) => {
      // Modify the rating value of the Rating component
      console.info('[RatingUIJsunit_0200] START');
      globalThis.value.message.notify({name:'rating',value:1})
      await CommonFunc.sleep(2000);
      // Get the rating value of the Rating component
      let strJson = getInspectorByKey('rating1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[RatingUIJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.rating).assertEqual('1.000000');
      await CommonFunc.sleep(1000);
      console.info('[RatingUIJsunit_0200] END');
      done();
    });

    it('RatingUIJsunit_0300', Level.LEVEL1, async (done: Function) => {
      // Modify the indicator value of the Rating component
      console.info('[RatingUIJsunit_0300] START');
      globalThis.value.message.notify({name:'indicator1',value:false})
      await CommonFunc.sleep(2000);
      let driver = await Driver.create()
      // Get the indicator value of the Rating component
      let strJson = getInspectorByKey('ratingBtn');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[RatingUIJsunit_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.indicator).assertEqual('false');

      // Verify that click cannot be modified the rating value of the Rating component
      let rating = await driver.findComponent(ON.id('ratingBtn'));

      console.info(`rating ` + JSON.stringify(rating))
      let rect = await rating.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+Math.round((rect.right-rect.left)/2)-1,Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `,rect.left+Math.round((rect.right-rect.left)/2)-1,Math.round((rect.top+rect.bottom)/2))
      await CommonFunc.sleep(1000);
      // Verify the rating value of the Rating component
      let strJson1 = getInspectorByKey('ratingBtn');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[RatingUIJsunit_0300] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.rating).assertEqual('2.500000');
      console.info('[RatingUIJsunit_0300] END');
      done();
    });

    it('RatingUIJsunit_0400', Level.LEVEL1, async (done: Function) => {
      // Modify the stars value of the Rating component
      console.info('[RatingUIJsunit_0400] START');
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'stars',value:7})
      await CommonFunc.sleep(2000);
      // Get the stars value of the Rating component
      let strJson = getInspectorByKey('rating1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[RatingUIJsunit_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.stars).assertEqual('7');
      console.info('[RatingUIJsunit_0400] END');
      done();
    });

    it('RatingUIJsunit_0500', Level.LEVEL1, async (done: Function) => {
      // Modify the stepSize value of the Rating component
      console.info('[RatingUIJsunit_0500] START');
      globalThis.value.message.notify({name:'stepSize',value:1})
      await CommonFunc.sleep(2000);
      // Get the stepSize value of the Rating component
      let strJson = getInspectorByKey('rating1');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[RatingUIJsunit_0500] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.stepSize).assertEqual('1.000000');
      await CommonFunc.sleep(1000);
      console.info('[RatingUIJsunit_0500] END');
      done();
    });

    it('RatingUIJsunit_0600', Level.LEVEL1, async (done: Function) => {
      // Verify onChange event of the Rating component
      console.info('[RatingUIJsunit_0600] START');
      await CommonFunc.sleep(1000);
      // Modify the indicator value of the Rating component
      globalThis.value.message.notify({name:'rating',value:1})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'text',value:'no change'})
       globalThis.value.message.notify({name:'indicator',value:false})
      await CommonFunc.sleep(2000);

      let driver = await UiDriver.create()
      let textComponent1 = await driver.findComponent(BY.key('text'));
      let text1 = await textComponent1.getText();
      console.info("[RatingUIJsunit_0600] text1: " + JSON.stringify(text1));
      expect(text1).assertEqual('no change');

      // Get the rating value of the Rating component
      let strJson1 = getInspectorByKey('rating1');
      let obj: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[RatingUIJsunit_0600] component obj is: " + JSON.stringify(obj));
      let rating1: number = obj.$attrs.rating
      console.info("[RatingUIJsunit_0600] rating1: " + JSON.stringify(rating1));
      
      // Get the component Rating and click
      let textComponent = await driver.findComponent(BY.key('rating1'));
      await textComponent.click();
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('rating1');
      let obj2: Record<string, ESObject> = JSON.parse(strJson2);
      let rating2: number = obj2.$attrs.rating
      console.info("[RatingUIJsunit_0600] rating2: " + JSON.stringify(rating2));
      expect(rating1 == rating2).assertFalse();

      let textComponent2 = await driver.findComponent(BY.key('text'));
      let text2 = await textComponent2.getText();
      console.info("[RatingUIJsunit_0600] text2: " + JSON.stringify(text2));
      //expect(text2).assertEqual('change succ');
      console.info('[RatingUIJsunit_0600] END');
      done();
    });

    it('RatingUIJsunit_0700', Level.LEVEL1, async (done: Function) => {
      // Get the default value of the Rating component
      console.info('[RatingUIJsunit_0700] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('rating');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[RatingUIJsunit_0700] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.rating).assertEqual('0.000000');
      expect(obj.$attrs.indicator).assertEqual('false');
      expect(obj.$attrs.stars).assertEqual('5');
      expect(obj.$attrs.stepSize).assertEqual('0.500000');
      console.info('[RatingUIJsunit_0700] END');
      done();
    });
  })
}
