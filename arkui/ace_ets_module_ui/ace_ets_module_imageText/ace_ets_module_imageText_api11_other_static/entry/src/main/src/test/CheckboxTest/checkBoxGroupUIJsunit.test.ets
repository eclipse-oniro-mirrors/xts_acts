'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Color } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


const waitUiReadyMs = 1000;

export default function checkBoxGroupUIJsunit() {
  describe('checkBoxGroupUIJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("checkBoxJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkBox/checkBoxGroupUI',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get checkBoxGroupUIJsunit state pages:" + JSON.stringify(pages));
        if (!("checkBoxGroupUI" == pages.name)) {
          console.info("get checkBoxGroupUIJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push checkBoxGroupUIJsunit page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push checkBoxGroupUI page error:" + err);
        expect().assertFail();
      }

    });

    
/**
     * @tc.number   checkBoxGroupUIJsunit_static_0100
     * @tc.name     checkBoxGroupUIJsunit_static_0100
     * @tc.desc     checkBoxGroupUIJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('checkBoxGroupUIJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxGroupUIJsunit_static_0100 START');
      await CommonFunc.sleep(1000);
      // get the checkboxGroup component and test attribute
      let strJson = inspector.getInspectorByKey('allck');
      console.info("checkBoxGroupUIJsunit_static_0100 strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("checkBoxGroupUIJsunit_static_0100 component obj is: " + JSON.stringify(obj.getElement('$attrs').getString("selectedColor")));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FF007DFF');
      // add assert single checkbox .getString("selectedColor")
      let strJson2 = inspector.getInspectorByKey('cb1');
      console.info("checkBoxGroupUIJsunit_static_cb1_0100 strJson:" + strJson2);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("checkBoxGroupUIJsunit_static_cb1_0100 component obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString("selectedColor")));
      expect(obj2.getElement('$attrs').getString("selectedColor")).assertEqual('#FF007DEF');
      done();
    });

    
/**
     * @tc.number   checkBoxGroupUIJsunit_static_0200
     * @tc.name     checkBoxGroupUIJsunit_static_0200
     * @tc.desc     checkBoxGroupUIJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('checkBoxGroupUIJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxGroupUIJsunit_static_0200 START');
      await CommonFunc.sleep(1000);
      // modify the attribute normal value of checkbox dynamically
      await CommonFunc.sleep(2000);
      AppStorage.get<MessageManager<string | boolean>>("messageManager")!.notify({ name: 'selectedColor', value: '#EEAAFF' })
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('allck');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[checkBoxGroupUIJsunit_static_0200'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FFEEAAFF');
      // add assert single checkbox .getString("selectedColor")
      let strJson2 = inspector.getInspectorByKey('cb1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("checkBoxGroupUIJsunit_static_cb1_0200 component obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString("selectedColor")));
      expect(obj2.getElement('$attrs').getString("selectedColor")).assertEqual('#FF007DEF');
      done();
    });

    
/**
     * @tc.number   checkBoxGroupUIJsunit_static_0300
     * @tc.name     checkBoxGroupUIJsunit_static_0300
     * @tc.desc     checkBoxGroupUIJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('checkBoxGroupUIJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxGroupUIJsunit_static_0300 START');
      await CommonFunc.sleep(1000);
      // modify the attribute illegal value of checkbox dynamically
      AppStorage.get<MessageManager<string | boolean>>("messageManager")!.notify({ name: 'selectedColor', value: '#eaf' })
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('allck');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[checkBoxGroupUIJsunit_static_0300 '] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FFEEAAFF');
      done();
    });

    
/**
     * @tc.number   checkBoxGroupUIJsunit_static_0400
     * @tc.name     checkBoxGroupUIJsunit_static_0400
     * @tc.desc     checkBoxGroupUIJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('checkBoxGroupUIJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxGroupUIJsunit_static_0400 START');
      await CommonFunc.sleep(1000);
      // modify the .getString("selectedColor")
      AppStorage.get<MessageManager<string | boolean>>("messageManager")!.notify({ name: 'selectedColor', value: 'rgb(238, 130, 238)' })
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('allck');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[checkBoxGroupUIJsunit_static_0400 '] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FFEE82EE');
      done();
    });

    
/**
     * @tc.number   checkBoxGroupUIJsunit_static_0500
     * @tc.name     checkBoxGroupUIJsunit_static_0500
     * @tc.desc     checkBoxGroupUIJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
it('checkBoxGroupUIJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxGroupUIJsunit_static_0500 START');
      await CommonFunc.sleep(1000);
      // modify the .getString("selectedColor")
      AppStorage.get<MessageManager<string | boolean>>("messageManager")!.notify({ name: 'selectedColor', value: Color.Green })
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('allck');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[checkBoxGroupUIJsunit_static_0500 '] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FF008000');
      done();
    });

    
/**
     * @tc.number   checkBoxGroupUIJsunit_static_0600
     * @tc.name     checkBoxGroupUIJsunit_static_0600
     * @tc.desc     checkBoxGroupUIJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
it('checkBoxGroupUIJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxGroupUIJsunit_static_0600 START');
      await CommonFunc.sleep(1000);
      // test the clicking event of checkboxGroup
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkGoup = await driver.findComponent(ON.id('allck'));
      await (checkGoup?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      // check the isSelect and name
      let ttx = await driver.findComponent(ON.id('text1'));
      let txt = await (ttx?.getText() as Promise<string>);
      console.info("[checkBoxGroupUIJsunit_static_0600'] component obj is: " + txt);
      expect(txt).assertEqual('["checkbox1","checkbox2","checkbox3"]');
      let ttxx = await driver.findComponent(ON.id('text2'));
      let txtt = await (ttxx?.getText() as Promise<string>);
      console.info("[checkBoxGroupUIJsunit_static_0600'] component obj2 is: " + txtt);
      expect(txtt).assertEqual('0');
      await (checkGoup?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      done();
    });

    
/**
     * @tc.number   checkBoxGroupUIJsunit_static_0700
     * @tc.name     checkBoxGroupUIJsunit_static_0700
     * @tc.desc     checkBoxGroupUIJsunit_static_0700
     * @tc.level    Level.LEVEL1
     */
it('checkBoxGroupUIJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxGroupUIJsunit_static_0700 START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkGoup = await driver.findComponent(ON.id('cb2'));
      await (checkGoup?.click() as Promise<void>);
      await driver.delayMs(waitUiReadyMs);
      // check the isSelect and name
      let ttx = await driver.findComponent(ON.id('text1'));
      let txt = await (ttx?.getText() as Promise<string>);
      console.info("[checkBoxGroupUIJsunit_static_0700'] component obj is: " + txt);
      expect(txt).assertEqual('["checkbox2"]');
      let ttxx = await driver.findComponent(ON.id('text2'));
      let txtt = await (ttxx?.getText() as Promise<string>);
      console.info("[checkBoxGroupUIJsunit_static_0700'] component obj2 is: " + txtt);
      expect(txtt).assertEqual('1');
      done();
    });

  })
}