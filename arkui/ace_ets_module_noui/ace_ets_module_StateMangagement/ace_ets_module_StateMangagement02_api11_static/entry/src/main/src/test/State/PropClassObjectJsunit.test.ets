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


export default function PropClassObjectJsunit() {
  describe('PropClassObjectJsunit', () => {
    beforeAll(() => {
      console.info("PropClassObjectJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("PropClassObjectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/PropClassObject',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PropClassObjectJsunit state pages:" + JSON.stringify(pages));
        if (!("PropClassObject" == pages.name)) {
          console.info("get PropClassObjectJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PropClassObjectJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropClassObjectJsunit page error:" + err);
      }
      console.info("PropClassObjectJsunit beforeEach end");
    });

  

    /**
     * @tc.number   PropClassObjectJsunit_static_0100
     * @tc.name     PropClassObjectJsunit_static_0100
     * @tc.desc     PropClassObjectJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PropClassObjectJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropClassObjectJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('sub_prop_AA');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropClassObjectJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropClassObjectJsunit_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("子组件Prop:Hello");
      console.info('[PropClassObjectJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   PropClassObjectJsunit_static_0200
     * @tc.name     PropClassObjectJsunit_static_0200
     * @tc.desc     PropClassObjectJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('PropClassObjectJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropClassObjectJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('sub_prop_A'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sub_prop_AA');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropClassObjectJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[PropClassObjectJsunit_static_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("子组件Prop:World");
      console.info('[PropClassObjectJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   PropClassObjectJsunit_static_0300
     * @tc.name     PropClassObjectJsunit_static_0300
     * @tc.desc     PropClassObjectJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('PropClassObjectJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropClassObjectJsunit_static_0300 START');
      let strJson = inspector.getInspectorByKey('prop_Object_AA');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropClassObjectJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[PropClassObjectJsunit_static_0300] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Click to change Class or Object: World");
      console.info('[PropClassObjectJsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   PropClassObjectJsunit_static_0400
     * @tc.name     PropClassObjectJsunit_static_0400
     * @tc.desc     PropClassObjectJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('PropClassObjectJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropClassObjectJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('prop_Object_A'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('prop_Object_AA');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropClassObjectJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[PropClassObjectJsunit_static_0400] name: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Click to change Class or Object: Hi");
      console.info('[PropClassObjectJsunit_static_0400] END');
      done();
    });
  })
}

