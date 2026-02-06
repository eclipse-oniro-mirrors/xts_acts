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

import { beforeEach, describe, expect, it,Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import { resourceManager } from '@kit.LocalizationKit';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import nativeRender from 'libnativerender.so'

export default function customDialogTest1() {

  describe('customDialogTest1', () => {

    let PAGE_TAG = 'customDialogTest1';
    beforeEach(async (done: Function) => {
      await Utils.pushPage(`customdialog/${PAGE_TAG}`, done);
      await Utils.sleep(1000);
      done();
    });

    /*
    * @tc.number: SUB_ARKUI_CAPI_CUSTOMDIALOG_0200
    * @tc.name: customDialogTest1_0010
    * @tc.desc: To test the properties of the updateDialog
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 1
    */
    it('customDialogTest1_0010', Level.LEVEL1, async (done: Function) => {
      console.info('customDialogTest1_0010  START');
      await Utils.sleep(500);
      let driver: Driver = Driver.create();
      await Utils.sleep(500);
      let btn = await driver.findComponent(ON.id('buttonId'));
      await btn.click();
      console.info("[customDialogTest1_0010] openDialog");
      await Utils.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('button1'));
      expect(btn1!= null).assertTrue()
      await btn1.click();

      console.info("[customDialogTest1_0010] updateDialog");
      await Utils.sleep(1000);

      await driver.triggerKey(2070)
      console.info('customDialogTest1_0010  END');
      done()
    })

  })
}