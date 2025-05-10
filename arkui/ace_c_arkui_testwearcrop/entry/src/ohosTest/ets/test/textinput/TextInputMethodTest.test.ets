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

import { beforeAll, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON} from '@ohos.UiTest';

export default function textInputMethodTest() {

  describe('textInputMethodTest', () => {

    let PAGE_TAG = 'TextInputMethodTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textinput/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_METHOD_0100
    * @tc.name       : textInputMethodTest001
    * @tc.desc       : test onCut event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('textInputMethodTest001', Level.LEVEL1, async (done: Function) => {
      let driver = await Driver.create();
      await Utils.sleep(500);
      let textinput = await driver.findComponent(ON.id('MethodTestTextInput'));
      console.log('textInputMethodTest001----1')
      await Utils.sleep(500);
      await textinput.click()
      await Utils.sleep(500);
      console.log('textInputMethodTest001----1')
      let button1 = await driver.findComponent(ON.text('下一步'));
      await Utils.sleep(500);
      await button1?.click();
      await Utils.sleep(500);
      expect('').assertEqual('')
      done()
    })
  })
}