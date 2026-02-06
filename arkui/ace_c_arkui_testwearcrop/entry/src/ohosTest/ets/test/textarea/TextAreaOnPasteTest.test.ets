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

export default function textAreaOnPasteTest() {

  describe('TextAreaOnPasteTest', () => {

    let PAGE_TAG = 'TextAreaOnPasteTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textarea/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTAREA_ONPASTE_0100
    * @tc.name       : testTextAreaOnPaste001
    * @tc.desc       : test onPaste event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextAreaOnPaste001', Level.LEVEL1, async  (done: Function) => {
      focusControl.requestFocus('OnPasteTestTextArea')
      await Utils.sleep(1000)
      await Utils.longClickComponent('OnPasteTestTextArea')
      await Utils.sleep(1000)
      await Utils.clickComponentByText('全选')
      await Utils.sleep(1000)
      await Utils.clickComponentByText('剪切')
      await Utils.sleep(1000)
      focusControl.requestFocus('OnPasteTestTextAreaCompare')
      await Utils.sleep(1000)
      await Utils.longClickComponent('OnPasteTestTextAreaCompare')
      await Utils.sleep(1000)
      await Utils.clickComponentByText('全选')
      await Utils.sleep(1000)
      await Utils.clickComponentByText('粘贴')
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnPasteTestTextAreaCompare').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}
