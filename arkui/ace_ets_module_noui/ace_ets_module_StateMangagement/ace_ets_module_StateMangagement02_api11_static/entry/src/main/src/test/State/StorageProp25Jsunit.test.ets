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


export default function StorageProp25Jsunit() {
  describe('StorageProp25Jsunit', () => {
    beforeAll(() => {
      console.info("StorageProp25Jsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StorageProp25Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StorageProp25',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StorageProp25Jsunit state pages:" + JSON.stringify(pages));
        if (!("StorageProp25" == pages.name)) {
          console.info("get StorageProp25Jsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StorageProp25Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageProp25Jsunit page error:" + err);
      }
      console.info("StorageProp25Jsunit beforeEach end");
    });



    /**
     * @tc.number   StorageProp25Jsunit_static_0100
     * @tc.name     StorageProp25Jsunit_static_0100
     * @tc.desc     StorageProp25Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('StorageProp25Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StorageProp25Jsunit_static_0100 START');
      let strJson1 = inspector.getInspectorByKey('lseA');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp25Jsunit_static_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_static_0100] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("LocalStorage值为47");

      let strJson2 = inspector.getInspectorByKey('sPropA');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageProp25Jsunit_static_0100] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_static_0100] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("当前PropA值为47");

      console.info('[StorageProp25Jsunit_static_0100] END');
      done();
    });

    /**
     * @tc.number   StorageProp25Jsunit_static_0200
     * @tc.name     StorageProp25Jsunit_static_0200
     * @tc.desc     StorageProp25Jsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('StorageProp25Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StorageProp25Jsunit_static_0200 START');
      let strJson1 = inspector.getInspectorByKey('lseB');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp25Jsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_static_0200] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("LocalStorage值为9");

      let strJson2 = inspector.getInspectorByKey('sPropB');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageProp25Jsunit_static_0200] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_static_0200] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("当前PropB值为9");

      console.info('[StorageProp25Jsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   StorageProp25Jsunit_static_0300
     * @tc.name     StorageProp25Jsunit_static_0300
     * @tc.desc     StorageProp25Jsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('StorageProp25Jsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StorageProp25Jsunit_static_0300 START');
      let strJson1 = inspector.getInspectorByKey('lsePropB');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp25Jsunit_static_0300] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_static_0300] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("LocalStorage值PropB为0");

      let strJson2 = inspector.getInspectorByKey('sonPropB');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageProp25Jsunit_static_0300] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_static_0300] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("子组件当前PropB值为11");

      console.info('[StorageProp25Jsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   StorageProp25Jsunit_static_0400
     * @tc.name     StorageProp25Jsunit_static_0400
     * @tc.desc     StorageProp25Jsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('StorageProp25Jsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StorageProp25Jsunit_static_0400 START');
      let strJson1 = inspector.getInspectorByKey('sonPropC');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp25Jsunit_static_0400] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_static_0400] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("子组件PropC: 11");

      let strJson2 = inspector.getInspectorByKey('sPropC');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageProp25Jsunit_static_0400] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_static_0400] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("父组件ProC: 11");

      console.info('[StorageProp25Jsunit_static_0400] END');
      done();
    });

    /**
     * @tc.number   StorageProp25Jsunit_static_0500
     * @tc.name     StorageProp25Jsunit_static_0500
     * @tc.desc     StorageProp25Jsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('StorageProp25Jsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StorageProp25Jsunit_static_0500 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('btn1_sto'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('sPropA');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp25Jsunit_static_0500] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_static_0500] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("当前PropA值为48");

      let strJson2 = inspector.getInspectorByKey('sPropB');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageProp25Jsunit_static_0500] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_static_0500] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("当前PropB值为10");

      console.info('[StorageProp25Jsunit_static_0500] END');
      done();
    });

    /**
     * @tc.number   StorageProp25Jsunit_static_0600
     * @tc.name     StorageProp25Jsunit_static_0600
     * @tc.desc     StorageProp25Jsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('StorageProp25Jsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StorageProp25Jsunit_static_0600 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('Child1_btn1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('lsePropB');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp25Jsunit_static_0600] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_static_0600] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("LocalStorage值PropB为0");

      let strJson2 = inspector.getInspectorByKey('sonPropB');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageProp25Jsunit_static_0600] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_static_0600] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("子组件当前PropB值为12");

      console.info('[StorageProp25Jsunit_static_0600] END');
      done();
    });

    /**
     * @tc.number   StorageProp25Jsunit_static_0700
     * @tc.name     StorageProp25Jsunit_static_0700
     * @tc.desc     StorageProp25Jsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('StorageProp25Jsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StorageProp25Jsunit_static_0700 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('Child1_btn2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('lsePropB');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp25Jsunit_static_0700] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_static_0700] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("LocalStorage值PropB为123");

      let strJson2 = inspector.getInspectorByKey('sonPropB');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageProp25Jsunit_static_0700] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_static_0700] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("子组件当前PropB值为123");

      console.info('[StorageProp25Jsunit_static_0700] END');
      done();
    });

    /**
     * @tc.number   StorageProp25Jsunit_static_0800
     * @tc.name     StorageProp25Jsunit_static_0800
     * @tc.desc     StorageProp25Jsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('StorageProp25Jsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('StorageProp25Jsunit_static_0800 START');
      let driver = Driver.create()
      let button = await driver.findComponent(ON.id('Child1_btn1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('lsePropB');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp25Jsunit_static_0800] component obj1 is: " + JSON.stringify(obj1));
      console.info("[StorageProp25Jsunit_static_0800] text: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual("LocalStorage值PropB为123");

      let strJson2 = inspector.getInspectorByKey('sonPropB');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageProp25Jsunit_static_0800] component obj2 is: " + JSON.stringify(obj2));
      console.info("[StorageProp25Jsunit_static_0800] text: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("子组件当前PropB值为124");

      console.info('[StorageProp25Jsunit_static_0800] END');
      done();
    });
  })
}
