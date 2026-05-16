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


export default function Foreach1() {
  describe('Foreach1', () => {

    beforeAll(() => {
      console.info("Foreach1 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Foreach1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Foreach1/Foreach1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Foreach1 state pages:" + JSON.stringify(pages));
        if (!("Foreach1" == pages.name)) {
          console.info("get Foreach1 pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push Foreach1 page error:" + err);
      }
      console.info("Foreach1 beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("Foreach1 after each called");
    });

    
    
    /**
     * @tc.number   foreach1_static_001
     * @tc.name     foreach1_static_001
     * @tc.desc     foreach1_static_001
     * @tc.level    Level.LEVEL0
     */
it('foreach1_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[foreach1_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id('repeat_for_each'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('foreach2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[foreach1_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2 new three');
      console.info('[foreach1_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   foreach1_static_002
     * @tc.name     foreach1_static_002
     * @tc.desc     foreach1_static_002
     * @tc.level    Level.LEVEL0
     */
it('foreach1_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[foreach1_static_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id('init_for_each'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await driver.findComponent(ON.id('for_each_1'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('foreach3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[foreach1_static_002] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('3 six');
      console.info('[foreach1_static_002] END');
      done();
    });

    
    
    /**
     * @tc.number   foreach1_static_003
     * @tc.name     foreach1_static_003
     * @tc.desc     foreach1_static_003
     * @tc.level    Level.LEVEL0
     */
it('foreach1_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[foreach1_static_003] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id('init_for_each'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await driver.findComponent(ON.id('for_each_2'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('foreach1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[foreach1_static_003] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1 three');
      console.info('[foreach1_static_003] END');

      let strJson1 = inspector.getInspectorByKey('foreach2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[foreach1_static_003] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('2 two');
      console.info('[foreach1_static_003] END');
      done();
    });

    
    
    /**
     * @tc.number   foreach1_static_004
     * @tc.name     foreach1_static_004
     * @tc.desc     foreach1_static_004
     * @tc.level    Level.LEVEL0
     */
it('foreach1_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[foreach1_static_004] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id('init_for_each'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await driver.findComponent(ON.id('for_each_1'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('foreach3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[foreach1_static_004] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('3 six');
      console.info('[foreach1_static_004] END');
      done();
    });

    
    
    /**
     * @tc.number   foreach1_static_005
     * @tc.name     foreach1_static_005
     * @tc.desc     foreach1_static_005
     * @tc.level    Level.LEVEL0
     */
it('foreach1_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[foreach1_static_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id('init_for_each'));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await driver.findComponent(ON.id('for_each_3'));
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('foreach1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[foreach1_static_005] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1 two');
      console.info('[foreach1_static_005] END');
      done();
    });
  })
}
