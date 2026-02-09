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
import MediaTestBase from './MediaTestBase.test';
import { testAVPlayerFun, setSource, PlayTest, sleep } from './AVPlayerTestBase.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import http from '@ohos.net.http';
import { BusinessError } from '@ohos.base';
import { globalThis } from './Util.test';

const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const RELEASED = 'released';
const ERROR = 'error';
let mediaTestBase = new MediaTestBase()
let payloadTypes: Array<int> = [];
let expectType: number = 5;

let dataCanBeRead = false;
let avPlayer: media.AVPlayer | undefined;

async function testSeiMessage(src: string, avPlayer: media.AVPlayer | undefined, payloadTypes: Array<int>, done: () => void) {
  console.info(`case media source: ${src}`);
  media.createAVPlayer((err: BusinessError|null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`);
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setAVPlayerSeiMessageCb(avPlayer!, payloadTypes, done);
      console.info('case src test');
      avPlayer!!.url = src as string;
    } else if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

function setAVPlayerSeiMessageCb(avPlayer: media.AVPlayer | null, payloadTypes: Array<int>, done: () => void) {
  let surfaceID: string = globalThis.value;

  avPlayer?.onStateChange((state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        console.info(`case INITIALIZED`);
        avPlayer!!.surfaceId = surfaceID;
        expect(avPlayer?.state).assertEqual(INITIALIZED);
        avPlayer!!.prepare((err: BusinessError|null) => {
          console.info('case prepare called' + err);
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer!!.duration);
          }
        });
        break;

      case PREPARED:
        console.info('case prepared');
        avPlayer?.play().then(() => {
          console.info('Play started');
        }).catch(mediaTestBase.catchCallback);
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
        avPlayer?.release().then(() => {}).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;

      default:
        break;
    }
  });

  avPlayer?.onSeiMessageReceived(payloadTypes, (messages: Array<media.SeiMessage>, playbackPosition?: int) => {
    try {
      console.info(`Received SEI message at playbackPosition: ${playbackPosition}`);
      expect(messages !== null && messages !== undefined).assertTrue();
      expect(messages.length).assertLarger(0);
      messages.forEach((message) => {
        expect(typeof message.payload === 'int').assertTrue();
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

function checkDataCanBeRead(url: string, done: () => void) {
  let httpRequest = http.createHttp();
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
        avPlayer!!.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
      }
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await mediaTestBase.clearRouter()
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SEIMESSAGERECEIVED_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SEIMESSAGERECEIVED_static_0100
     * @tc.desc   seiMessageReceived test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SEIMESSAGERECEIVED_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      const videoSrc = 'http://media.iyuns.top:1003/live/SEI-H264.flv';
      payloadTypes = [5];
      console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_SEIMESSAGERECEIVED_static_0100_111`)
      checkDataCanBeRead(videoSrc, done);
      if (dataCanBeRead) {
        console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_SEIMESSAGERECEIVED_static_0100_222`)
        await testSeiMessage(videoSrc, avPlayer, payloadTypes, done);
      } else {
        console.info(`SUB_MULTIMEDIA_MEDIA_AVPLAYER_SEIMESSAGERECEIVED_static_0100_333`)
        expect(dataCanBeRead).assertFalse()
        done();
      }
    });
  })
}