/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';

export default function TextAreaLetterSpacing(){

  describe('TextAreaLetterSpacing', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
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

    it('textAreaLetterSpacing001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TextAreaLetterSpacing';
      await Utils.pushPage(`textArea/${PAGE_TAG}`);
      console.info("[textAreaLetterSpacing001] start succ");
      await Utils.sleep(500);
      let driver = await Driver.create();
      await Utils.sleep(500);

      let textarea = await driver.findComponent(ON.id('textarea'));
      await Utils.sleep(500);
      await textarea.click();
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
      let strJson3 = getInspectorByKey('text7');
      await Utils.sleep(200);
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[textAreaLetterSpacing001] component obj3 is: " + JSON.stringify(obj3));
      console.info("[textAreaLetterSpacing001] content is: " + JSON.stringify(obj3.$attrs.backgroundColor));
      await Utils.sleep(500);
      expect(obj3.$attrs.backgroundColor).assertEqual('#FFE31111');

      done()
    })
  })
}