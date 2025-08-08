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

export default function spanLetterSpacingTest() {

  describe('SpanLetterSpacingTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_LETTERSPACING_0100
     * @tc.name       : testSpanLetterSpacing001
     * @tc.desc       : testing letterSpacing for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanLetterSpacing001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanLetterSpacing001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_LETTERSPACING_0200
     * @tc.name       : testSpanLetterSpacing002
     * @tc.desc       : testing letterSpacing for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanLetterSpacing002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanLetterSpacing002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_LETTERSPACING_0300
     * @tc.name       : testSpanLetterSpacing003
     * @tc.desc       : testing letterSpacing for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanLetterSpacing003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanLetterSpacing003()).assertEqual(0)
      done()
    })

  })
}
