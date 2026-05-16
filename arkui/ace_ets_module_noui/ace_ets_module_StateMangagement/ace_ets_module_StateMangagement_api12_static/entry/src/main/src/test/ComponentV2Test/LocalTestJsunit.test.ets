'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
export default function LocalTestJsunit() {
  describe('LocalTestJsunit', () => {
    beforeAll(() => {
      console.info("LocalTestJsunit beforeEach start");


      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api12.static", "EntryAbility");

    });

    beforeEach(async (): Promise<void> => {
      console.info("LocalTestJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ComponentV2/LocalTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        //routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LocalTestJsunit state pages:" + JSON.stringify(pages));
        if (!("LocalTest" == pages.name)) {
          console.info("get LocalTestJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push LocalTestJsunit page error:" + err);
      }
      console.info("LocalTestJsunit beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("LocalTestJsunit after each called");
    });


    
    
    /**
     * @tc.number   LocalTestJsunit_static_001
     * @tc.name     LocalTestJsunit_static_001
     * @tc.desc     LocalTestJsunit_static_001
     * @tc.level    Level.LEVEL0
     */
it('LocalTestJsunit_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalTestJsunit_static_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("tvParamMsg"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvParamMsg');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LocalTestJsunit_static_001] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('ARKUI');
      console.info('[LocalTestJsunit_static_001] END');
      done();
    });

    
    
    /**
     * @tc.number   LocalTestJsunit_static_002
     * @tc.name     LocalTestJsunit_static_002
     * @tc.desc     LocalTestJsunit_static_002
     * @tc.level    Level.LEVEL0
     */
it('LocalTestJsunit_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalTestJsunit_static_002] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("countJoint"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('countJoint');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LocalTestJsunit_static_002] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('1');
      console.info('[LocalTestJsunit_static_002] END');
      done();
    });
    
    
    /**
     * @tc.number   LocalTestJsunit_static_003
     * @tc.name     LocalTestJsunit_static_003
     * @tc.desc     LocalTestJsunit_static_003
     * @tc.level    Level.LEVEL0
     */
it('LocalTestJsunit_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalTestJsunit_static_003] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("tvArr"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvArr');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LocalTestJsunit_static_003] component obj arr is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('tvArr');
      await CommonFunc.sleep(1000);
      let btn1: Component|null = await driver.findComponent(ON.id("tvDate"));
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('tvDate');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalTestJsunit_static_003] component obj date is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Tue Jan 02 2024');
      await CommonFunc.sleep(1000);
      let btn2: Component|null = await driver.findComponent(ON.id("tvMap"));
      await CommonFunc.sleep(1000);
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('tvMap');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[LocalTestJsunit_static_003] component obj map is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('2');
      await CommonFunc.sleep(1000);
      let btn3: Component|null = await driver.findComponent(ON.id("tvSet"));
      await CommonFunc.sleep(1000);
      await (btn3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('tvSet');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[LocalTestJsunit_static_003] component obj set is: " + JSON.stringify(obj3));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('1,2,3');
      console.info('[LocalTestJsunit_static_003] END');
      done();
    });
    
    
    /**
     * @tc.number   LocalTestJsunit_static_004
     * @tc.name     LocalTestJsunit_static_004
     * @tc.desc     LocalTestJsunit_static_004
     * @tc.level    Level.LEVEL0
     */
it('LocalTestJsunit_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalTestJsunit_static_004] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("tvCount"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvCount');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LocalTestJsunit_static_004] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('2');
      console.info('[LocalTestJsunit_static_004] END');
      done();
    });
    
    
    /**
     * @tc.number   LocalTestJsunit_static_005
     * @tc.name     LocalTestJsunit_static_005
     * @tc.desc     LocalTestJsunit_static_005
     * @tc.level    Level.LEVEL0
     */
it('LocalTestJsunit_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalTestJsunit_static_005] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("tvTraceName"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvTraceName');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LocalTestJsunit_static_005] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('tvTraceName');
      console.info('[LocalTestJsunit_static_005] END');
      done();
    });
    
    
    /**
     * @tc.number   LocalTestJsunit_static_006
     * @tc.name     LocalTestJsunit_static_006
     * @tc.desc     LocalTestJsunit_static_006
     * @tc.level    Level.LEVEL0
     */
it('LocalTestJsunit_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalTestJsunit_static_006] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component|null = await driver.findComponent(ON.id("tvAddItem"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tvAddItem');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LocalTestJsunit_static_006] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('3');

      await CommonFunc.sleep(1000);
      let btn1: Component|null = await driver.findComponent(ON.id("tvRemoveItem"));
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('tvRemoveItem');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalTestJsunit_static_006] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('2');
      console.info('[LocalTestJsunit_static_006] END');
      done();
    });
  })
}
