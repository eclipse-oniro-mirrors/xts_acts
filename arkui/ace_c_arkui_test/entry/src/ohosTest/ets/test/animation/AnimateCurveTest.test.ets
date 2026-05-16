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

export default function animateCurveTest() {

  describe('AnimateCurveTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testAnimateCurve001
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_0100
     * @tc.desc   testing OH_ArkUI_Curve_CreateCurveByType with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateCurve002
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_0200
     * @tc.desc   testing OH_ArkUI_Curve_CreateStepsCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateCurve003
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_0300
     * @tc.desc   testing OH_ArkUI_Curve_CreateStepsCurve with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateCurve004
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_0400
     * @tc.desc   testing OH_ArkUI_Curve_CreateStepsCurve with abnormal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateCurve005
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_0500
     * @tc.desc   testing OH_ArkUI_Curve_CreateCubicBezierCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateCurve006
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_0600
     * @tc.desc   testing OH_ArkUI_Curve_CreateSpringCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateCurve007
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_0700
     * @tc.desc   testing OH_ArkUI_Curve_CreateSpringMotion with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateCurve008
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_0800
     * @tc.desc   testing OH_ArkUI_Curve_CreateResponsiveSpringMotion with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve008()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateCurve009
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_0900
     * @tc.desc   testing OH_ArkUI_Curve_CreateInterpolatingSpring with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve009', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve009()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateCurve010
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_1000
     * @tc.desc   testing OH_ArkUI_Curve_DisposeCurve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve010', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve010()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testAnimateCurve011
     * @tc.number SUB_ARKUI_CAPI_ANIMATECURVE_1100
     * @tc.desc   testing OH_ArkUI_Curve_CreateCustomCurve with normal value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAnimateCurve011', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve011()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  testAnimateCurve012
     * @tc.name    testAnimateCurve012
     * @tc.desc    testing OH_ArkUI_Curve_CreateCustomCurve minimum boundary
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAnimateCurve012', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve012()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  testAnimateCurve013
     * @tc.name    testAnimateCurve013
     * @tc.desc    testing OH_ArkUI_Curve_CreateCustomCurve Maximum
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAnimateCurve013', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve013()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  testAnimateCurve014
     * @tc.name    testAnimateCurve014
     * @tc.desc    testing OH_ArkUI_Curve_CreateCustomCurve 
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAnimateCurve014', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve014()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  testAnimateCurve015
     * @tc.name    testAnimateCurve015
     * @tc.desc    testing OH_ArkUI_Curve_CreateCubicBezierCurve 
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAnimateCurve015', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve015()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  testAnimateCurve016
     * @tc.name    testAnimateCurve016
     * @tc.desc    testing OH_ArkUI_Curve_CreateCubicBezierCurve 
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testAnimateCurve016', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve016()).assertEqual(0)
      done()
    })

    /**
     * @tc.number     testAnimateCurve017
     * @tc.name       testAnimateCurve017
     * @tc.desc       testing OH_ArkUI_Curve_CreateCubicBezierCurve
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testAnimateCurve017', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testAnimateCurve017()).assertEqual(0)
      done()
    })

  })
}
