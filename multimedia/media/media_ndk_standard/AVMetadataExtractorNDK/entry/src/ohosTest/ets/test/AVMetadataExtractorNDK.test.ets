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
     * @tc.number     : SUB_MULTIMEDIA_avmetadataextractor_OHAVMETADATAEXTRACTORCREATE_0100
     * @tc.name       : testohAvMetadataExtractorCreate0100
     * @tc.desc       : Create an instance of the metadata extractor for media files.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_SETFDSOURCE_0100
     * @tc.name       : testohAvMetadataExtractorSetFDSource0100
     * @tc.desc       : Set an MP3 file as the file source.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_SETFDSOURCE_0200
     * @tc.name       : testohAvMetadataExtractorSetFDSource0200
     * @tc.desc       : Set an MP4 file as the file source.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_SETFDSOURCE_0300
     * @tc.name       : testohAvMetadataExtractorSetFDSource0300
     * @tc.desc       : Set invalid fd Source.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_MULTIMEDIA_avmetadataextractor_OHAVMETADATAEXTRACTORFETCHMETADATA_0100
     * @tc.name       : testohAvMetadataExtractorFetchMetadata0100
     * @tc.desc       : Fetch metadata from the MP3 file using the metadata extractor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_MULTIMEDIA_avmetadataextractor_OHAVMETADATAEXTRACTORFETCHMETADATA_0200
     * @tc.name       : testohAvMetadataExtractorFetchMetadata0200
     * @tc.desc       : Fetch metadata from the MP4 file using the metadata extractor.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_FETCHALBUMCOVER_0100
     * @tc.name       : testohAvMetadataExtractorFetchAlbumCover0100
     * @tc.desc       : Get album cover from MP3.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_FETCHALBUMCOVER_0200
     * @tc.name       : testohAvMetadataExtractorFetchAlbumCover0200
     * @tc.desc       : Get album cover from MP4 and this is error.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORRELEASE_0100
     * @tc.name       : testohAvMetadataExtractorRelease100
     * @tc.desc       : Release the metadata extractor object.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_METADATAEXTRACTORRELEASE_0200
     * @tc.name       : testohAvMetadataExtractorReleaseTwo0200
     * @tc.desc       : Release the metadata extractor object with the object is nullptr
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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
     * @tc.number     : SUB_MULTIMEIDA_AVMETADATAEXTRACTOR_ALL_0100
     * @tc.name       : testohAvMetadataExtractorAll0100
     * @tc.desc       : Verify extraction of all metadata properties from the media source.
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
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

        expect(metadata.trackCount).assertEqual(2);
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
  });
}