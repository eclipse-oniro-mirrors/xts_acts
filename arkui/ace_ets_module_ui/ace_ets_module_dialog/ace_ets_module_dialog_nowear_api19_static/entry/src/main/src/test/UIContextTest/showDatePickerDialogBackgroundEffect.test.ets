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
import { describe, beforeEach, it, expect, Level, beforeAll, beforeEach, Size, TestType } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton,  Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function showDatePickerDialogBackgroundEffectTest() {
  describe('ShowDatePickerDialogBackgroundEffectTest', () => {
    beforeAll(() => {
      console.info("ShowDatePickerDialogBackgroundEffectTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api19.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("ShowDatePickerDialogBackgroundEffectTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/showDatePickerDialogBackgroundEffect',
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.clear();
      let pages = routerInstance.getState();
      console.info("get ShowDatePickerDialogBackgroundEffectTest state pages: " + JSON.stringify(pages));
      if (!("showDatePickerDialogBackgroundEffect" == pages.name)) {
        console.info("get ShowDatePickerDialogBackgroundEffectTest state pages.name: " + JSON.stringify(pages.name));

        routerInstance.pushUrl(options);
        await Utils.sleep(2000);
        // console.info("push ShowDatePickerDialogBackgroundEffectTest success: " + JSON.stringify(result));
      }
    });

    
    
    
    
/**
     * @tc.number   showDatePickerDialogBackgroundEffectTest_static_0100
     * @tc.name     showDatePickerDialogBackgroundEffectTest_static_0100
     * @tc.desc     showDatePickerDialogBackgroundEffectTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('showDatePickerDialogBackgroundEffectTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'showDatePickerDialogBackgroundEffectTest_static_0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ShowDatePickerDialog_Effect001'))  as Component;
      await btn!.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] START=======' + JSON.stringify(inspector.getInspectorTree()));
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      console.info('[' + tagName + '] START=======');
      await Utils.sleep(2000);
      let dialog = obj.getArray('$children')[1]
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if(uniRenderFlag == 'false' ){
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      }else{
        console.info("[ShowDatePickerDialogBackgroundEffectTest_static_0100] $attrs.options is: " + JSON.stringifyJsonElement(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#FFFFC0CB');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(40);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(25);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(2);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#FF0000FF');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[20.000000,20.000000]');
      }
      let btn1: Component = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    
    
    
/**
     * @tc.number   showDatePickerDialogBackgroundEffectTest_static_0200
     * @tc.name     showDatePickerDialogBackgroundEffectTest_static_0200
     * @tc.desc     showDatePickerDialogBackgroundEffectTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('showDatePickerDialogBackgroundEffectTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'showDatePickerDialogDialogBackgroundEffectTest_static_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ShowDatePickerDialog_Effect002')) as Component;
      await btn!.click();
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      console.info("[showDatePickerDialogBackgroundEffectTest_static_0200] $attrs.options is: " + JSON.stringifyJsonElement(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      let btn1: Component = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    
    
    
/**
     * @tc.number   showDatePickerDialogBackgroundEffectTest_static_0300
     * @tc.name     showDatePickerDialogBackgroundEffectTest_static_0300
     * @tc.desc     showDatePickerDialogBackgroundEffectTest_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('showDatePickerDialogBackgroundEffectTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'showDatePickerDialogBackgroundEffectTest_static_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ShowDatePickerDialog_Effect003')) as Component;
      await btn!.click();
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      console.info("[showDatePickerDialogBackgroundEffectTest_static_0300] $attrs.options is: " + JSON.stringifyJsonElement(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      let btn1: Component = await driver.findComponent(ON.text('确定')) as Component;
      await btn1!.click();
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}