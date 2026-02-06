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

export default function spanFontSizeTest() {

  describe('SpanFontSizeTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_SPAN_FONTSIZE_0100
     * @tc.name: testSpanFontSize001
     * @tc.desc: testing fontSize for span with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSpanFontSize001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontSize001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SPAN_FONTSIZE_0200
     * @tc.name: testSpanFontSize002
     * @tc.desc: testing fontSize for span with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testSpanFontSize002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontSize002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_SPAN_FONTSIZE_0300
     * @tc.name: testSpanFontSize003
     * @tc.desc: testing fontSize for span with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testSpanFontSize003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanFontSize003()).assertEqual(0)
      done()
    })

  })
}
