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


export default function CombinationState2Jsunit() {
  describe('CombinationState2Jsunit', () => {
    beforeAll(() => {
      console.info("CombinationState2Jsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("CombinationState2Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/CombinationState2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CombinationState2Jsunit state pages:" + JSON.stringify(pages));
        if (!("CombinationState2" == pages.name)) {
          console.info("get CombinationState2Jsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CombinationState2Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CombinationState2Jsunit page error:" + err);
      }
      console.info("CombinationState2Jsunit beforeEach end");
    });

  

    /**
     * @tc.number   CombinationState2Jsunit_static_0100
     * @tc.name     CombinationState2Jsunit_static_0100
     * @tc.desc     CombinationState2Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('CombinationState2Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      console.info('[CombinationState2Jsunit_static_0100] START');
      let strJson: string = inspector.getInspectorByKey('PropLink1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState2Jsunit_static_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PropLink:1');
      console.info('[CombinationState2Jsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   CombinationState2Jsunit_static_0200
     * @tc.name     CombinationState2Jsunit_static_0200
     * @tc.desc     CombinationState2Jsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('CombinationState2Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      let strJson1 = inspector.getInspectorByKey('PropLink47');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[CombinationState2Jsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('PropLink:47');
      console.info('[CombinationState2Jsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   CombinationState2Jsunit_static_0300
     * @tc.name     CombinationState2Jsunit_static_0300
     * @tc.desc     CombinationState2Jsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('CombinationState2Jsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      let strJson2 = inspector.getInspectorByKey('ChildLink47');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[CombinationState2Jsunit_static_0300] component obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('ChildLink: 47');
      console.info('[CombinationState2Jsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   CombinationState2Jsunit_static_0400
     * @tc.name     CombinationState2Jsunit_static_0400
     * @tc.desc     CombinationState2Jsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('CombinationState2Jsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      let strJson3 = inspector.getInspectorByKey('PropLink7');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[CombinationState2Jsunit_static_0400] component obj3 is: " + JSON.stringify(obj3));
      await CommonFunc.sleep(1000);
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('PropLink:7');
      console.info('[CombinationState2Jsunit_static_0400] END');
      done();
    });

    /**
     * @tc.number   CombinationState2Jsunit_static_0500
     * @tc.name     CombinationState2Jsunit_static_0500
     * @tc.desc     CombinationState2Jsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('CombinationState2Jsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Get the information of the State component
      let strJson4 = inspector.getInspectorByKey('ChildLink7');
      let obj4 = JSON.parseJsonElement(strJson4);
      console.info("[CombinationState2Jsunit_static_0500] component obj4 is: " + JSON.stringify(obj4));
      await CommonFunc.sleep(1000);
      expect(obj4.getElement('$attrs').getString('content')).assertEqual('ChildLink: 7');
      console.info('[CombinationState2Jsunit_static_0500] END');
      done();
    });

    /**
     * @tc.number   CombinationState2Jsunit_static_0600
     * @tc.name     CombinationState2Jsunit_static_0600
     * @tc.desc     CombinationState2Jsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('CombinationState2Jsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Click and get the value of State component
      console.info('[CombinationState2Jsunit_static_0600] START');
      let driver = Driver.create()
      let qrComponent = await driver.findComponent(ON.id('PropLink1'));
      await (qrComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('PropLink2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState2Jsunit_static_0200] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PropLink:2');
      console.info('[CombinationState2Jsunit_static_0600] END');
      done();
    });

    /**
     * @tc.number   CombinationState2Jsunit_static_0700
     * @tc.name     CombinationState2Jsunit_static_0700
     * @tc.desc     CombinationState2Jsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('CombinationState2Jsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Click and get the value of State component
      console.info('[CombinationState2Jsunit_static_0700] START');
      let driver = Driver.create()
      let qrComponent = await driver.findComponent(ON.id('PropLink47'));
      await (qrComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('PropLink48');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState2Jsunit_static_0700] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PropLink:48');
      console.info('[CombinationState2Jsunit_static_0700] END');
      done();
    });

    /**
     * @tc.number   CombinationState2Jsunit_static_0800
     * @tc.name     CombinationState2Jsunit_static_0800
     * @tc.desc     CombinationState2Jsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('CombinationState2Jsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Click and get the value of State component
      console.info('[CombinationState2Jsunit_static_0800] START');
      let driver = Driver.create()
      let qrComponent = await driver.findComponent(ON.id('PropLink7'));
      await (qrComponent?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('PropLink8');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[CombinationState2Jsunit_static_0800] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('PropLink:8');
      console.info('[CombinationState2Jsunit_static_0800] END');
      done();
    });
  })
}
