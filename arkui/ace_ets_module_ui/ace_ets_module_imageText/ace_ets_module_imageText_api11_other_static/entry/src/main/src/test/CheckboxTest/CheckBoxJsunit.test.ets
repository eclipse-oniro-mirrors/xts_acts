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
import { Color } from '@ohos.arkui.component';
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


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


const waitUiReadyMs = 1000;

export default function checkBoxJsunit() {
  describe('CheckBoxJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("checkBoxJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/checkBox/checkBoxExample',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get checkBoxJsunit state pages:" + JSON.stringify(pages));
        if (!("checkBoxExample" == pages.name)) {
          console.info("get checkBoxJsunit pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push checkBoxJsunit page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push checkBoxJsunit page error:" + err);
        expect().assertFail();
      }

    });

    
/**
     * @tc.number   checkBoxJsunit_static_0100
     * @tc.name     checkBoxJsunit_static_0100
     * @tc.desc     checkBoxJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('checkBoxJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxJsunit_static_0100 START');
      await CommonFunc.sleep(3000);
      // get the checkbox component and test attribute
      let strJson = inspector.getInspectorByKey('chek1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[checkBoxJsunit_static_0100'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString("select")));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FFED6F21');
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkBox = await driver.findComponent(ON.id('chek1'));
      let isChecked = await (checkBox?.isChecked() as Promise<boolean>);
      // to confirm
      console.info("[checkBoxJsunit_static_0100'] component obj isChecked: " + isChecked);
      expect(isChecked).assertTrue();
      done();
    });

    
/**
     * @tc.number   checkBoxJsunit_static_0200
     * @tc.name     checkBoxJsunit_static_0200
     * @tc.desc     checkBoxJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('checkBoxJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxJsunit_static_0200 START');
      await CommonFunc.sleep(1000);
      // modify the attribute normal value of checkbox dynamically
      const message:MessageManager<string | boolean> = AppStorage.get<MessageManager<string | boolean>>("messageManager")!
      message.notify({ name: 'select', value: false })
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkBox = await driver.findComponent(ON.id('chek1'));
      let isChecked = await (checkBox?.isChecked() as Promise<boolean>);
      expect(isChecked).assertFalse();
      AppStorage.get<MessageManager<string | boolean>>("messageManager")!.notify({ name: 'selectedColor', value: '#ecaaff' })
      await CommonFunc.sleep(4000);
      // check the value of changed attribute
      let strJson2 = inspector.getInspectorByKey('chek1');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[blankJsunit_0200'] component obj2 is: " + JSON.stringify(obj2.getElement('$attrs').getString("selectedColor")));
      expect(obj2.getElement('$attrs').getString("selectedColor")).assertEqual('#FFECAAFF');
      done();
    });

    
/**
     * @tc.number   checkBoxJsunit_static_0300
     * @tc.name     checkBoxJsunit_static_0300
     * @tc.desc     checkBoxJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('checkBoxJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxJsunit_static_0300 START');
      await CommonFunc.sleep(2000);
      // modify the attribute illegal value of checkbox dynamically
      AppStorage.get<MessageManager<string | boolean>>("messageManager")!.notify({ name: 'selectedColor', value: '#ecaf' })
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('chek1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[blankJsunit_0300'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#EECCAAFF');
      done();
    });

    
/**
     * @tc.number   checkBoxJsunit_static_0400
     * @tc.name     checkBoxJsunit_static_0400
     * @tc.desc     checkBoxJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('checkBoxJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxJsunit_static_0400 START');
      await CommonFunc.sleep(1000);
      // test the clicking event of checkbox
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkbox1 = await driver.findComponent(ON.id('chek1'));
      expect(checkbox1 != null).assertTrue();
      await (checkbox1?.click() as Promise<void>)
      await driver.delayMs(waitUiReadyMs);
      // check the click event by .getString("selectedColor")
      let strJson = inspector.getInspectorByKey('chek1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[blankJsunit_0400'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FFFFFF21');
      await (checkbox1?.click() as Promise<void>)
      done();
    });

    
/**
     * @tc.number   checkBoxJsunit_static_0500
     * @tc.name     checkBoxJsunit_static_0500
     * @tc.desc     checkBoxJsunit_static_0500
     * @tc.level    Level.LEVEL1
     */
it('checkBoxJsunit_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxJsunit_static_0300 START');
      await CommonFunc.sleep(2000);
      // verify the enum color
      AppStorage.get<MessageManager<string | boolean>>("messageManager")!.notify({ name: 'selectedColor', value: Color.Green })
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('chek1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[blankJsunit_0500'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString("selectedColor")));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FF008000');
      done();
    });

    
/**
     * @tc.number   checkBoxJsunit_static_0600
     * @tc.name     checkBoxJsunit_static_0600
     * @tc.desc     checkBoxJsunit_static_0600
     * @tc.level    Level.LEVEL1
     */
it('checkBoxJsunit_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxJsunit_static_0600 START');
      await CommonFunc.sleep(2000);
      // verify the enum color of rgb
      AppStorage.get<MessageManager<string | boolean>>("messageManager")!.notify({ name: 'selectedColor', value: 'rgb(238, 130, 238)' })
      await CommonFunc.sleep(2000);
      // check the value of changed attribute
      let strJson = inspector.getInspectorByKey('chek1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[blankJsunit_0600'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString("selectedColor")));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FFEE82EE');
      done();
    });

    
/**
     * @tc.number   checkBoxJsunit_static_0700
     * @tc.name     checkBoxJsunit_static_0700
     * @tc.desc     checkBoxJsunit_static_0700
     * @tc.level    Level.LEVEL1
     */
it('checkBoxJsunit_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('checkBoxJsunit_static_0700 START');
      await CommonFunc.sleep(1000);
      // more click
      let driver = Driver.create();
      await driver.delayMs(waitUiReadyMs);
      let checkbox1 = await driver.findComponent(ON.id('chek1'));
      expect(checkbox1 != null).assertTrue();
      await (checkbox1?.click() as Promise<void>)
      await driver.delayMs(waitUiReadyMs);
      await (checkbox1?.click() as Promise<void>)
      await driver.delayMs(waitUiReadyMs);
      await (checkbox1?.click() as Promise<void>)
      await driver.delayMs(waitUiReadyMs);
      // check the click event by .getString("selectedColor")
      let strJson = inspector.getInspectorByKey('chek1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[blankJsunit_0700'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString("selectedColor")));
      expect(obj.getElement('$attrs').getString("selectedColor")).assertEqual('#FFFFFF21');
      done();
    });


  })
}