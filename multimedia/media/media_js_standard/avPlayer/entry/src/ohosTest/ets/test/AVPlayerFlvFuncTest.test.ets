/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import media from '@ohos.multimedia.media'
import MediaTestBase from './MediaTestBase';
import { testAVPlayerFun, setSource, PlayTest, sleep } from './AVPlayerTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { http } from '@kit.NetworkKit';

const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const RELEASED = 'released';
const ERROR = 'error';
let mediaTestBase = new MediaTestBase()
let payloadTypes: Array<number> = [];
let expectType: number = 5;

let dataCanBeRead = false;
let avPlayer: media.AVPlayer | null = null;

async function testSeiMessage(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, payloadTypes: Array<number>, done: Function) {
  console.info(`case media source: ${src}`);
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`);
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setAVPlayerSeiMessageCb(avPlayer, payloadTypes, done);
      setSource(avPlayer, src);
    } else if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

function setAVPlayerSeiMessageCb(avPlayer: media.AVPlayer | null, payloadTypes: Array<number>, done: Function) {
  let surfaceID: string = globalThis.value;

  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        console.info(`case INITIALIZED`);
        avPlayer.surfaceId = surfaceID;
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer.prepare((err) => {
          console.info('case prepare called' + err);
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        break;

      case PREPARED:
        console.info('case prepared');
        avPlayer?.play().then(() => {
          console.info('Play started');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;

      case PLAYING:
        console.info('case playing');
        break;

      case RELEASED:
        avPlayer = null;
        done();
        break;

      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {}, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;

      default:
        break;
    }
  });

  avPlayer?.on('seiMessageReceived', payloadTypes, (messages: Array<media.SeiMessage>, playbackPosition?: number) => {
    try {
      console.info(`Received SEI message at playbackPosition: ${playbackPosition}`);
      expect(messages !== null && messages !== undefined).assertTrue();
      expect(messages.length).assertLarger(0);
      messages.forEach((message) => {
        expect(typeof message.payload === 'number').assertTrue();
        expect(message.payloadType).assertEqual(expectType);
        expect(message.payload !== null && message.payload !== undefined).assertTrue();
        expect(message.payload.byteLength).assertLarger(0);
      })
      done();
    } catch (error) {
      console.error('Error in SEI message handling:', error);
      expect().assertFail();
      done();
    }
  });
}

function checkDataCanBeRead(url: string, done: Function) {
  let httpRequest = http.createHttp();

  httpRequest.on('headersReceive', (header) => {
    console.info('Header received');
  });

  httpRequest.request(
    url,
    {
      method: http.RequestMethod.GET,
      readTimeout: 5000,
      connectTimeout: 5000,
      usingCache: false,
    },
    (err, data) => {
      if (!err) {
        console.info('Data can be read.');
        dataCanBeRead = true;
      } else {
        console.error('Failed to read data: ' + err.message);
        done();
      }

      httpRequest.off('headersReceive');
      httpRequest.destroy();
    }
  );
}

export default function AVPlayerFlvFuncTest() {
  describe('AVPlayerFlvFuncTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      console.log("check surfaceId is " + globalThis.value)
      for (let i =0; i < 10; i++) {
        if (!globalThis.value) {
          console.log("surfaceId is undefined")
          await mediaTestBase.msleepAsync(500);
        } else {
          console.log("surfaceId is " + globalThis.value)
          break;
        }
      }
      });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      if (avPlayer != null) {
        avPlayer.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      }
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await mediaTestBase.clearRouter()
    });

    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_AVPLAYER_SEIMESSAGERECEIVED_0100
        * @tc.name      : 001.test
        * @tc.desc      : seiMessageReceived test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SEIMESSAGERECEIVED_0100', 0, async (done: Function) => {
      const videoSrc = 'http://media.iyuns.top:1003/live/SEI-H264.flv';
      payloadTypes = [5];
      await checkDataCanBeRead(videoSrc, done);
      if (dataCanBeRead) {
        await testSeiMessage(videoSrc, avPlayer, payloadTypes, done);
      } else {
        done();
      }
    });
  })
}