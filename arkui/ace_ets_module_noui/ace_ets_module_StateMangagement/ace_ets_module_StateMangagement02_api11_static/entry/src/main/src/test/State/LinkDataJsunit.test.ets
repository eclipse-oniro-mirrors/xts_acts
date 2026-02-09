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


export default function LinkDataJsunit() {
  describe('LinkDataJsunit', () => {
    beforeAll(() => {
      console.info("LinkDataJsunit beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("LinkDataJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/LinkData',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LinkDataJsunit state pages:" + JSON.stringify(pages));
        if (!("LinkData" == pages.name)) {
          console.info("get LinkDataJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push LinkDataJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkDataJsunit page error:" + err);
      }
      console.info("LinkDataJsunit beforeEach end");
    });

  

    /**
     * @tc.number   LinkDataJsunit_static_0100
     * @tc.name     LinkDataJsunit_static_0100
     * @tc.desc     LinkDataJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('link_str');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_static_0100] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("string: hello");
      console.info('[LinkDataJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit_static_0200
     * @tc.name     LinkDataJsunit_static_0200
     * @tc.desc     LinkDataJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('strBtn_link'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('link_str');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_static_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("string: harmony");
      console.info('[LinkDataJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit_static_0300
     * @tc.name     LinkDataJsunit_static_0300
     * @tc.desc     LinkDataJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit_static_0300 START');
      let strJson = inspector.getInspectorByKey('link_num');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_static_0300] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("number: 0");
      console.info('[LinkDataJsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit_static_0400
     * @tc.name     LinkDataJsunit_static_0400
     * @tc.desc     LinkDataJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('numBtn_link'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('link_num');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_static_0400] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("number: 1");
      console.info('[LinkDataJsunit_static_0400] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit_static_0500
     * @tc.name     LinkDataJsunit_static_0500
     * @tc.desc     LinkDataJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit_static_0500 START');
      let strJson = inspector.getInspectorByKey('link_bon');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit_static_0500] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_static_0500] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("boolean: true");
      console.info('[LinkDataJsunit_static_0500] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit_static_0600
     * @tc.name     LinkDataJsunit_static_0600
     * @tc.desc     LinkDataJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit_static_0600 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('bonBtn_link'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('link_bon');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_static_0600] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("boolean: false");
      console.info('[LinkDataJsunit_static_0600] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit_static_0700
     * @tc.name     LinkDataJsunit_static_0700
     * @tc.desc     LinkDataJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit_static_0700 START');
      let strJson = inspector.getInspectorByKey('link_enum');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit_static_0700] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_static_0700] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("enum: 1");
      console.info('[LinkDataJsunit_static_0700] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit_static_0800
     * @tc.name     LinkDataJsunit_static_0800
     * @tc.desc     LinkDataJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit_static_0800 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('enumBtn_link'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('link_enum');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit_static_0800] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_static_0800] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("enum: 2");
      console.info('[LinkDataJsunit_static_0800] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit_static_0900
     * @tc.name     LinkDataJsunit_static_0900
     * @tc.desc     LinkDataJsunit_static_0900
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit_static_0900 START');
      let strJson = inspector.getInspectorByKey('link_cla');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit_static_0900] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit_static_0900] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("class: Hello World");
      console.info('[LinkDataJsunit_static_0900] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit1_static_1000
     * @tc.name     LinkDataJsunit1_static_1000
     * @tc.desc     LinkDataJsunit1_static_1000
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit1_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit1_static_1000 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('claBtn_link'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('link_cla');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit1_static_1000] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit1_static_1000] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("class: Hi ArkUI");
      console.info('[LinkDataJsunit1_static_1000] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit1_static_1100
     * @tc.name     LinkDataJsunit1_static_1100
     * @tc.desc     LinkDataJsunit1_static_1100
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit1_static_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit1_static_1100 START');
      let strJson = inspector.getInspectorByKey('link_strArr');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit1_static_1100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit1_static_1100] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("array: First,Second,Third");
      console.info('[LinkDataJsunit1_static_1100] END');
      done();
    });

    /**
     * @tc.number   LinkDataJsunit1_static_1200
     * @tc.name     LinkDataJsunit1_static_1200
     * @tc.desc     LinkDataJsunit1_static_1200
     * @tc.level    Level.LEVEL0
     */
it('LinkDataJsunit1_static_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('LinkDataJsunit1_static_1200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('sArrBtn_link'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('link_strArr');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkDataJsunit1_static_1200] component obj is: " + JSON.stringify(obj));
      console.info("[LinkDataJsunit1_static_1200] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("array: A,B,C");
      console.info('[LinkDataJsunit1_static_1200] END');
      done();
    });
  })
}

