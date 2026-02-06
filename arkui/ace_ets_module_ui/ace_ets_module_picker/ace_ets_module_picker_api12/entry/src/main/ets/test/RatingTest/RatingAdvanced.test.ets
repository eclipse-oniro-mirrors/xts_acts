/**
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
import inputEventClient from '@ohos.multimodalInput.inputEventClient';

export default function RatingAdvancedTest() {
  describe('RatingAdvancedTest', () => {

    const routerPush = async (target:string) => {
      let options:router.RouterOptions = {
        url: `MainAbility/pages/Rating/ratingAdvanced/${target}`,
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info(`get ${target} state pages:` + JSON.stringify(pages));
        console.info(`get ${target} pages.name:` + JSON.stringify(pages.name));
        if (!(target == pages.name)) {
          let result = router.push(options);
          await Utils.sleep(1000);
          console.info(`push ${target} page result:` + JSON.stringify(result));
          let pages = router.getState();
          expect(pages.name).assertContain(target)
        }
      } catch (err) {
        console.error(`push ${target} page error:` + err);
      }
    }

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("RatingAdvancedTest after each called");
    });

     /*
      * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0010
      * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0010
      * @tc.desc        rating 2,stars 8,steps 2,click rating
      * @tc.level       Level 3
      */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0010', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0010] START');
      await routerPush("rating01")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating01'));
      let rect = await btn1.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      let strJson1 = getInspectorByKey('ratingText01');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0010] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain('2');
      await driver.click(rect.left+ Math.round((rect.right-rect.left)/8*3)+1,Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `+rect.left+ Math.round((rect.right-rect.left)/8*3)+1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson2 = getInspectorByKey('ratingText01');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0010] obj2.$attrs.content is: " + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertContain('4');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020
     * @tc.desc        rating 0,stars 0,steps 1.5,click rating
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020] START');
      await routerPush("rating02")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating02'));
      let rect = await btn1.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))

      let strJson1 = getInspectorByKey('ratingText02');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain('0');
      let strJson2 = getInspectorByKey('rating02');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020] obj2.$attrs.content is: " + obj2.$attrs.stars);
      expect(obj2.$attrs.stars).assertEqual("5");
      await driver.click(rect.left+1,Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `+rect.left+1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson3 = getInspectorByKey('ratingText02');
      let obj3: ESObject = JSON.parse(strJson3);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020] obj3.$attrs.content is: " + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertContain('1.5');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0030
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0030
     * @tc.desc        rating -1,stars -1,steps 0,click rating
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0030', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0030] START');
      await routerPush("rating03")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating03'));
      let rect = await btn1.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))

      let strJson1 = getInspectorByKey('ratingText03');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0030] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain('-1');
      let strJson2 = getInspectorByKey('rating03');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020] obj2.$attrs.stars is: " + obj2.$attrs.stars);
      expect(obj2.$attrs.stars).assertEqual("5");

      await driver.click(rect.left+1,Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `+rect.left+1,Math.round((rect.top+rect.bottom)/2))

      await Utils.sleep(1000);
      let strJson3 = getInspectorByKey('ratingText03');
      let obj3: ESObject = JSON.parse(strJson3);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020] obj3.$attrs.content is: " + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertContain('0.5');
      done();
    });


    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0040
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0040
     * @tc.desc        rating 0,stars 10,steps 6,click rating
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0040', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0040] START');
      await routerPush("rating04")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating04'));
      let rect = await btn1.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('ratingText04');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0040] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain('6');
      await driver.click(rect.right-1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson2 = getInspectorByKey('ratingText04');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0040] obj2.$attrs.content is: " + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertContain('10');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0050
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0050
     * @tc.desc        rating 8,stars 7,steps 10,click rating
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0050', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0050] START');
      await routerPush("rating05")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('ratingText05');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0050] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain('8');
      let strJson2 = getInspectorByKey('rating05');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020] obj2.$attrs.stars is: " + obj2.$attrs.stars);
      expect(obj2.$attrs.stars).assertEqual("7");
      let btn1 = await driver.findComponent(ON.id('rating05'));
      let rect = await btn1.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+1,Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `+rect.left+1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson3 = getInspectorByKey('ratingText05');
      let obj3: ESObject = JSON.parse(strJson3);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0020] obj3.$attrs.content is: " + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertContain('0.5');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0060
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0060
     * @tc.desc        rating 5,stars 10,steps 0.3,click rating
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0060', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0060] START');
      await routerPush("rating06")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating06'));
      let rect = await btn1.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+1,Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `+rect.left+1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('ratingText06');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0060] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain('0.3');
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0060] END');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0070
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0070
     * @tc.desc        buildRating ,change indicator and click rating
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0070', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0070] START');
      await routerPush("rating07")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ratingButton07'));
      await btn1.click()
      let btn2 = await driver.findComponent(ON.id('rating07'));
      await btn2.click()
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('ratingText07');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0070] obj1 is: " + JSON.stringify(obj1));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0070] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain('1');
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0070] END');
      await btn1.click()
      let rect = await btn2.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+Math.round((rect.right-rect.left)/2)-1,Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `,rect.left+Math.round((rect.right-rect.left)/2)-1,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson2 = getInspectorByKey('ratingText07');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0070] obj2 is: " + JSON.stringify(obj2));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0070] obj2.$attrs.content is: " + obj2.$attrs.content);
      expect(obj2.$attrs.content).assertContain('2.5');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0080
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0080
     * @tc.desc        buildRating ,change indicator and change stars
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0080', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0080] START');
      await routerPush("rating08")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('ratingButton08_1'));
      await btn1.click()

      let btn2 = await driver.findComponent(ON.id('ratingButton08_2'));
      await btn2.click()
      await Utils.sleep(1000);

      let strJson1 = getInspectorByKey('rating08');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0080] obj1.$attrs.stars is: " + obj1.$attrs.stars);
      expect(obj1.$attrs.stars).assertContain(4);

      let btn3 = await driver.findComponent(ON.id('ratingButton08_3'));
      await btn3.click()
      await Utils.sleep(1000);

      let strJson2 = getInspectorByKey('rating08');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0080] obj2.$attrs.stars is: " + obj2.$attrs.stars);
      expect(obj2.$attrs.stars).assertContain(5);
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0200
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0200
     * @tc.desc        triggerChange = null
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0200] START');
      await routerPush("rating10")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('circle10'));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0200] btn1 is: " + JSON.stringify(btn1));
      await btn1.click()
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0210] click btn1 done");
      let strJson1 = getInspectorByKey('ratingText10');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0200] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual("can't click rating");
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0210
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0210
     * @tc.desc        triggerChange = undefined
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0210', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0210] START');
      await routerPush("rating11")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('circle11'));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0210] btn1 is: " + JSON.stringify(btn1));
      await btn1.click()
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0210] click btn1 done");

      let strJson1 = getInspectorByKey('ratingText11');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0210] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual("can't click rating");
      done();
    });
  })
}


