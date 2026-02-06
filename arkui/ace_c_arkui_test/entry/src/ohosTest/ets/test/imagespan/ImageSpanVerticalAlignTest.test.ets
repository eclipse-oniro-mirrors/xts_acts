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

export default function imageSpanVerticalAlignTest() {

  describe('ImageSpanVerticalAlignTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testImageSpanVerticalAlign001
     * @tc.number SUB_ARKUI_CAPI_IMAGESPAN_VERTICALALIGN_0100
     * @tc.desc   testing verticalAlign for imageSpan with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSpanVerticalAlign001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSpanVerticalAlign001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageSpanVerticalAlign002
     * @tc.number SUB_ARKUI_CAPI_IMAGESPAN_VERTICALALIGN_0200
     * @tc.desc   testing verticalAlign for imageSpan with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSpanVerticalAlign002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSpanVerticalAlign002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageSpanVerticalAlign003
     * @tc.number SUB_ARKUI_CAPI_IMAGESPAN_VERTICALALIGN_0300
     * @tc.desc   testing verticalAlign for imageSpan with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSpanVerticalAlign003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSpanVerticalAlign003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageSpanVerticalAlign004
     * @tc.number SUB_ARKUI_CAPI_IMAGESPAN_VERTICALALIGN_0400
     * @tc.desc   testing verticalAlign for imageSpan with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSpanVerticalAlign004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSpanVerticalAlign004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testImageSpanVerticalAlign005
     * @tc.number SUB_ARKUI_CAPI_IMAGESPAN_VERTICALALIGN_0500
     * @tc.desc   testing verticalAlign for imageSpan with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageSpanVerticalAlign005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSpanVerticalAlign005()).assertEqual(0)
      done()
    })

  })
}
