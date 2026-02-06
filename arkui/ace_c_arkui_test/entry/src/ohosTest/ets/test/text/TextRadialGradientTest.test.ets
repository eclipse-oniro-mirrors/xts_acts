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

export default function textRadialGradientTest() {

  describe('TextRadialGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_RADIALGRADIENT_0100
     * @tc.name       : testTextRadialGradient001
     * @tc.desc       : testing radialGradient for text with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextRadialGradient001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextRadialGradient001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_RADIALGRADIENT_0200
     * @tc.name       : testTextRadialGradient002
     * @tc.desc       : testing radialGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextRadialGradient002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextRadialGradient002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_RADIALGRADIENT_0300
     * @tc.name       : testTextRadialGradient003
     * @tc.desc       : testing radialGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextRadialGradient003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextRadialGradient003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_RADIALGRADIENT_0400
     * @tc.name       : testTextRadialGradient004
     * @tc.desc       : testing radialGradient for text with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testTextRadialGradient004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextRadialGradient004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_TEXT_RADIALGRADIENT_0500
     * @tc.name       : testTextRadialGradient005
     * @tc.desc       : testing radialGradient for text with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testTextRadialGradient005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testTextRadialGradient005()).assertEqual(0)
      done()
    })
  })
}
