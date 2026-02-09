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

export default function textAreaOnContentScrollTest() {

  describe('TextAreaOnContentScrollTest', () => {

    let PAGE_TAG = 'TextAreaOnContentScrollTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textarea/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name   testTextAreaOnContentScroll001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_ON_CONTENT_SCROLL_0001
     * @tc.desc   test onContentScroll event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaOnContentScroll001', Level.LEVEL1, async (done: Function) => {
      focusControl.requestFocus('OnContentScrollTestTextArea')
      await Utils.sleep(1000)
      await Utils.flingComponent('OnContentScrollTestTextArea', true, true);
      await Utils.sleep(1000)
      expect(Utils.getComponentInfoByKey('OnContentScrollTestTextArea').$attrs.backgroundColor).assertEqual('#FF00FF00')
      done()
    })

  })
}
