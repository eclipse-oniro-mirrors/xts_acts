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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../../Util.test';
import { BusinessError } from '@ohos.base';
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';
import { Visibility } from '@ohos.arkui.component';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


export default function getGridItemRect6() {
  describe('getGridItemRect6', () => {
    beforeAll(async (): Promise<void> => {
      console.info("getGridItemRect6 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")

    });
    beforeEach(() => {
      console.info("getGridItemRect6 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/grid/getGridItemRect6',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getGridItemRect6 state pages: " + JSON.stringify(pages));
        if (!("getGridItemRect6" == pages.name)) {
          console.info("get getGridItemRect6 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push getGridItemRect6 page error: " + err);
        expect().assertFail();
      }
    });
    // afterEach(async (): Promise<void> => {
    //   await CommonFunc.sleep(1000);
    //   const getGridItemRect6 = AppStorage.get<Router>("router") as Router
    //   getGridItemRect6.back({
    //     url: 'MainAbility/pages/index/index'
    //   })
    //   console.info("BadgeFocus after each called");
    // });


    
    /**
     * @tc.number   getGridItemRect6_static_0100
     * @tc.name     getGridItemRect6_static_0100
     * @tc.desc     getGridItemRect6_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getGridItemRect6_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect6_static_0100] START');
      const message: MessageManager<number> = AppStorage.get<MessageManager<number>>("messageManager")!
      message.notify({ name: 'index', value: 0 })
      await CommonFunc.sleep(500);
      message.notify({ name: 'margin1', value: 20.0 })
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect6_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect6_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect6_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect6_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect6_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(20));
      expect(Math.round(y)).assertEqual(Math.round(20));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(20));
      expect(Math.round(height)).assertEqual(Math.round(160));
      done();
    });


    
    /**
     * @tc.number   getGridItemRect6_static_0200
     * @tc.name     getGridItemRect6_static_0200
     * @tc.desc     getGridItemRect6_static_0200
     * @tc.level    Level.LEVEL0
     */
it('getGridItemRect6_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect6_static_0200] START');
      const message: MessageManager<number> = AppStorage.get<MessageManager<number>>("messageManager")!
      const message1: MessageManager<Visibility> =
        AppStorage.get<MessageManager<Visibility>>("messageManagerVisibility")!
      message.notify({ name: 'index', value: 0 })
      await CommonFunc.sleep(500);
      message.notify({ name: 'margin1', value: 0.0 })
      await CommonFunc.sleep(500);
      message1.notify({ name: 'visibility1', value: Visibility.Visible })
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect6_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect6_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect6_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect6_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect6_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(60));
      expect(Math.round(height)).assertEqual(Math.round(200));
      done();
    });


    
    /**
     * @tc.number   getGridItemRect6_static_0300
     * @tc.name     getGridItemRect6_static_0300
     * @tc.desc     getGridItemRect6_static_0300
     * @tc.level    Level.LEVEL0
     */
it('getGridItemRect6_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect6_static_0300] START');
      const message: MessageManager<number> = AppStorage.get<MessageManager<number>>("messageManager")!
      const message1: MessageManager<Visibility> =
        AppStorage.get<MessageManager<Visibility>>("messageManagerVisibility")!
      message.notify({ name: 'index', value: 0 })
      await CommonFunc.sleep(500);
      message1.notify({ name: 'visibility1', value: Visibility.Hidden })
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect6_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect6_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect6_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect6_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect6_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(60));
      expect(Math.round(height)).assertEqual(Math.round(200));
      done();
    });


    
    /**
     * @tc.number   getGridItemRect6_static_0400
     * @tc.name     getGridItemRect6_static_0400
     * @tc.desc     getGridItemRect6_static_0400
     * @tc.level    Level.LEVEL0
     */
it('getGridItemRect6_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getGridItemRect6_static_0400] START');
      const message: MessageManager<number> = AppStorage.get<MessageManager<number>>("messageManager")!
      const message1: MessageManager<Visibility> =
        AppStorage.get<MessageManager<Visibility>>("messageManagerVisibility")!
      message.notify({ name: 'index', value: 0 })
      await CommonFunc.sleep(500);
      message1.notify({ name: 'visibility1', value: Visibility.None })
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getGridItemRect6_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getGridItemRect6_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getGridItemRect6_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getGridItemRect6_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getGridItemRect6_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(30));
      expect(Math.round(y)).assertEqual(Math.round(100));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(0));
      expect(Math.round(height)).assertEqual(Math.round(0));
      done();
    });


  })
}
