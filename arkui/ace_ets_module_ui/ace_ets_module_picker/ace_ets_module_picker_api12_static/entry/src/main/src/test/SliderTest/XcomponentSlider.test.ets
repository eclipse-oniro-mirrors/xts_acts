'use static';
/*
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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import router from '@ohos.router'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function XComponentSliderTest() {
  describe('XComponentSliderTest', () => {

    beforeAll(() => {
      console.info("XComponentSliderTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.api12.static", "EntryAbility")

      console.info("XComponentSliderTest beforeAll end");
    });

    const routerPush = async (target:string) => {
      let options:router.RouterOptions = {
        url: `MainAbility/pages/Slider/XcomponentSlider/${target}`,
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info(`get ${target} state pages:` + JSON.stringify(pages));
        console.info(`get ${target} pages.name:` + JSON.stringify(pages.name));
        if (!(target == pages.name)) {
          routerInstance.pushUrl(options);
          // let result = routerInstance.pushUrl(options);
          await Utils.sleep(2000);
          // console.info(`push ${target} page result:` + JSON.stringify(result));
          let pages = routerInstance.getState();
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
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_021
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_021
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_021
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_021', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider01")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider01');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_021] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('10.000000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_022
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_022
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_022
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_022', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider02")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider02');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_022] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('20.000000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_023
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_023
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_023
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_023', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider03")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider03');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_023] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('100.000000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_024
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_024
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_024
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_024', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider04")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider04');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_024] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('0.000000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_025
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_025
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_025
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_025', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider05")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider05');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_025] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('100.000000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_026
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_026
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_026
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_026', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider06")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider06');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_026] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('90.500000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_027
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_027
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_027
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_027', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider07")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider07');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_027] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('90.199997');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_033
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_033
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_033
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_033', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider08")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider08');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_033] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual('0.010000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_034
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_034
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_034
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_034', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider09")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider09');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_034] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual('2.000000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_035
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_035
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_035
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_035', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider10")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider10');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_035] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual('1.000000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_036
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_036
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_036
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_036', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider11")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider11');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_036] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual('10.000000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_037
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_037
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_037
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_037', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider12")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider12');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_037] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('Axis.Vertical');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_038
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_038
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_038
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_038', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider13")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider13');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_038] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('Axis.Horizontal');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_039
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_039
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_039
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_039', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider14")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider14');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_039] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('reverse')).assertEqual("false");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_040
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_040
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_040
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_040', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider15")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider15');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_040] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('reverse')).assertEqual("true");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_041
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_041
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_041
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_041', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider16")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let slider = await driver.findComponent(ON.id('XSlider16')) as Component;
      let rect = await slider!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))

      await driver.click(rect.left+Math.round((rect.right-rect.left)/10)+30 as int,Math.round((rect.top+rect.bottom)/2) as int)
      console.info(`click is: `,rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2))
      // await driver.click(120,524);
      // console.info(`driver.click 1`)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider16');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_041] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('10.000000');
      await Utils.sleep(1000);
      await driver.drag(rect.left+Math.round((rect.right-rect.left)/10)+30 as int,Math.round((rect.top+rect.bottom)/2) as int,rect.left+Math.ceil((rect.right-rect.left)/5)+30 as int,Math.round((rect.top+rect.bottom)/2) as int, 600 as int)
      console.info(`drag is: `,rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2),rect.left+Math.ceil((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),600)
      let strJson2 = inspector.getInspectorByKey('XSlider16');
      let obj2 = JSON.parseJsonElement(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_041] obj2.$attrs.constructor is: " + JSON.stringifyJsonElement(obj2.getElement('$attrs').getElement('constructor')));
      expect(obj2.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('20.000000');
      await Utils.sleep(1000);
      await driver.drag(rect.left+Math.round((rect.right-rect.left)/5)+30 as int, Math.round((rect.top+rect.bottom)/2) as int, rect.left as int, Math.round((rect.top+rect.bottom)/2) as int, 600 as int)
      console.info(`drag is: `,rect.left+Math.round((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),rect.left,Math.round((rect.top+rect.bottom)/2),600)
      let strJson3 = inspector.getInspectorByKey('XSlider16');
      let obj3 = JSON.parseJsonElement(strJson3);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_041] obj3.$attrs.constructor is: " + JSON.stringifyJsonElement(obj3.getElement('$attrs').getElement('constructor')));
      expect(obj3.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('0.000000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_042
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_042
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_042
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_042', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider17")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let slider = await driver.findComponent(ON.id('XSlider17')) as Component;
      let rect = await slider!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+Math.round((rect.right-rect.left)/10)+30 as int, Math.round((rect.top+rect.bottom)/2) as int)
      console.info(`click is: `,rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2))
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider17');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_042] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('10.000000');
      await Utils.sleep(1000);
      await driver.drag(rect.left+Math.round((rect.right-rect.left)/10)+30 as int, Math.round((rect.top+rect.bottom)/2) as int,rect.left+Math.ceil((rect.right-rect.left)/5)+30 as int,Math.round((rect.top+rect.bottom)/2) as int, 600)
      console.info(`drag is: `,rect.left+Math.round((rect.right-rect.left)/10)+30,Math.round((rect.top+rect.bottom)/2),rect.left+Math.ceil((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),600)
      let strJson2 = inspector.getInspectorByKey('XSlider17');
      let obj2 = JSON.parseJsonElement(strJson2);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_042] obj2.$attrs.constructor is: " + JSON.stringifyJsonElement(obj2.getElement('$attrs').getElement('constructor')));
      expect(obj2.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('20.000000');
      await driver.drag(rect.left+Math.round((rect.right-rect.left)/5)+30 as int,Math.round((rect.top+rect.bottom)/2) as int,rect.left as int,Math.round((rect.top+rect.bottom)/2) as int,600)
      console.info(`drag is: `,rect.left+Math.round((rect.right-rect.left)/5)+30,Math.round((rect.top+rect.bottom)/2),rect.left,Math.round((rect.top+rect.bottom)/2),600)
      let strJson3 = inspector.getInspectorByKey('XSlider17');
      let obj3 = JSON.parseJsonElement(strJson3);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CAPI_static_042] obj3.$attrs.constructor is: " + JSON.stringifyJsonElement(obj3.getElement('$attrs').getElement('constructor')));
      expect(obj3.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('0.000000');
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0010
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0010
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0010
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0010', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider18")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider18');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0010] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("0.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('min')).assertEqual("0.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('max')).assertEqual("100.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual("1.000000");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0020
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0020
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0020
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0020', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider19")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider19');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0020] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("0.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('min')).assertEqual("0.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('max')).assertEqual("5.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual("1.000000");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0030
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0030
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0030
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0030', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider20")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider20');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0030] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("10.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('min')).assertEqual("10.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('max')).assertEqual("50.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual("0.500000");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0040
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0040
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0040
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0040', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider21")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider21');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0040] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("10.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('min')).assertEqual("10.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('max')).assertEqual("50.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual("1.000000");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0050
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0050
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0050
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0050', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider22")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider22');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0050] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("100.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('min')).assertEqual("100.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('max')).assertEqual("200.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual("10.000000");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0060
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0060
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0060
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0060', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider23")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider23');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0060] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("10.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('min')).assertEqual("0.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('max')).assertEqual("100.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual("10.000000");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0070
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0070
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0070
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0070', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider24")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('XSlider24');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0070] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("10.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('min')).assertEqual("0.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('max')).assertEqual("100.000000");
      expect(obj1.getElement('$attrs').getElement('constructor').getString('step')).assertEqual("50.000000");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0090
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0090
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0090
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0090', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider25")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('XSlider25')) as Component;
      let rect = await slider!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+Math.round((rect.right-rect.left)/10) as int,Math.round((rect.top+rect.bottom)/2) as int)
      console.info(`click is: `+rect.left+Math.round((rect.right-rect.left)/10),Math.round((rect.top+rect.bottom)/2))
      let strJson1 = inspector.getInspectorByKey('XSlider25');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0090] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      await Utils.sleep(1000);
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("10.000000");
      done();
    });

    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0100
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0100
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0100
     * @tc.level    Level.LEVEL3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("XcomponentSlider26")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('XSlider26')) as Component;
      let rect = await slider!.getBounds();
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left+Math.round((rect.right-rect.left)/10) as int,Math.round((rect.top+rect.bottom)/2) as int)
      console.info(`click is: `+rect.left+Math.round((rect.right-rect.left)/10),Math.round((rect.top+rect.bottom)/2))
      let strJson1 = inspector.getInspectorByKey('XSlider26');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0100] obj1.$attrs.constructor is: " + JSON.stringifyJsonElement(obj1.getElement('$attrs').getElement('constructor')));
      await Utils.sleep(1000);
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("10.000000");
      done();
    });
  })
}


