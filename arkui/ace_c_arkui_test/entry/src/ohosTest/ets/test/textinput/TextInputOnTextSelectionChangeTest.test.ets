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

export default function textInputOnTextSelectionChangeTest() {

  describe('TextInputOnTextSelectionChangeTest', () => {

    let PAGE_TAG = 'TextInputOnTextSelectionChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textinput/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testTextInputOnTextSelectionChange001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ON_TEXT_SELECTION_CHANGE_0001
     * @tc.desc   test onTextSelectionChange event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputOnTextSelectionChange001', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnTextSelectionChangeTestTextInput')
      await Utils.sleep(1000)
      await Utils.clickComponent('OnButtonClick')
      await Utils.sleep(1000)
      let dataArray: number[][] = nativeRender.getTextInputData();
      let textInputSelectionData: number[] = dataArray[0];
      expect(textInputSelectionData[2] == 0 && textInputSelectionData[3] == 4).assertEqual(true)
      done()
    })

  })
}
