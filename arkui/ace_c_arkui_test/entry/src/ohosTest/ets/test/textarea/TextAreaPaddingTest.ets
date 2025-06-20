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

import { expect, describe, it, afterEach, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textAreaPaddingTest() {

  describe('TextAreaPaddingTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_PADDING_0100
     * @tc.name: testTextAreaPadding001
     * @tc.desc: testing padding for textArea with single value 16vp
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaPadding001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPadding001()).assertEqual(0)
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_TEXTAREA_PADDING_0200
     * @tc.name: testTextAreaPadding002
     * @tc.desc: testing padding for textArea with overall value array 8,16,10,20(vp)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testTextAreaPadding002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextAreaPadding002()).assertEqual(0)
      done();
    });
  })
}
