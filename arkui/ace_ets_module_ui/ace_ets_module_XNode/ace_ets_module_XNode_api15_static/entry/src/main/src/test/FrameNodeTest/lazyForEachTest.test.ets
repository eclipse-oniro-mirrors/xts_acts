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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from "../../../../hypium"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import {UtilsTest,startAbility} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function lazyForEachTest() {
  describe('lazyForEachTest', () => {
    beforeAll(() => {
      console.info("lazyForEachTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.XNode.api15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async () => {
      console.info("lazyForEachTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FrameNode/lazyForEachTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        // let result = await router.replaceUrl(options);
        console.info("get lazyForEachTest state pages:" + JSON.stringify(pages));
        if (!("MainAbility/pages/FrameNode/lazyForEachTest" == pages.name)) {
          console.info("get lazyForEachTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push lazyForEachTest page error:" + err);
      }
      console.info("lazyForEachTest beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("lazyForEachTest after each called");
    });
    
    



    /**
     * @tc.number   lazyForEachTest_static_0100
     * @tc.name     lazyForEachTest_static_0100
     * @tc.desc     lazyForEachTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('lazyForEachTest_static_0100', Level.LEVEL0, async (done: ()=>void) => {

      console.info('lazyForEachTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      console.info('+++++++++++++++++++++1');
      let button = await driver.findComponent(ON.id('button_expand'));
  console.info('+++++++++++++++++++++2');
      await (button?.click() as Promise<void>);
  console.info('+++++++++++++++++++++3');
      await CommonFunc.sleep(1500);
      let strJson1: string = inspector.getInspectorByKey('getChildValue');
  console.info('+++++++++++++++++++++4');
      let strJson2: string = inspector.getInspectorByKey('getFirstChildIndexWithoutExpandValue');
  console.info('+++++++++++++++++++++5');
      let strJson3: string = inspector.getInspectorByKey('getLastChildIndexWithoutExpandValue');
  console.info('+++++++++++++++++++++6');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[lazyForEachTest_0100] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0100] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0100] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('LazyForEachListItem_TTT3');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('10');
      console.info('[lazyForEachTest_0100] END');
      done();
    });
    
    



    /**
     * @tc.number   lazyForEachTest_static_0200
     * @tc.name     lazyForEachTest_static_0200
     * @tc.desc     lazyForEachTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('lazyForEachTest_static_0200', Level.LEVEL0, async (done: ()=>void) => {

      console.info('lazyForEachTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_not_expand'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1: string = inspector.getInspectorByKey('getChildValue');
      let strJson2: string = inspector.getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = inspector.getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[lazyForEachTest_0200] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0200] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0200] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('LazyForEachListItem_TTT3');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[lazyForEachTest_0200] END');
      done();
    });
    
    



    /**
     * @tc.number   lazyForEachTest_static_0300
     * @tc.name     lazyForEachTest_static_0300
     * @tc.desc     lazyForEachTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('lazyForEachTest_static_0300', Level.LEVEL0, async (done: ()=>void) => {

      console.info('lazyForEachTest_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_lazy_expand'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1: string = inspector.getInspectorByKey('getChildValue');
      let strJson2: string = inspector.getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = inspector.getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[lazyForEachTest_0300] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0300] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0300] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('LazyForEachListItem_TTT3');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[lazyForEachTest_0300] END');
      done();
    });
    
    



    /**
     * @tc.number   lazyForEachTest_static_0400
     * @tc.name     lazyForEachTest_static_0400
     * @tc.desc     lazyForEachTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('lazyForEachTest_static_0400', Level.LEVEL0, async (done: ()=>void) => {

      console.info('lazyForEachTest_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_expand_null'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1: string = inspector.getInspectorByKey('getChildValue');
      let strJson2: string = inspector.getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = inspector.getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[lazyForEachTest_0400] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0400] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0400] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('LazyForEachListItem_TTT3');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('10');
      console.info('[lazyForEachTest_0400] END');
      done();
    });
    
    



    /**
     * @tc.number   lazyForEachTest_static_0500
     * @tc.name     lazyForEachTest_static_0500
     * @tc.desc     lazyForEachTest_static_0500
     * @tc.level    Level.LEVEL0
     */
it('lazyForEachTest_static_0500', Level.LEVEL0, async (done: ()=>void) => {

      console.info('lazyForEachTest_0500 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_expand_undefined'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1: string = inspector.getInspectorByKey('getChildValue');
      let strJson2: string = inspector.getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = inspector.getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[lazyForEachTest_0500] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0500] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0500] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('LazyForEachListItem_TTT3');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('10');
      console.info('[lazyForEachTest_0500] END');
      done();
    });
    
    



    /**
     * @tc.number   lazyForEachTest_static_0600
     * @tc.name     lazyForEachTest_static_0600
     * @tc.desc     lazyForEachTest_static_0600
     * @tc.level    Level.LEVEL0
     */
it('lazyForEachTest_static_0600', Level.LEVEL0, async (done: ()=>void) => {

      console.info('lazyForEachTest_0600 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_expand_out'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1: string = inspector.getInspectorByKey('getChildValue');
      let strJson2: string = inspector.getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = inspector.getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[lazyForEachTest_0600] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0600] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0600] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('undefined');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('10');
      console.info('[lazyForEachTest_0600] END');
      done();
    });
    
    



    /**
     * @tc.number   lazyForEachTest_static_0700
     * @tc.name     lazyForEachTest_static_0700
     * @tc.desc     lazyForEachTest_static_0700
     * @tc.level    Level.LEVEL0
     */
it('lazyForEachTest_static_0700', Level.LEVEL0, async (done: ()=>void) => {

      console.info('lazyForEachTest_0700 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_lazy_expand_out'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1: string = inspector.getInspectorByKey('getChildValue');
      let strJson2: string = inspector.getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = inspector.getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[lazyForEachTest_0700] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0700] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0700] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('undefined');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('10');
      console.info('[lazyForEachTest_0700] END');
      done();
    });
    
    



    /**
     * @tc.number   lazyForEachTest_static_0800
     * @tc.name     lazyForEachTest_static_0800
     * @tc.desc     lazyForEachTest_static_0800
     * @tc.level    Level.LEVEL0
     */
it('lazyForEachTest_static_0800', Level.LEVEL0, async (done: ()=>void) => {

      console.info('lazyForEachTest_0800 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('button_not_expand_out'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1: string = inspector.getInspectorByKey('getChildValue');
      let strJson2: string = inspector.getInspectorByKey('getFirstChildIndexWithoutExpandValue');
      let strJson3: string = inspector.getInspectorByKey('getLastChildIndexWithoutExpandValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      let obj2 = JSON.parseJsonElement(strJson2);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[lazyForEachTest_0800] content obj1 is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0800] content obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      console.info("[lazyForEachTest_0800] content obj3 is: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('undefined');
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('0');
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('3');
      console.info('[lazyForEachTest_0800] END');
      done();
    });
  })
}