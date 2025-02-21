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

import * as mediaTestBase from '../../../../../../MediaTestBase';
import media from '@ohos.multimedia.media';
import resourceManager from '@ohos.resourceManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import image from "@ohos.multimedia.image";


export default function AVMetadata() {
  describe('AVMetadata', function () {
    const AUDIO_SOURCE = 'mjpeg_mp3.mp3';
    const VIDEO_SOURCE = 'H264_AAC_Matedata.mp4';
    const VIDEO_NOSUPPORT = 'No_Support_Format.mov'
    const TAG = "MetadataDemo"
    let AVFileDescriptor = null;
    let AVFileDescriptor2 = null;
    let AVFileDescriptor3 = null;
    // let avMetadataExtractor = null;
    beforeAll(async function () {
      console.info('beforeAll case');
      await mediaTestBase.getStageFileDescriptor(AUDIO_SOURCE).then((res) => {
        AVFileDescriptor = res;
      });
      await mediaTestBase.getStageFileDescriptor(VIDEO_SOURCE).then((res) => {
        AVFileDescriptor2 = res;
      });
      await mediaTestBase.getStageFileDescriptor(VIDEO_NOSUPPORT).then((res) => {
        AVFileDescriptor3 = res;
      });
    })

    beforeEach(async function () {
      console.info('beforeEach case');
    })

    afterEach(async function () {
      console.info('afterEach case');
    })

    afterAll(async function () {
      console.info('afterAll case');
      await mediaTestBase.closeFileDescriptor(AUDIO_SOURCE);
      await mediaTestBase.closeFileDescriptor(VIDEO_SOURCE);
      await mediaTestBase.closeFileDescriptor(VIDEO_NOSUPPORT);
    })
    /* *
       * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_0100
       * @tc.name      : 001.testAVMeta album
       * @tc.desc      : Local Video playback control test
       * @tc.size      : MediumTest
       * @tc.type      : Function Test
       * @tc.level     : Level0
           */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_0100', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, album: ${metadata.album}`)
        expect(metadata.album).assertEqual("media")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_0200
      * @tc.name      : 001.testAVMeta albumArtist
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_0200', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, albumArtist: ${metadata.albumArtist}`)
        expect(metadata.albumArtist).assertEqual("media_test")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_0300
      * @tc.name      : 001.testAVMeta artist
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_0300', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, artist: ${metadata.artist}`)
        expect(metadata.artist).assertEqual("元数据测试")
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_0400
      * @tc.name      : 001.testAVMeta author
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_0400', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, author: ${metadata.author}`)
        expect(metadata.author).assertEqual("media")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_0500
      * @tc.name      : 001.testAVMeta dateTime
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_0500', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, dateTime: ${metadata.dateTime}`)
        console.info(TAG, `fetchMetadata callback success, dateTimeFormat: ${metadata.dateTimeFormat}`)
        expect(metadata.dateTime).assertEqual("2015-11-23")
        expect(metadata.dateTimeFormat).assertEqual("2015-11-23 00:00:00")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIMEFORMAT_PROMISE_FUNCTION_0600
      * @tc.name      : 001.testAVMeta dateTimeFormat
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIMEFORMAT_PROMISE_FUNCTION_0600', 0, async function (done) {
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      console.info('AVMetadataExtractor success   22222222222');
      // 获取元数据
      avMetadataExtractor.fdSrc = AVFileDescriptor
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video album :${metadata.album}}`)
        expect(metadata.album).assertEqual("media")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_0700
      * @tc.name      : 001.testAVMeta composer
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_0700', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, genre: ${metadata.composer}`)
        expect(metadata.composer).assertEqual("测试")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_0800
      * @tc.name      : 001.testAVMeta duration
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_0800', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, duration: ${metadata.duration}`)
        expect(metadata.duration).assertEqual("219600")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })
    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_0900
      * @tc.name      : 001.testAVMeta genre
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_0900', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, genre: ${metadata.genre}`)
        expect(metadata.genre).assertEqual("Lyrical")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })


    /* *
        * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_1000
        * @tc.name      : 001.testAVMeta hasAudio
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function Test
        * @tc.level     : Level0
           */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_1000', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, hasAudio: ${metadata.hasAudio}`)
        expect(metadata.hasAudio).assertEqual("yes")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_1100
        * @tc.name      : 001.testAVMeta hasVideo
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function Test
        * @tc.level     : Level0
           */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_1100', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, hasVideo: ${metadata.hasVideo}`)
        expect(metadata.hasVideo).assertEqual("")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_1200
      * @tc.name      : 001.testAVMeta mimeType
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_1200', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, mimeType: ${metadata.mimeType}`)
        expect(metadata.mimeType).assertEqual("audio/mpeg")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_1300
      * @tc.name      : 001.testAVMeta trackCount
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_1300', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, trackCount: ${metadata.trackCount}`)
        expect(metadata.trackCount).assertEqual('1')
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_SAMPLERATE_PROMISE_FUNCTION_1400
      * @tc.name      : 001.testAVMeta sampleRate
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_SAMPLERATE_PROMISE_FUNCTION_1400', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, sampleRate: ${metadata.sampleRate}`)
        expect(metadata.sampleRate).assertEqual('48000')
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_TITLE_PROMISE_FUNCTION_1500
      * @tc.name      : 001.testAVMeta title
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_TITLE_PROMISE_FUNCTION_1500', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, title: ${metadata.title}`)
        expect(metadata.title).assertEqual("test")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_1600
      * @tc.name      : 001.testAVMeta videoHeight
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_1600', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, videoHeight: ${metadata.videoHeight}`)
        expect(metadata.videoHeight).assertEqual("")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_1700
      * @tc.name      : 001.testAVMeta videoWidth
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_1700', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, videoWidth: ${metadata.videoWidth}`)
        expect(metadata.videoWidth).assertEqual("")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_1800
      * @tc.name      : 001.testAVMeta videoOrientation
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_1800', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, videoOrientation: ${metadata.videoOrientation}`)
        expect(metadata.videoOrientation).assertEqual("")
        avMetadataExtractor.release();
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_1900
    * @tc.name      : 001.testAVMeta album
    * @tc.desc      : Local Video playback control test
    * @tc.size      : MediumTest
    * @tc.type      : Function Test
    * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUM_PROMISE_FUNCTION_1900', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, album: ${metadata.album}`)
        expect(metadata.album).assertEqual("");
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_2000
      * @tc.name      : 001.testAVMeta albumArtist
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ALBUMARTIST_PROMISE_FUNCTION_2000', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, albumArtist: ${metadata.albumArtist}`)
        expect(metadata.albumArtist).assertEqual("");
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_2100
      * @tc.name      : 001.testAVMeta artist
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_ARTIST_PROMISE_FUNCTION_2100', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, artist: ${metadata.artist}`)
        expect(metadata.artist).assertEqual("");
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_2200
      * @tc.name      : 001.testAVMeta author
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUTHOR_PROMISE_FUNCTION_2200', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success, author: ${metadata.author}`)
        expect(metadata.author).assertEqual("")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_2300
      * @tc.name      : 001.testAVMeta dateTime
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DATETIME_PROMISE_FUNCTION_2300', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video dateTime :${metadata.dateTime}}`)
        expect(metadata.dateTime).assertEqual("2017-08-05 19:28:32")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_2400
      * @tc.name      : 001.testAVMeta composer
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_COMPOSER_PROMISE_FUNCTION_2400', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video composer :${metadata.composer}}`)
        expect(metadata.composer).assertEqual("")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_2500
      * @tc.name      : 001.testAVMeta duration
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_DURATION_PROMISE_FUNCTION_02500', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video duration :${metadata.duration}}`)
        expect(metadata.duration).assertEqual("5826")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_2600
      * @tc.name      : 001.testAVMeta genre
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_GENRE_PROMISE_FUNCTION_02600', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video genre :${metadata.genre}}`)
        expect(metadata.genre).assertEqual("")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_2700
        * @tc.name      : 001.testAVMeta hasAudio
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function Test
        * @tc.level     : Level0
           */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASAUDIO_PROMISE_FUNCTION_02700', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video hasAudio :${metadata.hasAudio}}`)
        expect(metadata.hasAudio).assertEqual("yes")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
        * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_2800
        * @tc.name      : 001.testAVMeta hasVideo
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function Test
        * @tc.level     : Level0
           */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_HASVIDEO_PROMISE_FUNCTION_02800', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video hasVideo :${metadata.hasVideo}}`)
        expect(metadata.hasVideo).assertEqual("yes")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_2900
      * @tc.name      : 001.testAVMeta mimeType
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_MIMETYPE_PROMISE_FUNCTION_02900', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video mimeType :${metadata.mimeType}}`)
        expect(metadata.mimeType).assertEqual("video/mp4")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_3000
      * @tc.name      : 001.testAVMeta trackCount
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_TRACKCOUNT_PROMISE_FUNCTION_3000', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video trackCount :${metadata.trackCount}}`)
        expect(metadata.trackCount).assertEqual("2")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA__SAMPLERATE_PROMISE_FUNCTION_3100
      * @tc.name      : 001.testAVMeta sampleRate
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA__SAMPLERATE_PROMISE_FUNCTION_3100', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video sampleRate :${metadata.sampleRate}}`)
        expect(metadata.sampleRate).assertEqual("48000")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_03200
      * @tc.name      : 001.testAVMeta videoHeight
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA__PLAYER_AVMETADATA_VIDEOHEIGHT_PROMISE_FUNCTION_03200', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video videoWidth :${metadata.videoWidth}}`)
        expect(metadata.videoHeight).assertEqual("480")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_03300
      * @tc.name      : 001.testAVMeta videoWidth
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOWIDTH_PROMISE_FUNCTION_03300', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video videoWidth :${metadata.videoWidth}}`)
        expect(metadata.videoWidth).assertEqual("640")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
      * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_3400
      * @tc.name      : 001.testAVMeta videoOrientation
      * @tc.desc      : Local Video playback control test
      * @tc.size      : MediumTest
      * @tc.type      : Function Test
      * @tc.level     : Level0
         */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_VIDEOORIENTATION_PROMISE_FUNCTION_3400', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor2;
      // 获取元信息
      await avMetadataExtractor.fetchMetadata().then((metadata) => {
        console.info(TAG, `fetchMetadata callback success video videoOrientation :${metadata.videoOrientation}}`)
        expect(metadata.videoOrientation).assertEqual("270")
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchMetadata catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUDIOPIXELMAP_PROMISE_FUNCTION_3500
    * @tc.name      : 001.testAVMeta PixelMap
    * @tc.desc      : Local Video playback control test
    * @tc.size      : MediumTest
    * @tc.type      : Function Test
    * @tc.level     : Level0
      */
    it('SUB_MULTIMEDIA_PLAYER_AVMETADATA_AUDIOPIXELMAP_PROMISE_FUNCTION_3500', 0, async function (done) {
      console.info('AVMetadataExtractor success   11111111111');
      let avMetadataExtractor: media.AVMetadataExtractor;
      await media.createAVMetadataExtractor().then((extractor) => {
        if (extractor != null) {
          avMetadataExtractor = extractor;
          console.info('createAVMetadataExtractor success');
        } else {
          console.error('createAVMetadataExtractor fail');
        }
      }).catch((error) => {
        console.error(`AVMetadataExtractor catchCallback, error message:${error.message}`);
      });
      // 获取元数据
      console.info('AVMetadataExtractor success   22222222222');
      avMetadataExtractor.fdSrc = AVFileDescriptor;
      // 获取专辑封面
      await avMetadataExtractor.fetchAlbumCover().then((pixelMap) => {
        this.pixelMap = pixelMap;
        pixelMap.getImageInfo().then((imageInfo: image.ImageInfo) => {
          if (imageInfo == undefined) {
            console.error("Failed to obtain the image pixel map information.");
          } else {
            console.log("imgwidth=" + imageInfo.size.width)
            console.log("imgheight=" + imageInfo.size.height)
            const width = imageInfo.size.width
            const height = imageInfo.size.height
            expect(imageInfo.size.width).assertEqual(width)
            expect(imageInfo.size.height).assertEqual(height)
          }
        })
        console.info(TAG, `fetchMetadata callback success video PixelMap :${pixelMap}}`)
        avMetadataExtractor.release()
      }).catch((error) => {
        console.error(`fetchAlbumCover catchCallback, error message:${error.message}`);
      });
      done();
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_PLAYER_AVMETADATA_ALBUM_CB_FUNCTION_0100
    * @tc.name      : 001.testAVMeta album
    * @tc.desc      : Local Video playback control test
    * @tc.size      : MediumTest
    * @tc.type      : Function Test
    * @tc.level     : Level0
        */
    it('SUB_MULTIMEDIA_AUDIO_PLAYER_AVMETADATA_ALBUM_CB_FUNCTION_0100', 0, async function (done) {
      console.info(TAG + "0100 is success")
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor()

      avMetadataExtractor.fdSrc = AVFileDescriptor
      avMetadataExtractor.fetchMetadata((err, metadata) => {
        if (err) {
          console.error(TAG, `fetchMetadata callback failed, err = ${JSON.stringify(err)}`)
          return
        }
        console.info(TAG, `fetchMetadata callback success video album :${metadata.album}}`)
        expect(metadata.album).assertEqual("media")
        avMetadataExtractor.release()
        done()
      })
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_AUDIO_PLAYER_VIDEOHEIGHT_PIXELMAP_CB_FUNCTION_0200
    * @tc.name      : 001.testAVMeta PixelMap
    * @tc.desc      : Local Video playback control test
    * @tc.size      : MediumTest
    * @tc.type      : Function Test
    * @tc.level     : Level0
       */
    it('SUB_MULTIMEDIA_AUDIO_PLAYER_VIDEOHEIGHT_PIXELMAP_CB_FUNCTION_0200', 0, async function (done) {
      console.info(TAG + "SUB_MULTIMEDIA_AUDIO_PLAYER_VIDEOHEIGHT_PIXELMAP_CB_FUNCTION_0200  is success")
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor()
      avMetadataExtractor.fdSrc = AVFileDescriptor
      avMetadataExtractor.fetchAlbumCover((err, PixelMap) => {
        if (err) {
          console.error(TAG, `fetchMetadata callback failed, err = ${JSON.stringify(err)}`)
          return
        }
        console.info(TAG, `fetchMetadata callback success video PixelMap :${PixelMap}}`)
        avMetadataExtractor.release()
        done()
      })
    })
  })
}
