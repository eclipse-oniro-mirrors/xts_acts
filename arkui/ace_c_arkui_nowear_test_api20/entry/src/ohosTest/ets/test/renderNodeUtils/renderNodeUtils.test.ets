/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function RenderNodeUtilsTest(){

  describe('RenderNodeUtilsTest', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0010
     * @tc.name       : RenderNodeUtils_001
     * @tc.desc       : test mask renderNodeUtils about rectShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0020
     * @tc.name       : RenderNodeUtils_002
     * @tc.desc       : test mask renderNodeUtils about styleOption
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0030
     * @tc.name       : RenderNodeUtils_003
     * @tc.desc       : test mask renderNodeUtils about rectShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0040
     * @tc.name       : RenderNodeUtils_004
     * @tc.desc       : test mask renderNodeUtils about colorOption
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0050
     * @tc.name       : RenderNodeUtils_005
     * @tc.desc       : test mask renderNodeUtils about radiusOption
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0060
     * @tc.name       : RenderNodeUtils_006
     * @tc.desc       : test mask renderNodeUtils about circleShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0070
     * @tc.name       : RenderNodeUtils_007
     * @tc.desc       : test mask renderNodeUtils about roundShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0080
     * @tc.name       : RenderNodeUtils_008
     * @tc.desc       : test mask renderNodeUtils about commandPath
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0090
     * @tc.name       : RenderNodeUtils_009
     * @tc.desc       : test mask renderNodeUtils about OvalShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0100
     * @tc.name       : RenderNodeUtils_010
     * @tc.desc       : test clip renderNodeUtils about commandPath
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0110
     * @tc.name       : RenderNodeUtils_011
     * @tc.desc       : test clip renderNodeUtils about rectShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_011()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0120
     * @tc.name       : RenderNodeUtils_012
     * @tc.desc       : test clip renderNodeUtils about roundShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_012()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0130
     * @tc.name       : RenderNodeUtils_013
     * @tc.desc       : test clip renderNodeUtils about circleShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_013()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0140
     * @tc.name       : RenderNodeUtils_014
     * @tc.desc       : test clip renderNodeUtils about OvalShape
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_014()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0150
     * @tc.name       : RenderNodeUtils_015
     * @tc.desc       : test SetMask about ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_015()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_RenderNodeUtils_0160
     * @tc.name       : RenderNodeUtils_016
     * @tc.desc       : test SetClip about ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('RenderNodeUtils_016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.RenderNodeUtils_016()).assertEqual(0)
      done()
    })
  })
}