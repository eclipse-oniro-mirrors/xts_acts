/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import MediaTestBase from './MediaTestBase.test';
import media from '@ohos.multimedia.media';
import resourceManager from '@ohos.resourceManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import image from "@ohos.multimedia.image";
import { BusinessError } from '@ohos.base';
import fs, {ReadOptions} from '@ohos.file.fs';

const AUDIO_SOURCE = 'mjpeg_mp3.mp3';
const VIDEO_SOURCE = 'H264_AAC_Matedata.mp4';
const VIDEO_NOSUPPORT = 'No_Support_Format.mov'
const TAG = "MetadataDemo"
const SLEEP_TIME = 200
let AVFileDescriptor: media.AVFileDescriptor | undefined;
let AVFileDescriptor2: media.AVFileDescriptor | undefined;
let AVFileDescriptor3: media.AVFileDescriptor | undefined;
let mediaTestBase = new MediaTestBase()

function openFileFailed() {
  console.info('case file fail');
}

export default function AVMetadata() {
  describe('AVMetadata', () => {
    let timeUs: long = 0;
    let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
    let param: media.PixelMapParams = {
      width: 300,
      height: 300,
    }

    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE, openFileFailed).then((res: media.AVFileDescriptor) => {
        AVFileDescriptor = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res: media.AVFileDescriptor) => {
        AVFileDescriptor2 = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_NOSUPPORT, openFileFailed).then((res: media.AVFileDescriptor) => {
        AVFileDescriptor3 = res;
      });
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await mediaTestBase.closeFdNumber(AVFileDescriptor!.fd);
      await mediaTestBase.closeFdNumber(AVFileDescriptor2!.fd);
      await mediaTestBase.closeFdNumber(AVFileDescriptor3!.fd);
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_static_0100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, album: ${metadata!!.album}`);
        expect(metadata!!.album).assertEqual("media");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_static_0200
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, albumArtist: ${metadata!!.albumArtist}`);
        expect(metadata!!.albumArtist).assertEqual("media_test");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_static_0300
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_static_0300
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, artist: ${metadata!!.artist}`);
        expect(metadata!!.artist).assertEqual("元数据测试");
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_static_0400
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_static_0400
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, author: ${metadata!!.author}`);
        expect(metadata!!.author).assertEqual("media");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_static_0500
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_static_0500
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, dateTime: ${metadata!!.dateTime}`);
        console.info(TAG, `fetchMetadata callback success, dateTimeFormat: ${metadata!!.dateTimeFormat}`);
        expect(metadata!!.dateTime).assertEqual("2015-11-23");
        expect(metadata!!.dateTimeFormat).assertEqual("2015-11-23 00:00:00");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIMEFORMAT_PROMISE_FUNCTION_static_0600
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIMEFORMAT_PROMISE_FUNCTION_static_0600
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIMEFORMAT_PROMISE_FUNCTION_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      console.info('AVMetadataExtractor success   22222222222');
      // 获取元数据
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video album :${metadata!!.album}}`);
        expect(metadata!!.album).assertEqual("media");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_static_0700
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_static_0700
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, genre: ${metadata!!.composer}`);
        expect(metadata!!.composer).assertEqual("测试");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_static_0800
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_static_0800
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, duration: ${metadata!!.duration}`);
        expect(metadata!!.duration).assertEqual("219600");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_static_0900
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_static_0900
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, genre: ${metadata!!.genre}`);
        expect(metadata!!.genre).assertEqual("Lyrical");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_static_1000
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_static_1000
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, hasAudio: ${metadata!!.hasAudio}`);
        expect(metadata!!.hasAudio).assertEqual("yes");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_static_1100
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_static_1100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, hasVideo: ${metadata!!.hasVideo}`);
        expect(metadata!!.hasVideo).assertEqual("");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_static_1200
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_static_1200
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, mimeType: ${metadata!!.mimeType}`);
        expect(metadata!!.mimeType).assertEqual("audio/mpeg");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_static_1300
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_static_1300
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, trackCount: ${metadata!!.trackCount}`);
        expect(metadata!!.trackCount).assertEqual("2");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_SAMPLERATE_PROMISE_FUNCTION_static_1400
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_SAMPLERATE_PROMISE_FUNCTION_static_1400
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_SAMPLERATE_PROMISE_FUNCTION_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, sampleRate: ${metadata!!.sampleRate}`);
        expect(metadata!!.sampleRate).assertEqual('48000');
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_TITLE_PROMISE_FUNCTION_static_1500
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_TITLE_PROMISE_FUNCTION_static_1500
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_TITLE_PROMISE_FUNCTION_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, title: ${metadata!!.title}`);
        expect(metadata!!.title).assertEqual("test");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_static_1600
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_static_1600
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, videoHeight: ${metadata!!.videoHeight}`);
        expect(metadata!!.videoHeight).assertEqual("1276");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_static_1700
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_static_1700
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, videoWidth: ${metadata!!.videoWidth}`);
        expect(metadata!!.videoWidth).assertEqual("1702");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_static_1800
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_static_1800
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, videoOrientation: ${metadata!!.videoOrientation}`);
        expect(metadata!!.videoOrientation).assertEqual("");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_static_1900
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_static_1900
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, album: ${metadata!!.album}`);
        expect(metadata!!.album).assertEqual("");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_static_2000
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_static_2000
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, albumArtist: ${metadata!!.albumArtist}`);
        expect(metadata!!.albumArtist).assertEqual("");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_static_2100
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_static_2100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, artist: ${metadata!!.artist}`);
        expect(metadata!!.artist).assertEqual("");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_static_2200
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_static_2200
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, author: ${metadata!!.author}`);
        expect(metadata!!.author).assertEqual("");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_static_2300
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_static_2300
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video dateTime :${metadata!!.dateTime}}`);
        expect(metadata!!.dateTime).assertEqual("2017-08-05 19:28:32");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_static_2400
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_static_2400
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video composer :${metadata!!.composer}}`);
        expect(metadata!!.composer).assertEqual("");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_static_02500
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_static_02500
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_static_02500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video duration :${metadata!!.duration}}`);
        expect(metadata!!.duration).assertEqual("5826");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_static_02600
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_static_02600
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_static_02600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video genre :${metadata!!.genre}}`);
        expect(metadata!!.genre).assertEqual("");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_static_02700
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_static_02700
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_static_02700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video hasAudio :${metadata!!.hasAudio}}`);
        expect(metadata!!.hasAudio).assertEqual("yes");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_static_02800
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_static_02800
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_static_02800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video hasVideo :${metadata!!.hasVideo}}`);
        expect(metadata!!.hasVideo).assertEqual("yes");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_static_02900
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_static_02900
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_static_02900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video mimeType :${metadata!!.mimeType}}`);
        expect(metadata!!.mimeType).assertEqual("video/mp4");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_static_3000
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_static_3000
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video trackCount :${metadata!!.trackCount}}`);
        expect(metadata!!.trackCount).assertEqual("2");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA__SAMPLERATE_PROMISE_FUNCTION_static_3100
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA__SAMPLERATE_PROMISE_FUNCTION_static_3100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA__SAMPLERATE_PROMISE_FUNCTION_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video sampleRate :${metadata!!.sampleRate}}`);
        expect(metadata!!.sampleRate).assertEqual("48000");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA__PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_static_03200
     * @tc.number SUB_MULTIMEDIA__PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_static_03200
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA__PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_static_03200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video videoWidth :${metadata!!.videoWidth}}`);
        expect(metadata!!.videoHeight).assertEqual("480");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_static_03300
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_static_03300
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_static_03300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video videoWidth :${metadata!!.videoWidth}}`);
        expect(metadata!!.videoWidth).assertEqual("640");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_static_3400
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_static_3400
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success video videoOrientation :${metadata!!.videoOrientation}}`);
        expect(metadata!!.videoOrientation).assertEqual("270");
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_PLAYER_AVMETADATA_ALBUM_CB_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_PLAYER_AVMETADATA_ALBUM_CB_FUNCTION_static_0100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PLAYER_AVMETADATA_ALBUM_CB_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + "0100 is success");
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      if(avMetadataExtractor == undefined) {
        console.info(TAG + "0100 avMetadataExtractor == undefined");
      } else {
        console.info(TAG + "0100 avMetadataExtractor != undefined: " + JSON.stringify(avMetadataExtractor));
      }
      if(AVFileDescriptor == undefined) {
        console.info(TAG + "0100 AVFileDescriptor == undefined");
      } else {
        console.info(TAG + "0100 AVFileDescriptor != undefined: " + JSON.stringify(AVFileDescriptor!));
      }
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;

      avMetadataExtractor!!.fetchMetadata((err, metadata) => {
        if (err != null) {
          console.error(TAG, `fetchMetadata callback failed, err = ${JSON.stringify(err)}`);
        } else {
          console.info(TAG, `fetchMetadata callback success video album :${metadata!!.album}}`);
          expect(metadata!!.album).assertEqual("media");
          avMetadataExtractor!!.release();
          done();
        }
      });
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_HDRTYPE_PROMISE_FUNCTION_static_1800
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_HDRTYPE_PROMISE_FUNCTION_static_1800
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HDRTYPE_PROMISE_FUNCTION_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success');
      let avMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        console.info(TAG, `fetchMetadata callback success, hdrType: ${metadata!!.hdrType}`);
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_LOCATION_PROMISE_FUNCTION_static_1900
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_LOCATION_PROMISE_FUNCTION_static_1900
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_LOCATION_PROMISE_FUNCTION_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success');
      let avMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        expect(metadata).not().assertNull();
        let location = metadata!!.location;
        console.info(TAG, `fetchMetadata callback success, latitude: ${location?.latitude}`);
        console.info(TAG, `fetchMetadata callback success, longitude: ${location?.longitude}`);
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATASRC_PROMISE_FUNCTION_static_2000
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATASRC_PROMISE_FUNCTION_static_2000
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATASRC_PROMISE_FUNCTION_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success');
      let avMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success');
      let stat = fs.statSync(AVFileDescriptor!.fd);
      let size = stat.size;
      let dataSrc: media.AVDataSrcDescriptor = {
        fileSize: size,
        callback: (buffer: ArrayBuffer, len: long, pos?: long) => {
          if (buffer == undefined || len == undefined || pos == undefined) {
            console.error(TAG, `dataSrc callback param invalid`);
            return -1;
          }
          let options: ReadOptions = {
            offset: pos,
            length: len
          };
          let num = fs.readSync(AVFileDescriptor!.fd, buffer, options);
          console.info(TAG, 'readAt end, num: ' + num);
          if (num > 0 && size >= pos) {
            return num.toInt();
          }
          return -1;
        }
      };
      avMetadataExtractor!!.dataSrc = dataSrc;
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        expect(metadata).not().assertNull();
        console.info(TAG, `fetchMetadata callback success, customInfo: ${metadata}`);
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_PLAYER_VIDEOHEIGHT_PIXELMAP_CB_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_PLAYER_VIDEOHEIGHT_PIXELMAP_CB_FUNCTION_static_0200
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_PLAYER_VIDEOHEIGHT_PIXELMAP_CB_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(TAG + "SUB_MULTIMEDIA_AUDIO_PLAYER_VIDEOHEIGHT_PIXELMAP_CB_FUNCTION_0200  is success");
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      avMetadataExtractor!!.fetchAlbumCover((err, PixelMap) => {
        if (err) {
          console.error(TAG, `fetchMetadata callback failed, err = ${JSON.stringify(err)}`);
        } else {
          console.info(TAG, `fetchMetadata callback success video PixelMap :${PixelMap}`);
          avMetadataExtractor!!.release();
          done();
        }
      });
    });



    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUDIOPIXELMAP_PROMISE_FUNCTION_static_3500
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUDIOPIXELMAP_PROMISE_FUNCTION_static_3500
     * @tc.desc   SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUDIOPIXELMAP_PROMISE_FUNCTION_static_3500
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUDIOPIXELMAP_PROMISE_FUNCTION_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor!!.fdSrc = AVFileDescriptor!;
      // 获取专辑封面
      await avMetadataExtractor!!.fetchAlbumCover().then((pixelMap: image.PixelMap | undefined) => {
        pixelMap!!.getImageInfo().then((imageInfo: image.ImageInfo) => {
          if (imageInfo == undefined) {
            console.error("Failed to obtain the image pixel map information.");
          } else {
            console.log("imgwidth=" + imageInfo.size.width);
            console.log("imgheight=" + imageInfo.size.height);
            const width = imageInfo.size.width;
            const height = imageInfo.size.height;
            expect(imageInfo.size.width).assertEqual(width);
            expect(imageInfo.size.height).assertEqual(height);
          }
        });
        console.info(TAG, `fetchMetadata callback success video PixelMap :${pixelMap}}`);
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`fetchAlbumCover catchCallback, error message:${error.message}`);
      });
      await mediaTestBase.msleepAsync(SLEEP_TIME)
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_FETCHFRAMEBYTIME_PROMISE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_FETCHFRAMEBYTIME_PROMISE_FUNCTION_static_0100
     * @tc.desc   SUB_MULTIMEDIA_PLAYER_AVMETADATA_FETCHFRAMEBYTIME_PROMISE_FUNCTION_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_FETCHFRAMEBYTIME_PROMISE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      if (!avMetadataExtractor) {
        console.info('AVMetadataExtractor create failed. Received null or undefined');
      }
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      if (!AVFileDescriptor2) {
        console.info('AVFileDescriptor2 create failed. Received null or undefined');
      }
      avMetadataExtractor!!.fdSrc = AVFileDescriptor2!;
      // 调用FetchFrameByTime方法
      await avMetadataExtractor!!.fetchFrameByTime(timeUs, queryOption, param).then((pixelMap: image.PixelMap | undefined) => {
        console.info('fetchFrameByTime success');
        let pixel_map = pixelMap;
        expect(pixel_map).not().assertNull();
        console.info(TAG, `fetchFrameByTime callback success video PixelMap}`);
      }).catch((error: Error) => {
        console.error(`fetchFrameByTime catchCallback, error message:${error.message}`);
        expect().assertFail();
      });
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_AVMETADATA_SETURLSOURCE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_AVMETADATA_SETURLSOURCE_FUNCTION_static_0100
     * @tc.desc   SUB_MULTIMEDIA_PLAYER_AVMETADATA_SETURLSOURCE_FUNCTION_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_SETURLSOURCE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor | undefined = await media.createAVMetadataExtractor();
      if (!avMetadataExtractor) {
        console.info('AVMetadataExtractor create failed. Received null or undefined');
      }
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      let url = 'http://www.w3schools.com/html/movie.mp4'
      avMetadataExtractor!!.setUrlSource(url);
      console.info('setUrlSource: ' + url);
      // 获取元信息
      await avMetadataExtractor!!.fetchMetadata().then((metadata: media.AVMetadata | undefined) => {
        expect(metadata).not().assertNull();
        console.info(TAG, `fetchMetadata callback success, customInfo: ${metadata}`);
        avMetadataExtractor!!.release();
      }).catch((error: Error) => {
        console.error(`setUrlSource catchCallback, error message:${error.message}`);
      });
      done();
    });
  })
}
