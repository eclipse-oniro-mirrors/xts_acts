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
export default function Provider0300Test() {
  describe('Provider0300Test', () => {

    beforeAll(() => {
      console.info("Provider0300Test beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("Provider0300Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Provider/Provider0300",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Provider0300Test state pages:" + JSON.stringify(pages));
        if (!("Provider0300Test" == pages.name)) {
          console.info("get Provider0300Test pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push Provider0300Test page error:" + err);
      }
      console.info("Provider0300Test beforeEach end");
    });



    
    
    /**
     * @tc.number   Provider0300Test_static_001
     * @tc.name     Provider0300Test_static_001
     * @tc.desc     Provider0300Test_static_001
     * @tc.level    Level.LEVEL0
     */
it('Provider0300Test_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[Provider0300Test_static_001] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("btnProvider0300ChangeMsg"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildProvider0300Class'))
      console.info("[Provider0300Test_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('10');
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildProvider0300Number'))
      console.info("[Provider0300Test_static_001] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('10');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildProvider0300Boolean'))
      console.info("[Provider0300Test_static_001] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('true');
      await CommonFunc.sleep(1000);
      let obj3 = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildProvider0300String'))
      console.info("[Provider0300Test_static_001] component obj3 is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('helloworld');
      await CommonFunc.sleep(1000);
      let obj4 = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildProvider0300Object'))
      console.info("[Provider0300Test_static_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('helloworld');
      await CommonFunc.sleep(1000);
      let obj5 = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildProvider0300Arr'))
      console.info("[Provider0300Test_static_001] component obj5 is: " + JSON.stringify(obj5));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual('10');
      await CommonFunc.sleep(1000);
      let obj6 = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildProvider0300Date'))
      console.info("[Provider0300Test_static_001] component obj6 is: " + JSON.stringify(obj6));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual('08:08:09 GMT+0800');
      await CommonFunc.sleep(1000);
      let obj7 = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildProvider0300Map'))
      console.info("[Provider0300Test_static_001] component obj7 is: " + JSON.stringify(obj7));
      expect(obj7.getElement('$attrs').getString('content')).assertEqual('100');
      await CommonFunc.sleep(1000);
      let obj8 = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildProvider0300Set'))
      console.info("[Provider0300Test_static_001] component obj8 is: " + JSON.stringify(obj8));
      expect(obj8.getElement('$attrs').getString('content')).assertEqual('0,1,2');
      await CommonFunc.sleep(1000);
      let obj9 = JSON.parseJsonElement(inspector.getInspectorByKey('tvChildProvider0300Enum'))
      console.info("[Provider0300Test_static_001] component obj9 is: " + JSON.stringify(obj9));
      expect(obj9.getElement('$attrs').getString('content')).assertEqual('PB');
      console.info('[Provider0300Test_static_001] END');
      done();
    });
  })
}
