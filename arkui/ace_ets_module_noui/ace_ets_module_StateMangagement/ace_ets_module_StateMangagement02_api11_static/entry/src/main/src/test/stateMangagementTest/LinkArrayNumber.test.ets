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
export default function LinkArrayNumber() {
  describe('LinkArrayNumber', () => {
    beforeAll(() => {
      console.info("LinkArrayNumber beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("LinkArrayNumber beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/stateMangagement/LinkArrayNumber',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LinkArrayNumber state pages:" + JSON.stringify(pages));
        if (!("LinkArrayNumber" == pages.name)) {
          console.info("get LinkArrayNumber pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push LinkArrayNumber page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkArrayNumber page error:" + err);
      }
      console.info("LinkArrayNumber beforeEach end");
    });

    
    /**
     * @tc.number   LinkArrayNumber_static_0100
     * @tc.name     LinkArrayNumber_static_0100
     * @tc.desc     LinkArrayNumber_static_0100
     * @tc.level    Level.LEVEL0
     */
it('LinkArrayNumber_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkArrayNumber_static_0100 START');
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkArrayNumber_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArrayNumber_add'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('LinkArrayNumber_value_0');

      console.info("[LinkArrayNumber_static_0100] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[LinkArrayNumber_static_0100] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('4');
      console.info('[LinkArrayNumber_static_0100] END');
      done();
    });
    
    /**
     * @tc.number   LinkArrayNumber_static_0200
     * @tc.name     LinkArrayNumber_static_0200
     * @tc.desc     LinkArrayNumber_static_0200
     * @tc.level    Level.LEVEL0
     */
it('LinkArrayNumber_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkArrayNumber_static_0200 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkArrayNumber_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArrayNumber_clear'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('LinkArrayNumber_value_0');
      console.info("[LinkArrayNumber_static_0200] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[LinkArrayNumber_static_0200] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[LinkArrayNumber_static_0200] END');
      done();
    });
    
    /**
     * @tc.number   LinkArrayNumber_static_0300
     * @tc.name     LinkArrayNumber_static_0300
     * @tc.desc     LinkArrayNumber_static_0300
     * @tc.level    Level.LEVEL0
     */
it('LinkArrayNumber_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkArrayNumber_static_0300 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkArrayNumber_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArrayNumber_replace'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('LinkArrayNumber_value_0');
      console.info("[LinkArrayNumber_static_0300] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[LinkArrayNumber_static_0300] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('0');
      console.info('[LinkArrayNumber_static_0300] END');
      done();
    });
    
    /**
     * @tc.number   LinkArrayNumber_static_0400
     * @tc.name     LinkArrayNumber_static_0400
     * @tc.desc     LinkArrayNumber_static_0400
     * @tc.level    Level.LEVEL0
     */
it('LinkArrayNumber_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkArrayNumber_static_0400 START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn_init = await driver.findComponent(ON.id('LinkArrayNumber_init'));
      await (btn_init?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArrayNumber_delete'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('LinkArrayNumber_value_0');
      console.info("[LinkArrayNumber_static_0400] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[LinkArrayNumber_static_0400] value: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')).assertEqual('5');
      console.info('[LinkArrayNumber_static_0400] END');
      done();
    });
  })
}