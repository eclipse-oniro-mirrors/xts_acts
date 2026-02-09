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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../hypium/index';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  UiDirection,
  MouseButton
} from '@ohos.UiTest';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function ListOffSet01Jsunit() {

  describe('ListOffSet01Jsunit', () => {
    beforeAll(() => {
      console.info("ListOffSet01Jsunit beforeAll start");
            
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split06.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("ListOffSet01Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/List/List_attribute/ListOffSet01',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get ListOffSet01Jsunit state pages:" + JSON.stringify(pages));
        if (!("ListOffSet01" == pages.name)) {
          console.info("get ListOffSet01Jsunit pages.name:" + JSON.stringify(pages.name));
           routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ListOffSet01Jsunit page error:" + err);
      }
      console.info("ListOffSet01Jsunit beforeEach end");
    });

    
    
    



/**
     * @tc.number   ListOffSet01Jsunit_static_0010
     * @tc.name     ListOffSet01Jsunit_static_0010
     * @tc.desc     ListOffSet01Jsunit_static_0010
     * @tc.level    Level.LEVEL0
     */
it('ListOffSet01Jsunit_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListOffSet01Jsunit_0010] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_End_Negative2'));
      await btn1!.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_Bottom'));
      await btn2!.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ListoffSet01_Textend');
      console.info("[ListOffSet01Jsunit_0010] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')))-100)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0010] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListOffSet01Jsunit_static_0020
     * @tc.name     ListOffSet01Jsunit_static_0020
     * @tc.desc     ListOffSet01Jsunit_static_0020
     * @tc.level    Level.LEVEL0
     */
it('ListOffSet01Jsunit_static_0020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListOffSet01Jsunit_0020] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_End5'));
      await btn1!.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_Bottom'));
      await btn2!.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ListoffSet01_Textend');
      console.info("[ListOffSet01Jsunit_0020] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')))-95)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0020] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListOffSet01Jsunit_static_0030
     * @tc.name     ListOffSet01Jsunit_static_0030
     * @tc.desc     ListOffSet01Jsunit_static_0030
     * @tc.level    Level.LEVEL0
     */
it('ListOffSet01Jsunit_static_0030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListOffSet01Jsunit_0030] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_End10'));
      await btn1!.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_Start10'));
      await btn2!.click();
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('ListoffSet01_Top'));
      await btn3!.click();
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('ListoffSet01_Text01');
      console.info("[ListOffSet01Jsunit_0030] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')))-10)<=1).assertTrue();
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id('ListoffSet01_Bottom'));
      await btn4!.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ListoffSet01_Textend');

      console.info("[ListOffSet01Jsunit_0030] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')))-90)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0030] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListOffSet01Jsunit_static_0040
     * @tc.name     ListOffSet01Jsunit_static_0040
     * @tc.desc     ListOffSet01Jsunit_static_0040
     * @tc.level    Level.LEVEL0
     */
it('ListOffSet01Jsunit_static_0040', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListOffSet01Jsunit_0040] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_Start_Negative2'));
      await btn1!.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_Top'));
      await btn2!.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ListoffSet01_Text01');

      console.info("[ListOffSet01Jsunit_0040] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content'))))<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0040] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListOffSet01Jsunit_static_0050
     * @tc.name     ListOffSet01Jsunit_static_0050
     * @tc.desc     ListOffSet01Jsunit_static_0050
     * @tc.level    Level.LEVEL0
     */
it('ListOffSet01Jsunit_static_0050', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListOffSet01Jsunit_0050] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_Start5'));
      await btn1!.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_Top'));
      await btn2!.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ListoffSet01_Text01');

      console.info("[ListOffSet01Jsunit_0050] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')))-5)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0050] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListOffSet01Jsunit_static_0060
     * @tc.name     ListOffSet01Jsunit_static_0060
     * @tc.desc     ListOffSet01Jsunit_static_0060
     * @tc.level    Level.LEVEL0
     */
it('ListOffSet01Jsunit_static_0060', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListOffSet01Jsunit_0060] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_Start5'));
      await btn1!.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_End0'));
      await btn2!.click();
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('ListoffSet01_Padding5'));
      await btn3!.click();
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id('ListoffSet01_Top'));
      await btn4!.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ListoffSet01_Text01');

      console.info("[ListOffSet01Jsunit_0060] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')))-10)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0060] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListOffSet01Jsunit_static_0070
     * @tc.name     ListOffSet01Jsunit_static_0070
     * @tc.desc     ListOffSet01Jsunit_static_0070
     * @tc.level    Level.LEVEL0
     */
it('ListOffSet01Jsunit_static_0070', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListOffSet01Jsunit_0070] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_Start0'));
      await btn1!.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_End5'));
      await btn2!.click();
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('ListoffSet01_Padding5'));
      await btn3!.click();
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id('ListoffSet01_Bottom'));
      await btn4!.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ListoffSet01_Textend');

      console.info("[ListOffSet01Jsunit_0070] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')))-90)<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0070] END');
      done();
    });

    
    
    



/**
     * @tc.number   ListOffSet01Jsunit_static_0080
     * @tc.name     ListOffSet01Jsunit_static_0080
     * @tc.desc     ListOffSet01Jsunit_static_0080
     * @tc.level    Level.LEVEL0
     */
it('ListOffSet01Jsunit_static_0080', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ListOffSet01Jsunit_0080] START');
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ListoffSet01_Start10'));
      await btn1!.click();
      await CommonFunc.sleep(1000);
      let btn2 = await driver.findComponent(ON.id('ListoffSet01_End10'));
      await btn2!.click();
      await CommonFunc.sleep(1000);
      let btn3 = await driver.findComponent(ON.id('ListoffSet01_Padding0'));
      await btn3!.click();
      await CommonFunc.sleep(1000);
      let btn4 = await driver.findComponent(ON.id('ListoffSet01_Top'));
      await btn4!.click();
      await CommonFunc.sleep(1000);
      let btn5 = await driver.findComponent(ON.id('ListoffSet01_Get'));
      await btn5!.click();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('ListoffSet01_Text02');

      console.info("[ListOffSet01Jsunit_0080] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(Math.abs(Math.round(Number(JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')))-(-10))<=1).assertTrue();
      console.info('[ListOffSet01Jsunit_0080] END');
      done();
    });


  })


}
