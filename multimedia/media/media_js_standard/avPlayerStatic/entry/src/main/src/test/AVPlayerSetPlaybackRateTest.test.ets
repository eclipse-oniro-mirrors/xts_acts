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

import media from '@ohos.multimedia.media'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '../../../hypium/index';
import MediaTestBase from './MediaTestBase.test';
import { setSource } from './AVPlayerTestBase.test';
import { BusinessError, ErrorCallback } from '@ohos.base';
import { globalThis } from './Util.test';

let mediaTestBase = new MediaTestBase()
let avPlayer: media.AVPlayer | undefined;
const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';
let movFd: media.AVFileDescriptor | undefined;
let mkvFd: media.AVFileDescriptor | undefined;
let mp3Fd: media.AVFileDescriptor | undefined;
let aacFd: media.AVFileDescriptor | undefined;
let wavFd: media.AVFileDescriptor | undefined;
const VIDEO_SOURCE_MOV = "No_Support_Format.mov";
const VIDEO_SOURCE_MKV = "H264_AAC.mkv";
const AUDIO_SOURCE_MP3 = "01.mp3";
const AUDIO_SOURCE_AAC = "AAC_48000_32_1.aac";
const AUDIO_SOURCE_WAV = "vorbis_48000_32_1.wav";

async function sleep(delay: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, delay);
  });
};
async function handleState(state: string, operationRecord: Record<string, () => Promise<void>>) {
  switch (state) {
    case IDLE:
      if (operationRecord[IDLE]) {
        await operationRecord[IDLE]!();
      }
      break;
    case INITIALIZED:
      let surfaceID: string = globalThis.value;
      avPlayer!!.surfaceId = surfaceID;
      console.info(`case avPlayer.surfaceId is ${avPlayer!!.surfaceId}`);
      if (operationRecord[INITIALIZED]) {
        await operationRecord[INITIALIZED]!();
      }
      avPlayer!!.prepare().then(() => {
        console.info(`case prepare called`);
      }).catch(mediaTestBase.catchCallback);
      break;
    case PREPARED:
      expect(avPlayer!!.currentTime).assertEqual(0);
      if (operationRecord[PREPARED]) {
        await operationRecord[PREPARED]!();
      }
      console.info('case to play AVPlayer');
      avPlayer!!.play().then(() => {
        console.info(`case play AVPlayer success`);
      }).catch(mediaTestBase.catchCallback);
      break;
    case PLAYING:
      if (operationRecord[PLAYING]) {
        await operationRecord[PLAYING]!();
      }
      break;
    case PAUSED:
      if (operationRecord[PAUSED]) {
        await operationRecord[PAUSED]!();
      }
      break;
    case COMPLETED:
      if (operationRecord[COMPLETED]) {
        await operationRecord[COMPLETED]!();
      }
      break;
    case STOPPED:
      if (operationRecord[STOPPED]) {
        await operationRecord[STOPPED]!();
      }
      break;
    case RELEASED:
      if (operationRecord[RELEASED]) {
        await operationRecord[RELEASED]!();
      }
      break;
    case ERROR:
      if (operationRecord[ERROR]) {
        await operationRecord[ERROR]!();
      }
      break;
    default:
      break;
    }
}

async function testSetPlaybackSpeed(fd: media.AVFileDescriptor, done: () => void, callback: media.OnPlaybackRateDone,
  operationRecord: Record<string, () => Promise<void>>, errorCallback?: ErrorCallback) {
  await media.createAVPlayer().then((video: media.AVPlayer | undefined) => {
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
    } else {
      console.error('case createAVPlayer failed');
      expect().assertFail();
      done();
    }
  }).catch(mediaTestBase.catchCallback);
  avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    await handleState(state.toString(), operationRecord);
  });
  avPlayer!!.onPlaybackRateDone(callback);
  console.info(`register playbackRateDone`);
  if (errorCallback != undefined) {
    avPlayer!!.onError(errorCallback);
  }
  console.info('case fdsrc test');
  avPlayer!!.fdSrc = fd;
}

function openFileFailed() {
  console.info('case file fail');
}

export default function AVPlayerSetPlaybackRateTest() {
  describe('AVPlayerSetPlaybackRateTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE_MOV, openFileFailed).then((res) => {
        movFd = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE_MKV, openFileFailed).then((res) => {
        mkvFd = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE_MP3, openFileFailed).then((res) => {
        mp3Fd = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE_AAC, openFileFailed).then((res) => {
        aacFd = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE_WAV, openFileFailed).then((res) => {
        wavFd = res;
      });
    });
    afterEach(async () => {
      if (avPlayer != null) {
        try {
          avPlayer!!.offStateChange();
          avPlayer!!.offPlaybackRateDone();
          avPlayer!!.offError();
          console.info('case now stopped, to release');
          await avPlayer!!.release().then(() => {
            console.info('case release AVPlayer success');
          }).catch(mediaTestBase.catchCallback);
        } catch (e) {
          console.info(`afterEach error: ${JSON.stringify(e)}`)
        }
      }
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      try {
        await mediaTestBase.closeFdNumber(movFd!.fd)
        await mediaTestBase.closeFdNumber(mkvFd!.fd)
        await mediaTestBase.closeFdNumber(mp3Fd!.fd)
        await mediaTestBase.closeFdNumber(aacFd!.fd)
        await mediaTestBase.closeFdNumber(wavFd!.fd)
      } catch (e) {
        console.info(`afterAll error: ${JSON.stringify(e)}`)
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0100
     * @tc.desc   test setPlaybackRate 0.125 in prepared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 0.125
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PREPARED] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PREPARED] call`)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(setrate).assertEqual(rate)
        done()
      }
      await testSetPlaybackSpeed(movFd!, done, callback, operationRecord)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0200
     * @tc.desc   test setPlaybackRate 0.25 in prepared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 0.25
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PREPARED] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PREPARED] call`)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(setrate).assertEqual(rate)
        done()
      }
      await testSetPlaybackSpeed(mkvFd!, done, callback, operationRecord)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0300
     * @tc.desc   test setPlaybackRate 0.5 in prepared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 0.5
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PREPARED] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PREPARED] call`)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(setrate).assertEqual(rate)
        done()
      }
      await testSetPlaybackSpeed(mkvFd!, done, callback, operationRecord)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0400
     * @tc.desc   test setPlaybackRate 0.75 in prepared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 0.75
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PREPARED] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PREPARED] call`)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(setrate).assertEqual(rate)
        done()
      }
      await testSetPlaybackSpeed(mkvFd!, done, callback, operationRecord)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0500
     * @tc.desc   test setPlaybackRate 1.0 in playing state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 1.0
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PLAYING] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PLAYING] call`)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(setrate).assertEqual(rate)
        done()
      }
      await testSetPlaybackSpeed(mkvFd!, done, callback, operationRecord)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0600
     * @tc.desc   test setPlaybackRate 1.25 in playing state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 1.25
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PLAYING] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PLAYING] call`)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(setrate).assertEqual(rate)
        done()
      }
      await testSetPlaybackSpeed(mkvFd!, done, callback, operationRecord)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0700
     * @tc.desc   test setPlaybackRate 1.75 in playing state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 1.75
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PLAYING] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PLAYING] call`)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(setrate).assertEqual(rate)
        done()
      }
      await testSetPlaybackSpeed(mkvFd!, done, callback, operationRecord)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0800
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0800
     * @tc.desc   test setPlaybackRate 2.0 in playing state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 2.0
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PLAYING] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PLAYING] call`)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(setrate).assertEqual(rate)
        done()
      }
      await testSetPlaybackSpeed(mkvFd!, done, callback, operationRecord)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0900
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0900
     * @tc.desc   test setPlaybackRate 2.25 in paused state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 2.25
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PAUSED] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PAUSED] call`)
      }
      operationRecord[PLAYING] = async () => {
        avPlayer!!.pause().then(() => {
          console.info(`pause AVPlayer success`)
        }).catch(mediaTestBase.catchCallback)
        await sleep(1000)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(setrate).assertEqual(rate)
        done()
      }
      await testSetPlaybackSpeed(mkvFd!, done, callback, operationRecord)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1000
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1000
     * @tc.desc   test setPlaybackRate 2.5 in paused state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 2.5
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PAUSED] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PAUSED] call`)
      }
      operationRecord[PLAYING] = async () => {
        avPlayer!!.pause().then(() => {
          console.info(`pause AVPlayer success`)
        }).catch(mediaTestBase.catchCallback)
        await sleep(1000)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(setrate).assertEqual(rate)
        done()
      }
      await testSetPlaybackSpeed(mkvFd!, done, callback, operationRecord)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1100
     * @tc.desc   test setPlaybackRate 0.126 in prepared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVPLAYER_SETPLAYBACKRATE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let setrate = 0.126
      let operationRecord: Record<string, () => Promise<void>> = {}
      operationRecord[PREPARED] = async () => {
        avPlayer!!.setPlaybackRate(setrate)
        console.info(`case operationRecord[PREPARED] call`)
      }
      let callback: media.OnPlaybackRateDone = (rate: double) => {
        console.info(`case OnPlaybackRateDone call: setrate: ${setrate}, rate: ${rate}`)
        expect(Math.abs(setrate - rate) < 0.0000001).assertTrue();
        done()
      }
      await testSetPlaybackSpeed(mkvFd!, done, callback, operationRecord)
    });
  })
}