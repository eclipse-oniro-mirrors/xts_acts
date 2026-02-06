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

export default function ConsumeArray() {
  describe('ConsumeArray', () => {

    beforeAll(() => {
      console.info("ConsumeArray beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement01.api11.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("ConsumeArray beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/@state/ConsumeArray',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ConsumeArray state pages:" + JSON.stringify(pages));
        if (!("ConsumeArray" == pages.name)) {
          console.info("get ConsumeArray pages.name:" + JSON.stringify(pages.name));
          //let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ConsumeArray page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ConsumeArray page error:" + err);
      }
      console.info("ConsumeArray beforeEach end");
    });

      
    
/**
     * @tc.number   ConsumeArray_static_0100
     * @tc.name     ConsumeArray_static_0100
     * @tc.desc     ConsumeArray_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ConsumeArray_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ConsumeArray_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state1'));
      await (button?.click() as Promise<void>) ;
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ConsumeArray');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ConsumeArray_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeArray_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Array]" number is [10]');
      console.info('[ConsumeArray_static_0100] END');
      done();
    });
    
    
/**
     * @tc.number   ConsumeArray_static_0200
     * @tc.name     ConsumeArray_static_0200
     * @tc.desc     ConsumeArray_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ConsumeArray_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ConsumeArray_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state2'));
      await (button?.click() as Promise<void>) ;
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ConsumeArray');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ConsumeArray_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeArray_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Array]" number is [true]');
      console.info('[ConsumeArray_static_0100] END');
      done();
    });
    
    
/**
     * @tc.number   ConsumeArray_static_0300
     * @tc.name     ConsumeArray_static_0300
     * @tc.desc     ConsumeArray_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ConsumeArray_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ConsumeArray_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state3'));
      await (button?.click() as Promise<void>) ;
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ConsumeArray');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ConsumeArray_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeArray_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Boolean]" number is true');
      console.info('[ConsumeArray_static_0100] END');
      done();
    });
    
    
/**
     * @tc.number   ConsumeArray_static_0400
     * @tc.name     ConsumeArray_static_0400
     * @tc.desc     ConsumeArray_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ConsumeArray_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ConsumeArray_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('state4'));
      await (button?.click() as Promise<void>) ;
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ConsumeArrayNew');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ConsumeArray_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ConsumeArray_static_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Array]" number is 200');
      console.info('[ConsumeArray_static_0100] END');
      done();
    });

  })
}

