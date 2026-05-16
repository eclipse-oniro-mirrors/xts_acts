'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
import accessibility from '@ohos.accessibility';
import Utils from '../../../ets/MainAbility/common/Utils'
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
async function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

const BUNDLE_NAME = 'com.arkui.ace.picker'

export default function SliderInterfaceTest() {
  describe('SliderInterfaceTest', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    const routerPush = async (target: string) => {
      let options: router.RouterOptions = {
        url: `MainAbility/pages/Slider/SliderInterface/${target}`,
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages = router.getState();
        console.info(`get ${target} state pages:` + JSON.stringify(pages));
        console.info(`get ${target} pages.name:` + JSON.stringify(pages.name));
        if (!(target == pages.name)) {
          router.pushUrl(options);
        }
      } catch (err) {
        console.error(`push ${target} page error:` + err);
      }
      await sleep(2);
    }
    

    afterEach(async (): Promise<void> => {
      console.info('[datepicker] after each called');
      const router = AppStorage.get<Router>("router") as Router
      router.clear();
      await sleep(1)
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0180
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0180
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0180
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0180', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider01")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider01');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0180] obj1.getElement('$attrs').getElement('constructor') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('Axis.Vertical');
      expect(obj1.getElement('$attrs').getElement('constructor').getString('reverse')).assertEqual('true');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0200
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0200
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0200
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0200', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider02")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider02');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0200] obj1.getElement('$attrs').getElement('constructor') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('Axis.Vertical');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0210
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0210
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0210
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0210', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider03")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider03');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0210] obj1.getElement('$attrs').getElement('constructor') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('max')).assertEqual('100.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0250
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0250
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0250
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0250', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider04")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider04');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0250] obj1.getElement('$attrs').getElement('constructor') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('min')).assertEqual('0.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0380
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0380
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0380
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0380', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider05")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider05');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0380] obj1.getElement('$attrs').getElement('constructor') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getString('showTips')).assertEqual('false');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0390
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0390
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0390
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0390', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider06")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider06');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0390] obj1.getElement('$attrs').getElement('constructor') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getString('showTips')).assertEqual('true');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0420
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0420
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0420
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0420', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider07")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider07');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0420] obj1.getElement('$attrs').getElement('constructor') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getString('showTips')).assertEqual('false');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0430
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0430
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0430
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0430', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider08")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider08');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0430] obj1.getElement('$attrs').getElement('constructor') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor')));
      expect(obj1.getElement('$attrs').getString('showTips')).assertEqual('true');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0440
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0440
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0440
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0440', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider09")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider09');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0440] obj1.getElement('$attrs').getString('width') is: " +
      JSON.stringify(obj1.getElement('$attrs').getString('width')));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0440] obj1.getElement('$attrs').getString('height') is: " +
      JSON.stringify(obj1.getElement('$attrs').getString('height')));
      expect(obj1.getElement('$attrs').getString('width')).assertEqual('300.00vp');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0450
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0450
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0450
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0450', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider10")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider10'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2).toInt(),
        rect.left + Math.round((rect.right - rect.left) / 4).toInt(), Math.round((rect.top + rect.bottom) / 2).toInt(), 600)
      console.info(`drag is: ` + rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider10');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0450] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("20.000000")
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0480
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0480
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0480
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0480', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider11")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let slider = await driver.findComponent(ON.id('Slider11'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2).toInt(),
        rect.left + Math.round((rect.right - rect.left) / 4).toInt(), Math.round((rect.top + rect.bottom) / 2).toInt(), 600)
      console.info(`drag is: ` + rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider11');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0480] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual("20.000000")
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0640
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0640
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0640
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0640', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider12")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('Slider12');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0640] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('0.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0650
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0650
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0650
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0650', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider13")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('Slider13');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0650] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('100.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0660
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0660
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0660
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0660', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider14")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider14'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2).toInt(),
        rect.left + Math.round((rect.right - rect.left) / 4).toInt(), Math.round((rect.top + rect.bottom) / 2).toInt(), 600)
      console.info(`drag is: ` + rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider14');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0660] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('20.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0670
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0670
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0670
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0670', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider15")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider15'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await Utils.sleep(1000);
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2).toInt(),
        rect.left + Math.round((rect.right - rect.left) / 8).toInt(), Math.round((rect.top + rect.bottom) / 2).toInt(), 600)
      console.info(`drag is: [SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0670] ` + rect.left,
        Math.round((rect.top + rect.bottom) / 2), rect.left + Math.round((rect.right - rect.left) / 8),
        Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider15');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0670] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('10.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0680
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0680
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0680
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0680', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider16")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);

      let slider = await driver.findComponent(ON.id('Slider16'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2).toInt(), rect.left + 55,
        Math.round((rect.top + rect.bottom) / 2).toInt(), 600)
      console.info(`drag is: `, rect.left, Math.round((rect.top + rect.bottom) / 2), rect.left + 55,
        Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider16');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0680] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('0.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0690
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0690
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0690
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0690', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider17")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider17'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left + Math.round((rect.right - rect.left) / 5).toInt(), Math.round((rect.top + rect.bottom) / 2).toInt())
      console.info(`click is: ` + rect.left + Math.round((rect.right - rect.left) / 5),
        Math.round((rect.top + rect.bottom) / 2))
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider17');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0690] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('20.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0700
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0700
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0700
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0700', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider18")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider18'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left, Math.round((rect.top + rect.bottom) / 2).toInt())
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider18');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0700] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('0.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0710
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0710
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0710
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0710', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider19")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider19'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.click(rect.left, Math.round((rect.top + rect.bottom) / 2).toInt())
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider19');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0710] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('0.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0720
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0720
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0720
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0720', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider20")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider20'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      await Utils.sleep(1000);
      console.info(`rect is: ` + JSON.stringify(rect))
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2).toInt(),
        rect.left + Math.round((rect.right - rect.left) / 4).toInt(), Math.round((rect.top + rect.bottom) / 2).toInt(), 600)
      console.info(`drag is: ` + rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider20');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0720] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('20.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0730
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0730
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0730
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0730', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider20")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider20'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await Utils.sleep(1000);
      await driver.click(rect.left + Math.round((rect.right - rect.left) / 4).toInt(), Math.round((rect.top + rect.bottom) / 2).toInt())
      console.info(`click is: ` + rect.left + Math.round((rect.right - rect.left) / 4),
        Math.round((rect.top + rect.bottom) / 2))
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider20');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_0730] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('20.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_1080
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_1080
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_1080
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_1080', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider21")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let slider = await driver.findComponent(ON.id('Slider21'));
      let rect = await (slider?.getBounds() as Promise<Rect>);
      console.info(`rect is: ` + JSON.stringify(rect))
      await Utils.sleep(1000);
      await driver.drag(rect.left, Math.round((rect.top + rect.bottom) / 2).toInt(),
        rect.left + Math.round((rect.right - rect.left) / 4).toInt(), Math.round((rect.top + rect.bottom) / 2).toInt(), 600)
      console.info(`drag is: ` + rect.left, Math.round((rect.top + rect.bottom) / 2),
        rect.left + Math.round((rect.right - rect.left) / 4), Math.round((rect.top + rect.bottom) / 2), 600)
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider21');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_INTERFACE_static_1080] obj1.getElement('$attrs').getElement('constructor').getString('value') is: " +
      JSON.stringify(obj1.getElement('$attrs').getElement('constructor').getString('value')));
      expect(obj1.getElement('$attrs').getElement('constructor').getString('value')).assertEqual('20.000000');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0010
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0010
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0010
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0010', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider22")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider22');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0010] obj1.getElement('$attrs').getString('width') is: " +
      JSON.stringify(obj1.getElement('$attrs').getString('width')));
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0010] obj1.getElement('$attrs').getString('height') is: " +
      JSON.stringify(obj1.getElement('$attrs').getString('height')));
      expect(obj1.getElement('$attrs').getString('width')).assertEqual('300.00vp');
      expect(obj1.getElement('$attrs').getString('height')).assertEqual('300.00vp');
      done();
    });



    
    
    /**
     * @tc.number   SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0020
     * @tc.name     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0020
     * @tc.desc     SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0020
     * @tc.level    Level.LEVEL3
     */
it('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0020', Level.LEVEL3, async (done: () => void): Promise<void> => {
      await routerPush("slider23")
      await Utils.sleep(2000);
      let driver = Driver.create();
      await Utils.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('Slider23');
      let obj1 = JSON.parseJsonElement(strJson1);
      await Utils.sleep(1000);
      console.info("[SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_LAYOUT_static_0020] obj1.getElement('$attrs').getString('height') is: " +
      JSON.stringify(obj1.getElement('$attrs').getString('height')));
      expect(obj1.getElement('$attrs').getString('height')).assertEqual('60.00vp');
      done();
    });
  })
}
