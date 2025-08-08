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
import nativeRender from 'libnativerender.so'
import { Driver, ON } from '@ohos.UiTest';
export default function textInputSelectionMenuHiddenTest() {

  describe('TextInputSelectionMenuHiddenTest', () => {

    let PAGE_TAG = 'TextInputSelectionMenuHiddenTest';
    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_SELECTION_MENU_HIDDEN_0001
    * @tc.name       : testTextInputSelectionMenuHidden001
    * @tc.desc       : test onInsert event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextInputSelectionMenuHidden001', Level.LEVEL1, async (done: Function) => {
      await Utils.pushPage(`textinput/${PAGE_TAG}`);
      focusControl.requestFocus('textInput1')
      await Utils.sleep(1000)
      await Utils.clickComponent('textInput1')
      await Utils.sleep(1000)
      let driver:Driver = Driver.create();
      await driver.assertComponentExist(ON.text('全选'));
      done()
      done()
    })

  })
}
