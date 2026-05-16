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


export default function StateClassObjectJsunit() {
  describe('StateClassObjectJsunit', () => {
    beforeAll(() => {
      console.info("StateClassObjectJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StateClassObjectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StateClassObject',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StateClassObjectJsunit state pages:" + JSON.stringify(pages));
        if (!("StateClassObject" == pages.name)) {
          console.info("get StateClassObjectJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StateClassObjectJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateClassObjectJsunit page error:" + err);
      }
      console.info("StateClassObjectJsunit beforeEach end");
    });



    /**
     * @tc.number   StateClassObjectJsunit_static_0100
     * @tc.name     StateClassObjectJsunit_static_0100
     * @tc.desc     StateClassObjectJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('StateClassObjectJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateClassObjectJsunit_static_0100 START');
      let strJson1 = inspector.getInspectorByKey('text_Object');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StateClassObjectJsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StateClassObjectJsunit_static_0100] title: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("Hello");

      let strJson2 = inspector.getInspectorByKey('text_Class');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StateClassObjectJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StateClassObjectJsunit_static_0100] title: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("World");

      console.info('[StateClassObjectJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   StateClassObjectJsunit_static_0200
     * @tc.name     StateClassObjectJsunit_static_0200
     * @tc.desc     StateClassObjectJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('StateClassObjectJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateClassObjectJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('state_Object1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('text_Object');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StateClassObjectJsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StateClassObjectJsunit_static_0200] title: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("Hi");

      let strJson2 = inspector.getInspectorByKey('text_Class');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StateClassObjectJsunit_static_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StateClassObjectJsunit_static_0200] title: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("ArkUI");
      console.info('[StateClassObjectJsunit_static_0200] END');

      done();
    });

    /**
     * @tc.number   StateClassObjectJsunit_static_0300
     * @tc.name     StateClassObjectJsunit_static_0300
     * @tc.desc     StateClassObjectJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('StateClassObjectJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateClassObjectJsunit_static_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('state_Object2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text_Object');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateClassObjectJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[StateClassObjectJsunit_static_0300] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Hello ArkUI");
      console.info('[StateClassObjectJsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   StateClassObjectJsunit_static_0400
     * @tc.name     StateClassObjectJsunit_static_0400
     * @tc.desc     StateClassObjectJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('StateClassObjectJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateClassObjectJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('state_Class'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text_Class');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateClassObjectJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[StateClassObjectJsunit_static_0400] name: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Harmony");
      console.info('[StateClassObjectJsunit_static_0400] END');
      done();
    });
  })
}

