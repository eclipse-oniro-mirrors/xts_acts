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
export default function ParamTestJsunit1() {
  describe('ParamTestJsunit1', () => {

    beforeAll(() => {
      console.info("ParamTestJsunit1 beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("ParamTestJsunit1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/ParamTest1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ParamTestJsunit1 state pages:" + JSON.stringify(pages));
        if (!("ParamTest1" == pages.name)) {
          console.info("get ParamTestJsunit1 pages.name:" + JSON.stringify(pages.name));

          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push ParamTestJsunit1 page error:" + err);
      }
      console.info("ParamTestJsunit1 beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ParamTestJsunit1 after each called");
    });


    
    
    /**
     * @tc.number   ParamTestJsunit1_static_001
     * @tc.name     ParamTestJsunit1_static_001
     * @tc.desc     ParamTestJsunit1_static_001
     * @tc.level    Level.LEVEL0
     */
it('ParamTestJsunit1_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ParamTestJsunit1_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("btnChangeArrParam"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvChildSet');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParamTestJsunit1_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('5');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('tvChildMap');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ParamTestJsunit1_static_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('value0');
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('tvChildDate');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ParamTestJsunit1_static_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('00:00:01 GMT+0800');
      console.info('[ParamTestJsunit1_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   ParamTestJsunit1_static_002
     * @tc.name     ParamTestJsunit1_static_002
     * @tc.desc     ParamTestJsunit1_static_002
     * @tc.level    Level.LEVEL0
     */
it('ParamTestJsunit1_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ParamTestJsunit1_static_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("tvUnionType"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvUnionType');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParamTestJsunit1_static_002] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('tvChildUnionType');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ParamTestJsunit1_static_002] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('100');
      console.info('[ParamTestJsunit1_static_002] END');
      done();
    });

    
    
    /**
     * @tc.number   ParamTestJsunit1_static_003
     * @tc.name     ParamTestJsunit1_static_003
     * @tc.desc     ParamTestJsunit1_static_003
     * @tc.level    Level.LEVEL0
     */
it('ParamTestJsunit1_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ParamTestJsunit1_static_003] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("tvUnionType"));
      console.log('btn========' + btn)
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvUnionType');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParamTestJsunit1_static_003] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('tvChildUnionType');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ParamTestJsunit1_static_003] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('100');
      console.info('[ParamTestJsunit1_static_003] END');
      done();
    });

    
    
    /**
     * @tc.number   ParamTestJsunit1_static_004
     * @tc.name     ParamTestJsunit1_static_004
     * @tc.desc     ParamTestJsunit1_static_004
     * @tc.level    Level.LEVEL0
     */
it('ParamTestJsunit1_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ParamTestJsunit1_static_004] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("tvChildMsgEvent"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvMsgEvent');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParamTestJsunit1_static_004] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('ARKUI');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('tvChildMsgEvent');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ParamTestJsunit1_static_004] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('ARKUI');
      console.info('[ParamTestJsunit1_static_004] END');
      done();
    });

    
    
    /**
     * @tc.number   ParamTestJsunit1_static_005
     * @tc.name     ParamTestJsunit1_static_005
     * @tc.desc     ParamTestJsunit1_static_005
     * @tc.level    Level.LEVEL0
     */
it('ParamTestJsunit1_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ParamTestJsunit1_static_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("tvNestGrandpa"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvNestGrandpa');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParamTestJsunit1_static_005] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('tvNestGrandpa');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('tvNestChild');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ParamTestJsunit1_static_005] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('tvNestGrandpa');
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('tvChildRequireMsg');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ParamTestJsunit1_static_005] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('tvNestGrandpa');
      console.info('[ParamTestJsunit1_static_005] END');
      done();
    });
    
    
    /**
     * @tc.number   ParamTestJsunit1_static_006
     * @tc.name     ParamTestJsunit1_static_006
     * @tc.desc     ParamTestJsunit1_static_006
     * @tc.level    Level.LEVEL0
     */
it('ParamTestJsunit1_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ParamTestJsunit1_static_006] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("btnChangeArrParam"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvArr');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParamTestJsunit1_static_006] component obj is: " + JSON.stringify(obj));
      console.info("[ParamTestJsunit1_static_006] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('[0,true,{"gender":"girl"}]');
      await CommonFunc.sleep(1000);
      console.info('[ParamTestJsunit1_static_006] END');
      done();
    });

    
    /**
     * @tc.number   ParamTestJsunit1_static_007
     * @tc.name     ParamTestJsunit1_static_007
     * @tc.desc     ParamTestJsunit1_static_007
     * @tc.level    Level.LEVEL0
     */
it('ParamTestJsunit1_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ParamTestJsunit1_static_007] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("tvArr"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvArr');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ParamTestJsunit1_static_007] component obj is: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('[0,true,{"gender":"girl"}]');
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('tvChildArr');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ParamTestJsunit1_static_007] component obj1 is: " + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('[0,true,{"gender":"girl"}]');
      console.info('[ParamTestJsunit1_static_007] END');
      done();
    });
  })
}
