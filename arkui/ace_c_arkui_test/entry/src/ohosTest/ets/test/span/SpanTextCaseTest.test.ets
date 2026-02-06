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

export default function spanTextCaseTest() {

  describe('SpanTextCaseTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testSpanTextCase001
     * @tc.number SUB_ARKUI_CAPI_SPAN_TEXTCASE_0100
     * @tc.desc   testing textcase for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanTextCase001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanTextCase001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanTextCase002
     * @tc.number SUB_ARKUI_CAPI_SPAN_TEXTCASE_0200
     * @tc.desc   testing textcase for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanTextCase002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanTextCase002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanTextCase003
     * @tc.number SUB_ARKUI_CAPI_SPAN_TEXTCASE_0300
     * @tc.desc   testing textcase for span with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanTextCase003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanTextCase003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testSpanTextCase004
     * @tc.number SUB_ARKUI_CAPI_SPAN_TEXTCASE_0400
     * @tc.desc   testing textcase for span with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSpanTextCase004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanTextCase004()).assertEqual(0)
      done()
    })

  })
}
