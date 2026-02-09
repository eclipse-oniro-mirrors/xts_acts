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


export default function ObjectLinkCanJsunit() {
  describe('ObjectLinkCanJsunit', () => {
    beforeAll(() => {
      console.info("ObjectLinkCanJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ObjectLinkCanJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkCan',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ObjectLinkCanJsunit state pages:" + JSON.stringify(pages));
        if (!("ObjectLinkCan" == pages.name)) {
          console.info("get ObjectLinkCanJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ObjectLinkCanJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkCanJsunit page error:" + err);
      }
      console.info("ObjectLinkCanJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ObjectLinkFar2_reset'));
      await (button?.click() as Promise<void>);
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });



    /**
     * @tc.number   ObjectLinkCanJsunit_static_0100
     * @tc.name     ObjectLinkCanJsunit_static_0100
     * @tc.desc     ObjectLinkCanJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkCanJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkCanJsunit_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('farClassBN'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('farClassBN');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ObjectLinkCanJsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkCanJsunit_static_0100] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("ClassBN + 1: 5");

      let strJson2 = inspector.getInspectorByKey('sonClassBN');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ObjectLinkCanJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkCanJsunit_static_0100] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("ClassBN的numB值: 6");

      console.info('[ObjectLinkCanJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkCanJsunit_static_0200
     * @tc.name     ObjectLinkCanJsunit_static_0200
     * @tc.desc     ObjectLinkCanJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkCanJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkCanJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('farClassBN3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('farClassBN3');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ObjectLinkCanJsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkCanJsunit_static_0200] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("ClassBN 赋值3: 5");

      let strJson2 = inspector.getInspectorByKey('sonClassBN');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ObjectLinkCanJsunit_static_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkCanJsunit_static_0200] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("ClassBN的numB值: 3");

      console.info('[ObjectLinkCanJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkCanJsunit_static_0300
     * @tc.name     ObjectLinkCanJsunit_static_0300
     * @tc.desc     ObjectLinkCanJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkCanJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkCanJsunit_static_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('sonClassBN'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sonClassBN');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkCanJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkCanJsunit_static_0300] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("ClassBN的numB值: 6");

      let strJson1 = inspector.getInspectorByKey('farClassBN');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ObjectLinkCanJsunit_static_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkCanJsunit_static_0300] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("ClassBN + 1: 5");

      let strJson2 = inspector.getInspectorByKey('farClassBN3');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ObjectLinkCanJsunit_static_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkCanJsunit_static_0300] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("ClassBN 赋值3: 5");

      console.info('[ObjectLinkCanJsunit_static_0300] END');
      done();
    });
  })
}

