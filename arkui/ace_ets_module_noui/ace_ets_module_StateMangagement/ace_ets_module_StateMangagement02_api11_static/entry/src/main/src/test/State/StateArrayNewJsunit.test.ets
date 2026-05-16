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


export default function StateArrayNewJsunit() {
  describe('StateArrayNewJsunit', () => {
    beforeAll(() => {
      console.info("StateArrayNewJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StateArrayNewJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StateArrayNew',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StateArrayNewJsunit state pages:" + JSON.stringify(pages));
        if (!("StateArrayNew" == pages.name)) {
          console.info("get StateArrayNewJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StateArrayNewJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StateArrayNewJsunit page error:" + err);
      }
      console.info("StateArrayNewJsunit beforeEach end");
    });

  
    /**
     * @tc.number   StateArrayNewJsunit_static_0200
     * @tc.name     StateArrayNewJsunit_static_0200
     * @tc.desc     StateArrayNewJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('StateArrayNewJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateArrayNewJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('every_Array'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('every_Array');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateArrayNewJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayNewJsunit_static_0200] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Click to every value to the array false');
      console.info('[StateArrayNewJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   StateArrayNewJsunit_static_0400
     * @tc.name     StateArrayNewJsunit_static_0400
     * @tc.desc     StateArrayNewJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('StateArrayNewJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateArrayNewJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('some_Array'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('some_Array');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateArrayNewJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayNewJsunit_static_0400] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Click to some value to the array false');
      console.info('[StateArrayNewJsunit_static_0400] END');
      done();
    });


    /**
     * @tc.number   StateArrayNewJsunit_static_0600
     * @tc.name     StateArrayNewJsunit_static_0600
     * @tc.desc     StateArrayNewJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('StateArrayNewJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateArrayNewJsunit_static_0600 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('filter_Array'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('filter_Array');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateArrayNewJsunit_static_0600] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayNewJsunit_static_0600] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("Click to filter value to the array exuberant,destruction,present");
      console.info('[StateArrayNewJsunit_static_0600] END');
      done();
    });


    /**
     * @tc.number   StateArrayNewJsunit_static_0800
     * @tc.name     StateArrayNewJsunit_static_0800
     * @tc.desc     StateArrayNewJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('StateArrayNewJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateArrayNewJsunit_static_0800 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('reduce_Array'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('reduce_Array');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateArrayNewJsunit_static_0800] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayNewJsunit_static_0800] ClassA: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Click to reduce value to the array 10');
      console.info('[StateArrayNewJsunit_static_0800] END');
      done();
    });

    /**
     * @tc.number   StateArrayNewJsunit1_static_1000
     * @tc.name     StateArrayNewJsunit1_static_1000
     * @tc.desc     StateArrayNewJsunit1_static_1000
     * @tc.level    Level.LEVEL0
     */
it('StateArrayNewJsunit1_static_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StateArrayNewJsunit1_static_1000 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('reduceRight_Array'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('reduceRight_Array');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[StateArrayNewJsunit1_static_1000] component obj is: " + JSON.stringify(obj));
      console.info("[StateArrayNewJsunit1_static_1000] ClassA: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Click to reduceRight value to the array 4,5,2,3,0,1');
      console.info('[StateArrayNewJsunit1_static_1000] END');
      done();
    });
  })
}

