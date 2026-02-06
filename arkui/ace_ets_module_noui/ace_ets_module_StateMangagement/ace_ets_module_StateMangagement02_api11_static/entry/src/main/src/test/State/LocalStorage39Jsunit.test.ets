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


export default function LocalStorage39Jsunit() {
  describe('LocalStorage39Jsunit', () => {
    beforeAll(() => {
      console.info("LocalStorage39Jsunit beforeEach start");
      
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement02.api11.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("LocalStorage39Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/State/LocalStorage39',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        let pages = routerInstance.getState();
        console.info("get LocalStorage39Jsunit state pages:" + JSON.stringify(pages));
        if (!("LocalStorage39" == pages.name)) {
          console.info("get LocalStorage39Jsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push LocalStorage39Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LocalStorage39Jsunit page error:" + err);
      }
      console.info("LocalStorage39Jsunit beforeEach end");
    });

    /**
     * @tc.number   LocalStorage39Jsunit_static_0200
     * @tc.name     LocalStorage39Jsunit_static_0200
     * @tc.desc     LocalStorage39Jsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('LocalStorage39Jsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      //Size获取AppStorage中存在键值对的个数
      console.info('[LocalStorage39Jsunit_static_0200] START');
      let driver = Driver.create()
      let Storage12Button1 = await driver.findComponent(ON.id('button4'));
      await (Storage12Button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('sizeText');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalStorage39Jsunit_static_0200] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('size是：2');

      console.info('[LocalStorage39Jsunit_static_0200] END');
      done();
    });

    /**
     * @tc.number   LocalStorage39Jsunit_static_0400
     * @tc.name     LocalStorage39Jsunit_static_0400
     * @tc.desc     LocalStorage39Jsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('LocalStorage39Jsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorage39Jsunit_static_0400] START');
      let driver = Driver.create()
      let Storage12Button1 = await driver.findComponent(ON.id('button1'));
      await (Storage12Button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('keysText1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalStorage39Jsunit_static_0400] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('Keys：["store_"]');
      console.info('[LocalStorage39Jsunit_static_0400] END');
      done();
    });

    /**
     * @tc.number   LocalStorage39Jsunit_static_0600
     * @tc.name     LocalStorage39Jsunit_static_0600
     * @tc.desc     LocalStorage39Jsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('LocalStorage39Jsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorage39Jsunit_static_0600] START');
      let driver = Driver.create()
      let Storage12Button1 = await driver.findComponent(ON.id('button2'));
      await (Storage12Button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('getText1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalStorage39Jsunit_static_0600] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('get PropA：1');
      console.info('[LocalStorage39Jsunit_static_0600] END');
      done();
    });

    /**
     * @tc.number   LocalStorage39Jsunit_static_0800
     * @tc.name     LocalStorage39Jsunit_static_0800
     * @tc.desc     LocalStorage39Jsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('LocalStorage39Jsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[LocalStorage39Jsunit_static_0800] START');
      let driver = Driver.create()
      let Storage12Button1 = await driver.findComponent(ON.id('button3'));
      await (Storage12Button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('getText2');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[LocalStorage39Jsunit_static_0800] obj1 is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('get PropE：undefined');
      console.info('[LocalStorage39Jsunit_static_0800] END');
      done();
    });
  })
}
