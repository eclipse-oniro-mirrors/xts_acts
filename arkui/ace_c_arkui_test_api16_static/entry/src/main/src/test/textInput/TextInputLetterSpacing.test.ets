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

import { beforeEach, describe, expect, it, Level , beforeAll } from '../../../../hypium';
import Utils from '../common/Utils';
import {LibUtil} from '../../../ets/pages/LibUtil'
import { Driver, ON, PointerMatrix, Rect,Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

let libUtil:LibUtil = new LibUtil();

export default function TextInputLetterSpacing(){

  describe('TextInputLetterSpacing',  () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0100
     * @tc.name       : TextInputLetterSpacing001
     * @tc.desc       : The letterspacing property of the textInput component 
                          and the previewText callback interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textInputLetterSpacing001
     * @tc.name     textInputLetterSpacing001
     * @tc.desc     textInputLetterSpacing001
     * @tc.level    Level.LEVEL1
     */
    it('textInputLetterSpacing001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TextInputLetterSpacing';
      await Utils.pushPage(`textInput/${PAGE_TAG}`);
      console.info("[textInputLetterSpacing001] start succ");
      await Utils.sleep(500);
      let driver = Driver.create();
      await Utils.sleep(500);

      let textinput:Component | null = await driver.findComponent(ON.id('textinput'));
      await Utils.sleep(500);
      await (textinput?.click() as Promise<void>);
      await Utils.sleep(500);
      await driver.triggerKey(2017);
      await Utils.sleep(500);
      await driver.triggerKey(2047);
      await Utils.sleep(500);
      await driver.triggerKey(2017);
      await Utils.sleep(500);
      await driver.triggerKey(2047);
      await Utils.sleep(500);
      await driver.triggerKey(2024);
      await Utils.sleep(500);
      await driver.triggerKey(2047);
      await Utils.sleep(500);
      let strJson2 = inspector.getInspectorByKey('text6');
      await Utils.sleep(200);
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info("[textInputLetterSpacing001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[textInputLetterSpacing001] content is: " + JSON.stringify(obj2.getElement('$attrs').getString('backgroundColor')));
      await Utils.sleep(500);
      expect(obj2.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFE31111');

      done()
    })
  })
}