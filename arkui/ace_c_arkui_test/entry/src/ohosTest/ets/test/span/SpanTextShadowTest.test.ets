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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function spanTextShadowTest() {

  describe('SpanTextShadowTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_TEXT_SHADOW_0100
     * @tc.name       : testSpanTextShadow001
     * @tc.desc       : testing textShadow for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanTextShadow001', 0, async (done: Function) => {
      expect(nativeFunc.testSpanTextShadow001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_TEXT_SHADOW_0200
     * @tc.name       : testSpanTextShadow002
     * @tc.desc       : testing textShadow for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanTextShadow002', 0, async (done: Function) => {
      expect(nativeFunc.testSpanTextShadow002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_TEXT_SHADOW_0300
     * @tc.name       : testSpanTextShadow003
     * @tc.desc       : testing textShadow for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanTextShadow003', 0, async (done: Function) => {
      expect(nativeFunc.testSpanTextShadow003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_SPAN_TEXT_SHADOW_0400
     * @tc.name       : testSpanTextShadow004
     * @tc.desc       : testing textShadow for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testSpanTextShadow004', 0, async (done: Function) => {
      expect(nativeFunc.testSpanTextShadow004()).assertEqual(0)
      done()
    })

  })
}
