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

export default function textAreaOnChangeTest() {

  describe('TextAreaOnChangeTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_ONCHANGE_0100
     * @tc.name: testTextAreaOnChange001
     * @tc.desc: testing onChange for textArea
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaOnChange001', Level.LEVEL1, async (done: Function) => {
      let PAGE_TAG = 'TextAreaOnChangeTest';
      await Utils.pushPage(`textarea/${PAGE_TAG}`);
      expect(Utils.getComponentInfoByKey('TextAreaOnChange').$attrs.backgroundColor).assertEqual('#FFFF0000');
      done();
    })
  })
}
