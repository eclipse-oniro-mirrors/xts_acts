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

export default function spanTextBackgroundStyleTest() {

  describe('SpanTextBackgroundStyleTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_TEXT_BACKGROUND_STYLE_0100
     * @tc.name       : testSpanTextBackgroundStyle001
     * @tc.desc       : testing content for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanTextBackgroundStyle001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanTextBackgroundStyle001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_TEXT_BACKGROUND_STYLE_0200
     * @tc.name       : testSpanTextBackgroundStyle002
     * @tc.desc       : testing content for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanTextBackgroundStyle002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanTextBackgroundStyle002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_TEXT_BACKGROUND_STYLE_0300
     * @tc.name       : testSpanTextBackgroundStyle003
     * @tc.desc       : testing content for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanTextBackgroundStyle003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanTextBackgroundStyle003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_TEXT_BACKGROUND_STYLE_0400
     * @tc.name       : testSpanTextBackgroundStyle004
     * @tc.desc       : testing content for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanTextBackgroundStyle004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanTextBackgroundStyle004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_TEXT_BACKGROUND_STYLE_0500
     * @tc.name       : testSpanTextBackgroundStyle005
     * @tc.desc       : testing content for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanTextBackgroundStyle005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanTextBackgroundStyle005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_TEXT_BACKGROUND_STYLE_0600
     * @tc.name       : testSpanTextBackgroundStyle006
     * @tc.desc       : testing content for span with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanTextBackgroundStyle006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testSpanTextBackgroundStyle006()).assertEqual(0)
      done()
    })

  })
}