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


export default function LinkSonJsunit() {
  describe('LinkSonJsunit', () => {
    beforeAll(() => {
      console.info("LinkSonJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("LinkSonJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/LinkSon',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LinkSonJsunit state pages:" + JSON.stringify(pages));
        if (!("LinkSon" == pages.name)) {
          console.info("get LinkSonJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push LinkSonJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkSonJsunit page error:" + err);
      }
      console.info("LinkSonJsunit beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ParentLink_reset'));
      await (button?.click() as Promise<void>);
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

 
    /**
     * @tc.number   LinkSonJsunit_static_0100
     * @tc.name     LinkSonJsunit_static_0100
     * @tc.desc     LinkSonJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('LinkSonJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkSonJsunit_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('str_parLink'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('str_parText');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LinkSonJsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_static_0100] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("Parent str: Link Parent");

      let strJson2 = inspector.getInspectorByKey('str1_tSon1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[LinkSonJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_static_0100] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("@Link str1: Link Parent");

      let strJson3 = inspector.getInspectorByKey('str2_tSon2');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[LinkSonJsunit_static_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_static_0100] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual("@Link str2: Link Parent");

      let strJson4 = inspector.getInspectorByKey('num_parText');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[LinkSonJsunit_static_0300] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_static_0300] text: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual("Parent num: 0");

      let strJson5 = inspector.getInspectorByKey('num1_tSon1');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[LinkSonJsunit_static_0300] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_static_0300] text: " + JSON.stringify(obj5.getElement('$attrs').getString('content')));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual("@Link num1: 0");

      let strJson6 = inspector.getInspectorByKey('num2_tSon2');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[LinkSonJsunit_static_0300] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_static_0300] text: " + JSON.stringify(obj6.getElement('$attrs').getString('content')));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual("@Link num2: 0");

      console.info('[LinkSonJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   LinkSonJsunit_static_0200
     * @tc.name     LinkSonJsunit_static_0200
     * @tc.desc     LinkSonJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('LinkSonJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkSonJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('str_son1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('str1_tSon1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LinkSonJsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_static_0200] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("@Link str1: Link Son1");

      let strJson2 = inspector.getInspectorByKey('str_parText');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[LinkSonJsunit_static_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_static_0200] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("Parent str: Link Son1");

      let strJson3 = inspector.getInspectorByKey('str2_tSon2');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[LinkSonJsunit_static_0200] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_static_0200] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual("@Link str2: Link Son1");

      let strJson4 = inspector.getInspectorByKey('num_parText');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[LinkSonJsunit_static_0200] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_static_0200] text: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual("Parent num: 0");

      let strJson5 = inspector.getInspectorByKey('num1_tSon1');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[LinkSonJsunit_static_0200] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_static_0200] text: " + JSON.stringify(obj5.getElement('$attrs').getString('content')));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual("@Link num1: 0");

      let strJson6 = inspector.getInspectorByKey('num2_tSon2');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[LinkSonJsunit_static_0200] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_static_0200] text: " + JSON.stringify(obj6.getElement('$attrs').getString('content')));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual("@Link num2: 0");

      console.info('[LinkSonJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   LinkSonJsunit_static_0300
     * @tc.name     LinkSonJsunit_static_0300
     * @tc.desc     LinkSonJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('LinkSonJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkSonJsunit_static_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('str_son2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('str2_tSon2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LinkSonJsunit_static_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_static_0300] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("@Link str2: Link Son2");

      let strJson2 = inspector.getInspectorByKey('str1_tSon1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[LinkSonJsunit_static_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_static_0300] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("@Link str1: Link Son2");

      let strJson3 = inspector.getInspectorByKey('str_parText');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[LinkSonJsunit_static_0300] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_static_0300] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual("Parent str: Link Son2");

      let strJson4 = inspector.getInspectorByKey('num_parText');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[LinkSonJsunit_static_0300] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_static_0300] text: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual("Parent num: 0");

      let strJson5 = inspector.getInspectorByKey('num1_tSon1');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[LinkSonJsunit_static_0300] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_static_0300] text: " + JSON.stringify(obj5.getElement('$attrs').getString('content')));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual("@Link num1: 0");

      let strJson6 = inspector.getInspectorByKey('num2_tSon2');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[LinkSonJsunit_static_0300] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_static_0300] text: " + JSON.stringify(obj6.getElement('$attrs').getString('content')));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual("@Link num2: 0");

      console.info('[LinkSonJsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   LinkSonJsunit_static_0400
     * @tc.name     LinkSonJsunit_static_0400
     * @tc.desc     LinkSonJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('LinkSonJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkSonJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('num_parLink'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('num_parText');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LinkSonJsunit_static_0400] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_static_0400] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("Parent num: 3");

      let strJson2 = inspector.getInspectorByKey('num1_tSon1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[LinkSonJsunit_static_0400] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_static_0400] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("@Link num1: 3");

      let strJson3 = inspector.getInspectorByKey('num2_tSon2');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[LinkSonJsunit_static_0400] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_static_0400] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual("@Link num2: 3");

      let strJson4 = inspector.getInspectorByKey('str_parText');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[LinkSonJsunit_static_0400] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_static_0400] text: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual("Parent str: before");

      let strJson5 = inspector.getInspectorByKey('str1_tSon1');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[LinkSonJsunit_static_0400] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_static_0400] text: " + JSON.stringify(obj5.getElement('$attrs').getString('content')));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual("@Link str1: before");

      let strJson6 = inspector.getInspectorByKey('str2_tSon2');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[LinkSonJsunit_static_0400] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_static_0400] text: " + JSON.stringify(obj6.getElement('$attrs').getString('content')));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual("@Link str2: before");
      console.info('[LinkSonJsunit_static_0400] END');
      done();
    });

    /**
     * @tc.number   LinkSonJsunit_static_0500
     * @tc.name     LinkSonJsunit_static_0500
     * @tc.desc     LinkSonJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('LinkSonJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkSonJsunit_static_0500 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('num_son1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('num1_tSon1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LinkSonJsunit_static_0500] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_static_0500] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("@Link num1: 2");

      let strJson2 = inspector.getInspectorByKey('num_parText');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[LinkSonJsunit_static_0500] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_static_0500] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("Parent num: 2");

      let strJson3 = inspector.getInspectorByKey('num2_tSon2');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[LinkSonJsunit_static_0500] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_static_0500] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual("@Link num2: 2");

      let strJson4 = inspector.getInspectorByKey('str_parText');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[LinkSonJsunit_static_0500] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_static_0500] text: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual("Parent str: before");

      let strJson5 = inspector.getInspectorByKey('str1_tSon1');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[LinkSonJsunit_static_0500] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_static_0500] text: " + JSON.stringify(obj5.getElement('$attrs').getString('content')));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual("@Link str1: before");

      let strJson6 = inspector.getInspectorByKey('str2_tSon2');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[LinkSonJsunit_static_0500] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_static_0500] text: " + JSON.stringify(obj6.getElement('$attrs').getString('content')));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual("@Link str2: before");

      console.info('[LinkSonJsunit_static_0500] END');
      done();
    });

    /**
     * @tc.number   LinkSonJsunit_static_0600
     * @tc.name     LinkSonJsunit_static_0600
     * @tc.desc     LinkSonJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('LinkSonJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkSonJsunit_static_0600 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('num_son2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('num2_tSon2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LinkSonJsunit_static_0600] component obj1 is: " + JSON.stringify(obj1));
      console.info("[LinkSonJsunit_static_0600] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("@Link num2: 1");

      let strJson2 = inspector.getInspectorByKey('num1_tSon1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[LinkSonJsunit_static_0600] component obj2 is: " + JSON.stringify(obj2));
      console.info("[LinkSonJsunit_static_0600] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("@Link num1: 1");

      let strJson3 = inspector.getInspectorByKey('num_parText');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[LinkSonJsunit_static_0600] component obj3 is: " + JSON.stringify(obj3));
      console.info("[LinkSonJsunit_static_0600] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual("Parent num: 1");

      let strJson4 = inspector.getInspectorByKey('str_parText');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[LinkSonJsunit_static_0600] component obj4 is: " + JSON.stringify(obj4));
      console.info("[LinkSonJsunit_static_0600] text: " + JSON.stringify(obj4.getElement('$attrs').getString('content')));
      expect(obj4.getElement('$attrs').getString('content')).assertEqual("Parent str: before");

      let strJson5 = inspector.getInspectorByKey('str1_tSon1');
      let obj5 = JSON.parseJsonElement(strJson5);
      console.info("[LinkSonJsunit_static_0600] component obj5 is: " + JSON.stringify(obj5));
      console.info("[LinkSonJsunit_static_0600] text: " + JSON.stringify(obj5.getElement('$attrs').getString('content')));
      expect(obj5.getElement('$attrs').getString('content')).assertEqual("@Link str1: before");

      let strJson6 = inspector.getInspectorByKey('str2_tSon2');
      let obj6 = JSON.parseJsonElement(strJson6);
      console.info("[LinkSonJsunit_static_0600] component obj6 is: " + JSON.stringify(obj6));
      console.info("[LinkSonJsunit_static_0600] text: " + JSON.stringify(obj6.getElement('$attrs').getString('content')));
      expect(obj6.getElement('$attrs').getString('content')).assertEqual("@Link str2: before");

      console.info('[LinkSonJsunit_static_0600] END');
      done();
    });
  })
}

