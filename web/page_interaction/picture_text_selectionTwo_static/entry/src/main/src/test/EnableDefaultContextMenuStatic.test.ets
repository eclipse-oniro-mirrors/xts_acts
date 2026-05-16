/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, beforeAll , TestType, Size, Level } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils.test';
import router from '@ohos.router';
import UIAbility from '@ohos.app.ability.UIAbility';
import{BusinessError } from '@ohos.base';
import { Driver, ON, MouseButton } from "@kit.TestKit";
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const EVENT_ID_SET_SUITE_KEY = 177009;
let testAbilityContext:common.UIAbilityContext;


export default function WebViewEnableDefaultContextMenuJsunit() {
  describe('WebViewEnableDefaultContextMenuTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log('beforeAll end,%s', 'Succeed!')
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info('web beforeEach start');
    })

    afterEach(async () => {
      await Utils.msSleep(1000);
      console.info('webKeyboardController afterEach end');
    })

    /**
     * @tc.name   EnableDefaultContextMenuStatic01
     * @tc.number SUB_WEB_ENABLEDEFAULTCONTEXTMENUSTATIC_STATIC_0100
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenuStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent("EnableDefaultContextMenuStatic01", EVENT_ID_SET_SUITE_KEY);
        await Utils.msSleep(1000);
        Utils.registerEvent("EnableDefaultContextMenuStatic01", true, 20260325, done);
        let driver = Driver.create();
        await Utils.msSleep(2000);
        let buttonThree = await driver.findComponent(ON.id('webEnableDefaultContextMenu'));
        await Utils.msSleep(1000);
        if(buttonThree) {
          buttonThree.click()
        }
        await Utils.msSleep(6000);
        let buttonTwo = await driver.findComponent(ON.id('enableDefaultContextMenuButton'));
        if(buttonTwo) {
          let point = await buttonTwo.getBoundsCenter()
          await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
          console.info("buttonOne.mouseClick")
        }
        await Utils.msSleep(1000);
        let buttonOne = await driver.findComponent(ON.text('复制'));
        if(buttonOne) {
          await Utils.msSleep(1000);
          buttonOne.click();
        }
        done();
      })

    /**
     * @tc.name   EnableDefaultContextMenuStatic02
     * @tc.number SUB_WEB_ENABLEDEFAULTCONTEXTMENUSTATIC_STATIC_0200
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenuStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent("EnableDefaultContextMenuStatic02", EVENT_ID_SET_SUITE_KEY);
        await Utils.msSleep(1000);
        Utils.registerEvent("EnableDefaultContextMenuStatic02", true, 20260326, done);
        let driver = Driver.create();
        await Utils.msSleep(2000);
        let buttonThree = await driver.findComponent(ON.id('webEnableDefaultContextMenu'));
        await Utils.msSleep(1000);
        if(buttonThree) {
          buttonThree.click()
        }
        await Utils.msSleep(6000);
        let buttonTwo = await driver.findComponent(ON.id('enableDefaultContextMenuButton'));
        if(buttonTwo) {
          let point = await buttonTwo.getBoundsCenter()
          await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
          console.info("buttonOne.mouseClick")
        }
        await Utils.msSleep(1000);
        let buttonOne = await driver.findComponent(ON.text('复制'));
        if(buttonOne) {
          await Utils.msSleep(1000);
          buttonOne.click();
        }
        done();
      })

    /**
     * @tc.name   EnableDefaultContextMenuStatic03
     * @tc.number SUB_WEB_ENABLEDEFAULTCONTEXTMENUSTATIC_STATIC_0300
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenuStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent("EnableDefaultContextMenuStatic03", EVENT_ID_SET_SUITE_KEY);
        await Utils.msSleep(1000);
        Utils.registerEvent("EnableDefaultContextMenuStatic03", true, 20260327, done);
        let driver = Driver.create();
        await Utils.msSleep(2000);
        let buttonThree = await driver.findComponent(ON.id('webEnableDefaultContextMenu'));
        await Utils.msSleep(1000);
        if(buttonThree) {
          buttonThree.click()
        }
        await Utils.msSleep(6000);
        let buttonTwo = await driver.findComponent(ON.id('enableDefaultContextMenuButton'));
        if(buttonTwo) {
          let point = await buttonTwo.getBoundsCenter()
          await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
          console.info("buttonOne.mouseClick")
        }
        await Utils.msSleep(1000);
        let buttonOne = await driver.findComponent(ON.text('复制'));
        if(buttonOne) {
          await Utils.msSleep(1000);
          buttonOne.click();
        }
        done();
      })

    /**
     * @tc.name   EnableDefaultContextMenuStatic04
     * @tc.number SUB_WEB_ENABLEDEFAULTCONTEXTMENUSTATIC_STATIC_0400
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableDefaultContextMenuStatic04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent("EnableDefaultContextMenuStatic04", EVENT_ID_SET_SUITE_KEY);
        await Utils.msSleep(1000);
        Utils.registerEvent("EnableDefaultContextMenuStatic04", true, 20260328, done);
        let driver = Driver.create();
        await Utils.msSleep(2000);
        let buttonThree = await driver.findComponent(ON.id('webEnableDefaultContextMenu'));
        await Utils.msSleep(1000);
        if(buttonThree) {
          buttonThree.click()
        }
        await Utils.msSleep(6000);
        let buttonTwo = await driver.findComponent(ON.id('enableDefaultContextMenuButton'));
        if(buttonTwo) {
          let point = await buttonTwo.getBoundsCenter()
          await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
          console.info("buttonOne.mouseClick")
        }
        await Utils.msSleep(1000);
        let buttonOne = await driver.findComponent(ON.text('复制'));
        if(buttonOne) {
          await Utils.msSleep(1000);
          buttonOne.click();
        }
        done();
      })
  })
}
