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

export default function textSweepGradientTest() {

  describe('TextSweepGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SWEEPGRADIENT_0100
     * @tc.name       : testTextSweepGradient001
     * @tc.desc       : testing sweepGradient for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextSweepGradient001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextSweepGradient001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SWEEPGRADIENT_0200
     * @tc.name       : testTextSweepGradient002
     * @tc.desc       : testing sweepGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextSweepGradient002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextSweepGradient002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SWEEPGRADIENT_0300
     * @tc.name       : testTextSweepGradient003
     * @tc.desc       : testing sweepGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextSweepGradient003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextSweepGradient003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SWEEPGRADIENT_0400
     * @tc.name       : testTextSweepGradient004
     * @tc.desc       : testing sweepGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextSweepGradient004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextSweepGradient004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_SWEEPGRADIENT_0500
     * @tc.name       : testTextSweepGradient005
     * @tc.desc       : testing sweepGradient for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextSweepGradient005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextSweepGradient005()).assertEqual(0)
      done()
    })
  })
}
