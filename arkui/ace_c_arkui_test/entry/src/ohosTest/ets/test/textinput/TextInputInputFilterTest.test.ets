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
import { Component,Driver, ON} from '@ohos.UiTest';

export default function textInputInputFilterTest() {

  describe('TextInputInputFilterTest', () => {

    let PAGE_TAG = 'TextInputInputFilterTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textinput/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testTextInputInputFilter001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_INPUTFILTER_0100
     * @tc.desc   test inputFilter event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputInputFilter001', Level.LEVEL1, async (done: Function) => {
      let driver:Driver = Driver.create();
      let textInput:Component = await driver.findComponent(ON.type('TextInput'));
      let content  = await textInput.getText();
      console.log('testTextInputInputFilter001', content)
      expect(content).assertEqual('abc')
      done()
    })

  })
}
