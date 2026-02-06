/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import MediaTestBase from './MediaTestBase';
import media from '@ohos.multimedia.media';
import resourceManager from '@ohos.resourceManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import image from "@ohos.multimedia.image";
import { BusinessError } from '@kit.BasicServicesKit';

const AUDIO_SOURCE = 'mjpeg_mp3.mp3';
const VIDEO_SOURCE = 'H264_AAC_Matedata.mp4';
const VIDEO_NOSUPPORT = 'No_Support_Format.mov'
const HTTP_SOURCE = 'http://XXX';
const TAG = "MetadataDemo"
const SLEEP_TIME = 200
let AVFileDescriptor: media.AVFileDescriptor;
let AVFileDescriptor2: media.AVFileDescriptor;
let AVFileDescriptor3: media.AVFileDescriptor;
let mediaTestBase = new MediaTestBase()

function openFileFailed() {
  console.info('case file fail');
}

function fullZero(num: string, digitalNum: number = 2){
  const stringLength = num.length
  let len = digitalNum - stringLength
  len = len < 0 ? 0 : len
  const zeroString: string = Array(len).fill('0').reduce((p: string, c: string): string => p + c, '')
  return stringLength < digitalNum ? `${num}${zeroString}` : num
}

function validateType(track: media.MediaDescription, key: string, type: string, composedKeys: string): void{
  const trackType = Math.pow(2,track[media.MediaDescriptionKey.MD_KEY_TRACK_TYPE] as number).toString(2)
  const composedKeysFirstPart = Number(`0b${composedKeys.split('.')[0]}`)
  const composedKeysSecondPart = Number(`0b${fullZero(composedKeys.split('.')[1] || '0')}`)
  console.log(`composedKeys: ${composedKeys}`)
  console.log(`composedKeysFirstPart: ${composedKeysFirstPart} - composedKeysSecondPart: ${composedKeysSecondPart}`)
  const trackTypeFirstPart = Number(`0b${trackType.split('.')[0]}`)
  const trackTypeSecondPart = Number(`0b${fullZero(trackType.split('.')[1] || '0')}`)
  console.log(`trackType: ${trackType}`)
  console.log(`trackTypeFirstPart: ${trackTypeFirstPart} - trackTypeSecondPart: ${trackTypeSecondPart}`)
  const needed = trackTypeFirstPart & composedKeysFirstPart || trackTypeSecondPart & composedKeysSecondPart
  console.log(`needed: ${needed}`)
  console.info(`key: ${key} --- value: ${track[key]} --- exceptType: ${type}`)
  if(needed){
    console.info(`Trigger Verification!`)
    expect(typeof track[key] == type).assertTrue()
  }
}

const MediaType = [
  "MEDIA_TYPE_UNSUPPORTED",
  "MEDIA_TYPE_AUD",
  "MEDIA_TYPE_VID",
  "MEDIA_TYPE_SUBTITLE",
  "MEDIA_TYPE_ATTACHMENT",
  "MEDIA_TYPE_DATA",
  "MEDIA_TYPE_TIMED_METADATA",
  "MEDIA_TYPE_AUXILIARY"
]
type BinaryKeysMap = Map<string, string>
const BinaryKeys: BinaryKeysMap = (() =>{
  return MediaType.reduce((pre_BinaryKeys: BinaryKeysMap,cur_BinaryKeys: string) => {
    const key = cur_BinaryKeys.split('_')[2]
    pre_BinaryKeys.set(key, Math.pow(2,media.MediaType[cur_BinaryKeys]).toString(2))
    return pre_BinaryKeys
  },new Map())
})()
BinaryKeys.set("ALL", String(MediaType.reduce((result: number, MediaType: string): number => {
  const key = MediaType.split('_')[2]
  result = result + Number(BinaryKeys.get(key))
  return result
},0)))

function composeKeys(keys: string[]){
  return String(keys.reduce((p, c) => p + Number(c), 0))
}

function validateMediaDescriptionKey(track: media.MediaDescription): void{
  validateType(track, media.MediaDescriptionKey.MD_KEY_TRACK_INDEX, 'number', composeKeys([BinaryKeys.get("ALL")!]))
  validateType(track, media.MediaDescriptionKey.MD_KEY_TRACK_TYPE, 'number', composeKeys([BinaryKeys.get("ALL")!]))
  validateType(track, media.MediaDescriptionKey.MD_KEY_CODEC_MIME, 'string', composeKeys([BinaryKeys.get("AUD")!,BinaryKeys.get("VID")!]))
  validateType(track, media.MediaDescriptionKey.MD_KEY_WIDTH, 'number', composeKeys([BinaryKeys.get("VID")!]))
  validateType(track, media.MediaDescriptionKey.MD_KEY_HEIGHT, 'number', composeKeys([BinaryKeys.get("VID")!]))
  validateType(track, media.MediaDescriptionKey.MD_KEY_FRAME_RATE, 'number', composeKeys([BinaryKeys.get("VID")!]))
  validateType(track, media.MediaDescriptionKey.MD_KEY_AUD_CHANNEL_COUNT, 'number', composeKeys([BinaryKeys.get("AUD")!]))
  validateType(track, media.MediaDescriptionKey.MD_KEY_AUD_SAMPLE_RATE, 'number', composeKeys([BinaryKeys.get("AUD")!]))
  validateType(track, media.MediaDescriptionKey.MD_KEY_HDR_TYPE, 'number', composeKeys([BinaryKeys.get("VID")!]))
}

export default function AVMetadata() {
  describe('AVMetadata', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE, openFileFailed).then((res) => {
        AVFileDescriptor = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res) => {
        AVFileDescriptor2 = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_NOSUPPORT, openFileFailed).then((res) => {
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
      await mediaTestBase.closeFdNumber(AVFileDescriptor.fd);
      await mediaTestBase.closeFdNumber(AVFileDescriptor2.fd);
      await mediaTestBase.closeFdNumber(AVFileDescriptor3.fd);
    });
    /* *
       * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_0100
       * @tc.name      : 001.testAVMeta album
       * @tc.desc      : Local Video playback control test
       * @tc.size      : MediumTest
       * @tc.type      : Function Test
       * @tc.level     : Level0
           */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_0100', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, album: ${metadata.album}`);
        expect(metadata.album).assertEqual("media");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_0200
      * @tc.name      : 001.testAVMeta albumArtist
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_0200', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, albumArtist: ${metadata.albumArtist}`);
        expect(metadata.albumArtist).assertEqual("media_test");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_0300
      * @tc.name      : 001.testAVMeta artist
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_0300', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, artist: ${metadata.artist}`);
        expect(metadata.artist).assertEqual("元数据测试");
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_0400
      * @tc.name      : 001.testAVMeta author
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_0400', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, author: ${metadata.author}`);
        expect(metadata.author).assertEqual("media");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_0500
      * @tc.name      : 001.testAVMeta dateTime
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_0500', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, dateTime: ${metadata.dateTime}`);
        console.info(TAG, `fetchMetadata callback success, dateTimeFormat: ${metadata.dateTimeFormat}`);
        expect(metadata.dateTime).assertEqual("2015-11-23");
        expect(metadata.dateTimeFormat).assertEqual("2015-11-23 00:00:00");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIMEFORMAT_PROMISE_FUNCTION_0600
      * @tc.name      : 001.testAVMeta dateTimeFormat
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIMEFORMAT_PROMISE_FUNCTION_0600', Level.LEVEL0,async (done: Function) => {
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      console.info('AVMetadataExtractor success   22222222222');
      // 获取元数据
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video album :${metadata.album}}`);
        expect(metadata.album).assertEqual("media");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_0700
      * @tc.name      : 001.testAVMeta composer
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_0700', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, genre: ${metadata.composer}`);
        expect(metadata.composer).assertEqual("测试");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_0800
      * @tc.name      : 001.testAVMeta duration
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_0800', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, duration: ${metadata.duration}`);
        expect(metadata.duration).assertEqual("219600");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_0900
      * @tc.name      : 001.testAVMeta genre
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_0900', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, genre: ${metadata.genre}`);
        expect(metadata.genre).assertEqual("Lyrical");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_1000
        * @tc.name      : 001.testAVMeta hasAudio
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function Test
        * @tc.level     : Level0
           */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_1000', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, hasAudio: ${metadata.hasAudio}`);
        expect(metadata.hasAudio).assertEqual("yes");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_1100
        * @tc.name      : 001.testAVMeta hasVideo
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function Test
        * @tc.level     : Level0
           */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_1100', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, hasVideo: ${metadata.hasVideo}`);
        expect(metadata.hasVideo).assertEqual("");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_1200
      * @tc.name      : 001.testAVMeta mimeType
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_1200', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, mimeType: ${metadata.mimeType}`);
        expect(metadata.mimeType).assertEqual("audio/mpeg");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_1300
      * @tc.name      : 001.testAVMeta trackCount
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_1300', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, trackCount: ${metadata.trackCount}`);
        expect(metadata.trackCount).assertEqual('1');
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_SAMPLERATE_PROMISE_FUNCTION_1400
      * @tc.name      : 001.testAVMeta sampleRate
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_SAMPLERATE_PROMISE_FUNCTION_1400', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, sampleRate: ${metadata.sampleRate}`);
        expect(metadata.sampleRate).assertEqual('48000');
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_TITLE_PROMISE_FUNCTION_1500
      * @tc.name      : 001.testAVMeta title
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_TITLE_PROMISE_FUNCTION_1500', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, title: ${metadata.title}`);
        expect(metadata.title).assertEqual("test");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_1600
      * @tc.name      : 001.testAVMeta videoHeight
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_1600', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, videoHeight: ${metadata.videoHeight}`);
        expect(metadata.videoHeight).assertEqual("");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_1700
      * @tc.name      : 001.testAVMeta videoWidth
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_1700', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, videoWidth: ${metadata.videoWidth}`);
        expect(metadata.videoWidth).assertEqual("");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_1800
      * @tc.name      : 001.testAVMeta videoOrientation
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_1800', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, videoOrientation: ${metadata.videoOrientation}`);
        expect(metadata.videoOrientation).assertEqual("");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_1900
    * @tc.name      : 001.testAVMeta album
    * @tc.desc      : Local Video playback control test
    * @tc.size      : MediumTest
    * @tc.type      : Function Test
    * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_1900', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, album: ${metadata.album}`);
        expect(metadata.album).assertEqual("");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_2000
      * @tc.name      : 001.testAVMeta albumArtist
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_2000', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, albumArtist: ${metadata.albumArtist}`);
        expect(metadata.albumArtist).assertEqual("");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_2100
      * @tc.name      : 001.testAVMeta artist
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_2100', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, artist: ${metadata.artist}`);
        expect(metadata.artist).assertEqual("");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_2200
      * @tc.name      : 001.testAVMeta author
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_2200', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, author: ${metadata.author}`);
        expect(metadata.author).assertEqual("");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_2300
      * @tc.name      : 001.testAVMeta dateTime
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_2300', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video dateTime :${metadata.dateTime}}`);
        expect(metadata.dateTime).assertEqual("2017-08-05 19:28:32");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_2400
      * @tc.name      : 001.testAVMeta composer
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_2400', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video composer :${metadata.composer}}`);
        expect(metadata.composer).assertEqual("");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_2500
      * @tc.name      : 001.testAVMeta duration
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_02500', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video duration :${metadata.duration}}`);
        expect(metadata.duration).assertEqual("5826");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_2600
      * @tc.name      : 001.testAVMeta genre
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_02600', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video genre :${metadata.genre}}`);
        expect(metadata.genre).assertEqual("");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_2700
        * @tc.name      : 001.testAVMeta hasAudio
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function Test
        * @tc.level     : Level0
           */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_02700', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video hasAudio :${metadata.hasAudio}}`);
        expect(metadata.hasAudio).assertEqual("yes");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_2800
        * @tc.name      : 001.testAVMeta hasVideo
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function Test
        * @tc.level     : Level0
           */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_02800', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video hasVideo :${metadata.hasVideo}}`);
        expect(metadata.hasVideo).assertEqual("yes");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_2900
      * @tc.name      : 001.testAVMeta mimeType
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_02900', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video mimeType :${metadata.mimeType}}`);
        expect(metadata.mimeType).assertEqual("video/mp4");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_3000
      * @tc.name      : 001.testAVMeta trackCount
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_3000', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video trackCount :${metadata.trackCount}}`);
        expect(metadata.trackCount).assertEqual("2");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA__SAMPLERATE_PROMISE_FUNCTION_3100
      * @tc.name      : 001.testAVMeta sampleRate
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA__SAMPLERATE_PROMISE_FUNCTION_3100', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video sampleRate :${metadata.sampleRate}}`);
        expect(metadata.sampleRate).assertEqual("48000");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_03200
      * @tc.name      : 001.testAVMeta videoHeight
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA__PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_03200', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video videoWidth :${metadata.videoWidth}}`);
        expect(metadata.videoHeight).assertEqual("480");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_03300
      * @tc.name      : 001.testAVMeta videoWidth
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_03300', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video videoWidth :${metadata.videoWidth}}`);
        expect(metadata.videoWidth).assertEqual("640");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_3400
      * @tc.name      : 001.testAVMeta videoOrientation
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_3400', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video videoOrientation :${metadata.videoOrientation}}`);
        expect(metadata.videoOrientation).assertEqual("270");
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUDIOPIXELMAP_PROMISE_FUNCTION_3500
    * @tc.name      : 001.testAVMeta PixelMap
    * @tc.desc      : Local Video playback control test
    * @tc.size      : MediumTest
    * @tc.type      : Function Test
    * @tc.level     : Level0
      */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUDIOPIXELMAP_PROMISE_FUNCTION_3500', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取专辑封面
      await avMetadataExtractor.fetchAlbumCover().then((pixelMap) => {
        pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
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
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchAlbumCover catchCallback, error message:${error.message}`);
      });
      await mediaTestBase.msleepAsync(SLEEP_TIME)
      done();
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_PLAYER_AVMETADATA_ALBUM_CB_FUNCTION_0100
    * @tc.name      : 001.testAVMeta album
    * @tc.desc      : Local Video playback control test
    * @tc.size      : MediumTest
    * @tc.type      : Function Test
    * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_AUDIO_PLAYER_AVMETADATA_ALBUM_CB_FUNCTION_0100', Level.LEVEL0,async (done: Function) => {
      console.info(TAG + "0100 is success");
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      await avMetadataExtractor.fetchMetadata((err, metadata) => {
        if (err) {
          console.error(TAG, `fetchMetadata callback failed, err = ${JSON.stringify(err)}`);
          return;
        }
        console.info(TAG, `fetchMetadata callback success video album :${metadata.album}}`);
        expect(metadata.album).assertEqual("media");
        avMetadataExtractor.release();
        done();
      });
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_PLAYER_VIDEOHEIGHT_PIXELMAP_CB_FUNCTION_0200
    * @tc.name      : 001.testAVMeta PixelMap
    * @tc.desc      : Local Video playback control test
    * @tc.size      : MediumTest
    * @tc.type      : Function Test
    * @tc.level     : Level0
       */
    it('SUB_MULTIMEDIA_AUDIO_PLAYER_VIDEOHEIGHT_PIXELMAP_CB_FUNCTION_0200', Level.LEVEL0,async (done: Function) => {
      console.info(TAG + "SUB_MULTIMEDIA_AUDIO_PLAYER_VIDEOHEIGHT_PIXELMAP_CB_FUNCTION_0200  is success");
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      await avMetadataExtractor.fetchAlbumCover((err, PixelMap) => {
        if (err) {
          console.error(TAG, `fetchMetadata callback failed, err = ${JSON.stringify(err)}`);
          return;
        }
        console.info(TAG, `fetchMetadata callback success video PixelMap :${PixelMap}}`);
        avMetadataExtractor.release();
        done();
      });
    });
    /* *
     * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HDRTYPE_PROMISE_FUNCTION_1800
     * @tc.name      : 001.testAVMeta hdrType
     * @tc.desc      : Local Video playback control test
     * @tc.size      : MediumTest
     * @tc.type      : Function Test
     * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HDRTYPE_PROMISE_FUNCTION_1800', Level.LEVEL0,async (done: Function) => {
      console.info('AVMetadataExtractor success');
      let avMetadataExtractor = await media.createAVMetadataExtractor();
      // 获取元数据
      console.info('AVMetadataExtractor success');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, hdrType: ${metadata.hdrType}`);
        avMetadataExtractor.release();
      }).catch((error: BusinessError) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    });

    /* *
     * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HDRTYPE_CALLBACK_FUNCTION_0100
     * @tc.name      : 001.testAVMeta hdrType
     * @tc.desc      : Local Video playback control test
     * @tc.size      : MediumTest
     * @tc.type      : Function Test
     * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HDRTYPE_CALLBACK_FUNCTION_0100', Level.LEVEL0, (done: Function) => {
      console.info(TAG + "0100 is success");
      let avMetadataExtractor: media.AVMetadataExtractor;
    
      media.createAVMetadataExtractor((error: BusinessError, extractor: media.AVMetadataExtractor) => {
        if (error) {
          console.error(TAG, `Failed to create AVMetadataExtractor, error message: ${JSON.stringify(error)}`);
          done();
          return;
        }
        avMetadataExtractor = extractor;
        console.info(TAG, 'Succeeded in creating AVMetadataExtractor');
        avMetadataExtractor.fdSrc = AVFileDescriptor;
        avMetadataExtractor.fetchMetadata((err, metadata) => {
          if (err) {
            console.error(TAG, `fetchMetadata callback failed, err = ${JSON.stringify(err)}`);
            done();
            return;
          }
          console.info(TAG, `fetchMetadata callback success video album :${metadata.album}`);
          expect(metadata.album).assertEqual("media");
          avMetadataExtractor.release();
          done();
        });
      });
    });

    /* *
     * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_SERURLSOURCE_VOID_FUNCTION_0100
     * @tc.name      : SUB_MULTIMEDIA_PLAYER_AVMETADATA_SERURLSOURCE_VOID_FUNCTION_0100
     * @tc.desc      : Online http Video playback control test
     * @tc.size      : MediumTest
     * @tc.type      : Function Test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_SERURLSOURCE_VOID_FUNCTION_0100', Level.LEVEL0, async (done: Function) => {
      let avMetadataExtractor = await media.createAVMetadataExtractor();
      console.info('AVMetadataExtractor success');
      let pixelMapLoc: image.PixelMap | undefined = undefined;
      avMetadataExtractor.setUrlSource(HTTP_SOURCE);
      // 初始化入参
      let timeUs = 10000;
      let queryOption = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width : 300,
        height : 300
      };
      // 获取缩略图
      await avMetadataExtractor.fetchFrameByTime(timeUs, queryOption, param).then((pixelMap: image.PixelMap) => {
        pixelMapLoc = pixelMap;
        console.info(TAG, `fetchFrameByTime success`);
      }).catch((error: BusinessError) => {
        console.error(`fetchFrameByTime catchCallback ${error.name} code: ${error.code} message: ${error.message}`);
      });
      await mediaTestBase.msleepAsync(SLEEP_TIME);
      expect(pixelMapLoc).assertUndefined();
      await avMetadataExtractor.release();
      done();
    });

    /* *
     * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_SERURLSOURCE_VOID_FUNCTION_0200
     * @tc.name      : SUB_MULTIMEDIA_PLAYER_AVMETADATA_SERURLSOURCE_VOID_FUNCTION_0200
     * @tc.desc      : Online http Video with httpheader playback control test
     * @tc.size      : MediumTest
     * @tc.type      : Function Test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_SERURLSOURCE_VOID_FUNCTION_0200', Level.LEVEL0, async (done: Function) => {
      let avMetadataExtractor = await media.createAVMetadataExtractor();
      console.info('AVMetadataExtractor success');
      let pixelMapLoc: image.PixelMap | undefined = undefined;
      let headers: Record<string, string> = {
        "User-Agent" : "User-Agent-Value"
      };
      avMetadataExtractor.setUrlSource(HTTP_SOURCE, headers);
      // 初始化入参
      let timeUs = 10000;
      let queryOption = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width : 300,
        height : 300
      };
      // 获取缩略图
      await avMetadataExtractor.fetchFrameByTime(timeUs, queryOption, param).then((pixelMap: image.PixelMap) => {
        pixelMapLoc = pixelMap;
        console.info(TAG, `fetchFrameByTime success`);
      }).catch((error: BusinessError) => {
        console.error(`fetchFrameByTime catchCallback ${error.name} code: ${error.code} message: ${error.message}`);
      });
      await mediaTestBase.msleepAsync(SLEEP_TIME);
      expect(pixelMapLoc).assertUndefined();
      await avMetadataExtractor.release();
      done();
    });

    /* *
     * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_FETCHFRAME_PROMISE_FUNCTION_0100
     * @tc.name      : SUB_MULTIMEDIA_PLAYER_AVMETADATA_FETCHFRAME_PROMISE_FUNCTION_0100
     * @tc.desc      : Online http Video playback control test
     * @tc.size      : MediumTest
     * @tc.type      : Function Test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_FETCHFRAME_PROMISE_FUNCTION_0100', Level.LEVEL0, async (done: Function) => {
      let avMetadataExtractor = await media.createAVMetadataExtractor();
      console.info('AVMetadataExtractor success');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 初始化入参
      let timeUs = 10000;
      let queryOption = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width : 300,
        height : 300
      };
      // 获取缩略图
      await avMetadataExtractor.fetchFrameByTime(timeUs, queryOption, param).then((pixelMap: image.PixelMap) => {
        expect(pixelMap).not().assertUndefined();
        console.info(TAG, `fetchFrameByTime success`);
      }).catch((error: BusinessError) => {
        console.error(`fetchFrameByTime catchCallback ${error.name} code: ${error.code} message: ${error.message}`);
        expect().assertFail();
      });
      await mediaTestBase.msleepAsync(SLEEP_TIME);
      await avMetadataExtractor.release();
      done();
    });

    /* *
     * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_FETCHMETADATA_PROMISE_FUNCTION_0100
     * @tc.name      : SUB_MULTIMEDIA_PLAYER_AVMETADATA_FETCHMETADATA_PROMISE_FUNCTION_0100
     * @tc.desc      : By fetchMetadata to get tracks info test
     * @tc.size      : MediumTest
     * @tc.type      : Function Test
     * @tc.level     : Level0
     */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_FETCHMETADATA_PROMISE_FUNCTION_0100', Level.LEVEL0, async (done: Function) => {
      let avMetadataExtractor = await media.createAVMetadataExtractor();
      console.info('AVMetadataExtractor success');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      let metadata = await avMetadataExtractor.fetchMetadata();
      if (metadata.tracks != undefined) {
        if (metadata.trackCount != undefined) {
          const trackCount = parseInt(metadata.trackCount);
          const array_size = metadata.tracks.length;
          expect(trackCount).assertEqual(array_size);
        }
        for (let i = 0; i < metadata.tracks.length; i++) {
          const element = metadata.tracks[i];
          if (element[media.MediaDescriptionKey.MD_KEY_TRACK_TYPE] == media.MediaType.MEDIA_TYPE_VID) {
            const value = element[media.MediaDescriptionKey.MD_KEY_CODEC_MIME] as string;
            expect(value).not().assertUndefined();
          }
          if (element[media.MediaDescriptionKey.MD_KEY_TRACK_TYPE] == media.MediaType.MEDIA_TYPE_AUD) {
            const value = element[media.MediaDescriptionKey.MD_KEY_CODEC_MIME] as string;
            expect(value).not().assertUndefined();
          }
          validateMediaDescriptionKey(element)
        }
      } else {
        console.error('get avmetadata tracks failed');
        expect().assertFail();
      }
      expect(media.MediaType.MEDIA_TYPE_UNSUPPORTED).assertEqual(-1);
      expect(media.MediaType.MEDIA_TYPE_AUD).assertEqual(0);
      expect(media.MediaType.MEDIA_TYPE_VID).assertEqual(1);
      expect(media.MediaType.MEDIA_TYPE_SUBTITLE).assertEqual(2);
      expect(media.MediaType.MEDIA_TYPE_ATTACHMENT).assertEqual(3);
      expect(media.MediaType.MEDIA_TYPE_DATA).assertEqual(4);
      expect(media.MediaType.MEDIA_TYPE_TIMED_METADATA).assertEqual(5);
      expect(media.MediaType.MEDIA_TYPE_AUXILIARY).assertEqual(6);
      await mediaTestBase.msleepAsync(SLEEP_TIME);
      avMetadataExtractor.release();
      done();
    });
  })
}
