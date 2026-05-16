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


export default function ObjectLinkFarJsunit() {
  describe('ObjectLinkFarJsunit', () => {
    beforeAll(() => {
      console.info("ObjectLinkFarJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ObjectLinkFarJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkFar',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ObjectLinkFarJsunit state pages:" + JSON.stringify(pages));
        if (!("ObjectLinkFar" == pages.name)) {
          console.info("get ObjectLinkFarJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ObjectLinkFarJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkFarJsunit page error:" + err);
      }
      console.info("ObjectLinkFarJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ObjectLinkFarClassAAA_reset'));
      await (button?.click() as Promise<void>);
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

    /**
     * @tc.number   ObjectLinkFarJsunit_static_0100
     * @tc.name     ObjectLinkFarJsunit_static_0100
     * @tc.desc     ObjectLinkFarJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkFarJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkFarJsunit_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('farClassAAA'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('farClassAAA');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ObjectLinkFarJsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkFarJsunit_static_0100] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("ClassAAA的numA值: 1");

      let strJson2 = inspector.getInspectorByKey('sonClassBBB');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ObjectLinkFarJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkFarJsunit_static_0100] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("ClassBBB的numB值: 5");

      console.info('[ObjectLinkFarJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkFarJsunit_static_0200
     * @tc.name     ObjectLinkFarJsunit_static_0200
     * @tc.desc     ObjectLinkFarJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkFarJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkFarJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('farClassBBB'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('farClassBBB');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ObjectLinkFarJsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkFarJsunit_static_0200] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("ClassAAA的classBBB: 5");

      let strJson2 = inspector.getInspectorByKey('sonClassBBB');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ObjectLinkFarJsunit_static_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkFarJsunit_static_0200] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("ClassBBB的numB值: 6");

      console.info('[ObjectLinkFarJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkFarJsunit_static_0300
     * @tc.name     ObjectLinkFarJsunit_static_0300
     * @tc.desc     ObjectLinkFarJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkFarJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkFarJsunit_static_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('sonClassBBB'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('sonClassBBB');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ObjectLinkFarJsunit_static_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkFarJsunit_static_0300] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("ClassBBB的numB值: 6");

      let strJson2 = inspector.getInspectorByKey('farClassAAA');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ObjectLinkFarJsunit_static_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkFarJsunit_static_0300] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("ClassAAA的numA值: 0");

      let strJson3 = inspector.getInspectorByKey('farClassBBB');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[ObjectLinkFarJsunit_static_0300] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ObjectLinkFarJsunit_static_0300] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual("ClassAAA的classBBB: 5");

      console.info('[ObjectLinkFarJsunit_static_0300] END');
      done();
    });
  })
}

