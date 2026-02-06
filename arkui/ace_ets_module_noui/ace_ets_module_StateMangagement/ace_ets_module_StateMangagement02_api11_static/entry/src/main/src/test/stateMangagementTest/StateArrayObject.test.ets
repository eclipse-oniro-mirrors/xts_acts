'use static';
/*
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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function StateArrayObject() {
  describe('StateArrayObject', () => {
    beforeAll(() => {
      console.info("StateArrayBoolean beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StateArrayBoolean beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/StateArrayObject',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StateArrayBoolean state pages:" + JSON.stringify(pages));
        if (!("StateArrayObject" == pages.name)) {
          console.info("get StateArrayBoolean pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StateArrayBoolean page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateArrayBoolean page error:" + err);
      }
      console.info("StateArrayBoolean beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("StateArrayObject after each called");
    });
    
    /**
     * @tc.number   StateArrayObject_static_0100
     * @tc.name     StateArrayObject_static_0100
     * @tc.desc     StateArrayObject_static_0100
     * @tc.level    Level.LEVEL0
     */
it('StateArrayObject_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('StateArrayObject_static_0100 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateArrayObject_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateArrayObject_add'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('stateArrayObject_value_3');
      console.info("[StateArrayObject_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[StateArrayObject_static_0100] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Item7: Object 7 index: 3');
      console.info('[StateArrayObject_static_0100] END');
      done();
    });
    
    /**
     * @tc.number   StateArrayObject_static_0200
     * @tc.name     StateArrayObject_static_0200
     * @tc.desc     StateArrayObject_static_0200
     * @tc.level    Level.LEVEL0
     */
it('StateArrayObject_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('StateArrayObject_static_0200 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateArrayObject_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateArrayObject_clear'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('stateArrayObject_value_0');
      console.info("[StateArrayObject_static_0200] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[StateArrayObject_static_0200] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Item0: Object 0 index: 0');
      console.info('[StateArrayObject_static_0200] END');
      done();
    });
    
    /**
     * @tc.number   StateArrayObject_static_0300
     * @tc.name     StateArrayObject_static_0300
     * @tc.desc     StateArrayObject_static_0300
     * @tc.level    Level.LEVEL0
     */
it('StateArrayObject_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('StateArrayObject_static_0300 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateArrayObject_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateArrayObject_replace'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('stateArrayObject_value_0');
      console.info("[StateArrayObject_static_0300] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[StateArrayObject_static_0300] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Item6: Object 6 index: 0');
      console.info('[StateArrayObject_static_0300] END');
      done();
    });
    
    /**
     * @tc.number   StateArrayObject_static_0400
     * @tc.name     StateArrayObject_static_0400
     * @tc.desc     StateArrayObject_static_0400
     * @tc.level    Level.LEVEL0
     */
it('StateArrayObject_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('StateArrayObject_static_0400 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('stateArrayObject_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('stateArrayObject_delete'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('stateArrayObject_value_0');
      console.info("[StateArrayObject_static_0400] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[StateArrayObject_static_0400] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('Item5: Object 5 index: 0');
      console.info('[StateArrayObject_static_0400] END');
      done();
    });
  })
}