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
import { Driver,ON } from '@ohos.UiTest';
import inputEventClient from '@ohos.multimodalInput.inputEventClient';

export default function XComponentSliderTest() {
  describe('XComponentSliderTest', () => {

    const routerPush = async (target:string) => {
      let options:router.RouterOptions = {
        url: `MainAbility/pages/Slider/XcomponentSlider/${target}`,
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

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_021
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_021
     * @tc.desc        initial value 10
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_021', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider01")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider01');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_021] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual('10.000000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_022
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_022
     * @tc.desc        initial value 20
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_022', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider02")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider02');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_022] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual('20.000000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_023
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_023
     * @tc.desc        initial value 100
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_023', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider03")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider03');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_023] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual('100.000000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_024
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_024
     * @tc.desc        initial value 0
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_024', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider04")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider04');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_024] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual('0.000000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_025
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_025
     * @tc.desc        initial value 1000
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_025', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider05")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider05');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_025] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual('100.000000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_026
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_026
     * @tc.desc        initial value 90.5
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_026', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider06")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider06');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_026] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual('90.500000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_027
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_027
     * @tc.desc        initial value 90.2
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_027', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider07")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider07');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_027] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual('90.199997');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_033
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_033
     * @tc.desc        step 0.01
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_033', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider08")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider08');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_033] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.step).assertEqual('0.010000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_034
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_034
     * @tc.desc        Test slider
     * @tc.level       step 2
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_034', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider09")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider09');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_034] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.step).assertEqual('2.000000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_035
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_035
     * @tc.desc        step 50
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_035', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider10")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider10');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_035] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.step).assertEqual('1.000000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_036
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_036
     * @tc.desc        step 10
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_036', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider11")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider11');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_036] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.step).assertEqual('10.000000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_037
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_037
     * @tc.desc        direction = Axis.Vertical
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_037', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider12")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider12');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_037] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.direction).assertEqual('Axis.Vertical');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_038
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_038
     * @tc.desc        direction = Axis.Horizontal
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_038', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider13")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider13');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_038] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.direction).assertEqual('Axis.Horizontal');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_039
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_039
     * @tc.desc        reverse = false
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_039', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider14")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider14');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_039] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.reverse).assertEqual("false");
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_040
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_040
     * @tc.desc        reverse = true
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_040', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider15")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider15');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_040] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.reverse).assertEqual("true");
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_041
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_041
     * @tc.desc        style:SliderStyle.OutSet
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_041', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider16")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let slider = await driver.findComponent(ON.id('XSlider16'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))

      await driver.click(rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `,rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2))
      // await driver.click(120,524);
      // console.info(`driver.click 1`)
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider16');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_041] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual('10.000000');
      await Utils.sleep(1000);
      await driver.drag(rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2),rect.left+Math.ceil((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),600)
      console.info(`drag is: `,rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2),rect.left+Math.ceil((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),600)
      let strJson2 = getInspectorByKey('XSlider16');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_041] obj2.$attrs.constructor is: " + JSON.stringify(obj2.$attrs.constructor));
      expect(obj2.$attrs.constructor.value).assertEqual('20.000000');
      await Utils.sleep(1000);
      await driver.drag(rect.left+Math.round((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),rect.left,Math.round((rect.top+rect.bottom)/2),600)
      console.info(`drag is: `,rect.left+Math.round((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),rect.left,Math.round((rect.top+rect.bottom)/2),600)
      let strJson3 = getInspectorByKey('XSlider16');
      let obj3: ESObject = JSON.parse(strJson3);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_041] obj3.$attrs.constructor is: " + JSON.stringify(obj3.$attrs.constructor));
      expect(obj3.$attrs.constructor.value).assertEqual('0.000000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_042
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_042
     * @tc.desc        style:SliderStyle.InSet
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_042', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider17")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let slider = await driver.findComponent(ON.id('XSlider17'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `,rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider17');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_042] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual('10.000000');
      await Utils.sleep(1000);
      await driver.drag(rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2),rect.left+Math.ceil((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),600)
      console.info(`drag is: `,rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2),rect.left+Math.ceil((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),600)
      let strJson2 = getInspectorByKey('XSlider17');
      let obj2: ESObject = JSON.parse(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_042] obj2.$attrs.constructor is: " + JSON.stringify(obj2.$attrs.constructor));
      expect(obj2.$attrs.constructor.value).assertEqual('20.000000');
      await driver.drag(rect.left+Math.round((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),rect.left,Math.round((rect.top+rect.bottom)/2),600)
      console.info(`drag is: `,rect.left+Math.round((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),rect.left,Math.round((rect.top+rect.bottom)/2),600)
      let strJson3 = getInspectorByKey('XSlider17');
      let obj3: ESObject = JSON.parse(strJson3);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_042] obj3.$attrs.constructor is: " + JSON.stringify(obj3.$attrs.constructor));
      expect(obj3.$attrs.constructor.value).assertEqual('0.000000');
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0010
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0010
     * @tc.desc        sliderBuilder {value：-1,min:-1,max:-1,step:-1}
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0010', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider18")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider18');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0010] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual("0.000000");
      expect(obj1.$attrs.constructor.min).assertEqual("0.000000");
      expect(obj1.$attrs.constructor.max).assertEqual("100.000000");
      expect(obj1.$attrs.constructor.step).assertEqual("1.000000");
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0020
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0020
     * @tc.desc        sliderBuilder {value：0,min:0,max:5,step:0}
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0020', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider19")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider19');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0020] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual("0.000000");
      expect(obj1.$attrs.constructor.min).assertEqual("0.000000");
      expect(obj1.$attrs.constructor.max).assertEqual("5.000000");
      expect(obj1.$attrs.constructor.step).assertEqual("1.000000");
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0030
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0030
     * @tc.desc        sliderBuilder {value：10,min:10,max:50,step:0.5}
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0030', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider20")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider20');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0030] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual("10.000000");
      expect(obj1.$attrs.constructor.min).assertEqual("10.000000");
      expect(obj1.$attrs.constructor.max).assertEqual("50.000000");
      expect(obj1.$attrs.constructor.step).assertEqual("0.500000");
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0040
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0040
     * @tc.desc        sliderBuilder {value：10,min:10,max:50,step:100}
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0040', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider21")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider21');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0040] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual("10.000000");
      expect(obj1.$attrs.constructor.min).assertEqual("10.000000");
      expect(obj1.$attrs.constructor.max).assertEqual("50.000000");
      expect(obj1.$attrs.constructor.step).assertEqual("1.000000");
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0050
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0050
     * @tc.desc        sliderBuilder {value：10,min:100,max:200,step:10}
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0050', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider22")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider22');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0050] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual("100.000000");
      expect(obj1.$attrs.constructor.min).assertEqual("100.000000");
      expect(obj1.$attrs.constructor.max).assertEqual("200.000000");
      expect(obj1.$attrs.constructor.step).assertEqual("10.000000");
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0060
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0060
     * @tc.desc        sliderBuilder {value：10,min:90,max:50,step:10}
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0060', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider23")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider23');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0060] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual("10.000000");
      expect(obj1.$attrs.constructor.min).assertEqual("0.000000");
      expect(obj1.$attrs.constructor.max).assertEqual("100.000000");
      expect(obj1.$attrs.constructor.step).assertEqual("10.000000");
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0070
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0070
     * @tc.desc        sliderBuilder {value：10,min:50,max:50,step:50}
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0070', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider24")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = getInspectorByKey('XSlider24');
      let obj1: ESObject = JSON.parse(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0070] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      expect(obj1.$attrs.constructor.value).assertEqual("10.000000");
      expect(obj1.$attrs.constructor.min).assertEqual("0.000000");
      expect(obj1.$attrs.constructor.max).assertEqual("100.000000");
      expect(obj1.$attrs.constructor.step).assertEqual("50.000000");
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0090
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0090
     * @tc.desc        triggerChange = null
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0090', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider25")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('XSlider25'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+Math.round((rect.right-rect.left)/10),Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `+rect.left+Math.round((rect.right-rect.left)/10),Math.round((rect.top+rect.bottom)/2))
      let strJson1 = getInspectorByKey('XSlider25');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0090] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      await Utils.sleep(1000);
      expect(obj1.$attrs.constructor.value).assertEqual("10.000000");
      done();
    });

   /**
     * @tc.number      SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0100
     * @tc.name        SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0100
     * @tc.desc        triggerChange = undefined
     * @tc.level       Level 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0100', Level.LEVEL3, async (done: Function) => {
      await routerPush("XcomponentSlider26")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('XSlider26'));
      let rect = await slider.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+Math.round((rect.right-rect.left)/10),Math.round((rect.top+rect.bottom)/2))
      console.info(`click is: `+rect.left+Math.round((rect.right-rect.left)/10),Math.round((rect.top+rect.bottom)/2))
      let strJson1 = getInspectorByKey('XSlider26');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0100] obj1.$attrs.constructor is: " + JSON.stringify(obj1.$attrs.constructor));
      await Utils.sleep(1000);
      expect(obj1.$attrs.constructor.value).assertEqual("10.000000");
      done();
    });
  })
}


