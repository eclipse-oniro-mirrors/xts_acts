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
import { Driver, ON, PointerMatrix, Rect ,Component} from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'

let libUtil:LibUtil = new LibUtil();

export default function TextAreaLetterSpacing(){

  describe('TextAreaLetterSpacing',  () => {
    beforeAll((): void => {
      await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_api16.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      await Utils.sleep(100);
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_CUSTOM_PRPPERTY_0100
     * @tc.name       : TextAreaLetterSpacing001
     * @tc.desc       : The letterspacing property of the textArea component 
                          and the previewText callback interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    /**
     * @tc.number   textAreaLetterSpacing001
     * @tc.name     textAreaLetterSpacing001
     * @tc.desc     textAreaLetterSpacing001
     * @tc.level    Level.LEVEL1
     */
    it('textAreaLetterSpacing001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      let PAGE_TAG = 'TextAreaLetterSpacing';
      await Utils.pushPage(`textArea/${PAGE_TAG}`);
      console.info("[textAreaLetterSpacing001] start succ");
      await Utils.sleep(500);
      let driver = Driver.create();
      await Utils.sleep(500);

      let textarea:Component | null = await driver.findComponent(ON.id('textarea'));
      await Utils.sleep(500);
      await (textarea?.click() as Promise<void>);
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
      let strJson3 = inspector.getInspectorByKey('text7');
      await Utils.sleep(200);
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info("[textAreaLetterSpacing001] component obj3 is: " + JSON.stringify(obj3));
      console.info("[textAreaLetterSpacing001] content is: " + JSON.stringify(obj3.getElement('$attrs').getString('backgroundColor')));
      await Utils.sleep(500);
      expect(obj3.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFE31111');

      done()
    })
  })
}