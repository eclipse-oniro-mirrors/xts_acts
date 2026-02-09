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
import RectValue from '../../../../ets/MainAbility/common/Rect';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function getListItemRect1() {
  describe('getListItemRect1', () => {



    beforeAll(async (): Promise<void> => {
      console.info("getListItemRect1 beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.api11.static", "EntryAbility")
    });
    beforeEach(() => {
      console.info("getListItemRect1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/list/getListItemRect1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getListItemRect1 state pages: " + JSON.stringify(pages));
        if (!("getListItemRect1" == pages.name)) {
          console.info("get getListItemRect1 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push getListItemRect1 page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn3 = await driver.findComponent(ON.id('getListItemRect1_button3'));
      await CommonFunc.sleep(2000);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(3000);
      // const routerInstance = AppStorage.get<Router>("router") as Router
      // routerInstance.back();
      console.info("BadgeFocus after each called");
    });


    
    /**
     * @tc.number   getListItemRect1_static_0100
     * @tc.name     getListItemRect1_static_0100
     * @tc.desc     getListItemRect1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getListItemRect1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect1_static_0100] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const message: MessageManager<Object> = AppStorage.get<MessageManager<Object>>("messageManager")!
      message.notify({ name: 'index', value: 0 })
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let listItem_1: RectValue = CommonFunc.getComponentRect('getListItemRect1_listItem_1') as RectValue;

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(0)) <= 1).assertTrue();

      console.log('assert size')
      console.log('listItem_1.right - listItem_1.left' + (listItem_1.right - listItem_1.left))
      expect(Math.abs(uiContext.vp2px(Math.round(width)) - Math.round(listItem_1.right - listItem_1.left)) <= 1)
        .assertTrue();
      console.log('listItem_1.bottom - listItem_1.top' + (listItem_1.bottom - listItem_1.top))
      expect(Math.abs(uiContext.vp2px(Math.round(height)) - Math.round(listItem_1.bottom - listItem_1.top)) <= 1)
        .assertTrue();

      done();
    });


    
    /**
     * @tc.number   getListItemRect1_static_0200
     * @tc.name     getListItemRect1_static_0200
     * @tc.desc     getListItemRect1_static_0200
     * @tc.level    Level.LEVEL0
     */
it('getListItemRect1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect1_static_0200] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const message: MessageManager<Object> = AppStorage.get<MessageManager<Object>>("messageManager")!
      message.notify({ name: 'index', value: 1 })
      await CommonFunc.sleep(1000);
      console.log('get Initial value')
      let listItem_2: RectValue = CommonFunc.getComponentRect('getListItemRect1_listItem_2') as RectValue;

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await CommonFunc.sleep(2000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)


      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(120)) <= 1).assertTrue();

      console.log('assert size')
      console.log('listItem_2.right - listItem_2.left' + (listItem_2.right - listItem_2.left))
      expect(Math.abs(uiContext.vp2px(Math.round(width)) - Math.round(listItem_2.right - listItem_2.left)) <= 1)
        .assertTrue();
      console.log('listItem_2.bottom - listItem_2.top' + (listItem_2.bottom - listItem_2.top))
      expect(Math.abs(uiContext.vp2px(Math.round(height)) - Math.round(listItem_2.bottom - listItem_2.top)) <= 1)
        .assertTrue();

      done();
    });


    
    /**
     * @tc.number   getListItemRect1_static_0300
     * @tc.name     getListItemRect1_static_0300
     * @tc.desc     getListItemRect1_static_0300
     * @tc.level    Level.LEVEL0
     */
it('getListItemRect1_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect1_static_0300] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const message: MessageManager<Object> = AppStorage.get<MessageManager<Object>>("messageManager")!
      message.notify({ name: 'index', value: -1 })
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)


      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(0)) <= 1).assertTrue();

      console.log('assert size')
      expect(Math.abs(Math.round(width) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(height) - Math.round(0)) <= 1).assertTrue();

      done();
    });


    
    /**
     * @tc.number   getListItemRect1_static_0400
     * @tc.name     getListItemRect1_static_0400
     * @tc.desc     getListItemRect1_static_0400
     * @tc.level    Level.LEVEL0
     */
it('getListItemRect1_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect1_static_0400] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const message: MessageManager<Object> = AppStorage.get<MessageManager<Object>>("messageManager")!
      message.notify({ name: 'index', value: 0 })
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button2 click')
      let btn2 = await driver.findComponent(ON.id('getListItemRect1_button2'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(0)) <= 1).assertTrue();

      console.log('assert size')
      expect(Math.abs(Math.round(width) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(height) - Math.round(0)) <= 1).assertTrue();

      done();
    });


    
    /**
     * @tc.number   getListItemRect1_static_0500
     * @tc.name     getListItemRect1_static_0500
     * @tc.desc     getListItemRect1_static_0500
     * @tc.level    Level.LEVEL0
     */
it('getListItemRect1_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getListItemRect1_static_0500] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const message: MessageManager<Object> = AppStorage.get<MessageManager<Object>>("messageManager")!
      message.notify({ name: 'index', value: 100 })
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(0)) <= 1).assertTrue();

      console.log('assert size')
      expect(Math.abs(Math.round(width) - Math.round(0)) <= 1).assertTrue();
      expect(Math.abs(Math.round(height) - Math.round(0)) <= 1).assertTrue();

      done();
    });


    
    /**
     * @tc.number   getListItemRect1_static_0600
     * @tc.name     getListItemRect1_static_0600
     * @tc.desc     getListItemRect1_static_0600
     * @tc.level    Level.LEVEL0
     */
it('getListItemRect1_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getListItemRect1_static_0600] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const message: MessageManager<Object> = AppStorage.get<MessageManager<Object>>("messageManager")!
      message.notify({ name: 'index', value: 0 })
      message.notify({ name: 'padding1', value: 20.0 })
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let listItem_1: RectValue = CommonFunc.getComponentRect('getListItemRect1_listItem_1') as RectValue;

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(20)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(20)) <= 1).assertTrue();

      console.log('assert size')
      console.log('listItem_1.right - listItem_1.left' + (listItem_1.right - listItem_1.left))
      expect(Math.floor(Math.abs(uiContext.vp2px(width) - (listItem_1.right - listItem_1.left))) <= 1).assertTrue();
      console.log('listItem_1.bottom - listItem_1.top' + (listItem_1.bottom - listItem_1.top))
      expect(Math.floor(Math.abs(uiContext.vp2px(height) - (listItem_1.bottom - listItem_1.top))) <= 1).assertTrue();

      done();
    });


    
    /**
     * @tc.number   getListItemRect1_static_0700
     * @tc.name     getListItemRect1_static_0700
     * @tc.desc     getListItemRect1_static_0700
     * @tc.level    Level.LEVEL0
     */
it('getListItemRect1_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[getListItemRect1_static_0700] START');
      let uiContext: UIContext = AppStorage.get<UIContext>('uiContent')!;
      const message: MessageManager<Object> = AppStorage.get<MessageManager<Object>>("messageManager")!
      message.notify({ name: 'index', value: 0 })
      message.notify({ name: 'margin1', value: 20.0 })
      await CommonFunc.sleep(1000);

      console.log('get Initial value')
      let listItem_1: RectValue = CommonFunc.getComponentRect('getListItemRect1_listItem_1') as RectValue;

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getListItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getListItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getListItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getListItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getListItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.abs(Math.round(x) - Math.round(20)) <= 1).assertTrue();
      expect(Math.abs(Math.round(y) - Math.round(20)) <= 1).assertTrue();

      console.log('assert size')
      expect(Math.abs(uiContext.vp2px(Math.round(width)) - Math.round(listItem_1.right - listItem_1.left)) <= 1)
        .assertTrue();
      expect(Math.abs(uiContext.vp2px(Math.round(height)) - Math.round(listItem_1.bottom - listItem_1.top)) <= 1)
        .assertTrue();

      done();
    });

  })
}
