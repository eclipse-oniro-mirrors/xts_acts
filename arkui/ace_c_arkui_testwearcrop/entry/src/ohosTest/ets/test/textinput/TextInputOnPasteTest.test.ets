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

export default function textInputOnPasteTest() {

  describe('TextInputOnPasteTest', () => {

    let PAGE_TAG = 'TextInputOnPasteTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textinput/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testTextInputOnPaste001
     * @tc.number SUB_ARKUI_CAPI_TEXTINPUT_ONPASTE_0100
     * @tc.desc   test onPaste event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextInputOnPaste001', Level.LEVEL1, async  (done: Function) => {
      focusControl.requestFocus('OnPasteTestTextInput')
      await Utils.sleep(1000)
      await Utils.longClickComponent('OnPasteTestTextInput')
      await Utils.sleep(1000)
      await Utils.clickComponentByText('全选')
      await Utils.sleep(1000)
      await Utils.clickComponentByText('剪切')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnPasteTestTextInputCompare')
      await Utils.sleep(1000)
      await Utils.longClickComponent('OnPasteTestTextInputCompare')
      await Utils.sleep(1000)
      await Utils.clickComponentByText('粘贴')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnPasteTestTextInputCompare').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}
