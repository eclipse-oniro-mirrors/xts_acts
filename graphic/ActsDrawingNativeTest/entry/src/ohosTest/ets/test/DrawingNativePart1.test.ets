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


export default function ActsNewDrawingNativeTestPart1() {
  describe('ActsNewDrawingNativeTestPart1', () => {
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
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0100
     * @tc.desc   test for testCanvasDrawRecordCmdNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRecordCmd(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0200
     * @tc.desc   test for testCanvasDrawRecordCmdABNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRecordCmd(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0300
     * @tc.desc   test for testCanvasDrawRecordCmdNestingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawRecordCmd(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0400
     * @tc.desc   test for testCanvasDrawRecordCmdNestingAbNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRecordCmd(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0500
     * @tc.desc   test for testCanvasDrawRecordCmdNestingAbNormal1.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingCanvasDrawRecordCmd(4);
      expect(result).assertEqual(0);
    })

    // RecordCmd Destroy related test cases (2 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_03000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_03000
     * @tc.desc   test for TestRecordCmdDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_03000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRecordCmdDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_03100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_03100
     * @tc.desc   test for TestRecordCmdDestroyNULL.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_03100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRecordCmdDestroy(1);
      expect(result).assertEqual(0);
    })

    // RecordCmdUtils BeginRecording related test cases (2 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_04100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_04100
     * @tc.desc   test for TestRecordCmdUtilsBeginRecordingAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_04100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsBeginRecording(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_04200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_04200
     * @tc.desc   test for TestRecordCmdUtilsBeginRecordingCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_04200', Level.LEVEL2, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsBeginRecording(1);
      expect(result).assertEqual(0);
    })

    // RecordCmdUtils Destroy related test cases (1 case)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_01000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_01000
     * @tc.desc   test for TestRecordCmdUtilsDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_01000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsDestroy(0);
      expect(result).assertEqual(0);
    })

    // RecordCmdUtils FinishRecording related test cases (2 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_02000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_02000
     * @tc.desc   test for TestRecordCmdUtilsFinishRecordingNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_02000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsFinishRecording(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_02100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_02100
     * @tc.desc   test for TestRecordCmdUtilsFinishRecordingNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_RECORDER_02100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRecordCmdUtilsFinishRecording(1);
      expect(result).assertEqual(0);
    })

    // Canvas DrawSingleCharacterWithFeatures related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_17900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_17900
     * @tc.desc   test for testCanvasDrawSingleChaWithFeaturesNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_FONT_17900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingCanvasDrawSingleChaWithFeatures(0);
      expect(result).assertEqual(0);
    })

    // Memory Stream related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0100
     * @tc.desc   test for testMemoryStreamCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingMemoryStream(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0200
     * @tc.desc   test for testMemoryStreamCreateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMemoryStream(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0300
     * @tc.desc   test for testMemoryStreamCreateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMemoryStream(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0400
     * @tc.desc   test for testMemoryStreamCreateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_MEMORY_STREAM_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingMemoryStream(3);
      expect(result).assertEqual(0);
    })

    // Point Create related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0100
     * @tc.desc   test for testPointCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointCreate(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0200
     * @tc.desc   test for testPointCreateNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointCreate(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0300
     * @tc.desc   test for testPointCreateAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointCreate(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0400
     * @tc.desc   test for testPointCreateMaximum.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointCreate(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0500
     * @tc.desc   test for testPointCreateMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointCreate(4);
      expect(result).assertEqual(0);
    })

    // Point Destroy related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0600
     * @tc.desc   test for testPointDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0600', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointDestroy(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0700
     * @tc.desc   test for testPointDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointDestroy(1);
      expect(result).assertEqual(0);
    })

    // Point GetSet related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0800
     * @tc.desc   test for testPointGetXNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointGetSet(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0900
     * @tc.desc   test for testPointGetXNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1000
     * @tc.desc   test for testPointGetXMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1100
     * @tc.desc   test for testPointGetYNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointGetSet(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1200
     * @tc.desc   test for testPointGetYNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1300
     * @tc.desc   test for testPointGetYMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1400
     * @tc.desc   test for testPointSetNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1400', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPointGetSet(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1500
     * @tc.desc   test for testPointSetNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1600
     * @tc.desc   test for testPointSetMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_POINT_1600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPointGetSet(8);
      expect(result).assertEqual(0);
    })

    // Region Basic Operations related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0100
     * @tc.desc   test for testRegionCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0200
     * @tc.desc   test for testRegionCreateMoreTimes.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0200', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0300
     * @tc.desc   test for testRegionDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0400
     * @tc.desc   test for testRegionDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0400', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1300
     * @tc.desc   test for testRegionSetRectResultTrue.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1400
     * @tc.desc   test for testRegionSetRectRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1400', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1500
     * @tc.desc   test for testRegionSetRectRectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1500', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1600
     * @tc.desc   test for testRegionSetRectResultFalse.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1600', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1700
     * @tc.desc   test for testRegionSetPathResultTrue.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1800
     * @tc.desc   test for testRegionSetPathRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1800', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1900
     * @tc.desc   test for testRegionSetPathResultFalse.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1900', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2000
     * @tc.desc   test for testRegionCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2100
     * @tc.desc   test for testRegionCopyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2200
     * @tc.desc   test for testRegionCopyAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2300
     * @tc.desc   test for testRegionCopyMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_2300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1000
     * @tc.desc   test for testRegionOpNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1100
     * @tc.desc   test for testRegionOpRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1200
     * @tc.desc   test for testRegionOpMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_1200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingRegionBasicOperations(17);
      expect(result).assertEqual(0);
    })


    // Region Contains related test cases (5 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0500
     * @tc.desc   test for testRegionContainsInRange.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingRegionQueryOperations(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0600
     * @tc.desc   test for testRegionContainsXvalueNotInRange.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0600', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionQueryOperations(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0700
     * @tc.desc   test for testRegionContainsYvalueNotInRange.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0700', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionQueryOperations(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0800
     * @tc.desc   test for testRegionContainsAllNotInRange.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0800', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionQueryOperations(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0900
     * @tc.desc   test for testRegionContainsRegionNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_REGION_0900', Level.LEVEL1, () => {
      const result = libDrawingNative.DrawingRegionQueryOperations(4);
      expect(result).assertEqual(0);
    })


    // Path Effect related test cases
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0100
     * @tc.desc   test for testCreateDashPathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0200
     * @tc.desc   test for testCreateDashPathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0300
     * @tc.desc   test for testCreateDashPathEffectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0400
     * @tc.desc   test for testCreateDashPathEffectMultipleCalls.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0500
     * @tc.desc   test for testPathEffectDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0600
     * @tc.desc   test for testPathEffectDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0700
     * @tc.desc   test for testCreateCornerPathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0800
     * @tc.desc   test for testCreateCornerPathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0900
     * @tc.desc   test for testCreateCornerPathEffectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1000
     * @tc.desc   test for testCreateDiscreatePathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1000', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1100
     * @tc.desc   test for testCreateDiscreatePathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1200
     * @tc.desc   test for testCreateDiscreatePathEffectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1300
     * @tc.desc   test for testCreateComposePathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1400
     * @tc.desc   test for testCreateComposePathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1500
     * @tc.desc   test for testCreatePathDashEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1600
     * @tc.desc   test for testCreatePathDashEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1700
     * @tc.desc   test for testCreatePathDashEffectAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1800
     * @tc.desc   test for testCreateSumPathEffectNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1800', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathEffect(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1900
     * @tc.desc   test for testCreateSumPathEffectNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_NATIVE_DRAWING_PATH_EFFECT_1900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathEffect(18);
      expect(result).assertEqual(0);
    })

    // Path Basic related test cases (30 cases)
    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0100
     * @tc.desc   test for TestPathCreateNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(0);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0200
     * @tc.desc   test for TestPathCopyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0200', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0300
     * @tc.desc   test for TestPathCopyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(2);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0400
     * @tc.desc   test for TestPathCopyInputDestroyed.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(3);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0500
     * @tc.desc   test for TestPathDestroyNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(4);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0600
     * @tc.desc   test for TestPathDestroyNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(5);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0700
     * @tc.desc   test for TestPathMoveToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(6);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0800
     * @tc.desc   test for TestPathMoveToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(7);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0900
     * @tc.desc   test for TestPathMoveToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_0900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(8);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01000
     * @tc.desc   test for TestPathMoveToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(9);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01100
     * @tc.desc   test for TestPathLineToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01100', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(10);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01200
     * @tc.desc   test for TestPathLineToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(11);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01300
     * @tc.desc   test for TestPathLineToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01300', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(12);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01400
     * @tc.desc   test for TestPathLineToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(13);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01500
     * @tc.desc   test for TestPathArcToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01500', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(14);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01600
     * @tc.desc   test for TestPathArcToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(15);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01700
     * @tc.desc   test for TestPathArcToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01700', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(16);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01800
     * @tc.desc   test for TestPathArcToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(17);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01900
     * @tc.desc   test for TestPathQuadToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_01900', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(18);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02000
     * @tc.desc   test for TestPathQuadToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(19);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02100
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02100
     * @tc.desc   test for TestPathQuadToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02100', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(20);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02200
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02200
     * @tc.desc   test for TestPathQuadToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02200', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(21);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02300
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02300
     * @tc.desc   test for TestPathConicToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02300', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(22);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02400
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02400
     * @tc.desc   test for TestPathConicToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02400', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(23);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02500
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02500
     * @tc.desc   test for TestPathConicToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02500', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(24);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02600
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02600
     * @tc.desc   test for TestPathConicToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02600', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(25);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02700
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02700
     * @tc.desc   test for TestPathCubicToNormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02700', Level.LEVEL0, () => {
      const result = libDrawingNative.DrawingPathBasic(26);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02800
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02800
     * @tc.desc   test for TestPathCubicToNull.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02800', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(27);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02900
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02900
     * @tc.desc   test for TestPathCubicToAbnormal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_02900', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(28);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03000
     * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03000
     * @tc.desc   test for TestPathCubicToMaximal.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('SUB_BASIC_GRAPHICS_SPECIAL_API_C_DRAWING_PATH_03000', Level.LEVEL3, () => {
      const result = libDrawingNative.DrawingPathBasic(29);
      expect(result).assertEqual(0);
    })
  })
}