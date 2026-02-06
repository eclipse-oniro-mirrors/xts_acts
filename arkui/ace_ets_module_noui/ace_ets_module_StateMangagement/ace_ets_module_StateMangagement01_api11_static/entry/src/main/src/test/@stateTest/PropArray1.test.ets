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
import router from '@ohos.router';
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

export default function PropArray1() {
  describe('PropArray1', () => {
    beforeAll(() => {
      console.info("LinkNumber beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement01.api11.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("LinkNumber beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/@state/PropArray1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LinkNumber state pages:" + JSON.stringify(pages));
        if (!("PropArray1" == pages.name)) {
          console.info("get LinkNumber pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push LinkNumber page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkNumber page error:" + err);
      }
      console.info("LinkNumber beforeEach end");
    });


    
    
/**
     * @tc.number   PropArray_static_0500
     * @tc.name     PropArray_static_0500
     * @tc.desc     PropArray_static_0500
     * @tc.level    Level.LEVEL0
     */
it('PropArray_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PropArray_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state5'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PropArray1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropArray_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropArray_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Array]" number is [10]');
      console.info('[PropArray_static_0100] END');
      done();
    });
    
    
/**
     * @tc.number   PropArray_static_0600
     * @tc.name     PropArray_static_0600
     * @tc.desc     PropArray_static_0600
     * @tc.level    Level.LEVEL0
     */
it('PropArray_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PropArray_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state6'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PropArray1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropArray_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropArray_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Date]" number is "2021-08-08T00:00:00.000Z"');
      console.info('[PropArray_static_0100] END');
      done();
    });
    
    
/**
     * @tc.number   PropArray_static_0700
     * @tc.name     PropArray_static_0700
     * @tc.desc     PropArray_static_0700
     * @tc.level    Level.LEVEL0
     */
it('PropArray_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PropArray_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state7'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PropArray1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropArray_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropArray_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Array]" number is ["20"]');
      console.info('[PropArray_static_0100] END');
      done();
    });
    
    
/**
     * @tc.number   PropArray_static_0800
     * @tc.name     PropArray_static_0800
     * @tc.desc     PropArray_static_0800
     * @tc.level    Level.LEVEL0
     */
it('PropArray_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PropArray_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state8'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PropArray1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[PropArray_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[PropArray_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Array]" number is [{"number":30}]');
      console.info('[PropArray_static_0100] END');
      done();
    });
    
    
/**
     * @tc.number   PropArray_static_0900
     * @tc.name     PropArray_static_0900
     * @tc.desc     PropArray_static_0900
     * @tc.level    Level.LEVEL0
     */
it('PropArray_static_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('StateArray_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state9'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('PropArray1New');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[StateArray_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Array]" number is 200');
      console.info('[StateArray_0100] END');
      done();
    });

  })
}

