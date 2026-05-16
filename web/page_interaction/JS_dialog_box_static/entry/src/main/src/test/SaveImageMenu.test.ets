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
import Utils from './Util.test';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON, MouseButton } from "@kit.TestKit";
const EVENT_ID_SET_SUITE_KEY = 177008;
let driver = Driver.create();


export default function SaveImageMenuJsunit() {
  describe('SaveImageMenuTest',  () =>{
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
     * @tc.name   SaveImageMenuStatic01
     * @tc.number SUB_WEB_SAVEIMAGEMENU_STATIC_0100
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SaveImageMenuStatic01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent("SaveImageMenuStatic01", EVENT_ID_SET_SUITE_KEY);
        await Utils.msSleep(1000);
        Utils.registerEvent("SaveImageMenuStatic01", "image", 20230319, done);
        await Utils.msSleep(1000);
        let buttonThree = await driver.findComponent(ON.id('webSaveImageMenu'));
        await Utils.msSleep(1000);
        if(buttonThree) {
          buttonThree.click()
        }
        await Utils.msSleep(6000);
        let buttonTwo = await driver.findComponent(ON.id('WebContextMenuResultButton'));
        if(buttonTwo) {
          let point = await buttonTwo.getBoundsCenter()
          await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
          console.info("buttonOne.mouseClick")
        }
        await Utils.msSleep(1000);
        let buttonOne = await driver.findComponent(ON.text('保存图片'));
        if(buttonOne) {
          await Utils.msSleep(1000);
          buttonOne.click();
        }
        done();
      })

    /**
     * @tc.name   SaveImageMenuStatic02
     * @tc.number SUB_WEB_SAVEIMAGEMENU_STATIC_0200
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SaveImageMenuStatic02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent("SaveImageMenuStatic02", EVENT_ID_SET_SUITE_KEY);
        await Utils.msSleep(1000);
        Utils.registerEvent("SaveImageMenuStatic02", "onLineImage", 20230320, done);
        await Utils.msSleep(1000);
        let buttonThree = await driver.findComponent(ON.id('webSaveImageMenu'));
        await Utils.msSleep(1000);
        if(buttonThree) {
          buttonThree.click()
        }
        await Utils.msSleep(6000);
        let buttonTwo = await driver.findComponent(ON.id('WebContextMenuResultButton'));
        if(buttonTwo) {
          let point = await buttonTwo.getBoundsCenter()
          await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
          console.info("buttonOne.mouseClick")
        }
        await Utils.msSleep(1000);
        let buttonOne = await driver.findComponent(ON.text('保存图片'));
        if(buttonOne) {
          await Utils.msSleep(1000);
          buttonOne.click();
        }
        done();
      })


    /**
     * @tc.name   SaveImageMenuStatic03
     * @tc.number SUB_WEB_SAVEIMAGEMENU_STATIC_0300
     * @tc.desc   saveImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SaveImageMenuStatic03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent("SaveImageMenuStatic03", EVENT_ID_SET_SUITE_KEY);
        await Utils.msSleep(1000);
        Utils.registerEvent("SaveImageMenuStatic03", "canvas", 20230321, done);
        await Utils.msSleep(1000);
        let buttonThree = await driver.findComponent(ON.id('webSaveImageMenu'));
        await Utils.msSleep(1000);
        if(buttonThree) {
          buttonThree.click()
        }
        await Utils.msSleep(6000);
        let buttonTwo = await driver.findComponent(ON.id('WebContextMenuResultButton'));
        if(buttonTwo) {
          let point = await buttonTwo.getBoundsCenter()
          await driver.mouseClick(point, MouseButton.MOUSE_BUTTON_RIGHT);
          console.info("buttonOne.mouseClick")
        }
        await Utils.msSleep(1000);
        let buttonOne = await driver.findComponent(ON.text('保存图片'));
        if(buttonOne) {
          await Utils.msSleep(1000);
          buttonOne.click();
        }
        done();
      })

  })
}




