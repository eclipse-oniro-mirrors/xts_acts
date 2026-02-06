'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Component, Point } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
// import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function parentX_parentY_strategy_Test() {
  describe('parentX_parentY_strategy_Test', () => {
    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");

      await UtilsTest.startAbility("com.arkui.ace.commonEvents.nowear.api11.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onChildTouchTest/parentX',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get parentX_parentY_strategy_Test state pages:" + JSON.stringify(pages));
        if (!("parentX" == pages.name)) {
          console.info("get WaterFlow_WaterFlow pages.name:" + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push parentX_parentY_strategy_Test page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push parentX_parentY_strategy_Test page error:" + err);
      }
      console.info("parentX_parentY_strategy_Test beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("parentX_parentY_strategy_Test after each called");
    });
    
    
    
/**
     * @tc.number   parentX_parentY_strategy_Test_static_0100
     * @tc.name     parentX_parentY_strategy_Test_static_0100
     * @tc.desc     parentX_parentY_strategy_Test_static_0100
     * @tc.level    Level.LEVEL0
     */
it('parentX_parentY_strategy_Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[parentX_parentY_strategy_Test_static_0100] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let row: Component|null = await driver.findComponent(ON.id('row'));
      if (row != null && row != undefined) {
        let point: Point = await (row.getBoundsCenter() as Promise<Point>);
        await CommonFunc.sleep(1000);
        await (driver?.click(Math.round(point.x as number) as Int, Math.round(point.y as number) as Int) as Promise<void>)
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('parentX');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[parentX_parentY_strategy_Test_static_0100] component obj is: " + JSON.stringify(obj));
        console.info("[parentX_parentY_strategy_Test_static_0100] content obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(Math.abs(Math.abs(Number(obj.getElement('$attrs').getString('content'))) - 200) <= 1).assertTrue();
        console.info('[parentX_parentY_strategy_Test_static_0100] END');
        await CommonFunc.sleep(1000);
      }
      done();
    });
    
    
    
/**
     * @tc.number   parentX_parentY_strategy_Test_static_0200
     * @tc.name     parentX_parentY_strategy_Test_static_0200
     * @tc.desc     parentX_parentY_strategy_Test_static_0200
     * @tc.level    Level.LEVEL0
     */
it('parentX_parentY_strategy_Test_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[parentX_parentY_strategy_Test_static_0200] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let row: Component|null = await driver.findComponent(ON.id('row'));
      if (row != null && row != undefined) {
        let point: Point = await (row.getBoundsCenter() as Promise<Point>);
        await CommonFunc.sleep(1000);
        await (driver?.click(Math.round(point.x) as Int, Math.round(point.y) as Int) as Promise<void>)
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('parentY');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[parentX_parentY_strategy_Test_static_0200] component obj is: " + JSON.stringify(obj));
        console.info("[parentX_parentY_strategy_Test_static_0200] contentY is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(Math.abs(Math.abs(Number(obj.getElement('$attrs').getString('content'))) - 200) <= 1).assertTrue();
        await CommonFunc.sleep(1000);
      }
      done();
    });
    
    
    
/**
     * @tc.number   parentX_parentY_strategy_Test_static_0300
     * @tc.name     parentX_parentY_strategy_Test_static_0300
     * @tc.desc     parentX_parentY_strategy_Test_static_0300
     * @tc.level    Level.LEVEL0
     */
it('parentX_parentY_strategy_Test_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[parentX_parentY_strategy_Test_static_0300] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let row: Component|null = await driver.findComponent(ON.id('row'));
      if (row != null && row != undefined) {
        let point: Point = await (row.getBoundsCenter() as Promise<Point>);
        await CommonFunc.sleep(1000);
        await (driver?.click(Math.round(point.x) as Int, Math.round(point.y) as Int) as Promise<void>)
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('strategy_DEFAULT');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[parentX_parentY_strategy_Test_static_0300] component obj is: " + JSON.stringify(obj));
        console.info("[parentX_parentY_strategy_Test_static_0300] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(Math.abs(Number(obj.getElement('$attrs').getString('content'))) <= 1).assertTrue();
        console.info('[parentX_parentY_strategy_Test_static_0300] END');
        await CommonFunc.sleep(1000);
      }
      done();
    });
    
    
    
/**
     * @tc.number   parentX_parentY_strategy_Test_static_0400
     * @tc.name     parentX_parentY_strategy_Test_static_0400
     * @tc.desc     parentX_parentY_strategy_Test_static_0400
     * @tc.level    Level.LEVEL0
     */
it('parentX_parentY_strategy_Test_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[parentX_parentY_strategy_Test_static_0400] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let row: Component|null = await driver.findComponent(ON.id('row'));
      if (row != null && row != undefined) {
        let point: Point = await (row.getBoundsCenter() as Promise<Point>);
        await CommonFunc.sleep(1000);
        await (driver?.click(Math.round(point.x) as Int, Math.round(point.y) as Int) as Promise<void>)
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('strategy_FORWARD_COMPETITION');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[parentX_parentY_strategy_Test_static_0400] component obj is: " + JSON.stringify(obj));
        console.info("[parentX_parentY_strategy_Test_static_0400] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(Math.abs(Math.abs(Number(obj.getElement('$attrs').getString('content'))) - 1) <= 1).assertTrue();
        console.info('[parentX_parentY_strategy_Test_static_0400] END');
        await CommonFunc.sleep(1000);
      }
      done();
    });
    
    
    
/**
     * @tc.number   parentX_parentY_strategy_Test_static_0500
     * @tc.name     parentX_parentY_strategy_Test_static_0500
     * @tc.desc     parentX_parentY_strategy_Test_static_0500
     * @tc.level    Level.LEVEL0
     */
it('parentX_parentY_strategy_Test_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[parentX_parentY_strategy_Test_static_0500] START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let row: Component|null = await driver.findComponent(ON.id('row'));
      if (row != null && row != undefined) {
        let point: Point = await (row.getBoundsCenter() as Promise<Point>);
        await CommonFunc.sleep(1000);
        await (driver?.click(Math.round(point.x) as Int, Math.round(point.y) as Int) as Promise<void>)
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('strategy_FORWARD');
        let obj = JSON.parseJsonElement(strJson);
        console.info("[parentX_parentY_strategy_Test_static_0500] component obj is: " + JSON.stringify(obj));
        console.info("[parentX_parentY_strategy_Test_static_0500] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
        expect(Math.abs(Math.abs(Number(obj.getElement('$attrs').getString('content'))) - 2) <= 1).assertTrue();
        console.info('[parentX_parentY_strategy_Test_static_0500] END');
        await CommonFunc.sleep(1000);
      }
      done();
    });
  })
}
