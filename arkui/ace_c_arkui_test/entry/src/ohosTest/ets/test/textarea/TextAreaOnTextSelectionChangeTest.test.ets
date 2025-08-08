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

import { beforeAll, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeRender from 'libnativerender.so'

export default function textAreaOnTextSelectionChangeTest() {

  describe('TextAreaOnTextSelectionChangeTest', () => {

    let PAGE_TAG = 'TextAreaOnTextSelectionChangeTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textarea/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTAREA_ON_TEXT_SELECTION_CHANGE_0001
    * @tc.name       : testTextAreaOnTextSelectionChange001
    * @tc.desc       : test onTextSelectionChange event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextAreaOnTextSelectionChange001', 0, async (done: Function) => {
      focusControl.requestFocus('OnTextSelectionChangeTestTextArea')
      await Utils.sleep(1000)
      await Utils.clickComponent('OnButtonClick')
      await Utils.sleep(1000)
      let dataArray: number[][] = nativeRender.getTextAreaData();
      let textAreaSelectionData: number[] = dataArray[0];
      console.log('testTextAreaOnTextSelectionChange001', JSON.stringify(dataArray))
      expect(textAreaSelectionData[2] == 0 && textAreaSelectionData[3] == 4).assertEqual(true)
      done()
    })

  })
}
