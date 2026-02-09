/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import avmetadataextractor from 'libavmetadataextractorndk.so';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import fs from '@ohos.file.fs';
import hilog from '@ohos.hilog';
import media from '@ohos.multimedia.media';
import resourceManager from '@ohos.resourceManager';
import Utils from './Utils';

const sleep5000: number = 5000;
const AV_ERR_OK = 0
const AV_ERR_INVALID_VAL = 3
const AV_ERR_FAIL = -1

export default function OhAVMetadataExtractorNDKTest() {
  let filesDir: string | undefined;
  let testContext: common.UIAbilityContext;
  describe('OhAVMetadataExtractorNDKTest', () => {
    beforeAll( async () => {
      console.info('beforeAll case');
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      filesDir = AppStorage.get('pathDir');
      Utils.sleep(sleep5000);
    });
    beforeEach(() => {
      console.info('beforeEach case');
    });
    afterEach(() => {
      console.info('afterEach case');
    });
    afterAll( async () => {
      console.info('afterAll case ');
    });

    interface AVFileDescriptor {
      fd: number;
      size: number;
    }

    const getfile = (fileName: string): AVFileDescriptor => {
      const filePath = filesDir + '/' + fileName;
      console.log("filePath: ", filePath);
      let file = fs.openSync(filePath);
      const stats = fs.statSync(filePath);
      const fileSize = stats.size;
      console.log("fileSize:", fileSize);
      return {fd: file.fd, size: fileSize};
    }

    const closefile = (fd: number): void => {
      if (fd > 0) {
        try {
          fs.closeSync(fd);
        } catch (err) {
          console.error(`Failed to close fd ${fd}:`, err);
        }
      }
    }

    /**
     * @tc.name   testohAvMetadataExtractorCreate0100
     * @tc.number SUB_MULTIMEDIA_avmetadataextractor_OHAVMETADATAEXTRACTORCREATE_0100
     * @tc.desc   Create an instance of the metadata extractor for media files.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorCreate0100', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorCreate0100 test start`);
      try {
        let result: number = avmetadataextractor.ohAvMetadataExtractorCreate();
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorCreate0100:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorCreate0100:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorCreate0100 test end`);
      done();
    });

    /**
     * @tc.name   testohAvMetadataExtractorSetFDSource0100
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_SETFDSOURCE_0100
     * @tc.desc   Set an MP3 file as the file source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorSetFDSource0100', Level.LEVEL0,async (done: Function) => {
      console.info(`testohAvMetadataExtractorSetFDSource0100 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = await avmetadataextractor.ohAvMetadataExtractorSetFdPathSource(fileDescribe);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorSetFDSource0100:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorSetFDSource0100:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorSetFDSource0100 test end`);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testohAvMetadataExtractorSetFDSource0200
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_SETFDSOURCE_0200
     * @tc.desc   Set an MP4 file as the file source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorSetFDSource0200', Level.LEVEL0,async (done: Function) => {
      console.info(`testohAvMetadataExtractorSetFDSource0200 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = await avmetadataextractor.ohAvMetadataExtractorSetFdPathSource(fileDescribe);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorSetFDSource0200:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorSetFDSource0200:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorSetFDSource0200 test end`);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testohAvMetadataExtractorSetFDSource0300
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_SETFDSOURCE_0300
     * @tc.desc   Set invalid fd Source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorSetFDSource0300', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorSetFDSource0300 test start`);
      try {
        let errorFileDescribe : number = -1;
        let result: number = avmetadataextractor.ohAvMetadataExtractorSetFdPathSource(errorFileDescribe);
        expect(result).not().assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorSetFDSource0300:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorSetFDSource0300:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorSetFDSource0300 test end`);
      done();
    });

    /**
     * @tc.name   testohAvMetadataExtractorFetchMetadata0100
     * @tc.number SUB_MULTIMEDIA_avmetadataextractor_OHAVMETADATAEXTRACTORFETCHMETADATA_0100
     * @tc.desc   Fetch metadata from the MP3 file using the metadata extractor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorFetchMetadata0100', Level.LEVEL0,async (done: Function) => {
      console.info(`testohAvMetadataExtractorFetchMetadata0100 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let fmd: number = await avmetadataextractor.ohAvMetadataExtractorFetchMetadata(fileDescribe);
        expect(fmd).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s',
          `testohAvMetadataExtractorFetchMetadata0100:${fmd}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchMetadata0100:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchMetadata0100 test end`);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testohAvMetadataExtractorFetchMetadata0200
     * @tc.number SUB_MULTIMEDIA_avmetadataextractor_OHAVMETADATAEXTRACTORFETCHMETADATA_0200
     * @tc.desc   Fetch metadata from the MP4 file using the metadata extractor.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorFetchMetadata0200', Level.LEVEL0,async (done: Function) => {
      console.info(`testohAvMetadataExtractorFetchMetadata0200 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let fmdtwo = await avmetadataextractor.ohAvMetadataExtractorFetchMetadata(fileDescribe);
        expect(fmdtwo).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s',
          `testohAvMetadataExtractorFetchMetadata0200:${fmdtwo}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchMetadata0200:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchMetadata0200 test end`);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testohAvMetadataExtractorFetchAlbumCover0100
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_FETCHALBUMCOVER_0100
     * @tc.desc   Get album cover from MP3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorFetchAlbumCover0100', Level.LEVEL0,async (done: Function) => {
      console.info(`testohAvMetadataExtractorFetchAlbumCover0100 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let fac: number = await avmetadataextractor.ohAvMetadataExtractorFetchAlbumCover(fileDescribe);
        expect(fac).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s',
          `testohAvMetadataExtractorFetchAlbumCover0100:${fac}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchAlbumCover0100:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchAlbumCover0100 test end`);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testohAvMetadataExtractorFetchAlbumCover0200
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_FETCHALBUMCOVER_0200
     * @tc.desc   Get album cover from MP4 and this is error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorFetchAlbumCover0200', Level.LEVEL0,async (done: Function) => {
      console.info(`testohAvMetadataExtractorFetchAlbumCover0200 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let fac: number = await avmetadataextractor.ohAvMetadataExtractorFetchAlbumCover(fileDescribe);
        expect(fac).not().assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s',
          `testohAvMetadataExtractorFetchAlbumCover0200:${fac}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchAlbumCover0200:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchAlbumCover0200 test end`);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.name   testohAvMetadataExtractorRelease0100
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORRELEASE_0100
     * @tc.desc   Release the metadata extractor object.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorRelease0100', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorRelease0100 test start`);
      try {
        let result = avmetadataextractor.ohAvMetadataExtractorRelease();
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorRelease0100:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorRelease0100:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorRelease0100 test end`);
      done();
    });

    /**
     * @tc.name   testohAvMetadataExtractorRelease0200
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORRELEASE_0200
     * @tc.desc   Release the metadata extractor object with the object is nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorRelease0200', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorReleaseTwo0200 test start`);
      try {
        let result: number = avmetadataextractor.ohAvMetadataExtractorReleaseTwo();
        expect(result).not().assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorReleaseTwo0200:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorReleaseTwo0200:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorReleaseTwo0200 test end`);
      done();
    });

    /**
     * @tc.name   testohAvMetadataExtractorAll0100
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_ALL_0100
     * @tc.desc   Verify extraction of all metadata properties from the media source.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testohAvMetadataExtractorAll0100', Level.LEVEL0,async (done: Function) => {
      console.info(`testohAvMetadataExtractorAll0100 test start`);
      let fileDescribe: number = -1;

      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let metadata: media.AVMetadata = await avmetadataextractor.ohAvMetadataExtractorFetchMetadataAll(fileDescribe);
        expect(metadata.author).assertEqual(undefined);
        expect(metadata.dateTime).assertEqual(undefined);
        expect(metadata.dateTimeFormat).assertEqual(undefined);

        expect(metadata.album).assertEqual("media");
        expect(metadata.albumArtist).assertEqual("media_test");
        expect(metadata.artist).assertEqual("元数据测试");
        expect(metadata.composer).assertEqual("测试");
        expect(metadata.genre).assertEqual("Lyrical");
        expect(metadata.title).assertEqual("test");
        expect(metadata.mimeType).assertEqual("video/mp4");

        expect(metadata.trackCount).assertEqual(3);
        expect(metadata.hasAudio).assertEqual(1);
        expect(metadata.hasVideo).assertEqual(1);
        expect(metadata.sampleRate).assertEqual(44100);
        expect(metadata.duration).assertEqual(10100);
        expect(metadata.videoHeight).assertEqual(1024);
        expect(metadata.videoWidth).assertEqual(1280);
        expect(metadata.videoOrientation).assertEqual(90);
        expect(metadata.hdrType).assertEqual(0);

        if (metadata.location) {
          expect(metadata.location.latitude).assertEqual(0.0000000);
          expect(metadata.location.longitude).assertEqual(0.0000000);
        } else {
          expect(metadata.location).assertEqual(undefined);
        }
      } catch (error) {
        hilog.info(0x0000, 'testTag', 'testohAvMetadataExtractorAll0100 failed: %{public}s', error);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`testohAvMetadataExtractorAll0100 test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORPIXELMAPPARAMSCREATE_0100
     * @tc.name   testohAvMetadataExtractorPixelMapParamsCreate0100
     * @tc.desc   Create the metadata extractor pixel map params object.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorPixelMapParamsCreate0100', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorPixelMapParamsCreate0100 test start`);
      try {
        let result: number = avmetadataextractor.OhAvMetadataExtractorPixelMapParamsCreate();
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorPixelMapParamsCreate0100:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorPixelMapParamsCreate0100:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorPixelMapParamsCreate0100 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORPIXELMAPPARAMSSETSIZE_0100
     * @tc.name   testohAvMetadataExtractorPixelMapParamsSetSize0100
     * @tc.desc   AvMetadataExtractor PixelMapParams Set Size 0x0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorPixelMapParamsSetSize0100', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorPixelMapParamsSetSize0100 test start`);
      try {
        let result = avmetadataextractor.OhAvMetadataExtractorPixelMapParamsSetSize(0,0);
        expect(result).assertEqual(true);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorPixelMapParamsSetSize0100:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorPixelMapParamsSetSize0100:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorPixelMapParamsSetSize0100 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORPIXELMAPPARAMSSETSIZE_0200
     * @tc.name   testohAvMetadataExtractorPixelMapParamsSetSize0200
     * @tc.desc   AvMetadataExtractor PixelMapParams Set Size -1x-1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testohAvMetadataExtractorPixelMapParamsSetSize0200', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorPixelMapParamsSetSize0200 test start`);
      try {
        let result = avmetadataextractor.OhAvMetadataExtractorPixelMapParamsSetSize(-1,-1);
        expect(result).assertEqual(true);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorPixelMapParamsSetSize0200:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorPixelMapParamsSetSize0200:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorPixelMapParamsSetSize0200 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORPIXELMAPPARAMSSETSIZE_0300
     * @tc.name   testohAvMetadataExtractorPixelMapParamsSetSize0300
     * @tc.desc   AvMetadataExtractor PixelMapParams Set Size 720x480
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorPixelMapParamsSetSize0300', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorPixelMapParamsSetSize0300 test start`);
      try {
        let result = avmetadataextractor.OhAvMetadataExtractorPixelMapParamsSetSize(720, 480);
        expect(result).assertEqual(true);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorPixelMapParamsSetSize0300:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorPixelMapParamsSetSize0300:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorPixelMapParamsSetSize0300 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORFETCHFRAMEBYTIME_0100
     * @tc.name   testohAvMetadataExtractorFetchFrameByTime0100
     * @tc.desc   MeataExtractor Fetch Frame By Time, timeUs is 0, option is 0, width is -1, height is -1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorFetchFrameByTime0100', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorFetchFrameByTime0100 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = avmetadataextractor.OhAvMetadataExtractorFetchFrameByTime(fileDescribe, 0, 0, -1, -1);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0100:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0100:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchFrameByTime0100 test end`);
      closefile(fileDescribe);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORFETCHFRAMEBYTIME_0200
     * @tc.name   testohAvMetadataExtractorFetchFrameByTime0200
     * @tc.desc   MeataExtractor Fetch Frame By Time, timeUs is 0, option is 1, width is 0, height is 0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorFetchFrameByTime0200', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorFetchFrameByTime0200 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = avmetadataextractor.OhAvMetadataExtractorFetchFrameByTime(fileDescribe, 0, 1, 0, 0);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0200:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0200:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchFrameByTime0200 test end`);
      closefile(fileDescribe);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORFETCHFRAMEBYTIME_0300
     * @tc.name   testohAvMetadataExtractorFetchFrameByTime0300
     * @tc.desc   MeataExtractor Fetch Frame By Time, timeUs is 0, option is 2, width is 1280, height is 1024
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorFetchFrameByTime0300', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorFetchFrameByTime0300 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = avmetadataextractor.OhAvMetadataExtractorFetchFrameByTime(fileDescribe, 0, 2, 1024, 1028);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0300:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0300:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchFrameByTime0300 test end`);
      closefile(fileDescribe);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORFETCHFRAMEBYTIME_0400
     * @tc.name   testohAvMetadataExtractorFetchFrameByTime0400
     * @tc.desc   MeataExtractor Fetch Frame By Time, timeUs is 0, option is 3, width is 720, height is 0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorFetchFrameByTime0400', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorFetchFrameByTime0400 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = avmetadataextractor.OhAvMetadataExtractorFetchFrameByTime(fileDescribe, 0, 3, 720, 0);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0400:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0400:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchFrameByTime0400 test end`);
      closefile(fileDescribe);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORFETCHFRAMEBYTIME_0500
     * @tc.name   testohAvMetadataExtractorFetchFrameByTime0500
     * @tc.desc   MeataExtractor Fetch Frame By Time, timeUs is -1, option is 0, width is 0, height is 0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorFetchFrameByTime0500', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorFetchFrameByTime0500 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = avmetadataextractor.OhAvMetadataExtractorFetchFrameByTime(fileDescribe, -1, 0, 0, 0);
        expect(result).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0500:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0500:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchFrameByTime0500 test end`);
      closefile(fileDescribe);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORFETCHFRAMEBYTIME_0600
     * @tc.name   testohAvMetadataExtractorFetchFrameByTime0600
     * @tc.desc   MeataExtractor Fetch Frame By Time, timeUs is 0, option is 0, width is 0, height is 480
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorFetchFrameByTime0600', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorFetchFrameByTime0600 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = avmetadataextractor.OhAvMetadataExtractorFetchFrameByTime(fileDescribe, 0, 0, 0, 480);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0600:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0600:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchFrameByTime0600 test end`);
      closefile(fileDescribe);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORFETCHFRAMEBYTIME_0700
     * @tc.name   testohAvMetadataExtractorFetchFrameByTime0700
     * @tc.desc   MeataExtractor Fetch Frame By Time, timeUs is max int, option is 0, width is 0, height is 0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorFetchFrameByTime0700', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorFetchFrameByTime0700 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = avmetadataextractor.OhAvMetadataExtractorFetchFrameByTime(fileDescribe, 50, 0, 0, 0);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0700:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0700:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchFrameByTime0700 test end`);
      closefile(fileDescribe);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORFETCHFRAMEBYTIME_0800
     * @tc.name   testohAvMetadataExtractorFetchFrameByTime0800
     * @tc.desc   MeataExtractor Fetch Frame By Time, timeUs is 0, option is max int, width is 0, height is 0
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorFetchFrameByTime0800', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorFetchFrameByTime0800 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = avmetadataextractor.OhAvMetadataExtractorFetchFrameByTime(fileDescribe, 99999999, 0, 0, 0);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0800:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime0800:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchFrameByTime0800 test end`);
      closefile(fileDescribe);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORFETCHFRAMEBYTIME_1000
     * @tc.name   testohAvMetadataExtractorFetchFrameByTime1000
     * @tc.desc   MeataExtractor Fetch Frame By Time, timeUs is 0, option is 0, width is 720, height is -1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorFetchFrameByTime1000', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorFetchFrameByTime1000 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = avmetadataextractor.OhAvMetadataExtractorFetchFrameByTime(fileDescribe, 0, 0, -1, 480);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime1000:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime1000:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchFrameByTime1000 test end`);
      closefile(fileDescribe);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORFETCHFRAMEBYTIME_1100
     * @tc.name   testohAvMetadataExtractorFetchFrameByTime1100
     * @tc.desc   MeataExtractor Fetch Frame By Time, timeUs is 0, option is 0, width is 9999, height is 9999
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorFetchFrameByTime1100', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorFetchFrameByTime1100 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result: number = avmetadataextractor.OhAvMetadataExtractorFetchFrameByTime(fileDescribe, 0, 0, 9999, 9999);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime1100:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorFetchFrameByTime1100:${error}`);
        expect().assertFail();
      }
      console.info(`testohAvMetadataExtractorFetchFrameByTime1100 test end`);
      closefile(fileDescribe);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_0200
     * @tc.name   testohAvMetadataExtractorGetMetaData0200
     * @tc.desc   AVMetaDataExtractor Get MetaData for video track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData0200', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorGetMetaData0200 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 0);
        expect(result["codec_mime"]).assertEqual("video/avc");
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0200:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0200:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`testohAvMetadataExtractorGetMetaData0200 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_0300
     * @tc.name   testohAvMetadataExtractorGetMetaData0300
     * @tc.desc   AVMetaDataExtractor Get MetaData for video track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData0300', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorGetMetaData0300 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 0);
        expect(result["track_type"]).assertEqual(1);
        
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0300:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0300:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`testohAvMetadataExtractorGetMetaData0300 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_0400
     * @tc.name   testohAvMetadataExtractorGetMetaData0400
     * @tc.desc   AVMetaDataExtractor Get MetaData for video track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData0400', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorGetMetaData0400 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 0);
        console.info(`testohAvMetadataExtractorGetMetaData0400 result = ${JSON.stringify(result)}`);
        expect(result["bitrate"]).assertEqual(1366541);
        
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0400:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0400:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`testohAvMetadataExtractorGetMetaData0400 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_0500
     * @tc.name   testohAvMetadataExtractorGetMetaData0500
     * @tc.desc   AVMetaDataExtractor Get MetaData for video track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData0500', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorGetMetaData0500 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 0);
        expect(result["frame_rate"]).assertEqual(6000);
        
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0500:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0500:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`testohAvMetadataExtractorGetMetaData0500 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_0600
     * @tc.name   testohAvMetadataExtractorGetMetaData0600
     * @tc.desc   AVMetaDataExtractor Get MetaData for video track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData0600', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorGetMetaData0600 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 0);
        expect(result["track_index"]).assertEqual(0);
        
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0600:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0600:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`testohAvMetadataExtractorGetMetaData0600 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_0700
     * @tc.name   testohAvMetadataExtractorGetMetaData0700
     * @tc.desc   AVMetaDataExtractor Get MetaData for video track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData0700', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorGetMetaData0700 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 0);
        expect(result["width"]).assertEqual(720);
        expect(result["height"]).assertEqual(480);
        
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0700:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0700:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`testohAvMetadataExtractorGetMetaData0700 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_0701
     * @tc.name   testohAvMetadataExtractorGetMetaData0701
     * @tc.desc   AVMetaDataExtractor Get MetaData for video track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData0701', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorGetMetaData0700 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 0);
        expect(result["hdr_type"]).assertEqual(0);
        
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0700:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0700:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`testohAvMetadataExtractorGetMetaData0700 test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_0702
     * @tc.name   testohAvMetadataExtractorGetMetaData0702
     * @tc.desc   AVMetaDataExtractor Get MetaData for video track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData0702', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorGetMetaData0700 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 0);
        expect(result["original_width"]).assertEqual(720);
        expect(result["original_height"]).assertEqual(480);
        
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0700:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0700:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`testohAvMetadataExtractorGetMetaData0700 test end`);
      done();
    });
    
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_0900
     * @tc.name   testohAvMetadataExtractorGetMetaData0900
     * @tc.desc   AVMetadataExtractor Get MetaData for audio track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData0900', Level.LEVEL0,(done: Function) => {
      console.info(`testohAvMetadataExtractorGetMetaData0900 test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 1);
        expect(result["sample_rate"]).assertEqual(44100);
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0900:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetMetaData0900:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`testohAvMetadataExtractorGetMetaData0900 test end`);
      done();
    });
    
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_1200
     * @tc.name   testohAvMetadataExtractorGetMetaData1200
     * @tc.desc   AVMetadataExtractor Get MetaData for audio track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData1200', Level.LEVEL0,(done: Function) => {
      const tag = "testohAvMetadataExtractorGetMetaData1200"
      console.info(`${tag} test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 1);
        expect(result["codec_mime"]).assertEqual("audio/mp4a-latm");
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`${tag} test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_1300
     * @tc.name   testohAvMetadataExtractorGetMetaData1300
     * @tc.desc   AVMetadataExtractor Get MetaData for audio track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData1300', Level.LEVEL0,(done: Function) => {
      const tag = "testohAvMetadataExtractorGetMetaData1300"
      console.info(`${tag} test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 1);
        expect(result["track_type"]).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`${tag} test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_1400
     * @tc.name   testohAvMetadataExtractorGetMetaData1400
     * @tc.desc   AVMetadataExtractor Get MetaData for audio track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData1400', Level.LEVEL0,(done: Function) => {
      const tag = "testohAvMetadataExtractorGetMetaData1400"
      console.info(`${tag} test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 1);
        expect(result["bitrate"]).assertEqual(129507);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_1500
     * @tc.name   testohAvMetadataExtractorGetMetaData1500
     * @tc.desc   AVMetadataExtractor Get MetaData for audio track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData1500', Level.LEVEL0,(done: Function) => {
      const tag = "testohAvMetadataExtractorGetMetaData1500"
      console.info(`${tag} test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 1);
        expect(result["channel_count"]).assertEqual(2);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`${tag} test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_1600
     * @tc.name   testohAvMetadataExtractorGetMetaData1600
     * @tc.desc   AVMetadataExtractor Get MetaData for audio track
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData1600', Level.LEVEL0,(done: Function) => {
      const tag = "testohAvMetadataExtractorGetMetaData1600"
      console.info(`${tag} test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorGetTrackDescription(fileDescribe, 1);
        expect(result["track_index"]).assertEqual(1);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`${tag} test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETMETADATA_1800
     * @tc.name   testohAvMetadataExtractorGetMetaData1800
     * @tc.desc   AVMetadataExtractor Get MetaData for file
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetMetaData1800', Level.LEVEL0,(done: Function) => {
      const tag = "testohAvMetadataExtractorGetMetaData1800"
      console.info(`${tag} test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("H264_AAC.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAvMetadataExtractorFetchFileMetadata(fileDescribe);
        expect(result["mimeType"]).assertEqual("video/mp4");
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${JSON.stringify(result)}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`${tag} test end`);
      done();
     });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORGETCUSTOMINFO_0100
     * @tc.name   testohAvMetadataExtractorGetCustomInfo0100
     * @tc.desc   AVMetadataExtractor Get Custom Info
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testohAvMetadataExtractorGetCustomInfo0100', Level.LEVEL0,(done: Function) => {
     console.info(`testohAvMetadataExtractorGetCustomInfo0100 test start`);
     let fileDescribe: number = -1;
     try {
       let avFileDescriptor: media.AVFileDescriptor = getfile("Muxer_Auxiliary_01.mp4");
       fileDescribe = avFileDescriptor.fd;
       let key = "com.openharmony.video.sei.h_log"
       let result = avmetadataextractor.OhAvMetadataExtractorGetCustomInfo(fileDescribe);
       expect(result[key]).assertEqual("3a");
       hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetCustomInfo0100:${JSON.stringify(result)}`);
     } catch (error) {
       hilog.info(0x0000, 'testTag', '%{public}s', `testohAvMetadataExtractorGetCustomInfo0100:${error}`);
       expect().assertFail();
     }
     closefile(fileDescribe);
     console.info(`testohAvMetadataExtractorGetCustomInfo0100 test end`);
     done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_OUTPUTPARAMSSETSIZE_0100
     * @tc.name   OhAVMetadataExtractorOutputParamsSetSizeError0100
     * @tc.desc   AVMetadataExtractor Output Params Set Size Error
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorOutputParamsSetSizeError0100', Level.LEVEL0,(done: Function) => {
      console.info(`OhAVMetadataExtractorOutputParamsSetSizeError0100 test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorOutputParamsSetSizeError();
        expect(result).assertEqual(false);
        hilog.info(0x0000, 'testTag', '%{public}s', `OhAVMetadataExtractorOutputParamsSetSizeError0100:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `OhAVMetadataExtractorOutputParamsSetSizeError0100:${error}`);
        expect().assertFail();
      }
      console.info(`OhAVMetadataExtractorOutputParamsSetSizeError0100 test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMEBYTIME_0100
     * @tc.name   OhAVMetadataExtractorFetchFrameByTimeError0001
     * @tc.desc   AVMetadataExtractor Fetch Frame By Time Error, input null MatadataExtractor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFrameByTimeError0001', Level.LEVEL0,(done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFrameByTimeError0001"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorFetchFrameByTimeError(0);
        expect(result).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMEBYTIME_0200
     * @tc.name   OhAVMetadataExtractorFetchFrameByTimeError0002
     * @tc.desc   AVMetadataExtractor Fetch Frame By Time Error, input null output params
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFrameByTimeError0002', Level.LEVEL0,(done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFrameByTimeError0002"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorFetchFrameByTimeError(1);
        expect(result).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMEBYTIME_0300
     * @tc.name   OhAVMetadataExtractorFetchFrameByTimeError0003
     * @tc.desc   AVMetadataExtractor Fetch Frame By Time Error, input null pixelmap
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFrameByTimeError0003', Level.LEVEL0,(done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFrameByTimeError0003"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorFetchFrameByTimeError(2);
        expect(result).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_GETTRACKDESCRIPTION_0100
     * @tc.name   OhAVMetadataExtractorGetTrackDescriptionError0001
     * @tc.desc   AVMetadataExtractor Fetch Frame By Time Error, input null MatadataExtractor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorGetTrackDescriptionError0001', Level.LEVEL0,(done: Function) => {
      let tag = "OhAVMetadataExtractorGetTrackDescriptionError0001"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorGetTrackDescriptionError(0);
        expect(result).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_GETTRACKDESCRIPTION_0200
     * @tc.name   OhAVMetadataExtractorGetTrackDescriptionError0002
     * @tc.desc   AVMetadataExtractor Fetch Frame By Time Error, input invalid track index
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorGetTrackDescriptionError0002', Level.LEVEL0,(done: Function) => {
      let tag = "OhAVMetadataExtractorGetTrackDescriptionError0002"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorGetTrackDescriptionError(1);
        expect(result).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_GETCUSTOMINFO_0100
     * @tc.name   OhAVMetadataExtractorGetCustomInfoError0001
     * @tc.desc   AVMetadataExtractor Fetch Frame By Time Error, input null MetadataExtractor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorGetCustomInfoError0001', Level.LEVEL0,(done: Function) => {
      let tag = "OhAVMetadataExtractorGetCustomInfoError0001"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorGetCustomInfoError();
        expect(result).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_SETMEDIASOURCE_0100
     * @tc.name   OhAvMetadataExtractorSetUrlMediaSource0001
     * @tc.desc   OH_AVMetadataExtractor_SetMediaSource, create mediasource by url
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAvMetadataExtractorSetUrlMediaSource0001', Level.LEVEL0,(done: Function) => {
      let tag = "OhAvMetadataExtractorSetUrlMediaSource0001"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAvMetadataExtractorSetUrlMediaSource("http://example.com/test.mp4");
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_SETMEDIASOURCE_0300
     * @tc.name   OhAvMetadataExtractorSetDataSourceMediaSource0001
     * @tc.desc   OH_AVMetadataExtractor_SetMediaSource, create mediasource by DataSource
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAvMetadataExtractorSetDataSourceMediaSource0001', Level.LEVEL0,(done: Function) => {
      let tag = "OhAvMetadataExtractorSetDataSourceMediaSource0001"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAvMetadataExtractorSetDataSourceMediaSource();
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });
    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_SETMEDIASOURCE_0200
     * @tc.name   OhAVMetadataExtractorSetMediaSourceError0001
     * @tc.desc   AVMetadataExtractor Set Media Source Error, input null MetadataExtractor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorSetMediaSourceError0001', Level.LEVEL0,(done: Function) => {
      let tag = "OhAVMetadataExtractorSetMediaSourceError0001"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorSetMediaSourceError(0);
        expect(result).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_SETMEDIASOURCE_0400
     * @tc.name   OhAVMetadataExtractorSetMediaSourceError0002
     * @tc.desc   AVMetadataExtractor Set Media Source Error, input null MetadataExtractor
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorSetMediaSourceError0002', Level.LEVEL0,(done: Function) => {
      let tag = "OhAVMetadataExtractorSetMediaSourceError0002"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorSetMediaSourceError(1);
        expect(result).assertEqual(AV_ERR_INVALID_VAL);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMES_0001
     * @tc.name   OhAVMetadataExtractorFetchFramesByTimes0001
     * @tc.desc   OH_AVMetadataExtractor_FetchFramesByTimes, set mode as OH_AVMETADATA_EXTRACTOR_QUERY_NEXT_SYNC
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFramesByTimes0001', Level.LEVEL0, async (done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFramesByTimes0001"
      console.info(`${tag} test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAVMetadataExtractorFetchFramesByTimes(fileDescribe,0,0,720,480,0,[0]);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMES_0002
     * @tc.name   OhAVMetadataExtractorFetchFramesByTimes0002
     * @tc.desc   OH_AVMetadataExtractor_FetchFramesByTimes, set mode as OH_AVMETADATA_EXTRACTOR_QUERY_PREVIOUS_SYNC
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFramesByTimes0002', Level.LEVEL0, async (done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFramesByTimes0002"
      console.info(`${tag} test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAVMetadataExtractorFetchFramesByTimes(fileDescribe,0,0,1920,1080,1,[0]);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMES_0003
     * @tc.name   OhAVMetadataExtractorFetchFramesByTimes0003
     * @tc.desc   OH_AVMetadataExtractor_FetchFramesByTimes, set mode as OH_AVMETADATA_EXTRACTOR_QUERY_CLOSEST_SYNC
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFramesByTimes0003', Level.LEVEL0, async (done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFramesByTimes0003"
      console.info(`${tag} test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAVMetadataExtractorFetchFramesByTimes(fileDescribe,0,0,0,0,2,[-1]);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMES_0004
     * @tc.name   OhAVMetadataExtractorFetchFramesByTimes0004
     * @tc.desc   OH_AVMetadataExtractor_FetchFramesByTimes, set mode as OH_AVMETADATA_EXTRACTOR_QUERY_CLOSEST
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFramesByTimes0004', Level.LEVEL0, async (done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFramesByTimes0004"
      console.info(`${tag} test start`);
      let fileDescribe: number = -1;
      try {
        let avFileDescriptor: media.AVFileDescriptor = getfile("MP4_ROTATE_90.mp4");
        fileDescribe = avFileDescriptor.fd;
        let result = avmetadataextractor.OhAVMetadataExtractorFetchFramesByTimes(fileDescribe,0,0,-1,-1,3,[9999*1000]);
        expect(result).assertEqual(AV_ERR_OK);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      closefile(fileDescribe);
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMES_0005
     * @tc.name   OhAVMetadataExtractorFetchFramesByTimes0005
     * @tc.desc   OH_AVMetadataExtractor_CancelAllFetchFrames
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFramesByTimes0005', Level.LEVEL0, async (done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFramesByTimes0005"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorCancelAllFetchFrames();
        expect(result).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMES_0006
     * @tc.name   OhAVMetadataExtractorFetchFramesByTimes0006
     * @tc.desc   OH_AVMetadataExtractor_FetchFramesByTimes, set mode as OH_AVMETADATA_EXTRACTOR_QUERY_CLOSEST
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFramesByTimes0006', Level.LEVEL0, async (done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFramesByTimes0006"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorFetchFramesByTimesErr();
        expect(result).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMES_0007
     * @tc.name   OhAVMetadataExtractorFetchFramesByTimes0007
     * @tc.desc   OH_AVMetadataExtractor_FetchFramesByTimes, set mode as OH_AVMETADATA_EXTRACTOR_QUERY_CLOSEST
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFramesByTimes0007', Level.LEVEL0, async (done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFramesByTimes0007"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorFetchFramesByTimesErr1();
        expect(result).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTOR_FETCHFRAMES_0008
     * @tc.name   OhAVMetadataExtractorFetchFramesByTimes0008
     * @tc.desc   OH_AVMetadataExtractor_FetchFramesByTimes, set mode as OH_AVMETADATA_EXTRACTOR_QUERY_CLOSEST
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchFramesByTimes0008', Level.LEVEL0, async (done: Function) => {
      let tag = "OhAVMetadataExtractorFetchFramesByTimes0008"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorFetchFramesByTimesErr2();
        expect(result).assertEqual(0);
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${result}`);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_FETCHSTATE_0001
     * @tc.name   OhAVMetadataExtractorFetchState0001
     * @tc.desc   OH_AVMetadataExtractor_FetchState
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMetadataExtractorFetchState0001', Level.LEVEL0, async (done: Function) => {
      let tag = "OhAVMetadataExtractorFetchState0001"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMetadataExtractorFetchState();
        expect(result).assertEqual(0);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });

    /**
     * @tc.number SUB_MULTIMEIDA_SEEKMODE_0001
     * @tc.name   OhAVMediaSeekMode0001
     * @tc.desc   OH_AVMedia_SeekMode
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('OhAVMediaSeekMode0001', Level.LEVEL0, async (done: Function) => {
      let tag = "OhAVMediaSeekMode0001"
      console.info(`${tag} test start`);
      try {
        let result = avmetadataextractor.OhAVMediaSeekMode();
        expect(result).assertEqual(0);
      } catch (error) {
        hilog.info(0x0000, 'testTag', '%{public}s', `${tag}:${error}`);
        expect().assertFail();
      }
      console.info(`${tag} test end`);
      done();
    });
  });
}