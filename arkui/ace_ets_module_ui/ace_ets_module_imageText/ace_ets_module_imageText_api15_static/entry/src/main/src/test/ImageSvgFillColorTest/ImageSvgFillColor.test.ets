'use static';
/**
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

import { describe, beforeEach, it, expect, Level, beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector'
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function ImageSvgFillColorTest() {
  describe('ImageSvgFillColorTest', () => {
    beforeAll(() => {
      console.info("ImageSvgFillColorTest beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageSvgFillColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ImageSvgFillColor/ImageSvgFillColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ImageSvgFillColorTest state success " + JSON.stringify(pages));
        if (!("ImageSvgFillColor" == pages.name)) {
          console.info("get ImageSvgFillColorTest state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push ImageSvgFillColorTest page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      console.info("ImageSvgFillColorTest beforeEach start");
    })
    
    
/**
     * @tc.number   ImageSVGFillColorTest_static_001
     * @tc.name     ImageSVGFillColorTest_static_001
     * @tc.desc     ImageSVGFillColorTest_static_001
     * @tc.level    Level.LEVEL1
     */
it('ImageSVGFillColorTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton1';
      let imageKey = 'svgFillColorImageKey1';
      let changeButton:Component = await driver.findComponent(ON.id(buttonID)) as Component;
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_001 fillColor1 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FFFF0000');
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_001 fillColor2 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF008000');
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_001 fillColor3 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF000000');
      }
      done();
    });

    
    
/**
     * @tc.number   ImageSVGFillColorTest_static_002
     * @tc.name     ImageSVGFillColorTest_static_002
     * @tc.desc     ImageSVGFillColorTest_static_002
     * @tc.level    Level.LEVEL1
     */
it('ImageSVGFillColorTest_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton2';
      let imageKey = 'svgFillColorImageKey2';
      let changeButton:Component = await driver.findComponent(ON.id(buttonID)) as Component;
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_002 fillColor1 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FFFFFFFF');
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_002 fillColor2 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FFFF0000');
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_002 fillColor3 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF000000');
      }
      done();
    });
    
    
/**
     * @tc.number   ImageSVGFillColorTest_static_003
     * @tc.name     ImageSVGFillColorTest_static_003
     * @tc.desc     ImageSVGFillColorTest_static_003
     * @tc.level    Level.LEVEL1
     */
it('ImageSVGFillColorTest_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton3';
      let imageKey = 'svgFillColorImageKey3';
      let changeButton:Component = await driver.findComponent(ON.id(buttonID)) as Component;
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_003 fillColor1 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FFFFFFFF');
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_003 fillColor2 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF000000');
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_003 fillColor3 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#80FF64FF');
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_003 fillColor4 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF000000');
      }
      done();
    });

    
    
/**
     * @tc.number   ImageSVGFillColorTest_static_004
     * @tc.name     ImageSVGFillColorTest_static_004
     * @tc.desc     ImageSVGFillColorTest_static_004
     * @tc.level    Level.LEVEL1
     */
it('ImageSVGFillColorTest_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton4';
      let imageKey = 'svgFillColorImageKey4';
      let changeButton:Component = await driver.findComponent(ON.id(buttonID)) as Component;
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_004 fillColor1 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_004 fillColor2 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_004 fillColor3 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF000000');
      }
      done();
    });

    
    
/**
     * @tc.number   ImageSVGFillColorTest_static_005
     * @tc.name     ImageSVGFillColorTest_static_005
     * @tc.desc     ImageSVGFillColorTest_static_005
     * @tc.level    Level.LEVEL1
     */
it('ImageSVGFillColorTest_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton5';
      let imageKey = 'svgFillColorImageKey5';
      let changeButton:Component = await driver.findComponent(ON.id(buttonID)) as Component;
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_005 fillColor1 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_005 fillColor2 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF000000');
      }
      done();
    });

    
    
/**
     * @tc.number   ImageSVGFillColorTest_static_006
     * @tc.name     ImageSVGFillColorTest_static_006
     * @tc.desc     ImageSVGFillColorTest_static_006
     * @tc.level    Level.LEVEL1
     */
it('ImageSVGFillColorTest_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton6';
      let imageKey = 'svgFillColorImageKey6';
      let changeButton:Component = await driver.findComponent(ON.id(buttonID)) as Component;
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_006 fillColor1 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FFFFFFFF');
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_006 fillColor2 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF000000');
      }
      done();
    });

    
    
/**
     * @tc.number   ImageSVGFillColorTest_static_007
     * @tc.name     ImageSVGFillColorTest_static_007
     * @tc.desc     ImageSVGFillColorTest_static_007
     * @tc.level    Level.LEVEL1
     */
it('ImageSVGFillColorTest_static_007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton7';
      let imageKey = 'svgFillColorImageKey7';
      let changeButton:Component = await driver.findComponent(ON.id(buttonID)) as Component;
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_007 fillColor1 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FFFFFFFF');
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_007 fillColor2 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF000000');
      }
      done();
    });

    
    
/**
     * @tc.number   ImageSVGFillColorTest_static_008
     * @tc.name     ImageSVGFillColorTest_static_008
     * @tc.desc     ImageSVGFillColorTest_static_008
     * @tc.level    Level.LEVEL1
     */
it('ImageSVGFillColorTest_static_008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let buttonID = 'svgFillColorButton8';
      let imageKey = 'svgFillColorImageKey8';
      let changeButton:Component = await driver.findComponent(ON.id(buttonID)) as Component;
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_008 fillColor1 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FFFFFFFF');
        await changeButton.click();
        await CommonFunc.sleep(1000);
      }
      {
        let strJson = inspector.getInspectorByKey(imageKey);
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTest_008 fillColor2 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF000000');
      }
      done();
    });

    
    
/**
     * @tc.number   ImageSVGFillColorTestModifier_static_001
     * @tc.name     ImageSVGFillColorTestModifier_static_001
     * @tc.desc     ImageSVGFillColorTestModifier_static_001
     * @tc.level    Level.LEVEL1
     */
it('ImageSVGFillColorTestModifier_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('modifierImage');
      let obj = JSON.parseJsonElement(strJson);
      console.info('ImageSVGFillColorTestModifier fillColor1 is: ' + obj.getElement('$attrs').getElement('fillColor'));
      expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FFFF0000');
      {
        let changeButton:Component = await driver.findComponent(ON.id('modifierButton')) as Component;
        await changeButton.click();
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('modifierImage');
        let obj = JSON.parseJsonElement(strJson);
        console.info('ImageSVGFillColorTestModifier fillColor2 is: ' + obj.getElement('$attrs').getElement('fillColor'));
        expect(obj.getElement('$attrs').getElement('fillColor')).assertEqual('#FF000000');
      }
      done();
    });
  })
}
