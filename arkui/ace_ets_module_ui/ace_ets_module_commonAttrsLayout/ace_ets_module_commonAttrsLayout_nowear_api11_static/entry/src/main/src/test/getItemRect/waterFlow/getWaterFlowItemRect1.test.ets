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
import { Driver, MouseButton, ON } from '@ohos.UiTest';
import { ComponentUtils, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { BusinessError } from '@ohos.base';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../../Util.test';
import { MessageManager } from '../../../../ets/MainAbility/common/MessageManager';

// import ohosrouter from '@ohos.router';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

interface ParamsData {
  data3: number[];
}

interface MyParams {
  data1: string;
  data2: ParamsData;
}

export default function getWaterFlowItemRect1() {
  describe('getWaterFlowItemRect1', () => {
    beforeAll(async (): Promise<void> => {
      console.info("getWaterFlowItemRect1 beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonAttrsLayout.nowear.api11.static", "EntryAbility")

    });
    beforeEach(() => {
      console.info("getWaterFlowItemRect1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/getItemRect/waterFlow/getWaterFlowItemRect1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getWaterFlowItemRect1 state pages: " + JSON.stringify(pages));
        if (!("getWaterFlowItemRect1" == pages.name)) {
          console.info("get getWaterFlowItemRect1 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getWaterFlowItemRect1 page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("BadgeFocus after each called");
    });

    
    
/**
     * @tc.number   getWaterFlowItemRect1_static_0100
     * @tc.name     getWaterFlowItemRect1_static_0100
     * @tc.desc     getWaterFlowItemRect1_static_0100
     * @tc.level    Level.LEVEL0
     */
it('getWaterFlowItemRect1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getWaterFlowItemRect1_static_0100] START1');
      const message: MessageManager<Int> = AppStorage.get<MessageManager<Int>>("messageManagerInt")!
      message.notify({ name: 'index', value: 0 })
      console.info('[getWaterFlowItemRect1_static_0100] after');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getWaterFlowItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getWaterFlowItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getWaterFlowItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getWaterFlowItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(170));
      expect(Math.round(height)).assertEqual(Math.round(100));

      done();
    });

    
    
/**
     * @tc.number   getWaterFlowItemRect1_static_0200
     * @tc.name     getWaterFlowItemRect1_static_0200
     * @tc.desc     getWaterFlowItemRect1_static_0200
     * @tc.level    Level.LEVEL0
     */
it('getWaterFlowItemRect1_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getWaterFlowItemRect1_static_0200] START');
      const message: MessageManager<Int> = AppStorage.get<MessageManager<Int>>("messageManagerInt")!
      message.notify({ name: 'index', value: -1 })
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getWaterFlowItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getWaterFlowItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getWaterFlowItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getWaterFlowItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(0));
      expect(Math.round(height)).assertEqual(Math.round(0));

      done();
    });

    
    
/**
     * @tc.number   getWaterFlowItemRect1_static_0300
     * @tc.name     getWaterFlowItemRect1_static_0300
     * @tc.desc     getWaterFlowItemRect1_static_0300
     * @tc.level    Level.LEVEL0
     */
it('getWaterFlowItemRect1_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getWaterFlowItemRect1_static_0300] START');
      const ohosrouter = AppStorage.get<Router>("router") as Router
      await CommonFunc.sleep(1000);
      try {
        ohosrouter.back({
          url: 'MainAbility/pages/index/index'
        });
        await CommonFunc.sleep(500);
        ohosrouter.clear();
        await CommonFunc.sleep(500);
        let pages = ohosrouter.getState();
        console.info("getWaterFlowItemRect1 " + JSON.stringify(pages));
        ohosrouter.pushUrl({
          url: 'MainAbility/pages/getItemRect/waterFlow/getWaterFlowItemRect1',
          params: {
            data1: 'message',
            data2: {
              data3: [123, 456, 789]
            }
          } as MyParams
        }).then(() => {
          // success
        })
          .catch((err: Error) => {
            console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
          })
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.error("push getScrollItemRect5 page error: " + err);
      }
      const message: MessageManager<Int> = AppStorage.get<MessageManager<Int>>("messageManagerInt")!
      message.notify({ name: 'index', value: 0 })
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button2 click')
      let btn2 = await driver.findComponent(ON.id('getWaterFlowItemRect1_button2'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getWaterFlowItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getWaterFlowItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getWaterFlowItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getWaterFlowItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(0));
      expect(Math.round(height)).assertEqual(Math.round(0));

      done();
    });


    
    
/**
     * @tc.number   getWaterFlowItemRect1_static_0400
     * @tc.name     getWaterFlowItemRect1_static_0400
     * @tc.desc     getWaterFlowItemRect1_static_0400
     * @tc.level    Level.LEVEL0
     */
it('getWaterFlowItemRect1_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[getWaterFlowItemRect1_static_0400] START');
      const message: MessageManager<Int> = AppStorage.get<MessageManager<Int>>("messageManagerInt")!
      message.notify({ name: 'index', value: 100 })
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(2000);

      console.log('button click')
      let btn = await driver.findComponent(ON.id('getWaterFlowItemRect1_button'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.log('get text message')
      let strJson1 = inspector.getInspectorByKey('getWaterFlowItemRect1_text1')
      let x = Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
      console.log('x' + x)

      let strJson2 = inspector.getInspectorByKey('getWaterFlowItemRect1_text2')
      let y = Number(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content'))
      console.log('y' + y)

      let strJson3 = inspector.getInspectorByKey('getWaterFlowItemRect1_text3')
      let width = Number(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content'))
      console.log('width' + width)

      let strJson4 = inspector.getInspectorByKey('getWaterFlowItemRect1_text4')
      let height = Number(JSON.parseJsonElement(strJson4).getElement('$attrs').getString('content'))
      console.log('height' + height)

      console.log('assert position')
      expect(Math.round(x)).assertEqual(Math.round(0));
      expect(Math.round(y)).assertEqual(Math.round(0));

      console.log('assert size')
      expect(Math.round(width)).assertEqual(Math.round(0));
      expect(Math.round(height)).assertEqual(Math.round(0));

      done();
    });


  })
}
