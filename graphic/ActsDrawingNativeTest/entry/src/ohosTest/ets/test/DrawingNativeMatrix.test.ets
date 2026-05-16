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


export default function DrawingNativeMatrixTest() {
  describe('DrawingNativeMatrixTest', () => {
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
     * @tc.name   testMatrixCreateDestroyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_0100
     * @tc.desc   Test for creating and destroying a matrix with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixCreateDestroyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateDestroyNULL
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_0200
     * @tc.desc   Test for creating and destroying a matrix with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateDestroyNULL', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateDestroyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_0300
     * @tc.desc   Test for multiple calls of creating and destroying a matrix.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateDestroyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateRotationNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_0400
     * @tc.desc   Test for creating a rotation matrix with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixCreateRotationNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateRotationNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_0500
     * @tc.desc   Test for creating a rotation matrix with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateRotationNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateRotationAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_0600
     * @tc.desc   Test for creating a rotation matrix with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateRotationAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateRotationMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_0700
     * @tc.desc   Test for creating a rotation matrix with maximum values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateRotationMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateRotationMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_0800
     * @tc.desc   Test for multiple calls of creating a rotation matrix.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateRotationMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateTranslationNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_0900
     * @tc.desc   Test for creating a translation matrix with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixCreateTranslationNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixCreate(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateTranslationNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_1000
     * @tc.desc   Test for creating a translation matrix with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateTranslationNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateTranslationAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_1100
     * @tc.desc   Test for creating a translation matrix with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateTranslationAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateTranslationMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_1200
     * @tc.desc   Test for creating a translation matrix with maximum values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateTranslationMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateTranslationMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_1300
     * @tc.desc   Test for multiple calls of creating a translation matrix.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateTranslationMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateScaleNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_1400
     * @tc.desc   test for testMatrixCreateScaleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixCreateScaleNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixCreate(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateScaleNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_1500
     * @tc.desc   test for testMatrixCreateScaleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateScaleNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateScaleAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_1600
     * @tc.desc   test for testMatrixCreateScaleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateScaleAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateScaleMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_1700
     * @tc.desc   test for testMatrixCreateScaleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateScaleMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCreateScaleMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixCreate_1800
     * @tc.desc   test for testMatrixCreateScaleMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCreateScaleMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixCreate(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMatrixSetGetMatrixNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_0100
     * @tc.desc   Test for setting and getting matrix values with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMatrixSetGetMatrixNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixTransform(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMatrixSetGetMatrixNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_0200
     * @tc.desc   Test for setting and getting matrix values with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMatrixSetGetMatrixNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMatrixSetGetMatrixAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_0300
     * @tc.desc   Test for setting and getting matrix values with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMatrixSetGetMatrixAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMatrixSetGetMatrixMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_0400
     * @tc.desc   Test for setting and getting matrix values with maximum values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMatrixSetGetMatrixMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMatrixSetGetMatrixMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_0500
     * @tc.desc   Test for multiple calls of setting and getting matrix values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMatrixSetGetMatrixMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixTranslateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_0600
     * @tc.desc   Test for translating a matrix with normal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixTranslateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixTransform(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixTranslateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_0700
     * @tc.desc   Test for translating a matrix with NULL parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixTranslateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixTranslateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_0800
     * @tc.desc   Test for translating a matrix with abnormal parameters.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixTranslateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixTranslateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_0900
     * @tc.desc   Test for translating a matrix with maximum values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixTranslateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixTranslateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_1000
     * @tc.desc   Test for multiple calls of translating a matrix.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixTranslateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRotateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_1100
     * @tc.desc   test for testMatrixRotateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixRotateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixTransform(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRotateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_1200
     * @tc.desc   test for testMatrixRotateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixRotateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRotateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_1300
     * @tc.desc   test for testMatrixRotateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixRotateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRotateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_1400
     * @tc.desc   test for testMatrixRotateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixRotateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRotateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_1500
     * @tc.desc   test for testMatrixRotateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixRotateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixScaleNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_1600
     * @tc.desc   test for testMatrixScaleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixScaleNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixTransform(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixScaleNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_1700
     * @tc.desc   test for testMatrixScaleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixScaleNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixScaleAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_1800
     * @tc.desc   test for testMatrixScaleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixScaleAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixScaleMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_1900
     * @tc.desc   test for testMatrixScaleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixScaleMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixScaleMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_2000
     * @tc.desc   test for testMatrixScaleMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixScaleMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetRectToRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_2100
     * @tc.desc   test for testMatrixSetRectToRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetRectToRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixTransform(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetRectToRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_2200
     * @tc.desc   test for testMatrixSetRectToRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetRectToRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetRectToRectMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixTransform_2300
     * @tc.desc   test for testMatrixSetRectToRectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetRectToRectMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixTransform(22);
      expect(result).assertEqual(0);
    })

    // Matrix Operation related test cases
    /**
     * @tc.name   testMatrixPreRotateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_0100
     * @tc.desc   test for testMatrixPreRotateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreRotateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixOperation(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreRotateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_0200
     * @tc.desc   test for testMatrixPreRotateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreRotateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreRotateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_0300
     * @tc.desc   test for testMatrixPreRotateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreRotateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreRotateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_0400
     * @tc.desc   test for testMatrixPreRotateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreRotateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreRotateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_0500
     * @tc.desc   test for testMatrixPreRotateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreRotateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreScaleNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_0600
     * @tc.desc   test for testMatrixPreScaleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreScaleNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixOperation(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreScaleNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_0700
     * @tc.desc   test for testMatrixPreScaleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreScaleNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreScaleAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_0800
     * @tc.desc   test for testMatrixPreScaleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreScaleAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreScaleMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_0900
     * @tc.desc   test for testMatrixPreScaleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreScaleMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreScaleMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_1000
     * @tc.desc   test for testMatrixPreScaleMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreScaleMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreTranslateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_1100
     * @tc.desc   test for testMatrixPreTranslateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreTranslateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixOperation(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreTranslateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_1200
     * @tc.desc   test for testMatrixPreTranslateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreTranslateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreTranslateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_1300
     * @tc.desc   test for testMatrixPreTranslateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreTranslateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreTranslateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_1400
     * @tc.desc   test for testMatrixPreTranslateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreTranslateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreTranslateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_1500
     * @tc.desc   test for testMatrixPreTranslateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreTranslateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostRotateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_1600
     * @tc.desc   test for testMatrixPostRotateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostRotateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixOperation(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostRotateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_1700
     * @tc.desc   test for testMatrixPostRotateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostRotateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostRotateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_1800
     * @tc.desc   test for testMatrixPostRotateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostRotateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostRotateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_1900
     * @tc.desc   test for testMatrixPostRotateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostRotateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostRotateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixOperation_2000
     * @tc.desc   test for testMatrixPostRotateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostRotateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixOperation(19);
      expect(result).assertEqual(0);
    })

    // Matrix Part2 Transform related test cases
    /**
     * @tc.name   testMatrixPostScaleNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_0100
     * @tc.desc   test for testMatrixPostScaleNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostScaleNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostScaleNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_0200
     * @tc.desc   test for testMatrixPostScaleNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostScaleNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostScaleAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_0300
     * @tc.desc   test for testMatrixPostScaleAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostScaleAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostScaleMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_0400
     * @tc.desc   test for testMatrixPostScaleMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostScaleMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostScaleMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_0500
     * @tc.desc   test for testMatrixPostScaleMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostScaleMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostTranslateNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_0600
     * @tc.desc   test for testMatrixPostTranslateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPostTranslateNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostTranslateNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_0700
     * @tc.desc   test for testMatrixPostTranslateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostTranslateNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostTranslateAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_0800
     * @tc.desc   test for testMatrixPostTranslateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostTranslateAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostTranslateMaximum
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_0900
     * @tc.desc   test for testMatrixPostTranslateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostTranslateMaximum', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPostTranslateMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_1000
     * @tc.desc   test for testMatrixPostTranslateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPostTranslateMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixResetNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_1100
     * @tc.desc   test for testMatrixResetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixResetNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixResetNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_1200
     * @tc.desc   test for testMatrixResetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixResetNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixResetMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_1300
     * @tc.desc   test for testMatrixResetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixResetMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixConcatNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_1400
     * @tc.desc   test for testMatrixConcatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixConcatNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixConcatNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_1500
     * @tc.desc   test for testMatrixConcatNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixConcatNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixConcatMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_1600
     * @tc.desc   test for testMatrixConcatMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixConcatMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixInvertNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_1700
     * @tc.desc   test for testMatrixInvertNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixInvertNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixInvertNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_1800
     * @tc.desc   test for testMatrixInvertNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixInvertNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixInvertMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Transform_1900
     * @tc.desc   test for testMatrixInvertMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixInvertMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Transform(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_0100
     * @tc.desc   test for testMatrixSetPolyToPolyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetPolyToPolyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_0200
     * @tc.desc   test for testMatrixSetPolyToPolyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetPolyToPolyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_0300
     * @tc.desc   test for testMatrixSetPolyToPolyAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetPolyToPolyAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetPolyToPolyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_0400
     * @tc.desc   test for testMatrixSetPolyToPolyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetPolyToPolyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapPointsNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_0500
     * @tc.desc   test for testMatrixMapPointsNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMapPointsNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapPointsNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_0600
     * @tc.desc   test for testMatrixMapPointsNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapPointsNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapPointsAbnormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_0700
     * @tc.desc   test for testMatrixMapPointsAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapPointsAbnormal', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapPointsMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_0800
     * @tc.desc   test for testMatrixMapPointsMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapPointsMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_0900
     * @tc.desc   test for testMatrixMapRectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixMapRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_1000
     * @tc.desc   test for testMatrixMapRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixMapRectMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_1100
     * @tc.desc   test for testMatrixMapRectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixMapRectMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsEqualNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_1200
     * @tc.desc   test for testMatrixIsEqualNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixIsEqualNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsEqualNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_1300
     * @tc.desc   test for testMatrixIsEqualNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsEqualNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsEqualMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_1400
     * @tc.desc   test for testMatrixIsEqualMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsEqualMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsIdentityNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_1500
     * @tc.desc   test for testMatrixIsIdentityNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixIsIdentityNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsIdentityNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_1600
     * @tc.desc   test for testMatrixIsIdentityNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsIdentityNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsIdentityMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2MapQuery_1700
     * @tc.desc   test for testMatrixIsIdentityMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsIdentityMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2MapQuery(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCopyNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Set_0100
     * @tc.desc   test for testMatrixCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixCopyNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart2Set(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCopyNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Set_0200
     * @tc.desc   test for testMatrixCopyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCopyNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Set(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixCopyMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart2Set_0300
     * @tc.desc   test for testMatrixCopyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixCopyMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart2Set(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPerConcatNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_0100
     * @tc.desc   test for testMatrixPerConcatNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPerConcatNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart3(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPerConcatNull1
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_0200
     * @tc.desc   test for testMatrixPerConcatNull1.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPerConcatNull1', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPerConcatNull2
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_0300
     * @tc.desc   test for testMatrixPerConcatNull2.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPerConcatNull2', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPerConcatCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_0400
     * @tc.desc   test for testMatrixPerConcatCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPerConcatCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsAffineNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_0500
     * @tc.desc   test for testMatrixIsAffineNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixIsAffineNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart3(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsAffineNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_0600
     * @tc.desc   test for testMatrixIsAffineNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsAffineNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixIsAffineMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_0700
     * @tc.desc   test for testMatrixIsAffineMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixIsAffineMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreSkewNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_0800
     * @tc.desc   test for testMatrixPreSkewNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixPreSkewNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart3(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreSkewNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_0900
     * @tc.desc   test for testMatrixPreSkewNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreSkewNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixPreSkewMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_1000
     * @tc.desc   test for testMatrixPreSkewMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixPreSkewMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRectStaysRectNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_1100
     * @tc.desc   test for testMatrixRectStaysRectNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixRectStaysRectNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart3(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRectStaysRectNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_1200
     * @tc.desc   test for testMatrixRectStaysRectNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixRectStaysRectNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixRectStaysRectMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_1300
     * @tc.desc   test for testMatrixRectStaysRectMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixRectStaysRectMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetSinCosNormal
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_1400
     * @tc.desc   test for testMatrixSetSinCosNormal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testMatrixSetSinCosNormal', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMatrixPart3(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetSinCosNull
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_1500
     * @tc.desc   test for testMatrixSetSinCosNull
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetSinCosNull', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   testMatrixSetSinCosMultipleCalls
     * @tc.number SUB_GRAPHIC_GRAPHIC_2D_DrawingMatrixPart3_1600
     * @tc.desc   test for testMatrixSetSinCosMultipleCalls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('testMatrixSetSinCosMultipleCalls', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMatrixPart3(15);
      expect(result).assertEqual(0);
    })
  })
}