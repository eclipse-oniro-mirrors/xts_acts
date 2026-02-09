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

export default function actionSheetBlurStyleOptionsTest() {
  describe('ActionSheetBlurStyleOptionsTest', () => {

    beforeAll(() => {
      console.info("ActionSheetBlurStyleOptionsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.nowear.api19.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("ActionSheetBlurStyleOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/actionSheet/actionSheetBlurStyleOptions',
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      routerInstance.clear();
      let pages = routerInstance.getState();
      console.info("get ActionSheetBlurStyleOptionsTest state pages: " + JSON.stringify(pages));
      if (!("actionSheetBlurStyleOptions" == pages.name)) {
        console.info("get ActionSheetBlurStyleOptionsTest state pages.name: " + JSON.stringify(pages.name));
        routerInstance.pushUrl(options);
        await Utils.sleep(2000);
      }
    });

    
    
    
    
/**
     * @tc.number   actionSheetBlurStyleOptionsTest_static_0100
     * @tc.name     actionSheetBlurStyleOptionsTest_static_0100
     * @tc.desc     actionSheetBlurStyleOptionsTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('actionSheetBlurStyleOptionsTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'actionSheetBlurStyleOptionsTest_static_0100';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ActionSheet_Options001'));
      await btn!.click();
      await Utils.sleep(1000);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let dialog = obj1.getArray('$children')[1]
      let date1 = obj1.getArray('$children')[1].getArray('$children')[0]
      let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
      console.info("[actionSheetBlurStyleOptionsTest_static_0100] $attrs.backgroundBlurStyle is: " + JSON.stringifyJsonElement(date1.getElement('$attrs').getElement('backgroundBlurStyle')));
      console.info("[actionSheetBlurStyleOptionsTest_static_0100] $attrs.backgroundBlurStyle.options is: " + JSON.stringifyJsonElement(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options')));
      if(uniRenderFlag == 'false' ){
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getDouble('scale')).assertEqual(1.0);
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('colorMode')).assertEqual('ThemeColorMode.System');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      }else{
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Average');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getDouble('scale')).assertEqual(0);
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('colorMode')).assertEqual('ThemeColorMode.Light');
        expect(date1.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('inactiveColor')).assertEqual('#FFFFC0CB');
      }
      let btn1: Component | null = await driver.findComponent(ON.text('Confirm button'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    
    
    
/**
     * @tc.number   actionSheetBlurStyleOptionsTest_static_0200
     * @tc.name     actionSheetBlurStyleOptionsTest_static_0200
     * @tc.desc     actionSheetBlurStyleOptionsTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('actionSheetBlurStyleOptionsTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'actionSheetBlurStyleOptionsTest_static_0200';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ActionSheet_Options002'));
      await btn!.click();
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      console.info('[' + tagName + '] ============================ obj.getArray($children) ' + JSON.stringify(obj.getArray('$children')))
      console.info('[' + tagName + '] ============================ obj.getArray($children)[1] ' + JSON.stringify(obj.getArray('$children')[1]))
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      console.info('[' + tagName + '] ============================ date ' + JSON.stringify(date))
      console.info("[actionSheetBlurStyleOptionsTest_static_0200] $attrs.options is: " + JSON.stringify(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getDouble('scale')).assertEqual(1.0);
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('colorMode')).assertEqual('ThemeColorMode.System');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      let btn1: Component | null = await driver.findComponent(ON.text('Confirm button'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });

    
    
    
    
/**
     * @tc.number   actionSheetBlurStyleOptionsTest_static_0300
     * @tc.name     actionSheetBlurStyleOptionsTest_static_0300
     * @tc.desc     actionSheetBlurStyleOptionsTest_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2
     */
it('actionSheetBlurStyleOptionsTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let tagName = 'actionSheetBlurStyleOptionsTest_static_0300';
      console.info('[' + tagName + '] START============================');
      await Utils.sleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('ActionSheet_Options003'));
      await btn!.click();
      await Utils.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await Utils.sleep(2000);
      let date = obj.getArray('$children')[1].getArray('$children')[0]
      console.info("[actionSheetBlurStyleOptionsTest_static_0300] $attrs.options is: " + JSON.stringify(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options')));
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getDouble('scale')).assertEqual(1.0);
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('colorMode')).assertEqual('ThemeColorMode.System');
      expect(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options').getString('inactiveColor')).assertEqual('#00000000');
      let btn1: Component | null = await driver.findComponent(ON.text('Confirm button'));
      await (btn1?.click() as Promise<void>);
      await Utils.sleep(1000);
      console.info('[' + tagName + '] END ===========================');
      done();
    });
  })
}