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

export default function UIPresentCustomDialogBackgroundEffectTest() {
  describe('UIPresentCustomDialogBackgroundEffectTest', () => {
    beforeAll(() => {
      console.info("presentCustomDialogBackgroundEffect beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api19.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("presentCustomDialogBackgroundEffect beforeEach start");
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get presentCustomDialogBackgroundEffect state pages:" + JSON.stringify(pages));
        if (!("presentCustomDialogBackgroundEffect" == pages.name)) {
          console.info("get  presentCustomDialogBackgroundEffect pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl({
            url: 'MainAbility/pages/UIContext/presentCustomDialogBackgroundEffect',
          })
        }
      } catch (err) {
        console.error("push presentCustomDialogBackgroundEffect page error:" + err);
      }
      console.info("presentCustomDialogBackgroundEffect foreEach end");
    });


    
/**
     * @tc.number   UIPresentCustomDialogBackgroundEffectTest_0100
     * @tc.name     UIPresentCustomDialogBackgroundEffectTest_0100
     * @tc.desc     UIPresentCustomDialogBackgroundEffectTest_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('UIPresentCustomDialogBackgroundEffectTest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'UIPresentCustomDialogBackgroundEffectTest_0100';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('UIPresentCustomDialog_Effect001'));
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
          console.info("[UIPresentCustomDialogBackgroundEffectTest_0100] getElement('$attrs').options is: " +
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
        let btn1: Component | null = await driver.findComponent(ON.text('通过DialogId关闭'));
        await (btn1?.click() as Promise<void>);
        await Utils.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });


    
/**
     * @tc.number   UIPresentCustomDialogBackgroundEffectTest_0200
     * @tc.name     UIPresentCustomDialogBackgroundEffectTest_0200
     * @tc.desc     UIPresentCustomDialogBackgroundEffectTest_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('UIPresentCustomDialogBackgroundEffectTest_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'UIPresentCustomDialogDialogBackgroundEffectTest_0200';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('UIPresentCustomDialog_Effect002'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(1000);
        let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let date = obj.getElement('$children')[1].getElement('$children')[0]
        console.info("[UIPresentCustomDialogBackgroundEffectTest_0200] getElement('$attrs').options is: " +
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
        let btn1: Component | null = await driver.findComponent(ON.text('通过DialogId关闭'));
        await (btn1?.click() as Promise<void>);
        await Utils.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });


    
/**
     * @tc.number   UIPresentCustomDialogBackgroundEffectTest_0300
     * @tc.name     UIPresentCustomDialogBackgroundEffectTest_0300
     * @tc.desc     UIPresentCustomDialogBackgroundEffectTest_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('UIPresentCustomDialogBackgroundEffectTest_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let tagName = 'UIPresentCustomDialogBackgroundEffectTest_0300';
        console.info('[' + tagName + '] START============================');
        await Utils.sleep(1000);
        let driver = Driver.create();
        let btn = await driver.findComponent(ON.id('UIPresentCustomDialog_Effect003'));
        await (btn?.click() as Promise<void>);
        await Utils.sleep(1000);
        let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
        await Utils.sleep(2000);
        let date = obj.getElement('$children')[1].getElement('$children')[0]
        console.info("[UIPresentCustomDialogBackgroundEffectTest_0300] getElement('$attrs').options is: " +
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
        let btn1: Component | null = await driver.findComponent(ON.text('通过DialogId关闭'));
        await (btn1?.click() as Promise<void>);
        await Utils.sleep(1000);
        console.info('[' + tagName + '] END ===========================');
        done();
      });
  })
}