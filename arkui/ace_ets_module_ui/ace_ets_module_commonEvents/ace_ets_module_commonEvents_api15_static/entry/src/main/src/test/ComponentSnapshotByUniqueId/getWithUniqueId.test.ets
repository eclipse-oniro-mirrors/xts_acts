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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function defaultFocus() {

  describe('getWithUniqueId', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ComponentSnapshotByUniqueId/getWithUniqueId',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get getWithUniqueId state pages: " + JSON.stringify(pages));
        if (!("getWithUniqueId" == pages.name)) {
          console.info("get getWithUniqueId state pages.name: 11111 ");
          routerInstance.replaceUrl(options);
          console.info("get getWithUniqueId state pages.name: 22222");
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push getWithUniqueId page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("defaultFocus after each called");
    });

    
    
/**
     * @tc.number   getWithUniqueId_static_0001
     * @tc.name     getWithUniqueId_static_0001
     * @tc.desc     getWithUniqueId_static_0001
     * @tc.level    Level.LEVEL0
     */
it('getWithUniqueId_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getWithUniqueId_static_0001 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('resultText');
      await CommonFunc.sleep(2000);
      console.info("[getWithUniqueId_static_0001] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[getWithUniqueId_static_0001] content is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));

      let snapshotScaleButton = await driver.findComponent(ON.id('snapshotScale'));
      await CommonFunc.sleep(2000);
      await (snapshotScaleButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let snapshotButton = await driver.findComponent(ON.id('UniqueId_getSnapshot'));
      await CommonFunc.sleep(1000);
      await (snapshotButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('resultText');
      await CommonFunc.sleep(2000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('UniqueId_getSnapshot_success');
      await CommonFunc.sleep(1000);
      console.info('[getWithUniqueId_static_0001] END');
      done();
    });

    
    
/**
     * @tc.number   getWithUniqueId_static_0002
     * @tc.name     getWithUniqueId_static_0002
     * @tc.desc     getWithUniqueId_static_0002
     * @tc.level    Level.LEVEL0
     */
it('getWithUniqueId_static_0002', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getWithUniqueId_static_0002 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('resultText');
      await CommonFunc.sleep(2000);
      console.info("[getWithUniqueId_static_0002] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[getWithUniqueId_static_0002] content is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));

      let snapshotButton = await driver.findComponent(ON.id('UniqueId_getSyncSnapshot'));
      await (snapshotButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('resultText');
      await CommonFunc.sleep(2000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('UniqueId_getSyncSnapshot_success');
      await CommonFunc.sleep(1000);
      console.info('[getWithUniqueId_static_0002] END');
      done();
    });


    
    
/**
     * @tc.number   getWithUniqueId_static_0003
     * @tc.name     getWithUniqueId_static_0003
     * @tc.desc     getWithUniqueId_static_0003
     * @tc.level    Level.LEVEL0
     */
it('getWithUniqueId_static_0003', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getWithUniqueId_static_0003 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('resultText');
      await CommonFunc.sleep(2000);
      console.info("[getWithUniqueId_static_0003] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[getWithUniqueId_static_0003] content is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));

      let snapshotWaitButton = await driver.findComponent(ON.id('snapshotWait'));
      await CommonFunc.sleep(2000);
      await (snapshotWaitButton?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let snapshotButton = await driver.findComponent(ON.id('UniqueId_getSnapshot'));
      await CommonFunc.sleep(2000);
      await (snapshotButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('resultText');
      await CommonFunc.sleep(2000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('UniqueId_getSnapshot_success');
      await CommonFunc.sleep(1000);
      console.info('[getWithUniqueId_static_0003] END');
      done();
    });


    
    
/**
     * @tc.number   getWithUniqueId_static_0004
     * @tc.name     getWithUniqueId_static_0004
     * @tc.desc     getWithUniqueId_static_0004
     * @tc.level    Level.LEVEL0
     */
it('getWithUniqueId_static_0004', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('getWithUniqueId_static_0004 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('resultText');
      await CommonFunc.sleep(1000);
      console.info("[getWithUniqueId_static_0004] attrs is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[getWithUniqueId_static_0004] content is: " +
      JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')));

      let snapshotButton = await driver.findComponent(ON.id('UniqueId_getSyncSnapshot'));
      await (snapshotButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJson = inspector.getInspectorByKey('resultText');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))
        .assertEqual('UniqueId_getSyncSnapshot_success');
      await CommonFunc.sleep(1000);
      console.info('[getWithUniqueId_static_0004] END');
      done();
    });

  })
}