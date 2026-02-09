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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test'
import { LibUtil } from '../../../ets/pages/LibUtil';
import { focusControl } from '@ohos.arkui.component'

export default function textAreaOnPasteTest() {

  describe('TextAreaOnPasteTest', () => {
    let PAGE_TAG = 'TextAreaOnPasteTest';

    beforeAll((): void => {
      console.info("[ui] beforeAll start");
            await UtilsTest.startAbility("com.openharmony.arkui_capi_xts_testwearcrop.static", "EntryAbility")
      await Utils.pushPage(`textarea/${PAGE_TAG}`, false);
      console.info("[ui] beforeAll end");
    });


    
    /**
     * @tc.number   testTextAreaOnPaste001
     * @tc.name     testTextAreaOnPaste001
     * @tc.desc     testTextAreaOnPaste001
     * @tc.level    Level.LEVEL1
     */
    it('testTextAreaOnPaste001', Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      expect(Utils.getComponentInfoByKey('OnPasteTestTextAreaCompare')
        .getElement('$attrs')
        .getString('backgroundColor')).assertEqual('#FF00FF00')
      done()
    })

  })
}
