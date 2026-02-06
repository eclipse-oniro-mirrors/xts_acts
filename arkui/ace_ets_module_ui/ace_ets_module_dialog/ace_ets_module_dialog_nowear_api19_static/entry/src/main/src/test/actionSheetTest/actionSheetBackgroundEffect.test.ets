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

export default function actionSheetBackgroundEffectTest() {
  describe('ActionSheetBackgroundEffectTest', () => {

    beforeAll(() => {
      console.info("ActionSheetBackgroundEffectTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api19.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("ActionSheetBackgroundEffectTest beforeEach start");
      const routerInstance = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/actionSheet/actionSheetBackgroundEffect',
      }
      // routerInstance.clear();
      let pages = routerInstance.getState();
      console.info("get ActionSheetBackgroundEffectTest state pages: " + JSON.stringify(pages));
      if (!("actionSheetBackgroundEffect" == pages.name)) {
        console.info("get ActionSheetBackgroundEffectTest state pages.name: " + JSON.stringify(pages.name));
        routerInstance.pushUrl(options);
        await Utils.sleep(2000);
      }
    });

    
    
    
    
/**
     * @tc.number   actionSheetBackgroundEffectTest_static_0100
     * @tc.name     actionSheetBackgroundEffectTest_static_0100
     * @tc.desc     actionSheetBackgroundEffectTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('actionSheetBackgroundEffectTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'actionSheetBackgroundEffectTest_static_0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ActionSheet_Effect001'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let dialog = obj.getArray('$children')[1]
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      if(uniRenderFlag == 'false' ){
        console.info("[actionSheetBackgroundEffectTest_static_0100] $attrs.options false is: " + JSON.stringify(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      }else{
        console.info("[actionSheetBackgroundEffectTest_static_0100] $attrs.options is: " + JSON.stringify(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#FFFFC0CB');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(40);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(25);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(2);
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#FF0000FF');
        expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[20.000000,20.000000]');
      }
      let btn1 = await driver.findComponent(ON.text('Confirm button'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    
    
    
/**
     * @tc.number   actionSheetBackgroundEffectTest_static_0200
     * @tc.name     actionSheetBackgroundEffectTest_static_0200
     * @tc.desc     actionSheetBackgroundEffectTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('actionSheetBackgroundEffectTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'actionSheetBackgroundEffectTest_static_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ActionSheet_Effect002'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      console.info("[actionSheetBackgroundEffectTest_static_0200] $attrs.options is: " + JSON.stringify(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      let btn1 = await driver.findComponent(ON.text('Confirm button'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    
    
    
/**
     * @tc.number   actionSheetBackgroundEffectTest_static_0300
     * @tc.name     actionSheetBackgroundEffectTest_static_0300
     * @tc.desc     actionSheetBackgroundEffectTest_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('actionSheetBackgroundEffectTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'actionSheetBackgroundEffectTest_static_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ActionSheet_Effect003'));
      await (btn?.click() as Promise<void>);
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      console.info("[actionSheetBackgroundEffectTest_static_0300] $attrs.options is: " + JSON.stringify(date.getElement('$attrs').getElement('backgroundEffect').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('color')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('radius')).assertEqual(0);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('saturation')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getDouble('brightness')).assertEqual(1);
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      expect(date.getElement('$attrs').getElement('backgroundEffect').getElement('options').getString('blurOption')).assertEqual('[0,0]');
      let btn1 = await driver.findComponent(ON.text('Confirm button'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}