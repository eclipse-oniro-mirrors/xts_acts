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


export default function CombinationState3Jsunit() {
  describe('CombinationState3Jsunit', () => {
    beforeAll(() => {
      console.info("CombinationState3Jsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("CombinationState3Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/CombinationState3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CombinationState3Jsunit state pages:" + JSON.stringify(pages));
        if (!("CombinationState3" == pages.name)) {
          console.info("get CombinationState3Jsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CombinationState3Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CombinationState3Jsunit page error:" + err);
      }
      console.info("CombinationState3Jsunit beforeEach end");
    });

 

    /**
     * @tc.number   CombinationState3Jsunit_static_0100
     * @tc.name     CombinationState3Jsunit_static_0100
     * @tc.desc     CombinationState3Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('CombinationState3Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      console.info('[CombinationState3Jsunit_static_0100] START');
      let driver = Driver.create()
      let qrComponent = await driver.findComponent(ON.id('change_ClassA'));
      await (qrComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ChildPropState1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState3Jsunit_static_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('子组件ChildPropState1: 1');

      let strJson1 = inspector.getInspectorByKey('ChildPropState2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[CombinationState3Jsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('子组件ChildPropState2: 5');
      console.info('[CombinationState3Jsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   CombinationState3Jsunit_static_0200
     * @tc.name     CombinationState3Jsunit_static_0200
     * @tc.desc     CombinationState3Jsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('CombinationState3Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Click and get the value of State component
      console.info('[CombinationState3Jsunit_static_0200] START');
      let driver = Driver.create()
      let qrComponent = await driver.findComponent(ON.id('change_ClassA'));
      await (qrComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ChildProvide1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState3Jsunit_static_0200] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('子组件ChildProvide1: 1');

      let strJson1 = inspector.getInspectorByKey('ChildProvide2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[CombinationState3Jsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('子组件ChildProvide2: 5');
      console.info('[CombinationState3Jsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   CombinationState3Jsunit_static_0300
     * @tc.name     CombinationState3Jsunit_static_0300
     * @tc.desc     CombinationState3Jsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('CombinationState3Jsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      console.info('[CombinationState3Jsunit_static_0300] START');
      let driver = Driver.create()
      let qrComponent = await driver.findComponent(ON.id('change_ClassA'));
      await (qrComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ChildLink1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState3Jsunit_static_0300] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('子组件ChildLink1: 2');

      let strJson1 = inspector.getInspectorByKey('ChildLink2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[CombinationState3Jsunit_static_0300] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('子组件ChildLink2: 6');
      console.info('[CombinationState3Jsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   CombinationState3Jsunit_static_0400
     * @tc.name     CombinationState3Jsunit_static_0400
     * @tc.desc     CombinationState3Jsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('CombinationState3Jsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      console.info('[CombinationState3Jsunit_static_0400] START');
      let driver = Driver.create()
      let qrComponent = await driver.findComponent(ON.id('change_ClassA'));
      await (qrComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ChildProp1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState3Jsunit_static_0400] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('子组件ChildProp1: 2');

      let strJson1 = inspector.getInspectorByKey('ChildProp2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[CombinationState3Jsunit_static_0400] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('子组件ChildProp2: 6');
      console.info('[CombinationState3Jsunit_static_0400] END');
      done();
    });
  })
}
