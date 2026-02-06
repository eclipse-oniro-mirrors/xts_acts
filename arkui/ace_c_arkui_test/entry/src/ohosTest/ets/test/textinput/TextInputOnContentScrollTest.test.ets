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

export default function textInputOnContentScrollTest() {

  describe('TextInputOnContentScrollTest', () => {

    let PAGE_TAG = 'TextInputOnContentScrollTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textinput/${PAGE_TAG}`, done);
    });

    /*
    * @tc.number     : SUB_ARKUI_CAPI_TEXTINPUT_ON_CONTENT_SCROLL_0001
    * @tc.name       : testTextInputOnContentScroll001
    * @tc.desc       : test estTextInputOnContentScroll event callback
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testTextInputOnContentScroll001', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnContentScrollTestTextInput')
      await Utils.sleep(1000)
      await Utils.flingComponent('OnContentScrollTestTextInput', false, true);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnContentScrollTestTextInput').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}
