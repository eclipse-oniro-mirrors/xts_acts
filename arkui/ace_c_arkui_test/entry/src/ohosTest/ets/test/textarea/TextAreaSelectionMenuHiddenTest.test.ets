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

import { expect, describe, it, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'
import { Driver, ON } from '@ohos.UiTest';

export default function textAreaSelectionMenuHiddenTest() {

  describe('TextAreaSelectionMenuHiddenTest', () => {
    let PAGE_TAG = 'TextAreaSelectionMenuHiddenTest';
    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_SELECTIONMENUHIDDEN_0001
     * @tc.name: testTextAreaSelectionMenuHidden001
     * @tc.desc: testing SelectionMenuHidden for textArea with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaSelectionMenuHidden001', 0, async (done: Function) => {
      await Utils.pushPage(`textarea/${PAGE_TAG}`);
      focusControl.requestFocus('textArea')
      await Utils.sleep(1000)
      await Utils.clickComponent('textArea')
      await Utils.sleep(1000)
      let driver:Driver = Driver.create();
      await driver.assertComponentExist(ON.text('全选'));
      done()
    });
  })
}
