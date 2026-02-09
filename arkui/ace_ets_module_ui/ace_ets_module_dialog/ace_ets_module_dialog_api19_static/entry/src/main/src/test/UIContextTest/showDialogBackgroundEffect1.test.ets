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

export default function UIShowDialogBackgroundEffectTest() {
  describe('UIShowDialogBackgroundEffectTest', () => {
    beforeAll(() => {
      console.info("UIShowDialogBackgroundEffectTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api19.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("UIShowDialogBackgroundEffectTest beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get UIShowDialogBackgroundEffectTest state pages:" + JSON.stringify(pages));
        if (!("showDialogBackgroundEffect1" == pages.name)) {
          console.info("get  UIShowDialogBackgroundEffectTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/UIContext/showDialogBackgroundEffect1',
          })
        }
      } catch (err) {
        console.error("push UIShowDialogBackgroundEffectTest page error:" + err);
      }
      console.info("UIShowDialogBackgroundEffectTest foreEach end");
    });

    
    
/**
     * @tc.number   UIShowDialogBackgroundEffectTest_0100
     * @tc.name     UIShowDialogBackgroundEffectTest_0100
     * @tc.desc     UIShowDialogBackgroundEffectTest_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('UIShowDialogBackgroundEffectTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'UIShowDialogBackgroundEffectTest_0100';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('UIShowDialog_Effect001'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(1000);
        let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let dialog = obj.getElement('$children')[1]
        let date = obj.getElement('$children')[1].getElement('$children')[0]
        let uniRenderFlag: string = dialog.getElement('$attrs').getString('uniRender');
        if (uniRenderFlag == 'false') {
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getString('color')).assertEqual('#00000000');
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getDouble('radius')).assertEqual(0);
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getInteger('saturation')).assertEqual(1);
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getInteger('brightness')).assertEqual(1);
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getString('inactiveColor')).assertEqual('#00000000');
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getString('blurOption')).assertEqual('[0,0]');
        } else {
          console.info("[UIShowDialogBackgroundEffectTest_0100] getElement('$attrs').options is: " +
          JSON.stringify(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')));
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getString('color')).assertEqual('#FFFFC0CB');
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getDouble('radius')).assertEqual(40);
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getInteger('saturation')).assertEqual(25);
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getInteger('brightness')).assertEqual(2);
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getString('inactiveColor')).assertEqual('#FF0000FF');
          expect(date
            .getElement('$attrs')
            .getElement('backgroundEffect')
            .getElement('options')
            .getString('blurOption')).assertEqual('[20.000000,20.000000]');
        }
        let btn1: Component | null = await driver.findComponent(ON.text('button1'));
        await (btn1?.click() as Promise<void>);
        await Utils.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    
    
/**
     * @tc.number   UIShowDialogBackgroundEffectTest_0200
     * @tc.name     UIShowDialogBackgroundEffectTest_0200
     * @tc.desc     UIShowDialogBackgroundEffectTest_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('UIShowDialogBackgroundEffectTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'UIShowDialogBackgroundEffectTest_0200';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('UIShowDialog_Effect002'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(1000);
        let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let date = obj.getElement('$children')[1].getElement('$children')[0]
        console.info("[UIShowDialogBackgroundEffectTest_0200] getElement('$attrs').options is: " +
        JSON.stringify(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')));
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('color')).assertEqual('#00000000');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getDouble('radius')).assertEqual(0);
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getInteger('saturation')).assertEqual(1);
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getInteger('brightness')).assertEqual(1);
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('inactiveColor')).assertEqual('#00000000');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('blurOption')).assertEqual('[0,0]');
        let btn1: Component | null = await driver.findComponent(ON.text('button1'));
        await (btn1?.click() as Promise<void>);
        await Utils.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });

    
    
/**
     * @tc.number   UIShowDialogBackgroundEffectTest_0300
     * @tc.name     UIShowDialogBackgroundEffectTest_0300
     * @tc.desc     UIShowDialogBackgroundEffectTest_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('UIShowDialogBackgroundEffectTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'UIShowDialogBackgroundEffectTest_0300';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('UIShowDialog_Effect003'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(1000);
        let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let date = obj.getElement('$children')[1].getElement('$children')[0]
        console.info("[UIShowDialogBackgroundEffectTest_0300] getElement('$attrs').options is: " +
        JSON.stringify(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')));
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('policy')).assertEqual('BlurStyleActivePolicy.ALWAYS_ACTIVE');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('adaptiveColor')).assertEqual('AdaptiveColor.Default');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('color')).assertEqual('#00000000');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getDouble('radius')).assertEqual(0);
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getInteger('saturation')).assertEqual(1);
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getInteger('brightness')).assertEqual(1);
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('inactiveColor')).assertEqual('#00000000');
        expect(date
          .getElement('$attrs')
          .getElement('backgroundEffect')
          .getElement('options')
          .getString('blurOption')).assertEqual('[0,0]');
        let btn1: Component | null = await driver.findComponent(ON.text('button1'));
        await (btn1?.click() as Promise<void>);
        await Utils.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  })
}