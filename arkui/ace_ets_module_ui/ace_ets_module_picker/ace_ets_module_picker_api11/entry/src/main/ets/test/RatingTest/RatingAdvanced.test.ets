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
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0040
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0040
     * @tc.desc        indicator = false, dont set focusable
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0040', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0040] START');
      await routerPush("ratingFocus01")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = getInspectorByKey('ratingFocusText01');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0080] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain("Rating is focusAble");
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0050
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0050
     * @tc.desc        indicator = true, don't set focusable
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0050', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0050] START');
      await routerPush("ratingFocus02")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = getInspectorByKey('ratingFocusText02');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0050] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain("Rating is not focusAble");
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0060
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0060
     * @tc.desc        indicator = false , focusable = true
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0060', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0060] START');
      await routerPush("ratingFocus03")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = getInspectorByKey('ratingFocusText03');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0060] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain("Rating is focusAble");
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0070
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0070
     * @tc.desc        indicator = false , focusable = false
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0070', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0070] START');
      await routerPush("ratingFocus04")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = getInspectorByKey('ratingFocusText04');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0070] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain("Rating is not focusAble");
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0080
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0080
     * @tc.desc        indicator = true , focusable = true
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0080', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0080] START');
      await routerPush("ratingFocus05")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = getInspectorByKey('ratingFocusText05');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0080] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain("Rating is not focusAble");
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0090
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0090
     * @tc.desc        indicator = true , focusable = false
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0090', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0090] START');
      await routerPush("ratingFocus06")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      await driver.triggerKey(2049);
      let strJson1 = getInspectorByKey('ratingFocusText06');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0090] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain("Rating is not focusAble");
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0010
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0010
     * @tc.desc        indicator = false , observe onChange
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0010', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0010] START');
      await routerPush("rating01")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating01'));
      await btn1.click()
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('ratingText01');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0010] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain('success rating');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0020
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0020
     * @tc.desc        indicator = true , observe onChange
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0020', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0020] START');
      await routerPush("rating02")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating02'));
      await btn1.click()
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('ratingText02');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0020] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertContain('failed rating');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0170
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0170
     * @tc.desc        stepSize = 0.05
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0170', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0170] START');
      await routerPush("rating03")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('rating03'));
      await btn1.click()
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('ratingText03');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0170] obj1.$attrs.content is: " + obj1.$attrs.content);
      expect(obj1.$attrs.content).assertEqual('success rating');
      let strJson2 = getInspectorByKey('rating03');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0170] obj2.$attrs.content is: " + obj2.$attrs.content);
      expect(obj2.$attrs.stepSize).assertContain(0.5);
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0010
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0010
     * @tc.desc        width 300 , height 300
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0010', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0010] START');
      await routerPush("rating04")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('rating04');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0010] obj1.$attrs.width is: " + obj1.$attrs.width);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0010] obj1.$attrs.height is: " + obj1.$attrs.height);
      expect(obj1.$attrs.width).assertEqual('300.00vp');
      expect(obj1.$attrs.height).assertEqual('300.00vp');
      done();
    });

    /*
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0040
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0040
     * @tc.desc        set height , observe width
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0040', Level.LEVEL3, async (done: Function) => {
      console.info('[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0040] START');
      await routerPush("rating05")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('rating05');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0040] obj1.$attrs.width is: " + obj1.$attrs.width);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_RATING_LAYOUT_0040] obj1.$attrs.height is: " + obj1.$attrs.height);
      expect(obj1.$attrs.width).assertEqual('180.00vp');
      expect(obj1.$attrs.height).assertEqual('60.00vp');
      done();
    });
  })
}


