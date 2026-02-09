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

export default function showDialogBlurStyleOptionsTest() {
  describe('ShowDialogBlurStyleOptionsTest', () => {
    beforeAll(() => {
      console.info("ShowDialogBlurStyleOptionsTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api19.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ShowDialogBlurStyleOptionsTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ShowDialogBlurStyleOptionsTest state pages:" + JSON.stringify(pages));
        if (!("showDialogBlurStyleOptions1" == pages.name)) {
          console.info("get  ShowDialogBlurStyleOptionsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/promptAction/showDialogBlurStyleOptions1',
          })
        }
      } catch (err) {
        console.error("push ShowDialogBlurStyleOptionsTest page error:" + err);
      }
      console.info("ShowDialogBlurStyleOptionsTest foreEach end");
    });

    
    
/**
     * @tc.number   showDialogBlurStyleOptions_static_0100
     * @tc.name     showDialogBlurStyleOptions_static_0100
     * @tc.desc     showDialogBlurStyleOptions_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogBlurStyleOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'showDialogBlurStyleOptions';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('ShowDialog_Options001'));
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
          console.info("[showDialogBlurStyleOptions_static_0100] getElement('$attrs').options is: " +
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
        let btn1: Component | null = await driver.findComponent(ON.text('button1'));
        await (btn1?.click() as Promise<void>);
        await Utils.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    
    
/**
     * @tc.number   showDialogBlurStyleOptions_static_0200
     * @tc.name     showDialogBlurStyleOptions_static_0200
     * @tc.desc     showDialogBlurStyleOptions_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogBlurStyleOptions_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'showDialogBlurStyleOptions_static_0200';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('ShowDialog_Options002'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(1000);
        let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let date = obj.getElement('$children')[1].getElement('$children')[0]
        console.info("[showDialogBlurStyleOptions_static_0200] getElement('$attrs').options is: " +
        JSON.stringify(date
          .getElement('$attrs')
          .getElement('backgroundBlurStyle')
          .getElement('options')));
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
        let btn1: Component | null = await driver.findComponent(ON.text('button1'));
        await (btn1?.click() as Promise<void>);
        await Utils.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    
    
/**
     * @tc.number   showDialogBlurStyleOptions_static_0300
     * @tc.name     showDialogBlurStyleOptions_static_0300
     * @tc.desc     showDialogBlurStyleOptions_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogBlurStyleOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'showDialogBlurStyleOptions_static_0300';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('ShowDialog_Options003'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(1000);
        let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let date = obj.getElement('$children')[1].getElement('$children')[0]
        console.info("[showDialogBlurStyleOptions_static_0300] getElement('$attrs').options is: " +
        JSON.stringify(date
          .getElement('$attrs')
          .getElement('backgroundBlurStyle')
          .getElement('options')));
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
        let btn1: Component | null = await driver.findComponent(ON.text('button1'));
        await (btn1?.click() as Promise<void>);
        await Utils.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  })
}