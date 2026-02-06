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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import avimagemetadatndk from 'libavimagemetadatndk.so'
import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';

// 常量定义
const TEST_TAG = 'AVImageMetadataNDKTest';
const TEST_VIDEO_FILE = 'H264_AAC.mkv';
const TEST_AUDIO_FILE = 'No_Support_Format.mov';

export default function AVImageMetadataNDKTest() {
  describe('AVImageMetadataNDKTest', () => {

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVImageGenerator_SetFDSource0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVImageGenerator_SetFDSource0100
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVImageGenerator_SetFDSource0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVImageGenerator_SetFDSource0100 start====");
          let result: number = avimagemetadatndk.OH_AVImageGenerator_SetFDSource0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVImageGenerator_SetFDSource0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVImageGenerator_FetchFrameByTime0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVImageGenerator_FetchFrameByTime0100
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVImageGenerator_FetchFrameByTime0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVImageGenerator_FetchFrameByTime0100 start====");
          let result: number = avimagemetadatndk.OH_AVImageGenerator_FetchFrameByTime0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVImageGenerator_FetchFrameByTime0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVImageGenerator_Release0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVImageGenerator_Release0100
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVImageGenerator_Release0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVImageGenerator_Release0100 start====");
          let result: number = avimagemetadatndk.OH_AVImageGenerator_Release0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVImageGenerator_Release0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0100
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0100 start====");
          const context = getContext() as common.Context;
          const filesDir = context.filesDir;
          const filePath = `${filesDir}/H264_AAC.mkv`;
          const file = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
          const fileStat = fs.statSync(file.fd);
          const length = fileStat.size;
          const offset = 0;
          let result: number =
            avimagemetadatndk.OH_AVImageGenerator_QueryOptions0100(file.fd, offset, length);
          fs.closeSync(file.fd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })
    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0101
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0101 start====");
          const context = getContext() as common.Context;
          const filesDir = context.filesDir;
          const filePath = `${filesDir}/H264_AAC.mkv`;
          const file = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
          const fileStat = fs.statSync(file.fd);
          const length = fileStat.size;
          const offset = 0;
          let result: number =
            avimagemetadatndk.OH_AVImageGenerator_QueryOptions0101(file.fd, offset, length);
          fs.closeSync(file.fd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0102
     * @tc.name       : SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0102
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0102 start====");
          const context = getContext() as common.Context;
          const filesDir = context.filesDir;
          const filePath = `${filesDir}/H264_AAC.mkv`;
          const file = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
          const fileStat = fs.statSync(file.fd);
          const length = fileStat.size;
          const offset = 0;
          let result: number =
            avimagemetadatndk.OH_AVImageGenerator_QueryOptions0102(file.fd, offset, length);
          fs.closeSync(file.fd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0102 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0103
     * @tc.name       : SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0103
     * @tc.desc       : test OH_LowPowerAudioSink
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0103 start====");
          const context = getContext() as common.Context;
          const filesDir = context.filesDir;
          const filePath = `${filesDir}/H264_AAC.mkv`;
          const file = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
          const fileStat = fs.statSync(file.fd);
          const length = fileStat.size;
          const offset = 0;
          let result: number =
            avimagemetadatndk.OH_AVImageGenerator_QueryOptions0103(file.fd, offset, length);
          fs.closeSync(file.fd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVImageGenerator_QueryOptions0103 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVMetadataExtractor_SetFDSource0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVMetadataExtractor_SetFDSource0100
     * @tc.desc       : test OH_AVMetadataExtractor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVMetadataExtractor_SetFDSource0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_SetFDSource0100 start====");
          let result: number = avimagemetadatndk.OH_AVMetadataExtractor_SetFDSource0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_SetFDSource0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchMetadata0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchMetadata0100
     * @tc.desc       : test OH_AVMetadataExtractor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchMetadata0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchMetadata0100 start====");
          let result: number = avimagemetadatndk.OH_AVMetadataExtractor_FetchMetadata0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchMetadata0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchMetadata0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchMetadata0101
     * @tc.desc       : test OH_AVMetadataExtractor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchMetadata0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchMetadata0101 start====");
          let result: number = avimagemetadatndk.OH_AVMetadataExtractor_FetchMetadata0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchMetadata0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchAlbumCover0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchAlbumCover0100
     * @tc.desc       : test OH_AVMetadataExtractor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchAlbumCover0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchAlbumCover0100 start====");
          let result: number = avimagemetadatndk.OH_AVMetadataExtractor_FetchAlbumCover0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchAlbumCover0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchAlbumCover0101
     * @tc.name       : SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchAlbumCover0101
     * @tc.desc       : test OH_AVMetadataExtractor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchAlbumCover0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          const context = getContext() as common.Context;
          const filesDir = context.filesDir;
          const filePath = `${filesDir}/AAC_48000_32_1.aac`;
          const file = fs.openSync(filePath, fs.OpenMode.READ_ONLY);
          const fileStat = fs.statSync(file.fd);
          const length = fileStat.size;
          const offset = 0;
          console.info("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchAlbumCover0101 start====");
          let result: number =
            avimagemetadatndk.OH_AVMetadataExtractor_FetchAlbumCover0101(file.fd, offset, length);
          fs.closeSync(file.fd);
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_FetchAlbumCover0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_AVMetadataExtractor_Release0100
     * @tc.name       : SUB_MULTIMEIDA_OH_AVMetadataExtractor_Release0100
     * @tc.desc       : test OH_AVMetadataExtractor
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_AVMetadataExtractor_Release0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_Release0100 start====");
          let result: number = avimagemetadatndk.OH_AVMetadataExtractor_Release0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_AVMetadataExtractor_Release0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoProcessing_RegisterCallback0100
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoProcessing_RegisterCallback0100
     * @tc.desc       : test OH_VideoProcessing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoProcessing_RegisterCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoProcessing_RegisterCallback0100 start====");
          let result: number = avimagemetadatndk.OH_VideoProcessing_RegisterCallback0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoProcessing_RegisterCallback0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoProcessing_GetSurface0100
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoProcessing_GetSurface0100
     * @tc.desc       : test OH_VideoProcessing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoProcessing_GetSurface0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoProcessing_GetSurface0100 start====");
          let result: number = avimagemetadatndk.OH_VideoProcessing_GetSurface0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoProcessing_GetSurface0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoProcessing_SetParameter0100
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoProcessing_SetParameter0100
     * @tc.desc       : test OH_VideoProcessing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoProcessing_SetParameter0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoProcessing_SetParameter0100 start====");
          let result: number = avimagemetadatndk.OH_VideoProcessing_SetParameter0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoProcessing_SetParameter0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoProcessing_SetParameter0101
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoProcessing_SetParameter0101
     * @tc.desc       : test OH_VideoProcessing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoProcessing_SetParameter0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoProcessing_SetParameter0101 start====");
          let result: number = avimagemetadatndk.OH_VideoProcessing_SetParameter0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoProcessing_SetParameter0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoProcessing_GetParameter0100
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoProcessing_GetParameter0100
     * @tc.desc       : test OH_VideoProcessing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoProcessing_GetParameter0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoProcessing_GetParameter0100 start====");
          let result: number = avimagemetadatndk.OH_VideoProcessing_GetParameter0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoProcessing_GetParameter0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoProcessing_GetParameter0101
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoProcessing_GetParameter0101
     * @tc.desc       : test OH_VideoProcessing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoProcessing_GetParameter0101',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoProcessing_GetParameter0101 start====");
          let result: number = avimagemetadatndk.OH_VideoProcessing_GetParameter0101();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoProcessing_GetParameter0101 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

    /**
     * @tc.number     : SUB_MULTIMEIDA_OH_VideoProcessing_RenderOutputBuffer0100
     * @tc.name       : SUB_MULTIMEIDA_OH_VideoProcessing_RenderOutputBuffer0100
     * @tc.desc       : test OH_VideoProcessing
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('SUB_MULTIMEIDA_OH_VideoProcessing_RenderOutputBuffer0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_MULTIMEIDA_OH_VideoProcessing_RenderOutputBuffer0100 start====");
          let result: number = avimagemetadatndk.OH_VideoProcessing_RenderOutputBuffer0100();
          expect(0).assertEqual(result);
          done()
        } catch (err) {
          console.error("====>SUB_MULTIMEIDA_OH_VideoProcessing_RenderOutputBuffer0100 catch err: " + err);
          expect(false).assertEqual(true);
          done()
        }
      })

  })
}
