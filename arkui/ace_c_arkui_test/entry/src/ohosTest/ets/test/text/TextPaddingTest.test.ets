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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function textPaddingTest() {

  describe('TextPaddingTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_PADDING_0100
     * @tc.name       : testTextPadding001
     * @tc.desc       : testing padding for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPadding001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPadding001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_PADDING_0200
     * @tc.name       : testTextPadding002
     * @tc.desc       : testing padding for text with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPadding002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPadding002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_PADDING_0300
     * @tc.name       : testTextPadding003
     * @tc.desc       : testing padding for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPadding003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPadding003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_PADDING_0400
     * @tc.name       : testTextPadding004
     * @tc.desc       : testing padding for text with boundary value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextPadding004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextPadding004()).assertEqual(0)
      done()
    })
  })
}
