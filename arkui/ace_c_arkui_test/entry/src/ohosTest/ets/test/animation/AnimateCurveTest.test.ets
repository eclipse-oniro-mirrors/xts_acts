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

export default function animateCurveTest() {

  describe('AnimateCurveTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_0100
     * @tc.name       : testAnimateCurve001
     * @tc.desc       : testing OH_ArkUI_Curve_CreateCurveByType with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve001', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve001()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_0200
     * @tc.name       : testAnimateCurve002
     * @tc.desc       : testing OH_ArkUI_Curve_CreateStepsCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve002', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve002()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_0300
     * @tc.name       : testAnimateCurve003
     * @tc.desc       : testing OH_ArkUI_Curve_CreateStepsCurve with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve003', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve003()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_0400
     * @tc.name       : testAnimateCurve004
     * @tc.desc       : testing OH_ArkUI_Curve_CreateStepsCurve with abnormal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve004', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve004()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_0500
     * @tc.name       : testAnimateCurve005
     * @tc.desc       : testing OH_ArkUI_Curve_CreateCubicBezierCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve005', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve005()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_0600
     * @tc.name       : testAnimateCurve006
     * @tc.desc       : testing OH_ArkUI_Curve_CreateSpringCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve006', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve006()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_0700
     * @tc.name       : testAnimateCurve007
     * @tc.desc       : testing OH_ArkUI_Curve_CreateSpringMotion with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve007', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve007()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_0800
     * @tc.name       : testAnimateCurve008
     * @tc.desc       : testing OH_ArkUI_Curve_CreateResponsiveSpringMotion with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve008', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve008()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_0900
     * @tc.name       : testAnimateCurve009
     * @tc.desc       : testing OH_ArkUI_Curve_CreateInterpolatingSpring with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve009', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve009()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_1000
     * @tc.name       : testAnimateCurve010
     * @tc.desc       : testing OH_ArkUI_Curve_DisposeCurve
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve010', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve010()).assertEqual(0)
      done()
    })

    /*
     * @tc.number     : SUB_ARKUI_CAPI_ANIMATECURVE_1100
     * @tc.name       : testAnimateCurve011
     * @tc.desc       : testing OH_ArkUI_Curve_CreateCustomCurve with normal value
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testAnimateCurve011', 0, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve011()).assertEqual(0)
      done()
    })

  })
}
