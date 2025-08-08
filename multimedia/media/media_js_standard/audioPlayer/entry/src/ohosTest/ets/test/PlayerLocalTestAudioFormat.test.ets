/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import NewMediaTestBase from './MediaTestBase';
import { playAudioSource } from './AudioPlayerTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'

const PLAY_TIME = 3000;
let isToSeek = false;
let isToDuration = false;
let fdNumber: number | undefined = 0;
let mediaTestBase: NewMediaTestBase = new NewMediaTestBase();

export default function PlayerLocalTestAudioFormat() {
  describe('PlayerLocalTestAudioFormat', () => {
    beforeAll(() => {
      console.info('beforeAll case');
    });
    beforeEach(() => {
      isToSeek = false;
      isToDuration = false;
      console.info('beforeEach case');
    });
    afterEach(async () => {
      if (fdNumber != undefined) {
        await mediaTestBase.closeFdNumber(fdNumber);
      }
      console.info('afterEach case');
    });
    afterAll(() => {
      console.info('afterAll case');
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP3_0100
        * @tc.name      : 001.Playing mp3 streams
        * @tc.desc      : Format : MP3
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP3_0100', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('01.mp3', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219600, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP3_0200
        * @tc.name      : 002.Playing mp3 streams
        * @tc.desc      : Format : MP3
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 16/32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP3_0200', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('02.mp3', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219600, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP3_0300
        * @tc.name      : 003.Playing mp3 streams
        * @tc.desc      : Format : MP3
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP3_0300', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('03.mp3', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219600, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP3_0400
        * @tc.name      : 004.Playing mp3 streams
        * @tc.desc      : Format : MP3
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP3_0400', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('04.mp3', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219600, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0100
        * @tc.name      : 001.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0100', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('47.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219575, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0300
        * @tc.name      : 003.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0300', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('49.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219575, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0400
        * @tc.name      : 004.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0400', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('50.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219575, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0500
        * @tc.name      : 005.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : AAC LC
                          Samplerate : 96000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0500', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('51.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219565, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0600
        * @tc.name      : 006.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : AAC LC
                          Samplerate : 96000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0600', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('54.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219577, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0700
        * @tc.name      : 007.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0700', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('64.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219577, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0800
        * @tc.name      : 008.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 16
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0800', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('65.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219577, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0900
        * @tc.name      : 009.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_0900', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('66.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219577, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1000
        * @tc.name      : 010.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1000', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('67.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219577, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1100
        * @tc.name      : 011.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 48000
                          Bitrate : 16
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1100', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('92.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219555, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1200
        * @tc.name      : 012.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 48000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1200', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('93.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219555, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1300
        * @tc.name      : 013.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1300', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('94.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219555, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1400
        * @tc.name      : 014.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 96000
                          Bitrate : 16
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1400', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('96.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219554, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1500
        * @tc.name      : 015.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 96000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1500', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('97.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219554, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1600
        * @tc.name      : 016.Playing mp4 streams
        * @tc.desc      : Format : MP4
                          Codec : Vorbis
                          Samplerate : 96000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP4_1600', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('98.mp4', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219554, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_M4A_0100
        * @tc.name      : 001.Playing m4a streams
        * @tc.desc      : Format : M4A
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_M4A_0100', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('55.m4a', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219575, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_M4A_0300
        * @tc.name      : 003.Playing m4a streams
        * @tc.desc      : Format : M4A
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_M4A_0300', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('57.m4a', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219575, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_M4A_0400
        * @tc.name      : 004.Playing m4a streams
        * @tc.desc      : Format : M4A
                          Codec : AAC LC
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_M4A_0400', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('58.m4a', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219575, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_M4A_0500
        * @tc.name      : 005.Playing m4a streams
        * @tc.desc      : Format : M4A
                          Codec : AAC LC
                          Samplerate : 96000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_M4A_0500', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('59.m4a', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219565, PLAY_TIME, true, done);
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_M4A_0700
        * @tc.name      : 007.Playing m4a streams
        * @tc.desc      : Format : M4A
                          Codec : AAC LC
                          Samplerate : 96000
                          Bitrate : 64
                          Channel : 2
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_M4A_0700', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('62.m4a', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219565, PLAY_TIME, true, done);
    });

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP3_0100
        * @tc.name      : 001.Playing mp3 streams
        * @tc.desc      : Format : MP3
                          Codec : MP3
                          Samplerate : 48000
                          Bitrate : 32
                          Channel : 1
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_AUDIOPLAYER_FORMAT_MP3_0100', Level.LEVEL0, async (done: Function) => {
      await mediaTestBase.getFdRead('01.mp3', done).then((testNumber) => {
        fdNumber = testNumber;
      });
      let path = 'fd://' + fdNumber;
      playAudioSource(path, 219600, PLAY_TIME, true, done);
    }); 
  })
}
