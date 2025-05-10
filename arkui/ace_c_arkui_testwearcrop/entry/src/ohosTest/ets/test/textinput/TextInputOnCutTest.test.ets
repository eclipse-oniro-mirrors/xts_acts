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

export default function textInputOnCutTest() {

  describe('TextInputOnCutTest', () => {

    let PAGE_TAG = 'TextInputOnCutTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textinput/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_ONCUT_0100
    * @tc.name       : testTextInputOnCut001
    * @tc.desc       : test onCut event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextInputOnCut001', 0, async (done: Function) => {
      focusControl.requestFocus('OnCutTestTextInput')
      await Utils.sleep(2000)
      await Utils.clickComponent('OnCutTestTextInput')
      await Utils.sleep(2000)
      await Utils.doubleClickComponent('OnCutTestTextInput')
      await Utils.sleep(2000)
      await Utils.clickComponentByText('剪切')
      await Utils.sleep(2000)
      expect(Utils.getComponentInfoByKey('OnCutTestTextInput').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}
