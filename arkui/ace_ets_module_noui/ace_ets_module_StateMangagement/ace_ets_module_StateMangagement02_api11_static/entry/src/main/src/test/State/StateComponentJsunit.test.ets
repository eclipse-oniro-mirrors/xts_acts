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



export default function StateComponentJsunit() {
  describe('StateComponentJsunit', () => {
    beforeAll(() => {
      console.info("StateComponentJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StateComponentJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StateComponent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StateComponentJsunit state pages:" + JSON.stringify(pages));
        if (!("StateComponent" == pages.name)) {
          console.info("get StateComponentJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StateComponentJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateComponentJsunit page error:" + err);
      }
      console.info("StateComponentJsunit beforeEach end");
    });



    /**
     * @tc.number   StateComponentJsunit_static_0100
     * @tc.name     StateComponentJsunit_static_0100
     * @tc.desc     StateComponentJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('StateComponentJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //get the value of title1
      console.info('StateComponentJsunit_static_0100 START');
      let strJson1 = inspector.getInspectorByKey('text_component1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StateComponentJsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StateComponentJsunit_static_0100] title: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("Hello World");

      let strJson2 = inspector.getInspectorByKey('text_component7');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StateComponentJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StateComponentJsunit_static_0100] title: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("Hello, World 2");

      console.info('[StateComponentJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   StateComponentJsunit_static_0200
     * @tc.name     StateComponentJsunit_static_0200
     * @tc.desc     StateComponentJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('StateComponentJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateComponentJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('change_component1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text_component1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateComponentJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StateComponentJsunit_static_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Hello ArkUI");
      console.info('[StateComponentJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   StateComponentJsunit_static_0300
     * @tc.name     StateComponentJsunit_static_0300
     * @tc.desc     StateComponentJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('StateComponentJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateComponentJsunit_static_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('increase_component1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('increase_component3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateComponentJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[StateComponentJsunit_static_0300] label: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("Click to increase count=3");
      console.info('[StateComponentJsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   StateComponentJsunit_static_0400
     * @tc.name     StateComponentJsunit_static_0400
     * @tc.desc     StateComponentJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('StateComponentJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateComponentJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('change_component7'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('text_component7');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateComponentJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[StateComponentJsunit_static_0400] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Hello ArkUI");
      console.info('[StateComponentJsunit_static_0400] END');
      done();
    });

    /**
     * @tc.number   StateComponentJsunit_static_0500
     * @tc.name     StateComponentJsunit_static_0500
     * @tc.desc     StateComponentJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('StateComponentJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateComponentJsunit_static_0500 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('increase_component7'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('increase_component8');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateComponentJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      console.info("[StateComponentJsunit_static_0500] label: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
      expect(obj.getElement('$attrs').getString('label')).assertEqual("Click to increase count=8");
      console.info('[StateComponentJsunit_static_0500] END');
      done();
    });
  })
}

