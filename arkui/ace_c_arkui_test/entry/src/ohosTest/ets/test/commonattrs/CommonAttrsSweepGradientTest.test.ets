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

export default function commonAttrsSweepGradientTest() {

  describe('CommonAttrsSweepGradientTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0100
     * @tc.name       : testCommonAttrsSweepGradient001
     * @tc.desc       : testing sweepGradient for button with default value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSweepGradient001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSweepGradient001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0200
     * @tc.name       : testCommonAttrsSweepGradient002
     * @tc.desc       : testing sweepGradient for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSweepGradient002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSweepGradient002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0300
     * @tc.name       : testCommonAttrsSweepGradient003
     * @tc.desc       : testing sweepGradient for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSweepGradient003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSweepGradient003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0400
     * @tc.name       : testCommonAttrsSweepGradient004
     * @tc.desc       : testing sweepGradient for button with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testCommonAttrsSweepGradient004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSweepGradient004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_COMMONATTRS_ALIGN_0500
     * @tc.name       : testCommonAttrsSweepGradient005
     * @tc.desc       : testing sweepGradient for button with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('testCommonAttrsSweepGradient005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCommonAttrsSweepGradient005()).assertEqual(0)
      done()
    })

  })
}
