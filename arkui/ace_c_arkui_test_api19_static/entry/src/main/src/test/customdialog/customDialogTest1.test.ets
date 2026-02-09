'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it,Level, beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { UtilsTest } from '../Util.test'
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
let libUtil:LibUtil = new LibUtil();

export default function customDialogTest1() {

  describe('customDialogTest1', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api19.static", "EntryAbility")
    });
    let PAGE_TAG = 'customDialogTest1';
    beforeEach(async (): Promise<void> => {
      await Utils.pushPage(`customdialog/${PAGE_TAG}`, false);
      await Utils.sleep(100);
    });

    
    /**
     * @tc.number   customDialogTest1_0010
     * @tc.name     customDialogTest1_0010
     * @tc.desc     customDialogTest1_0010
     * @tc.level    Level.LEVEL1
     */
    it('customDialogTest1_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('customDialogTest1_0010  START');
      await Utils.sleep(500);
      let driver: Driver = Driver.create();
      let btn:Component = await driver.findComponent(ON.id('buttonId')) as Component;
      await btn.click();
      console.info("[customDialogTest1_0010] openDialog");
      await Utils.sleep(1000);
      let btn1:Component = await driver.findComponent(ON.id('button1')) as Component;
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