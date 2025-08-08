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

export default function imageSpanSrcTest() {

  describe('ImageSpanSrcTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SPAN_SRC_0100
     * @tc.name       : testImageSpanSrc001
     * @tc.desc       : testing src for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageSpanSrc001', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanSrc001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SPAN_SRC_0200
     * @tc.name       : testImageSpanSrc002
     * @tc.desc       : testing src for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageSpanSrc002', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanSrc002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SPAN_SRC_0300
     * @tc.name       : testImageSpanSrc003
     * @tc.desc       : testing src for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageSpanSrc003', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanSrc003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SPAN_SRC_0400
     * @tc.name       : testImageSpanSrc004
     * @tc.desc       : testing src for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageSpanSrc004', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanSrc004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_IMAGE_SPAN_SRC_0500
     * @tc.name       : testImageSpanSrc005
     * @tc.desc       : testing src for imageSpan with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testImageSpanSrc005', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanSrc005()).assertEqual(0)
      done()
    })

  })
}
