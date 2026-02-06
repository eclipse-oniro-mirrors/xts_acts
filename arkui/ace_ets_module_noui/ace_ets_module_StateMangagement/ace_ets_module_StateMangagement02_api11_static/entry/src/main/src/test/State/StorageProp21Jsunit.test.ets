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


export default function StorageProp21Jsunit() {
  describe('StorageProp21Jsunit', () => {
    beforeAll(() => {
      console.info("StorageProp21Jsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("StorageProp21Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/StorageProp21',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StorageProp21Jsunit state pages:" + JSON.stringify(pages));
        if (!("StorageProp21" == pages.name)) {
          console.info("get StorageProp21Jsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StorageProp21Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageProp21Jsunit page error:" + err);
      }
      console.info("StorageProp21Jsunit beforeEach end");
    });



    /**
     * @tc.number   StorageProp21Jsunit_static_0200
     * @tc.name     StorageProp21Jsunit_static_0200
     * @tc.desc     StorageProp21Jsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('StorageProp21Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StorageProp21Jsunit_static_0200] START');
      let driver = Driver.create()
      let button_son1 = await driver.findComponent(ON.id('button1'));
      await (button_son1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('button1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[StorageProp21Jsunit_static_0200] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('label')).assertEqual('button1: cd');
      console.info('[StorageProp21Jsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   StorageProp21Jsunit_static_0300
     * @tc.name     StorageProp21Jsunit_static_0300
     * @tc.desc     StorageProp21Jsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('StorageProp21Jsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StorageProp21Jsunit_static_0300] START');
      let driver = Driver.create()
      let button_son1 = await driver.findComponent(ON.id('button2'));
      await (button_son1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson2 = inspector.getInspectorByKey('button2');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[StorageProp21Jsunit_static_0300] obj2 is: " + JSON.stringify(obj2));
      await CommonFunc.sleep(1000);
      expect(obj2.getElement('$attrs').getString('label')).assertEqual('button2: 3');
      console.info('[StorageProp21Jsunit_static_0300] END');
      done();
    });

    /**
     * @tc.number   StorageProp21Jsunit_static_0400
     * @tc.name     StorageProp21Jsunit_static_0400
     * @tc.desc     StorageProp21Jsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('StorageProp21Jsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StorageProp21Jsunit_static_0400] START');
      let driver = Driver.create()
      let button_son1 = await driver.findComponent(ON.id('button3'));
      await (button_son1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson13 = inspector.getInspectorByKey('button3');
      let obj13 = JSON.parseJsonElement(strJson13);
      console.info("[StorageProp21Jsunit_static_0400] obj13 is: " + JSON.stringify(obj13));
      await CommonFunc.sleep(1000);
      expect(obj13.getElement('$attrs').getString('label')).assertEqual('button3: false');
      console.info('[StorageProp21Jsunit_static_0400] END');
      done();
    });

    /**
     * @tc.number   StorageProp21Jsunit_static_0500
     * @tc.name     StorageProp21Jsunit_static_0500
     * @tc.desc     StorageProp21Jsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('StorageProp21Jsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StorageProp21Jsunit_static_0500] START');
      let driver = Driver.create()
      let button_son1 = await driver.findComponent(ON.id('button4'));
      await (button_son1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson24 = inspector.getInspectorByKey('button4');
      let obj24 = JSON.parseJsonElement(strJson24);
      console.info("[StorageProp21Jsunit_static_0500] obj24 is: " + JSON.stringify(obj24));
      await CommonFunc.sleep(1000);
      expect(obj24.getElement('$attrs').getString('label')).assertEqual('button4: 3');
      console.info('[StorageProp21Jsunit_static_0500] END');
      done();
    });
  })
}
