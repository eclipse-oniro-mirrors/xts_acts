/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import testNapi from 'libentry.so'
const sleep = (ms: number) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function ImageKitErrorCodeTest() {
  describe('imageKitErrorCodeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    });
    afterEach(async (done:Function) => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await sleep(100);
      done();
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });


    /**
     * @tc.name   SUB_OH_PixelmapNative_AntiAliasingLevel_NONE
     * @tc.number SUB_OH_PixelmapNative_AntiAliasingLevel_NONE
     * @tc.desc   SUB_OH_PixelmapNative_AntiAliasingLevel_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_PixelmapNative_AntiAliasingLevel_NONE', Level.LEVEL1, () => {
      try {
          let c: number = testNapi.pixelmapNative_AntiAliasingLevel_NONE();
          expect(c).assertEqual(1);
        } catch (err) {
          console.error("====>SUB_OH_PixelmapNative_AntiAliasingLevel_NONE catch err: " + err);
          expect(false).assertEqual(0);
        }
    });


    /**
     * @tc.name   SUB_OH_PixelmapNative_AntiAliasingLevel_LOW
     * @tc.number SUB_OH_PixelmapNative_AntiAliasingLevel_LOW
     * @tc.desc   SUB_OH_PixelmapNative_AntiAliasingLevel_LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_PixelmapNative_AntiAliasingLevel_LOW', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.pixelmapNative_AntiAliasingLevel_LOW();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_PixelmapNative_AntiAliasingLevel_LOW catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_PixelmapNative_AntiAliasingLevel_MEDIUM
     * @tc.number SUB_OH_PixelmapNative_AntiAliasingLevel_MEDIUM
     * @tc.desc   test OH_PixelmapNative_AntiAliasingLevel_MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_PixelmapNative_AntiAliasingLevel_MEDIUM', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmapNative_AntiAliasingLevel_MEDIUM();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_PixelmapNative_AntiAliasingLevel_MEDIUM catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrMetadataKey_HDR_STATIC_METADATA
     * @tc.number SUB_OH_Pixelmap_HdrMetadataKey_HDR_STATIC_METADATA
     * @tc.desc   test OH_Pixelmap_HdrMetadataKey_HDR_STATIC_METADATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_Pixelmap_HdrMetadataKey_HDR_STATIC_METADATA', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.pixelmap_HdrMetadataKey_HDR_STATIC_METADATA();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrMetadataKey_HDR_STATIC_METADATA catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrMetadataKey_HDR_DYNAMIC_METADATA
     * @tc.number SUB_OH_Pixelmap_HdrMetadataKey_HDR_DYNAMIC_METADATA
     * @tc.desc   test OH_Pixelmap_HdrMetadataKey_HDR_DYNAMIC_METADATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrMetadataKey_HDR_DYNAMIC_METADATA', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrMetadataKey_HDR_DYNAMIC_METADATA();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrMetadataKey_HDR_DYNAMIC_METADATA catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrMetadataKey_HDR_GAINMAP_METADATA
     * @tc.number SUB_OH_Pixelmap_HdrMetadataKey_HDR_GAINMAP_METADATA
     * @tc.desc   test OH_Pixelmap_HdrMetadataKey_HDR_GAINMAP_METADATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_Pixelmap_HdrMetadataKey_HDR_GAINMAP_METADATA', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.pixelmap_HdrMetadataKey_HDR_GAINMAP_METADATA();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrMetadataKey_HDR_GAINMAP_METADATA catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_Image_ErrorCode_IMAGE_DMA_NOT_EXIST
     * @tc.number SUB_Image_ErrorCode_IMAGE_DMA_NOT_EXIST
     * @tc.desc   test Image_ErrorCode_IMAGE_DMA_NOT_EXIST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Image_ErrorCode_IMAGE_DMA_NOT_EXIST', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.imageErrorCode_IMAGE_DMA_NOT_EXIST();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_Image_ErrorCode_IMAGE_DMA_NOT_EXIST catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrMetadataType_NONE
     * @tc.number SUB_OH_Pixelmap_HdrMetadataType_NONE
     * @tc.desc   test OH_Pixelmap_HdrMetadataType_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_Pixelmap_HdrMetadataType_NONE', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.pixelmap_HdrMetadataType_NONE();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrMetadataType_NONE catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrMetadataType_BASE
     * @tc.number SUB_OH_Pixelmap_HdrMetadataType_BASE
     * @tc.desc   test OH_Pixelmap_HdrMetadataType_BASE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrMetadataType_BASE', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrMetadataType_BASE();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrMetadataType_BASE catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrMetadataType_GAINMAP
     * @tc.number SUB_OH_Pixelmap_HdrMetadataType_GAINMAP
     * @tc.desc   test OH_Pixelmap_HdrMetadataType_GAINMAP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_OH_Pixelmap_HdrMetadataType_GAINMAP', Level.LEVEL1, () => {
      try {
        let c: number = testNapi.pixelmap_HdrMetadataType_GAINMAP();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrMetadataType_GAINMAP catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrMetadataType_ALTERNATE
     * @tc.number SUB_OH_Pixelmap_HdrMetadataType_ALTERNATE
     * @tc.desc   test OH_Pixelmap_HdrMetadataType_ALTERNATE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrMetadataType_ALTERNATE', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrMetadataType_ALTERNATE();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrMetadataType_ALTERNATE catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrStaticMetadata_displayPrimariesX
     * @tc.number SUB_OH_Pixelmap_HdrStaticMetadata_displayPrimariesX
     * @tc.desc   test OH_Pixelmap_HdrStaticMetadata_displayPrimariesX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrStaticMetadata_displayPrimariesX', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrStaticMetadata_displayPrimariesX();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrStaticMetadata_displayPrimariesX catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrStaticMetadata_displayPrimariesY
     * @tc.number SUB_OH_Pixelmap_HdrStaticMetadata_displayPrimariesY
     * @tc.desc   test OH_Pixelmap_HdrStaticMetadata_displayPrimariesY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrStaticMetadata_displayPrimariesY', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrStaticMetadata_displayPrimariesY();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrStaticMetadata_displayPrimariesY catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrStaticMetadata_whitePointX
     * @tc.number SUB_OH_Pixelmap_HdrStaticMetadata_whitePointX
     * @tc.desc   test OH_Pixelmap_HdrStaticMetadata_whitePointX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrStaticMetadata_whitePointX', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrStaticMetadata_whitePointX();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrStaticMetadata_whitePointX catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrStaticMetadata_whitePointY
     * @tc.number SUB_OH_Pixelmap_HdrStaticMetadata_whitePointY
     * @tc.desc   test OH_Pixelmap_HdrStaticMetadata_whitePointY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrStaticMetadata_whitePointY', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrStaticMetadata_whitePointY();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrStaticMetadata_whitePointY catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrStaticMetadata_maxLuminance
     * @tc.number SUB_OH_Pixelmap_HdrStaticMetadata_maxLuminance
     * @tc.desc   test OH_Pixelmap_HdrStaticMetadata_maxLuminance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrStaticMetadata_maxLuminance', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrStaticMetadata_maxLuminance();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrStaticMetadata_maxLuminance catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrStaticMetadata_minLuminance
     * @tc.number SUB_OH_Pixelmap_HdrStaticMetadata_minLuminance
     * @tc.desc   test OH_Pixelmap_HdrStaticMetadata_minLuminance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrStaticMetadata_minLuminance', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrStaticMetadata_minLuminance();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrStaticMetadata_minLuminance catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrStaticMetadata_maxContentLightLevel
     * @tc.number SUB_OH_Pixelmap_HdrStaticMetadata_maxContentLightLevel
     * @tc.desc   test OH_Pixelmap_HdrStaticMetadata_maxContentLightLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrStaticMetadata_maxContentLightLevel', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrStaticMetadata_maxContentLightLevel();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrStaticMetadata_maxContentLightLevel catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrStaticMetadata_maxFrameAverageLightLevel
     * @tc.number SUB_OH_Pixelmap_HdrStaticMetadata_maxFrameAverageLightLevel
     * @tc.desc   test OH_Pixelmap_HdrStaticMetadata_maxFrameAverageLightLevel
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrStaticMetadata_maxFrameAverageLightLevel', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrStaticMetadata_maxFrameAverageLightLevel();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrStaticMetadata_maxFrameAverageLightLevel catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrDynamicMetadata_data
     * @tc.number SUB_OH_Pixelmap_HdrDynamicMetadata_data
     * @tc.desc   test OH_Pixelmap_HdrDynamicMetadata_data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrDynamicMetadata_data', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrDynamicMetadata_data();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrDynamicMetadata_data catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrDynamicMetadata_length
     * @tc.number SUB_OH_Pixelmap_HdrDynamicMetadata_length
     * @tc.desc   test OH_Pixelmap_HdrDynamicMetadata_length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrDynamicMetadata_length', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrDynamicMetadata_length();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrDynamicMetadata_length catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_writerVersion
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_writerVersion
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_writerVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_writerVersion', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_writerVersion();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_writerVersion catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_miniVersion
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_miniVersion
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_miniVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_miniVersion', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_miniVersion();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_miniVersion catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapChannelNum
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapChannelNum
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_gainmapChannelNum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapChannelNum', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_gainmapChannelNum();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapChannelNum catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_useBaseColorFlag
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_useBaseColorFlag
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_useBaseColorFlag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_useBaseColorFlag', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_useBaseColorFlag();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_useBaseColorFlag catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_baseHeadroom
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_baseHeadroom
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_baseHeadroom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_baseHeadroom', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_baseHeadroom();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_baseHeadroom catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_alternateHeadroom
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_alternateHeadroom
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_alternateHeadroom
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_alternateHeadroom', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_alternateHeadroom();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_alternateHeadroom catch err: " + err);
        expect(false).assertEqual(0);
      }
    });


    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapMax
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapMax
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_gainmapMax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapMax', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_gainmapMax();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapMax catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapMin
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapMin
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_gainmapMin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapMin', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_gainmapMin();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_gainmapMin catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_gamma
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_gamma
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_gamma
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_gamma', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_gamma();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_gamma catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_baselineOffset
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_baselineOffset
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_baselineOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_baselineOffset', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_baselineOffset();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_baselineOffset catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_OH_Pixelmap_HdrGainmapMetadata_alternateOffset
     * @tc.number SUB_OH_Pixelmap_HdrGainmapMetadata_alternateOffset
     * @tc.desc   test OH_Pixelmap_HdrGainmapMetadata_alternateOffset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_OH_Pixelmap_HdrGainmapMetadata_alternateOffset', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelmap_HdrGainmapMetadata_alternateOffset();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_OH_Pixelmap_HdrGainmapMetadata_alternateOffset catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_PixelFormat_RGB_565
     * @tc.number SUB_PixelFormat_RGB_565
     * @tc.desc   test PixelFormat_RGB_565
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PixelFormat_RGB_565', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelFormat_RGB_565();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_PixelFormat_RGB_565 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_PixelFormat_RGB_888
     * @tc.number SUB_PixelFormat_RGB_888
     * @tc.desc   test PixelFormat_RGB_888
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PixelFormat_RGB_888', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelFormat_RGB_888();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_PixelFormat_RGB_888 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_PixelFormat_ALPHA_8
     * @tc.number SUB_PixelFormat_ALPHA_8
     * @tc.desc   test PixelFormat_ALPHA_8
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PixelFormat_ALPHA_8', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelFormat_ALPHA_8();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_PixelFormat_ALPHA_8 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_PixelFormat_RGBA_F16
     * @tc.number SUB_PixelFormat_RGBA_F16
     * @tc.desc   test PixelFormat_RGBA_F16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PixelFormat_RGBA_F16', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelFormat_RGBA_F16();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_PixelFormat_RGBA_F16 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_PixelFormat_NV21
     * @tc.number SUB_PixelFormat_NV21
     * @tc.desc   test PixelFormat_NV21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PixelFormat_NV21', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelFormat_NV21();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_PixelFormat_NV21 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_PixelFormat_NV12
     * @tc.number SUB_PixelFormat_NV12
     * @tc.desc   test PixelFormat_NV12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PixelFormat_NV12', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelFormat_NV12();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_PixelFormat_NV12 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_PixelFormat_RGBA_1010102
     * @tc.number SUB_PixelFormat_RGBA_1010102
     * @tc.desc   test PixelFormat_RGBA_1010102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PixelFormat_RGBA_1010102', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelFormat_RGBA_1010102();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_PixelFormat_RGBA_1010102 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_PixelFormat_YCRCB_P010
     * @tc.number SUB_PixelFormat_YCRCB_P010
     * @tc.desc   test pixelFormat_YCRCB_P010
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_PixelFormat_YCRCB_P010', Level.LEVEL0, () => {
      try {
        let c: number = testNapi.pixelFormat_YCBCR_P010();
        expect(c).assertEqual(1);
      } catch (err) {
        console.error("====>SUB_PixelFormat_YCRCB_P010 catch err: " + err);
        expect(false).assertEqual(0);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_ALLOCATOR_MODE_DMA_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_ALLOCATOR_MODE_DMA_0100
     * @tc.desc   test IMAGE_ALLOCATOR_MODE_DMA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_MULTIMEDIA_IMAGE_ALLOCATOR_MODE_DMA_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = testNapi.JSImageImageAllocatorModeDmaCode();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_ALLOCATOR_MODE_SHARED_MEMORY_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_ALLOCATOR_MODE_SHARED_MEMORY_0100
     * @tc.desc   test IMAGE_ALLOCATOR_MODE_SHARED_MEMORY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_MULTIMEDIA_IMAGE_ALLOCATOR_MODE_SHARED_MEMORY_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = testNapi.JSImageImageAllocatorModeSharedMemoryCode();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_ALPHA_TYPE_OPAQUE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_ALPHA_TYPE_OPAQUE_0100
     * @tc.desc   test PIXELMAP_ALPHA_TYPE_OPAQUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ALPHA_TYPE_OPAQUE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = testNapi.JSImagePixelmapAlphaTypeOpaqueCode();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_ALPHA_TYPE_UNPREMULTIPLIED_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_ALPHA_TYPE_UNPREMULTIPLIED_0100
     * @tc.desc   test PIXELMAP_ALPHA_TYPE_UNPREMULTIPLIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAP_ALPHA_TYPE_UNPREMULTIPLIED_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = testNapi.JSImagePixelmapAlphaTypeUnpremultipliedCode();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_TYPE_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_TYPE_0100
     * @tc.desc   test type of OH_Pixelmap_HdrMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_TYPE_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = testNapi.JSImagePixelmapHdrMetadataValueTypeCode();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_STATIC_METADATA_0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_STATIC_METADATA_0100
     * @tc.desc   test staticMetadata of OH_Pixelmap_HdrMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_STATIC_METADATA_0100", Level.LEVEL3, async (done: Function) => {
      let res: number = testNapi.JSImagePixelmapHdrMetadataValueStaticMetadataCode();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_DYNAMIC_METADATA0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_DYNAMIC_METADATA0100
     * @tc.desc   test dynamicMetadata of OH_Pixelmap_HdrMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_DYNAMIC_METADATA0100", Level.LEVEL3, async (done: Function) => {
      let res: number = testNapi.JSImagePixelmapHdrMetadataValueDynamicMetadataCode();
      expect(res).assertEqual(0);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_GAINMAP_METADATA0100
     * @tc.number SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_GAINMAP_METADATA0100
     * @tc.desc   test gainmapMetadata of OH_Pixelmap_HdrMetadataValue
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("SUB_MULTIMEDIA_IMAGE_PIXELMAP_HDRMETADATAVALUE_GAINMAP_METADATA0100", Level.LEVEL3, async (done: Function) => {
      let res: number = testNapi.JSImagePixelmapHdrMetadataValueGainmapMetadataCode();
      expect(res).assertEqual(0);
      done();
    });

  })
}