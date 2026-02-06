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


export default function ObjectLinkSplJsunit() {
  describe('ObjectLinkSplJsunit', () => {
    beforeAll(() => {
      console.info("ObjectLinkSplJsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("ObjectLinkSplJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/ObjectLinkSpl',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ObjectLinkSplJsunit state pages:" + JSON.stringify(pages));
        if (!("ObjectLinkSpl" == pages.name)) {
          console.info("get ObjectLinkSplJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ObjectLinkSplJsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ObjectLinkSplJsunit page error:" + err);
      }
      console.info("ObjectLinkSplJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('ViewAS_reset'));
      await (button?.click() as Promise<void>);
      console.log('reset button click succ')
      await CommonFunc.sleep(1000);
    });

  

    /**
     * @tc.number   ObjectLinkSplJsunit_static_0100
     * @tc.name     ObjectLinkSplJsunit_static_0100
     * @tc.desc     ObjectLinkSplJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkSplJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkSplJsunit_static_0100 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('adds_state'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('num_state');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkSplJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSplJsunit_static_0100] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("@State: 6");

      let strJson1 = inspector.getInspectorByKey('sNum_olk');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ObjectLinkSplJsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkSplJsunit_static_0100] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("ObjectLink: 6");

      let strJson2 = inspector.getInspectorByKey('sNum_props');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ObjectLinkSplJsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkSplJsunit_static_0100] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("son_Prop: 6");

      let strJson3 = inspector.getInspectorByKey('sNum_links');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[ObjectLinkSplJsunit_static_0100] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ObjectLinkSplJsunit_static_0100] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual("son_Link: 6");

      console.info('[ObjectLinkSplJsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkSplJsunit_static_0200
     * @tc.name     ObjectLinkSplJsunit_static_0200
     * @tc.desc     ObjectLinkSplJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkSplJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkSplJsunit_static_0200 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btn_olk'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sNum_olk');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkSplJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSplJsunit_static_0200] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("ObjectLink: 6");

      let strJson1 = inspector.getInspectorByKey('num_state');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[ObjectLinkSplJsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[ObjectLinkSplJsunit_static_0200] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("@State: 6");

      let strJson2 = inspector.getInspectorByKey('sNum_props');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[ObjectLinkSplJsunit_static_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[ObjectLinkSplJsunit_static_0200] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("son_Prop: 6");

      let strJson3 = inspector.getInspectorByKey('sNum_links');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[ObjectLinkSplJsunit_static_0200] component obj3 is: " + JSON.stringify(obj3));
      console.info("[ObjectLinkSplJsunit_static_0200] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual("son_Link: 6");

      console.info('[ObjectLinkSplJsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkSplJsunit_static_0300
     * @tc.name     ObjectLinkSplJsunit_static_0300
     * @tc.desc     ObjectLinkSplJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkSplJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkSplJsunit_static_0300 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btn_prop'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('sNum_props');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ObjectLinkSplJsunit_static_0300] component obj is: " + JSON.stringify(obj));
      console.info("[ObjectLinkSplJsunit_static_0300] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual("son_Prop: 5");

      let strJson1 = inspector.getInspectorByKey('num_state');
       let obj1 = JSON.parseJsonElement(strJson1);
       console.info("[ObjectLinkSplJsunit_static_0300] component obj1 is: " + JSON.stringify(obj1));
       console.info("[ObjectLinkSplJsunit_static_0300] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
       expect(obj1.getElement('$attrs').getString('content')).assertEqual("@State: 5");

      let strJson2 = inspector.getInspectorByKey('sNum_olk');
       let obj2 = JSON.parseJsonElement(strJson2);
       console.info("[ObjectLinkSplJsunit_static_0300] component obj2 is: " + JSON.stringify(obj2));
       console.info("[ObjectLinkSplJsunit_static_0300] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
       expect(obj2.getElement('$attrs').getString('content')).assertEqual("ObjectLink: 5");

      let strJson3 = inspector.getInspectorByKey('sNum_links');
       let obj3 = JSON.parseJsonElement(strJson3);
       console.info("[ObjectLinkSplJsunit_static_0300] component obj3 is: " + JSON.stringify(obj3));
       console.info("[ObjectLinkSplJsunit_static_0300] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
       expect(obj3.getElement('$attrs').getString('content')).assertEqual("son_Link: 5");

      console.info('[ObjectLinkSplJsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   ObjectLinkSplJsunit_static_0400
     * @tc.name     ObjectLinkSplJsunit_static_0400
     * @tc.desc     ObjectLinkSplJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ObjectLinkSplJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('ObjectLinkSplJsunit_static_0400 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btn_link'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('sNum_links');
       let obj = JSON.parseJsonElement(strJson);
       console.info("[ObjectLinkSplJsunit_static_0400] component obj is: " + JSON.stringify(obj));
       console.info("[ObjectLinkSplJsunit_static_0400] text: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
       expect(obj.getElement('$attrs').getString('content')).assertEqual("son_Link: 6");

      let strJson1 = inspector.getInspectorByKey('num_state');
       let obj1 = JSON.parseJsonElement(strJson1);
       console.info("[ObjectLinkSplJsunit_static_0400] component obj1 is: " + JSON.stringify(obj1));
       console.info("[ObjectLinkSplJsunit_static_0400] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
       expect(obj1.getElement('$attrs').getString('content')).assertEqual("@State: 6");

      let strJson2 = inspector.getInspectorByKey('sNum_olk');
       let obj2 = JSON.parseJsonElement(strJson2);
       console.info("[ObjectLinkSplJsunit_static_0400] component obj2 is: " + JSON.stringify(obj2));
       console.info("[ObjectLinkSplJsunit_static_0400] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
       expect(obj2.getElement('$attrs').getString('content')).assertEqual("ObjectLink: 6");

      let strJson3 = inspector.getInspectorByKey('sNum_props');
       let obj3 = JSON.parseJsonElement(strJson3);
       console.info("[ObjectLinkSplJsunit_static_0400] component obj3 is: " + JSON.stringify(obj3));
       console.info("[ObjectLinkSplJsunit_static_0400] text: " + JSON.stringify(obj3.getElement('$attrs').getString('content')));
       expect(obj3.getElement('$attrs').getString('content')).assertEqual("son_Prop: 6");

      console.info('[ObjectLinkSplJsunit_static_0400] END');
      done();
    });
  })
}

