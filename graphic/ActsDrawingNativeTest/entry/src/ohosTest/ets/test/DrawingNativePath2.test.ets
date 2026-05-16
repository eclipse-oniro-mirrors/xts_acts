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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import libDrawingNative from 'libdrawingnative.so';
import Utils, { Log } from './Utils.test';


export default function DrawingNativePath2Test() {
  describe('DrawingNativePath2Test', () => {
    beforeAll(async () => {
    })

    beforeEach(async () => {
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testPathApproximateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0100
     * @tc.desc   test for testPathApproximateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathApproximateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathApproximateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0200
     * @tc.desc   test for testPathApproximateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathApproximateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathApproximateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0300
     * @tc.desc   test for testPathApproximateAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathApproximateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathApproximateMultiCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0400
     * @tc.desc   test for testPathApproximateMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathApproximateMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0500
     * @tc.desc   test for testPathInterpolateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathInterpolateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0600
     * @tc.desc   test for testPathInterpolateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathInterpolateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0700
     * @tc.desc   test for testPathInterpolateAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathInterpolateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathInterpolateMultiCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0800
     * @tc.desc   test for testPathInterpolateMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathInterpolateMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInterpolateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_0900
     * @tc.desc   test for testPathIsInterpolateNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInterpolateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInterpolateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_1000
     * @tc.desc   test for testPathIsInterpolateNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsInterpolateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInterpolateMultiCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart3Advanced_1100
     * @tc.desc   test for testPathIsInterpolateMultiCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsInterpolateMultiCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart3Advanced(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalOne
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0100
     * @tc.desc   test for testPathIsInverseFillTypeNormalOne
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInverseFillTypeNormalOne', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalTwo
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0200
     * @tc.desc   test for testPathIsInverseFillTypeNormalTwo
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInverseFillTypeNormalTwo', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalThree
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0300
     * @tc.desc   test for testPathIsInverseFillTypeNormalThree
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInverseFillTypeNormalThree', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNormalFour
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0400
     * @tc.desc   test for testPathIsInverseFillTypeNormalFour
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsInverseFillTypeNormalFour', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0500
     * @tc.desc   test for testPathIsInverseFillTypeNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsInverseFillTypeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathToggleInverseFillTypeNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0600
     * @tc.desc   test for testPathToggleInverseFillTypeNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathToggleInverseFillTypeNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsInverseFillTypeCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0700
     * @tc.desc   test for testPathIsInverseFillTypeCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsInverseFillTypeCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathToggleInverseFillTypeCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4InverseFillType_0800
     * @tc.desc   test for testPathToggleInverseFillTypeCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathToggleInverseFillTypeCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4InverseFillType(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPointDataNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_0100
     * @tc.desc   test for testPathGetPointDataNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetPointDataNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPointDataNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_0200
     * @tc.desc   test for testPathGetPointDataNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetPointDataNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPointDataAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_0300
     * @tc.desc   test for testPathGetPointDataAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetPointDataAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetPointDataMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_0400
     * @tc.desc   test for testPathGetPointDataMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetPointDataMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetVerbDataNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_0500
     * @tc.desc   test for testPathGetVerbDataNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetVerbDataNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetVerbDataNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_0600
     * @tc.desc   test for testPathGetVerbDataNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetVerbDataNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetVerbDataAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_0700
     * @tc.desc   test for testPathGetVerbDataAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetVerbDataAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetVerbDataMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_0800
     * @tc.desc   test for testPathGetVerbDataMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetVerbDataMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetConicWeightNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_0900
     * @tc.desc   test for testPathGetConicWeightNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetConicWeightNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetConicWeightNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_1000
     * @tc.desc   test for testPathGetConicWeightNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetConicWeightNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetConicWeightAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_1100
     * @tc.desc   test for testPathGetConicWeightAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetConicWeightAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetConicWeightMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_1200
     * @tc.desc   test for testPathGetConicWeightMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetConicWeightMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConvertToSvgStringNormal1
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_1300
     * @tc.desc   test for testPathConvertToSvgStringNormal1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathConvertToSvgStringNormal1', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConvertToSvgStringNormal2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_1400
     * @tc.desc   test for testPathConvertToSvgStringNormal2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testPathConvertToSvgStringNormal2', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConvertToSvgStringNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_1500
     * @tc.desc   test for testPathConvertToSvgStringNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathConvertToSvgStringNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConvertToSvgStringAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_1600
     * @tc.desc   test for testPathConvertToSvgStringAbnormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathConvertToSvgStringAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathConvertToSvgStringMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_1700
     * @tc.desc   test for testPathConvertToSvgStringMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathConvertToSvgStringMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetLastPointNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_1800
     * @tc.desc   test for testPathGetLastPointNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathGetLastPointNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetLastPointNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_1900
     * @tc.desc   test for testPathGetLastPointNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetLastPointNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathGetLastPointMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_2000
     * @tc.desc   test for testPathGetLastPointMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathGetLastPointMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsEqualNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_2100
     * @tc.desc   test for testPathIsEqualNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testPathIsEqualNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsEqualNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_2200
     * @tc.desc   test for testPathIsEqualNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsEqualNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testPathIsEqualMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingPathPart4GetData_2300
     * @tc.desc   test for testPathIsEqualMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testPathIsEqualMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathPart4GetData(22);
      expect(result).assertEqual(0);
    })
  })
}