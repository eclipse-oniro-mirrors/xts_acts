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

export default function imageSpanHeightTest() {

  describe('ImageSpanHeightTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_IMAGESPAN_HEIGHT_0100
     * @tc.name: testImageSpanHeight001
     * @tc.desc: testing height for imageSpan with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageSpanHeight001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSpanHeight001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_IMAGESPAN_HEIGHT_0200
     * @tc.name: testImageSpanHeight002
     * @tc.desc: testing height for imageSpan with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testImageSpanHeight002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSpanHeight002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_IMAGESPAN_HEIGHT_0300
     * @tc.name: testImageSpanHeight003
     * @tc.desc: testing height for imageSpan with large value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageSpanHeight003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testImageSpanHeight003()).assertEqual(0)
      done()
    })

  })
}
