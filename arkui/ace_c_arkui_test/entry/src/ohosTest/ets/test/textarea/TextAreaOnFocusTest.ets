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

import { describe, it, expect, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';

export default function textAreaOnFocusTest() {

  describe('TextAreaOnFocusTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ONFOCUS_0100
     * @tc.name: testTextAreaOnFocus001
     * @tc.desc: testing onfocus for textArea with red value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaOnFocus001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TextAreaOnFocusTest';
      await Utils.pushPage(`textarea/${PAGE_TAG}`);
      focusControl.requestFocus('TextAreaOnFocus');
      expect(Utils.getComponentInfoByKey('TextAreaOnFocus').$attrs.backgroundColor).assertEqual('#FFFF0000');
      done();
    })
  })
}
