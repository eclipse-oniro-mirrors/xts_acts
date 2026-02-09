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


export default function PropArrayJsunit() {
  describe('PropArrayJsunit', () => {
    beforeAll(() => {
      console.info("PropArrayJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("PropArrayJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/PropArray',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get PropArrayJsunit state pages:" + JSON.stringify(pages));
        if (!("PropArray" == pages.name)) {
          console.info("get PropArrayJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push PropArrayJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push PropArrayJsunit page error:" + err);
      }
      console.info("PropArrayJsunit beforeEach end");
    });

  
    /**
     * @tc.number   PropArrayJsunit_static_0100
     * @tc.name     PropArrayJsunit_static_0100
     * @tc.desc     PropArrayJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PropArrayJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropArrayJsunit_static_0100 START');
      let strJson = inspector.getInspectorByKey('initial_Array');
       let obj = JSON.parseJsonElement(strJson);
       console.info("[PropArrayJsunit_static_0100] component obj is: " + JSON.stringify(obj));
       console.info("[PropArrayJsunit_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
       expect(obj.getElement('$attrs').getString('content')).assertEqual('title：[{"value":1},{"value":2},{"value":3}]');
      console.info('[PropArrayJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   PropArrayJsunit_static_0200
     * @tc.name     PropArrayJsunit_static_0200
     * @tc.desc     PropArrayJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('PropArrayJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropArrayJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('parent_Array'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('initial_Array');
       let obj = JSON.parseJsonElement(strJson);
       console.info("[PropArrayJsunit_static_0200] component obj is: " + JSON.stringify(obj));
       console.info("[PropArrayJsunit_static_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
       expect(obj.getElement('$attrs').getString('content')).assertEqual('title：[{"value":8},{"value":2},{"value":3}]');
      console.info('[PropArrayJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   PropArrayJsunit_static_0300
     * @tc.name     PropArrayJsunit_static_0300
     * @tc.desc     PropArrayJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('PropArrayJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropArrayJsunit_static_0300 START');
      let strJson = inspector.getInspectorByKey('sub_prop');
       let obj = JSON.parseJsonElement(strJson);
       console.info("[PropArrayJsunit_static_0300] component obj is: " + JSON.stringify(obj));
       console.info("[PropArrayJsunit_static_0300] title: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
       expect(obj.getElement('$attrs').getString('label')).assertEqual('子组件Prop:[{"value":8},{"value":2},{"value":3}]');
      done();
    });

    /**
     * @tc.number   PropArrayJsunit_static_0400
     * @tc.name     PropArrayJsunit_static_0400
     * @tc.desc     PropArrayJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('PropArrayJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('PropArrayJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('sub_prop'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sub_prop');
       let obj = JSON.parseJsonElement(strJson);
       console.info("[PropArrayJsunit_static_0400] component obj is: " + JSON.stringify(obj));
       console.info("[PropArrayJsunit_static_0400] title: " + JSON.stringify(obj.getElement('$attrs').getString('label')));
       expect(obj.getElement('$attrs').getString('label')).assertEqual('子组件Prop:[{"value":7},{"value":2},{"value":3}]');
      console.info('[PropArrayJsunit_static_0400] END');
      done();
    });
  })
}

