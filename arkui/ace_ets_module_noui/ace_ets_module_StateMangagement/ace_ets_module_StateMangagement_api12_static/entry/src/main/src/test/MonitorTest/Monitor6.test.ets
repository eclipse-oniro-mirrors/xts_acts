'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
export default function Monitor6Test() {
  describe('Monitor6Test', () => {

    beforeAll(() => {
      console.info("Monitor6Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Monitor6Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Monitor/Monitor6',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Monitor6Test state pages:" + JSON.stringify(pages));
        if (!("Monitor6Test" == pages.name)) {
          console.info("get IfElse001Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push IfElse001Test page error:" + err);
      }
      console.info("IfElse001Test beforeEach end");
    });


    
    
    /**
     * @tc.number   Monitor6Test_static_0100
     * @tc.name     Monitor6Test_static_0100
     * @tc.desc     Monitor6Test_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Monitor6Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Monitor6Test_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Monitor6_1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Monitor6_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Monitor6Test_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('测试1：fail');
      console.info('[Monitor6Test_static_0100] END');
      done();
    });
    
    
    /**
     * @tc.number   Monitor6Test_static_0200
     * @tc.name     Monitor6Test_static_0200
     * @tc.desc     Monitor6Test_static_0200
     * @tc.level    Level.LEVEL0
     */
it('Monitor6Test_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Monitor6Test_static_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Monitor6_2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Monitor6_2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Monitor6Test_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('测试2：fail');
      console.info('[Monitor6Test_static_0200] END');
      done();
    });
    
    
    /**
     * @tc.number   Monitor6Test_static_0300
     * @tc.name     Monitor6Test_static_0300
     * @tc.desc     Monitor6Test_static_0300
     * @tc.level    Level.LEVEL0
     */
it('Monitor6Test_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Monitor6Test_static_0300 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Monitor6_3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Monitor6_3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Monitor6Test_static_0300] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('测试3：fail');
      console.info('[Monitor6Test_static_0300] END');
      done();

    
    
    /**
     * @tc.number   Monitor6Test_static_0400
     * @tc.name     Monitor6Test_static_0400
     * @tc.desc     Monitor6Test_static_0400
     * @tc.level    Level.LEVEL0
     */
it('Monitor6Test_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('Monitor6Test_static_0400 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('Monitor6_4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Monitor6_4');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[Monitor6Test_static_0400] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('label')).assertEqual('测试4：fail');
      console.info('[Monitor6Test_static_0400] END');
      done();
    });
    });
  })
}

