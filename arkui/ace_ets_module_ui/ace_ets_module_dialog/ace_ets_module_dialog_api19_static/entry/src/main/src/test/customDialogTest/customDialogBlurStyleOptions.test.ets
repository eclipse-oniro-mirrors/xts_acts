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
import Utils from '../../../ets/MainAbility/common/Utils';
import {
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function customDialogBlurStyleOptionsTest() {
  describe('CustomDialogBlurStyleOptionsTest', () => {
    beforeAll(() => {
      console.info("CustomDialogBlurStyleOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api19.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("CustomDialogBlurStyleOptionsTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CustomDialogBlurStyleOptionsTest state pages:" + JSON.stringify(pages));
        if (!("customDialogBlurStyleOptions" == pages.name)) {
          console.info("get  CustomDialogBlurStyleOptionsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/customDialog/customDialogBlurStyleOptions',
          })
          await UtilsTest.msSleep(2000)
        }
      } catch (err) {
        console.error("push CustomDialogBlurStyleOptionsTest page error:" + err);
      }
      console.info("CustomDialogBlurStyleOptionsTest foreEach end");
    });


    
    
/**
     * @tc.number   customDialogBlurStyleOptions_static_0100
     * @tc.name     customDialogBlurStyleOptions_static_0100
     * @tc.desc     customDialogBlurStyleOptions_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('customDialogBlurStyleOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'customDialogBlurStyleOptions';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('CustomDialog_Options001'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(1000);
        let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let dialog = obj1.getElement('$children')[1]
        let date1 = obj1.getElement('$children')[1].getElement('$children')[0]
        let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
        if (uniRenderFlag == 'false') {
          expect(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')
            .getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
          expect(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')
            .getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
          expect(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')
            .getDouble('scale')).assertEqual(1.0);
          expect(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')
            .getString('colorMode')).assertEqual('ThemeColorMode.System');
          expect(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')
            .getString('inactiveColor')).assertEqual('#00000000');
        } else {
          console.info("[customDialogBlurStyleOptions_static_0100] getElement('$attrs').options is: " +
          JSON.stringify(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')));
          expect(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')
            .getString('policy')).assertEqual('BlurStyleActivePolicy.FOLLOWS_WINDOW_ACTIVE_STATE');
          expect(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')
            .getString('adaptiveColor')).assertEqual('AdaptiveColor.Average');
          expect(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')
            .getDouble('scale')).assertEqual(0);
          expect(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')
            .getString('colorMode')).assertEqual('ThemeColorMode.Light');
          expect(date1
            .getElement('$attrs')
            .getElement('backgroundBlurStyle')
            .getElement('options')
            .getString('inactiveColor')).assertEqual('#FFFFC0CB');
        }
        let btn1: Component | null = await driver.findComponent(ON.text('confirm'));
        console.info('[' + tagName + '] END =========================== ' + btn1);
        await (btn1?.click() as Promise<void>);
        let btn2 = await driver.findComponent(ON.id('CustomDialog_Options001_close'));
        await (btn2?.click() as Promise<void>);
        await Utils.sleep(2000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    
    
/**
     * @tc.number   customDialogBlurStyleOptions_static_0200
     * @tc.name     customDialogBlurStyleOptions_static_0200
     * @tc.desc     customDialogBlurStyleOptions_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('customDialogBlurStyleOptions_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'customDialogBlurStyleOptions_static_0200';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('CustomDialog_Options002'));
        await (btn?.click() as Promise<void>);
        console.info('[' + tagName + '] click============================');
        await Utils.sleep(1000);
        let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let date = obj.getElement('$children')[1].getElement('$children')[0]
        console.info("[customDialogBlurStyleOptions_static_0200] getElement('$attrs').options is: " +
        JSON.stringify(date.getElement('$attrs').getElement('backgroundBlurStyle').getElement('options')));
        expect(date
          .getElement('$attrs')
          .getElement('backgroundBlurStyle')
          .getElement('options')
          .getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundBlurStyle')
          .getElement('options')
          .getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundBlurStyle')
          .getElement('options')
          .getDouble('scale')).assertEqual(1.0);
        expect(date
          .getElement('$attrs')
          .getElement('backgroundBlurStyle')
          .getElement('options')
          .getString('colorMode')).assertEqual('ThemeColorMode.System');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundBlurStyle')
          .getElement('options')
          .getString('inactiveColor')).assertEqual('#00000000');
        let btn1: Component | null = await driver.findComponent(ON.text('confirm'));
        await (btn1?.click() as Promise<void>);
        let btn2 = await driver.findComponent(ON.id('CustomDialog_Options002_close'));
        await (btn2?.click() as Promise<void>);
        await Utils.sleep(2000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  })
}