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

export default function imageSpanObjectFitTest() {

  describe('ImageSpanObjectFitTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number: SUB_ARKUI_CAPI_IMAGESPAN_OBJECTFIT_0100
     * @tc.name: testImageSpanObjectFit001
     * @tc.desc: testing objectFit for imageSpan with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageSpanObjectFit001', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanObjectFit001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_IMAGESPAN_OBJECTFIT_0200
     * @tc.name: testImageSpanObjectFit002
     * @tc.desc: testing objectFit for imageSpan with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageSpanObjectFit002', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanObjectFit002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_IMAGESPAN_OBJECTFIT_0300
     * @tc.name: testImageSpanObjectFit003
     * @tc.desc: testing objectFit for imageSpan with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageSpanObjectFit003', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanObjectFit003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_IMAGESPAN_OBJECTFIT_0400
     * @tc.name: testImageSpanObjectFit004
     * @tc.desc: testing objectFit for imageSpan with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageSpanObjectFit004', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanObjectFit004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_IMAGESPAN_OBJECTFIT_0500
     * @tc.name: testImageSpanObjectFit005
     * @tc.desc: testing objectFit for imageSpan with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageSpanObjectFit005', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanObjectFit005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_IMAGESPAN_OBJECTFIT_0600
     * @tc.name: testImageSpanObjectFit006
     * @tc.desc: testing objectFit for imageSpan with normal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testImageSpanObjectFit006', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanObjectFit006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number: SUB_ARKUI_CAPI_IMAGESPAN_OBJECTFIT_0700
     * @tc.name: testImageSpanObjectFit007
     * @tc.desc: testing objectFit for imageSpan with abnormal value
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('testImageSpanObjectFit007', 0, async (done: Function) => {
      expect(nativeFunc.testImageSpanObjectFit007()).assertEqual(0)
      done()
    })

  })
}
