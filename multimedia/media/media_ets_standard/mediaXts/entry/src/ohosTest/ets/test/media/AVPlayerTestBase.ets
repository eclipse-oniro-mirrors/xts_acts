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
import { expect } from '@ohos/hypium';
import MediaTestBase from './MediaTestBase';
import { audio } from '@kit.AudioKit';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  LOG_TAG,
  SLEEP_TIME_100,
  SLEEP_TIME_2,
  SLEEP_TIME_20,
  SLEEP_TIME_200,
  SLEEP_TIME_2000,
  SLEEP_TIME_500
} from '../Constants';

const TAG = LOG_TAG + 'AVPlayerTestBase';

const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';

let mediaTestBase = new MediaTestBase();
let createToReleaseLoopCount = 0;

export interface PlayTest {
  width: number,
  height: number,
  duration: number
}

export function setSource(avPlayer: media.AVPlayer | null, src: string | media.AVFileDescriptor | undefined,
  testName: string) {
  if (!avPlayer) {
    console.error(TAG, testName + ' case avPlayer is null');
    return;
  }
  if (typeof (src) == 'string') {
    console.info(TAG, testName + ' case src test');
    avPlayer.url = src;
  } else {
    console.info(TAG, testName + ' case fdSrc test');
    avPlayer.fdSrc = src;
  }
}

export function setSubtitle(avPlayer: media.AVPlayer | null, src: string | media.AVFileDescriptor, testName: string) {
  if (!avPlayer) {
    console.error(TAG, testName + ' case avPlayer is null');
    return;
  }
  if (typeof (src) === 'string') {
    console.info(TAG, testName + ' case src test');
    avPlayer.addSubtitleFromUrl(src);
  } else {
    console.info(TAG, testName + ' case fdSrc test');
    avPlayer.addSubtitleFromFd(src.fd, src.offset, src.length);
  }
}

export function setSubtitle3(avPlayer: media.AVPlayer | null, src: string | media.AVFileDescriptor, testName: string) {
  if (!avPlayer) {
    console.error(TAG, testName + ' case avPlayer is null');
    return;
  }
  if (typeof (src) === 'string') {
    console.info(TAG, testName + ' case src test');
    avPlayer.addSubtitleFromUrl(null);
  } else {
    console.info(TAG, testName + ' case fdSrc test');
    avPlayer.addSubtitleFromFd(src.fd, src.offset, src.length);
  }
}

function checkPlayTest(avPlayer: media.AVPlayer | null, playTest: PlayTest) {
  if (avPlayer == null) {
    return;
  }
  expect(Math.abs(avPlayer.duration - playTest.duration)).assertLess(500);
  if (playTest.width > 0) {
    expect(avPlayer?.width).assertEqual(playTest.width);
    expect(avPlayer?.height).assertEqual(playTest.height);
  }
}

function toPreparePromise(avPlayer: media.AVPlayer | null, playTest: PlayTest, testName: string) {
  if (!avPlayer) {
    console.info(TAG, testName + ' case avPlayer is null');
    return;
  }
  avPlayer?.prepare().then(() => {
    console.info(TAG, testName + ' case prepare called, avPlayer.duration: ' + avPlayer.duration);
    checkPlayTest(avPlayer, playTest);
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

async function preparePromise(avPlayer: media.AVPlayer | null, testName: string) {
  if (!avPlayer) {
    console.info(TAG, testName + ' case avPlayer is null');
    return;
  }
  await avPlayer?.prepare().then(() => {
    console.info(TAG, testName + ' case prepare called, avPlayer.duration: ' + avPlayer.duration);
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

function addCnt(countArr: Array<number> | null) {
  if (countArr != null) {
    countArr[0]++;
  }
}

export function setCallback(avPlayer: media.AVPlayer | null, type: string, countArr: Array<number> | null,
  testName: string) {
  if (avPlayer == null) {
    return;
  }
  switch (type) {
    case 'volumeChange':
      avPlayer?.on('volumeChange', (volume) => {
        console.info(TAG, testName + ` case volumeChange called, volume is ${volume}`);
        addCnt(countArr);
      });
      break;
    case 'endOfStream':
      avPlayer?.on('endOfStream', () => {
        console.info(TAG, testName + ` case endOfStream called`);
        addCnt(countArr);
      });
      break;
    case 'speedDone':
      avPlayer?.on('speedDone', (speedMode) => {
        console.info(TAG, testName + ` case speedDone called, speedMode is ${speedMode}`);
        addCnt(countArr);
      });
      break;
    case 'bitrateDone':
      avPlayer?.on('bitrateDone', (bitrate) => {
        console.info(TAG, testName + ` case bitrateDone called, bitrate is ${bitrate}`);
      });
      break;
    case 'timeUpdate':
      avPlayer?.on('timeUpdate', (time) => {
        console.info(TAG, testName + ' case timeUpdate callback, time:' + time);
      });
      break;
    case 'bufferingUpdate':
      avPlayer?.on('bufferingUpdate', (infoType, value) => {
      });
      break;
    case 'durationUpdate':
      avPlayer?.on('durationUpdate', (duration) => {
        console.info(TAG, testName + ' case durationUpdate called, duration:' + duration);
        addCnt(countArr);
      });
      break;
    case 'startRenderFrame':
      avPlayer?.on('startRenderFrame', () => {
        console.info(TAG, testName + ' case startRenderFrame called');
        addCnt(countArr);
      });
      break;
    case 'videoSizeChange':
      avPlayer?.on('videoSizeChange', (w, h) => {
        console.info(TAG, testName + ` case videoSizeChange called, weight is ${w}, height is ${h}`);
        addCnt(countArr);
      });
      break;
    case 'audioInterrupt':
      avPlayer?.on('audioInterrupt', (info) => {
        console.info(TAG, testName + ` case audioInterrupt called, info is ${info}`);
      });
      break;
    case 'availableBitrates':
      avPlayer?.on('availableBitrates', (bitrates) => {
        for (let i = 0; i < bitrates.length; i++) {
          console.info(TAG, testName + ' case availableBitrates : ' + bitrates[i]);
        }
        addCnt(countArr);
      });
      break;
    default:
      break;
  }
}

export function offCallback(avPlayer: media.AVPlayer | null, typeArr: Array<string>, testName: string) {
  if (avPlayer == null) {
    console.info(TAG, testName + ' avPlayer is null');
    return;
  }
  for (let i = 0; i < typeArr.length; i++) {
    switch (typeArr[i]) {
      case 'stateChange':
        avPlayer.off('stateChange');
        break;
      case 'volumeChange':
        avPlayer.off('volumeChange');
        break;
      case 'endOfStream':
        avPlayer.off('endOfStream');
        break;
      case 'seekDone':
        avPlayer.off('seekDone');
        break;
      case 'speedDone':
        avPlayer.off('speedDone');
        break;
      case 'speedDone':
        avPlayer.off('speedDone');
        break;
      case 'timeUpdate':
        avPlayer.off('timeUpdate');
        break;
      case 'durationUpdate':
        avPlayer.off('durationUpdate');
        break;
      case 'bufferingUpdate':
        avPlayer.off('bufferingUpdate');
        break;
      case 'startRenderFrame':
        avPlayer.off('startRenderFrame');
        break;
      case 'videoSizeChange':
        avPlayer.off('videoSizeChange');
        break;
      case 'audioInterrupt':
        avPlayer.off('audioInterrupt');
        break;
      case 'availableBitrates':
        avPlayer.off('availableBitrates');
        break;
      case 'trackChange':
        avPlayer.off('trackChange');
        break;
      case 'trackInfoUpdate':
        avPlayer.off('trackInfoUpdate');
        break;
      case 'error':
        avPlayer.off('error');
        break;
      default:
        break;
    }
  }
}

export function setAVPlayerFunCb(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  playTest: PlayTest, playTime: number, done: Function, testName: string) {
  let volumeCnt = [0];
  let endOfStreamCnt = [0];
  let speedDoneCnt = [0];
  let videoSizeCnt = [0];
  let startRenderFrameCnt = [0];
  let durationUpdateCnt = [0];
  let seekDoneCnt = [0];
  let prepareCnt = 0;
  let playCnt = 0;
  let completedCnt = 0;
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case setAVPlayerFunCb in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    if (reason == media.StateChangeReason.BACKGROUND) {
      console.info(TAG, testName + ` case media.StateChangeReason.BACKGROUND`);
      await avPlayer?.release().then(() => {
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    console.info(TAG, testName + ` setAVPlayerFunCb case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        expect(avPlayer?.state).assertEqual(INITIALIZED);
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
          avPlayer.audioRendererInfo = {
            content: audio.ContentType.CONTENT_TYPE_MUSIC,
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          }
          // step 1, 13: initialized -> prepared
          toPreparePromise(avPlayer, playTest, testName);
        }
        break;
      case PREPARED:
        prepareCnt++;
        if (avPlayer) {
          expect(avPlayer?.state).assertEqual(PREPARED);
          checkPlayTest(avPlayer, playTest);
          expect(avPlayer?.currentTime).assertEqual(0);
          if (prepareCnt == 1) {
            // step 2: prepared -> playing
            avPlayer?.play().then(() => {
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          } else {
            // step 14: prepared -> seek
            avPlayer?.seek(avPlayer.duration);
          }
        }
        break;
      case PLAYING:
        playCnt++;
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        } else if (playCnt == 1) {
          expect(avPlayer?.state).assertEqual(PLAYING);
          // step 3: playing -> seek duration/3
          await mediaTestBase.msleepAsync(SLEEP_TIME_100);
          avPlayer?.seek(avPlayer.duration / 3);
        } else if (playCnt == 2) {
          expect(avPlayer?.state).assertEqual(PLAYING);
          //  step 7: playing -> seek duration when loop true
          avPlayer?.seek(avPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC);
        } else if (playCnt == 3) {
          // step 10: playing -> stop
          avPlayer?.stop().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        break;
      case PAUSED:
        if (avPlayer) {
          expect(avPlayer?.state).assertEqual(PAUSED);
          // step 5: pause -> seek 0
          avPlayer.loop = true;
          avPlayer?.seek(0, media.SeekMode.SEEK_NEXT_SYNC);
        }
        break;
      case COMPLETED:
        completedCnt++;
        if (avPlayer) {
          expect(avPlayer?.currentTime).assertEqual(avPlayer.duration);
          expect(avPlayer?.state).assertEqual(COMPLETED);
        }
        if (completedCnt == 1 && seekDoneCnt[0] < 5) {
          // step 9: completed -> play
          avPlayer?.play();
        } else {
          // step 16: completed -> reset
          avPlayer?.reset().then(() => {
            if (avPlayer) {
              expect(avPlayer?.state).assertEqual(IDLE);
            }
            // step 17: reset -> release
            avPlayer?.release().then(() => {
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        break;
      case STOPPED:
        if (avPlayer) {
          expect(avPlayer?.state).assertEqual(STOPPED);
        }
        // step 11: stop -> reset
        avPlayer?.reset().then(() => {
          if (avPlayer) {
            expect(avPlayer?.state).assertEqual(IDLE);
            // step 12: reset -> initialized
            setSource(avPlayer, src, testName);
          }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case RELEASED:
        expect(avPlayer?.state).assertEqual(RELEASED);
        // step 18: release -> done
        avPlayer = null;
        expect(volumeCnt[0]).assertLarger(0);
        expect(endOfStreamCnt[0]).assertLarger(0);
        expect(seekDoneCnt[0]).assertLarger(0);
        expect(speedDoneCnt[0]).assertLarger(0);
        expect(completedCnt).assertLarger(0);
        if (playTest.width != 0) {
          expect(startRenderFrameCnt[0]).assertLarger(0);
          expect(videoSizeCnt[0]).assertLarger(0);
        } else {
          expect(startRenderFrameCnt[0]).assertEqual(0);
          expect(videoSizeCnt[0]).assertEqual(0);
        }
        expect(durationUpdateCnt[0]).assertLarger(0)
        offCallback(avPlayer, ['stateChange'], testName);
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('seekDone', async (seekDoneTime) => {
    seekDoneCnt[0]++;
    console.info(TAG,
      testName + ` case seekDone called, seekDoneCnt is ${seekDoneCnt}, seekDoneTime is ${seekDoneTime}`);
    switch (seekDoneCnt[0]) {
      case 1:
        expect(avPlayer?.state).assertEqual(PLAYING);
        // step 4: seek(playing) -> pause
        avPlayer?.pause().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case 2:
        // step 6: seek(paused) -> play
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.play();
        avPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
        avPlayer?.setVolume(0.5);
        break;
      case 3:
      case 4:
      case 5:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        let nowTime = avPlayer.currentTime;
        if (avPlayer.state == PREPARED) {
          // step 15: prepared -> play
          avPlayer?.play();
        }
        if (nowTime > avPlayer.duration / 2) {
          avPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
          await mediaTestBase.msleepAsync(SLEEP_TIME_100);
        }
        if (avPlayer.loop == true) {
          // step 8: playing -> seek duration when loop false
          expect(avPlayer?.state).assertEqual(PLAYING);
          avPlayer.loop = false;
          avPlayer?.seek(avPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC);
        }
        break;
    }
  });
  setCallback(avPlayer, 'volumeChange', volumeCnt, testName);
  setCallback(avPlayer, 'endOfStream', endOfStreamCnt, testName);
  setCallback(avPlayer, 'speedDone', speedDoneCnt, testName);
  setCallback(avPlayer, 'bitrateDone', null, testName);
  setCallback(avPlayer, 'timeUpdate', null, testName);
  setCallback(avPlayer, 'bufferingUpdate', null, testName);
  setCallback(avPlayer, 'durationUpdate', durationUpdateCnt, testName);
  setCallback(avPlayer, 'startRenderFrame', startRenderFrameCnt, testName);
  setCallback(avPlayer, 'videoSizeChange', videoSizeCnt, testName);
  setCallback(avPlayer, 'audioInterrupt', null, testName);
  setCallback(avPlayer, 'availableBitrates', null, testName);
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer?.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok");
    }, time);
  }).then(() => {
    console.info(TAG, ` sleep ${time} over...`);
  });
}

function setAVPlayerPlayAndPauseWithCallBack(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  playTime: number, done: Function, testName: string) {
  let playPauseCount = 0;
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case setAVPlayerPlayAndPauseWithCallBack in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        avPlayer.surfaceId = surfaceID;
        console.info(TAG, testName + ' playPauseLoopWithCallBack play state is INITIALIZED');
        preparePromise(avPlayer, testName);
        break;
      case PREPARED:
        // step 1: initialized -> prepared -> play
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info(TAG, testName + ' playPauseLoopWithCallBack play state is PREPARED');
        avPlayer?.play().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case PLAYING:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        avPlayer.loop = true;
        console.info(TAG, testName + ' playPauseLoopWithCallBack play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        playPauseCount++;
        await mediaTestBase.msleepAsync(playTime);
        if (playPauseCount == 1001) {
          // step 4: playing -> stop -> release
          avPlayer?.stop().then(() => {
            console.info(TAG, testName + ' playPauseLoopWithCallBack avPlayer from play to stop');
            avPlayer?.release().then(() => {
              console.info(TAG, testName + ' playPauseLoopWithCallBack avPlayer from stop to release');
              done();
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          // step 2: playing -> pause loop
          avPlayer?.pause().then(() => {
            console.info(TAG,
              testName + ' playPauseLoopWithCallBack avPlayer from play to pause,time is :' + playPauseCount);
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        break;
      case PAUSED:
        console.info('playPauseLoopWithCallBack play state is PAUSED');
        expect(avPlayer?.state).assertEqual(PAUSED);
        // step 3: pause -> playing loop
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case RELEASED:
        expect(avPlayer?.state).assertEqual(RELEASED);
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer?.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function idle(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`)
  await media.createAVPlayer().then((video) => {
    if (typeof (video) != 'undefined') {
      console.info(TAG, testName + ' case createAVPlayer success');
      avPlayer = video;
      expect(true).assertTrue();
    } else {
      console.error(TAG, testName + ' case createAVPlayer failed');
      expect().assertFail();
    }
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  return avPlayer;
}

export async function avPlayerWithCallBack(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  playTime: number, done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await setAVPlayerPlayAndPauseWithCallBack(src, avPlayer, playTime, done, testName);
  await setSource(avPlayer, src, testName);
}

export async function avPlayerWithoutCallBack(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case avPlayerWithoutCallBack Initialized in, surfaceID is ${surfaceID}`);
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' avPlayerWithoutCallBack setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer && avPlayer.state == INITIALIZED) {
    avPlayer.surfaceId = surfaceID;
    await preparePromise(avPlayer, testName);
    await sleep(SLEEP_TIME_2000);
  }
  if (avPlayer && avPlayer.state == PREPARED) {
    console.info(TAG, testName + ' avPlayerWithoutCallBack avPlayer from PREPARED to play');
    // play to pause loop 1000 times
    for (let i = 0; i < 1000; i++) {
      await playToPauseLoop(avPlayer, testName);
      console.info(TAG, testName + ` case avPlayerWithoutCallBack playToPauseLoop is ${i}`);
    }
  }
  await avPlayer?.stop().then(() => {
    console.info(TAG, testName + ' avPlayerWithoutCallBack avPlayer from play to stop');
    avPlayer?.release().then(() => {
      console.info(TAG, testName + ' avPlayerWithoutCallBack avPlayer from stop to release');
      expect(avPlayer?.state).assertEqual(RELEASED);
      done();
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}


async function createToReleaseLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case createToReleaseLoop in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case IDLE:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        expect(avPlayer?.state).assertEqual(IDLE);
        setSource(avPlayer, src, testName);
        break;
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        avPlayer.surfaceId = surfaceID;
        console.info(TAG, testName + ' createToReleaseLoop play state is INITIALIZED');
        // step 1: initialized -> prepared -> play
        avPlayer?.release();
        break;
      case RELEASED:
        expect(avPlayer?.state).assertEqual(RELEASED);
        createToReleaseLoopCount++;
        if (createToReleaseLoopCount == 1001) {
          done();
        } else {
          avPlayer = await idle(src, avPlayer, testName);
          await createToReleaseLoop(src, avPlayer, done, testName);
          await setSource(avPlayer, src, testName);
        }
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer?.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function createToRelease(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  await createToReleaseLoop(src, avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' CreateToRelease setSource');
}

export async function playToCompleted(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await playToCompletedLoop(src, avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

async function playToCompletedLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let playToCompletedCount = 0;
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case playToCompletedLoop in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        avPlayer.surfaceId = surfaceID;
        console.info(TAG, testName + ' playToCompletedLoop play state is INITIALIZED');
        // step 1: initialized -> prepared -> play
        await preparePromise(avPlayer, testName);
        await sleep(SLEEP_TIME_2000);
        avPlayer?.play();
        break;
      case PLAYING:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        avPlayer.loop = false;
        console.info(TAG, testName + ' playToCompletedLoop play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        playToCompletedCount++;
        if (playToCompletedCount == 1001) {
          // step 4: playing -> stop -> release
          avPlayer?.stop().then(() => {
            console.info(TAG, testName + ' playToCompletedLoop avPlayer from play to stop');
            avPlayer?.release().then(() => {
              console.info(TAG, testName + ' playToCompletedLoop avPlayer from stop to release');
              done();
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          // step 2: playing -> seek loop
          avPlayer?.seek(10034, media.SeekMode.SEEK_NEXT_SYNC);
          console.info(TAG,
            testName + ' playToCompletedLoop avPlayer from play to seek,time is :' + playToCompletedCount);
        }
        break;
      case COMPLETED:
        expect(avPlayer?.currentTime).assertEqual(avPlayer?.duration);
        expect(avPlayer?.state).assertEqual(COMPLETED);
        console.info(TAG, testName + ' playToCompletedLoop avPlayer from COMPLETED to play');
        // step 3: COMPLETED -> play loop
        avPlayer?.play();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer?.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function seekLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: Function,
  testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  await setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' seekLoop setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer && avPlayer.state == INITIALIZED) {
    avPlayer.surfaceId = surfaceID;
    console.info(TAG, testName + ' seekLoop case prepare success');
    await preparePromise(avPlayer, testName);
    await sleep(SLEEP_TIME_2000);
  }
  await avPlayer?.play().then(() => {
    console.info(TAG, testName + ' seekLoop play success');
    expect(avPlayer?.state).assertEqual(PLAYING);
  }, (err: BusinessError) => {
    console.error(TAG, testName + ' seekLoop play filed,error message is :' + err.message);
  });
  if (avPlayer) {
    await seekLoopWithCallback(avPlayer, testName);
    console.info(TAG, testName + ' seekLoop avPlayer from play to seek');
  }
  // play seek loop 1000 times
  await avPlayer?.stop().then(() => {
    console.info(TAG, testName + ' seekLoopWithCallback avPlayer from play to stop');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  await avPlayer?.release().then(() => {
    console.info(TAG, testName + ' seekLoopWithCallback avPlayer from stop to release');
    expect(avPlayer?.state).assertEqual(RELEASED);
    done();
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

async function seekLoopWithCallback(avPlayer: media.AVPlayer, testName: string) {
  for (let loopTime = 0; loopTime < 5000; loopTime += 5) {
    new Promise<string>((resolve, reject) => {
      avPlayer?.on('seekDone', seekDoneTime => {
        console.info(TAG, testName + ` case seekDone called seekDoneTime is ${seekDoneTime}`);
        resolve("ok");
      });
      avPlayer.seek(loopTime);
      console.info(TAG, testName + ` case seekLoopWithCallback loopTime is ${loopTime}`);
    });
  }
}

async function seekLoopWithoutCallbackLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let seekLoopWithoutCallbackLoop = 0;
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case seekLoopWithoutCallbackLoop in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        avPlayer.surfaceId = surfaceID;
        console.info(TAG, testName + ' seekLoopWithoutCallbackLoop play state is INITIALIZED');
        // step 1: prepare
        preparePromise(avPlayer, testName);
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        // step 2: sop
        avPlayer?.play();
        break;
      case PLAYING:
        console.info(TAG, testName + ' seekLoopWithoutCallbackLoop play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        // step 5: PLAYING-IDLE
        for (let loopTime = 0; loopTime < 1000; loopTime++) {
          avPlayer?.seek(loopTime)
          console.info(TAG, testName + ` case seekLoopWithoutCallbackLoop loopTime is ${loopTime}`);
          if (loopTime == 999) {
            avPlayer?.stop().then(() => {
              console.info(TAG, testName + ' seekLoopWithoutCallbackLoop avPlayer from play to stop');
              avPlayer?.release().then(() => {
                console.info(TAG, testName + ' seekLoopWithoutCallbackLoop avPlayer from stop to release');
                expect(avPlayer?.state).assertEqual(RELEASED);
                done();
              }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          }
        }
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer?.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function seekLoopWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await seekLoopWithoutCallbackLoop(src, avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' seekLoopWithoutCallback setSource');
}

async function prepareToStopLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let prepareToStopLoopCount = 0;
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case prepareToStopLoop in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        avPlayer.surfaceId = surfaceID;
        console.info(TAG, testName + ' prepareToStopLoop play state is INITIALIZED');
        // step 1: prepare
        preparePromise(avPlayer, testName);
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        // step 2: sop
        avPlayer?.stop();
        break;
      case STOPPED:
        expect(avPlayer?.state).assertEqual(STOPPED);
        prepareToStopLoopCount++;
        if (prepareToStopLoopCount == 1001) {
          // end: release
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' prepareToStopLoop avPlayer from stop to release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          preparePromise(avPlayer, testName);
        }
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer?.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function prepareToStop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await prepareToStopLoop(src, avPlayer, done, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' prepareToStopLoop setSource');
}

async function prepareToResetLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let prepareToResetLoopCount = 0;
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case prepareToResetLoop in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      // step 1: create-Idle
      case IDLE:
        expect(avPlayer?.state).assertEqual(IDLE);
        prepareToResetLoopCount++;
        if (prepareToResetLoopCount == 1001) {
          // end: release
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' prepareToResetLoop avPlayer from stop to release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          // step 2: idle-INITIALIZED
          setSource(avPlayer, src, testName);
          console.info(TAG,
            testName + ' prepareToResetLoop avPlayer from play to seek,time is :' + prepareToResetLoopCount);
        }
        break;
      case INITIALIZED:
        if (!avPlayer) {
          console.error(TAG, testName + ' case avPlayer is null');
          break;
        }
        avPlayer.surfaceId = surfaceID;
        console.info(TAG, testName + ' prepareToResetLoop play state is INITIALIZED');
        // step 3: INITIALIZED-PREPARED
        preparePromise(avPlayer, testName);
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        // step 4: PREPARED-PLAYING
        avPlayer?.play()
        break;
      case PLAYING:
        console.info(TAG, testName + ' prepareToResetLoop play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        // step 5: PLAYING-IDLE
        avPlayer?.reset();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer?.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function prepareToReset(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  // url -> prepare -> play -> reset loop 1000 times
  await prepareToResetLoop(src, avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

let createToReleaseLoopCount2 = 0;

async function createToReleaseLoop2(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case createToReleaseLoop2 in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case IDLE:
        expect(avPlayer?.state).assertEqual(IDLE);
        setSource(avPlayer, src, testName);
        break;
      case INITIALIZED:
        if (!avPlayer) {
          console.error(TAG, testName + ' case avPlayer is null');
          break;
        }
        avPlayer.surfaceId = surfaceID;
        console.info(TAG, testName + ' createToReleaseLoop2 play state is INITIALIZED');
        preparePromise(avPlayer, testName);
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        // step 4: PREPARED-PLAYING
        avPlayer?.play();
        break;
      case PLAYING:
        console.info(TAG, testName + ' createToReleaseLoop2 play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        avPlayer?.release();
        break;
      case RELEASED:
        expect(avPlayer?.state).assertEqual(RELEASED);
        createToReleaseLoopCount2++
        if (createToReleaseLoopCount2 == 1001) {
          done();
        } else {
          avPlayer = await idle(src, avPlayer, testName);
          await createToReleaseLoop2(src, avPlayer, done, testName);
          await setSource(avPlayer, src, testName);
        }
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer?.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function createToRelease2(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await createToReleaseLoop2(src, avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' createToRelease2 setSource');
}

let createLoopTime = 0;
let createTotalTime = 0;
let createStart = 0;

export async function createTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  createStart = Date.now();
  console.info(TAG, testName + ` createTimeWithCallback createStart time is : ${createStart}`);
  createTimeCallback(src, avPlayer, done, testName);
}

function createTimeCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: Function,
  testName: string) {
  let end: number;
  let execution: number;
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` createTimeCallback stateChange called, state is ${state}, reason is ${reason}`);
    console.info(TAG, testName + ` createTimeCallback state is ${state}`);
    switch (state) {
      case IDLE:
        expect(avPlayer?.state).assertEqual(IDLE);
        end = Date.now();
        console.info(TAG, testName + ` createTimeCallback end time is : ${end}`);
        execution = (end - createStart);
        createTotalTime = createTotalTime + execution;
        console.info(TAG, testName + ' createTimeCallback execution time  is :' + execution);
        createLoopTime++;
        avPlayer?.release();
      case RELEASED:
        console.info(TAG, testName + ' createTimeCallback play state is release');
        expect(avPlayer?.state).assertEqual(RELEASED);
        if (createLoopTime == 10) {
          let avg = createTotalTime / 10;
          console.info(TAG, testName + ' createTimeCallback avg time  is :' + avg);
          createLoopTime = 0;
          createTotalTime = 0;
          done();
        } else {
          avPlayer = null;
          createTimeWithCallback(src, avPlayer, done, testName);
        }
        break;
      default:
        break;
    }
  });
}

export async function createTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let totalTime = 0;
  for (let i = 0; i < 10; i++) {
    let start = Date.now();
    console.info(TAG, testName + ` createTimeWithoutCallback start time is : ${start}`);
    avPlayer = await idle(src, avPlayer, testName);
    let end = Date.now();
    let execution = (end - start);
    console.info(TAG, testName + ' createTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' createTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' createTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function prepareTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' prepareTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    let start = Date.now();
    console.info(TAG, testName + ` prepareTimeWithoutCallback start time is : ${start}`);
    let end: number = 0;
    await avPlayer?.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info(TAG, testName + ' prepareTimeWithoutCallback avPlayer state is prepared');
      end = Date.now();
      console.info(TAG, testName + ` prepareTimeWithoutCallback end time is : ${end}`);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await mediaTestBase.msleepAsync(SLEEP_TIME_200);
    let execution = (end - start);
    console.info(TAG, testName + ' prepareTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' prepareTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' prepareTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function prepareTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await prepareTimeCallback(src, avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

async function prepareTimeCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  let start: number;
  let end: number;
  let execution: number;
  let loopTime = 0;
  let totalTime = 0;
  console.info(TAG, testName + ` case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case IDLE:
        expect(avPlayer?.state).assertEqual(IDLE);
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' prepareTimeWithCallback avPlayer is release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info(TAG, testName + ' prepareTimeWithCallback avg time is :' + avg);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          setSource(avPlayer, src, testName);
        }
      case INITIALIZED:
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' prepareTimeWithCallback play state is INITIALIZED');
        // step 1: initialized -> prepared
        start = Date.now();
        console.info(TAG, testName + ` prepareTimeWithCallback start time is : ${start}`);
        avPlayer?.prepare();
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info(TAG, testName + ' prepareTimeWithCallback avPlayer state is prepared');
        end = Date.now();
        console.info(TAG, testName + ` prepareTimeWithCallback end time is : ${end}`);
        execution = (end - start);
        console.info(TAG, testName + ' prepareTimeWithCallback execution time  is :' + execution);
        totalTime = totalTime + execution;
        loopTime++;
        avPlayer?.reset();
        break;
      default:
        break;
    }
  });
}

export async function playTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' playTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    await avPlayer?.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info(TAG, testName + ' playTimeWithoutCallback avPlayer state is prepared');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    let end: number = 0;
    console.info(TAG, testName + ` playTimeWithoutCallback start time is : ${start}`);
    await avPlayer?.play().then(() => {
      end = Date.now();
      console.info(TAG, testName + ` playTimeWithoutCallback end time is : ${end}`);
      console.info(TAG, testName + ' playTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }, (err: BusinessError) => {
      console.error(TAG, testName + ' playTimeWithoutCallback play filed,error message is :' + err.message);
    });
    let execution = (end - start);
    console.info(TAG, testName + ' playTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info('playTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
      avPlayer = null;
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' playTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function playTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await playTimeCallback(avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

export function playTimeCallback(avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  let start = 0;
  let end = 0;
  let execution = 0;
  let loopTime = 0;
  let totalTime = 0;
  console.info(TAG, testName + ` case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' playTimeCallback play state is INITIALIZED');
        // step 1: initialized -> prepared
        avPlayer?.prepare((err: BusinessError) => {
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName + ' playTimeCallback play state is prepared');
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info(TAG, testName + ' playTimeCallback avPlayer state is prepared');
        start = Date.now();
        console.info(TAG, testName + ` playTimeCallback start time is : ${start}`);
        // step 2: prapared -> play
        avPlayer?.play();
        break;
      case PLAYING:
        console.info(TAG, testName + ' playTimeCallback play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        end = Date.now();
        console.info(TAG, testName + ` playTimeCallback end time is : ${end}`);
        execution = (end - start)
        console.info(TAG, testName + ' playTimeCallback execution time  is :' + execution);
        totalTime = totalTime + execution;
        loopTime++;
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' playTimeCallback avPlayer is release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info(TAG, testName + ' playTimeWithCallback avg time is :' + avg);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          // step 3: playing -> pause loop
          setTimeout(() => {
            avPlayer?.pause()
          }, 200);
        }
        break;
      case PAUSED:
        console.info(TAG, testName + ' playTimeWithCallback play state is PAUSED');
        expect(avPlayer?.state).assertEqual('paused');
        start = Date.now();
        console.info(TAG, testName + ` playTimeCallback start time is : ${start}`);
        avPlayer?.play();
        break;
      default:
        break;
    }
  });
}

export async function pauseTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    let execution = 0;
    let end = 0;
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' pauseTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    await avPlayer?.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info(TAG, testName + ' pauseTimeWithoutCallback avPlayer state is prepared');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await avPlayer?.play().then(() => {
      console.info(TAG, testName + ' pauseTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }, (err: BusinessError) => {
      console.error(TAG, testName + ' pauseTimeWithoutCallback play filed,error message is :' + err.message);
    })
    let start = Date.now();

    console.info(TAG, testName + ` pauseTimeWithoutCallback start time is : ${start}`);
    await avPlayer?.pause().then(() => {
      console.info(TAG, testName + ' pauseTimeWithoutCallback pause success');
      expect(avPlayer?.state).assertEqual(PAUSED);
      end = Date.now();
      console.info(TAG, testName + ` pauseTimeWithoutCallback end time is : ${end}`);
      execution = (end - start);
      console.info(TAG, testName + 'pauseTimeWithoutCallback execution time  is :' + execution);
    }, (err: BusinessError) => {
      console.error(TAG, testName + ' pauseTimeWithoutCallback pause filed,error message is :' + err.message);
    })
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' pauseTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + 'pauseTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function pauseTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await pauseTimeCallback(avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

function pauseTimeCallback(avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  let start = 0;
  let end = 0;
  let execution = 0;
  let loopTime = 0;
  let totalTime = 0;
  console.info(TAG, testName + ` case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' pauseTimeCallback play state is INITIALIZED');
        // step 1: initialized -> prepared
        avPlayer?.prepare((err: BusinessError) => {
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName + ' pauseTimeCallback play state is prepared');
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info(TAG, testName + ' pauseTimeCallback avPlayer state is prepared');
        avPlayer?.play();
        break;
      case PLAYING:
        console.info(TAG, testName + ' pauseTimeCallback play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        setTimeout(() => {
          start = Date.now();
          console.info(TAG, testName + ' pauseTimeCallback start time is : ' + start);
          avPlayer?.pause();
        }, 200);
        break;
      case PAUSED:
        expect(avPlayer?.state).assertEqual(PAUSED);
        end = Date.now();
        console.info(TAG, testName + ' pauseTimeCallback end time is : ' + end);
        execution = (end - start);
        console.info(TAG, testName + ' pauseTimeCallback execution time  is :' + execution);
        totalTime = totalTime + execution;
        loopTime++;
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' pauseTimeCallback avPlayer is release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info(TAG, testName + ' pauseTimeCallback avg time is :' + avg);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          avPlayer?.play();
        }
        break;
      default:
        break;
    }
  });
}

export async function stopTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' stopTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    await avPlayer?.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info(TAG, testName + ' stopTimeWithoutCallback avPlayer state is prepared');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await avPlayer?.play().then(() => {
      console.info(TAG, testName + ' stopTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }, (err: BusinessError) => {
      console.error(TAG, testName + ' stopTimeWithoutCallback play filed,error message is :' + err.message);
    })
    let start = Date.now();
    console.info(TAG, testName + ` stopTimeWithoutCallback start time is : ${start}`);
    let end = 0;
    await avPlayer?.stop().then(() => {
      end = Date.now();
      console.info(TAG, testName + ` stopTimeWithoutCallback end time is : ${end}`);
      expect(avPlayer?.state).assertEqual(STOPPED);
      console.info(TAG, testName + ' stopTimeWithoutCallback avPlayer state is stop');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    let execution = (end - start);
    console.info(TAG, testName + 'stopTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' stopTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' stopTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function stopTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await stopTimeCallback(src, avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

function stopTimeCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: Function,
  testName: string) {
  let surfaceID: string = globalThis.value;
  let start = 0;
  let end = 0;
  let execution = 0;
  let loopTime = 0;
  let totalTime = 0;
  console.info(TAG, testName + ` case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case IDLE:
        setSource(avPlayer, src, testName);
        break;
      case INITIALIZED:
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' stopTimeCallback play state is INITIALIZED');
        // step 1: initialized -> prepared
        avPlayer?.prepare((err: BusinessError) => {
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName + ' stopTimeCallback play state is prepared');
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info(TAG, testName + ' stopTimeCallback avPlayer state is prepared');
        start = Date.now();
        console.info(TAG, testName + ` stopTimeCallback start time is : ${start}`);
        loopTime++;
        avPlayer?.stop();
        break;
      case STOPPED:
        expect(avPlayer?.state).assertEqual(STOPPED);
        end = Date.now();
        console.info(TAG, testName + ` stopTimeCallback end time is : ${end}`);
        execution = (end - start);
        console.info(TAG, testName + ' stopTimeCallback execution time  is :' + execution);
        totalTime = totalTime + execution;
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' stopTimeCallback avPlayer is release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info(TAG, testName + ' stopTimeCallback avg time is :' + avg);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          avPlayer?.reset();
        }
        break;
      default:
        break;
    }
  });
}

export async function resetTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' resetTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    await avPlayer?.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info(TAG, testName + ' resetTimeWithoutCallback avPlayer state is prepared');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    let end = 0;
    await avPlayer?.play().then(() => {
      console.info(TAG, testName + ' resetTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }, (err: BusinessError) => {
      console.error(TAG, testName + ' resetTimeWithoutCallback play filed,error message is :' + err.message);
    })
    let start = Date.now();
    console.info(TAG, testName + ` resetTimeWithoutCallback start time is : ${start}`);
    await avPlayer?.reset().then(() => {
      end = Date.now();
      console.info(TAG, testName + ` resetTimeWithoutCallback end time is : ${end}`);
      console.info(TAG, testName + ' reset success');
      expect(avPlayer?.state).assertEqual(IDLE);
    }, (err: BusinessError) => {
      console.error(TAG, testName + ' reset filed,error message is :' + err.message);
    })
    let execution = (end - start);
    console.info(TAG, testName + ' resetTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' resetTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' resetTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function resetTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await resetTimeCallback(src, avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

function resetTimeCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: Function,
  testName: string) {
  let surfaceID: string = globalThis.value;
  let start = 0;
  let end = 0;
  let execution = 0;
  let loopTime = 0;
  let totalTime = 0;
  console.info(TAG, testName + ` case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case IDLE:
        expect(avPlayer?.state).assertEqual(IDLE);
        end = Date.now();
        console.info(TAG, testName + ` resetTimeCallback end time is : ${end}`);
        execution = (end - start);
        console.info(TAG, testName + ' resetTimeCallback execution time  is :' + execution);
        totalTime = totalTime + execution;
        loopTime++;
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' resetTimeCallback avPlayer is release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info(TAG, testName + ' resetTimeCallback avg time is :' + avg);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          setSource(avPlayer, src, testName);
        }
        break;
      case INITIALIZED:
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' resetTimeCallback play state is INITIALIZED');
        start = Date.now();
        console.info(TAG, testName + ` resetTimeCallback start time is : ${start}`);
        avPlayer?.reset().then(() => {
          console.info(TAG, testName + ' reset success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
}

export async function releaseTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' releaseTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    let start = Date.now();
    console.info(TAG, testName + ` releaseTimeWithoutCallback start time is : ${start}`);
    let end = 0;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' releaseTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    end = Date.now();
    console.info(TAG, testName + ` releaseTimeWithoutCallback end time is : ${end}`);
    let execution = (end - start)
    console.info(TAG, testName + ' releaseTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' releaseTimeWithoutCallback avg time  is :' + avg);
  done();
}

let releaseTotalTime = 0;
let releaseLoop = 0;

export async function releaseTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await releaseTimeCallback(src, avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

function releaseTimeCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: Function,
  testName: string) {
  let surfaceID: string = globalThis.value;
  let start = 0;
  let end = 0;
  let execution = 0;
  console.info(TAG, testName + ` case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' releaseTimeCallback play state is INITIALIZED');
        start = Date.now();
        console.info(TAG, testName + ` releaseTimeCallback start time is : ${start}`);
        avPlayer?.release();
        break;
      case RELEASED:
        console.info(TAG, testName + ' releaseTimeCallback play state is release');
        expect(avPlayer?.state).assertEqual(RELEASED);
        end = Date.now();
        console.info(TAG, testName + ` releaseTimeCallback end time is : ${end}`);
        execution = (end - start);
        console.info(TAG, testName + ' releaseTimeCallback execution time  is :' + execution);
        releaseTotalTime = releaseTotalTime + execution;
        releaseLoop++;
        if (releaseLoop == 10) {
          let avg = releaseTotalTime / 10;
          console.info(TAG, testName + ' releaseTimeCallback avg time  is :' + avg);
          releaseTotalTime = 0;
          releaseLoop = 0;
          done();
        } else {
          avPlayer = null;
          releaseTimeWithCallback(src, avPlayer, done, testName);
        }
        break;
      default:
        break;
    }
  });
}

export function getTotalTime(releaseTotalTime: number) {
  return releaseTotalTime;
}

export async function seekTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' seekTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    await avPlayer?.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info(TAG, testName + ' seekTimeWithoutCallback avPlayer state is prepared');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    let end = 0;
    await avPlayer?.play().then(() => {
      console.info(TAG, testName + ' seekTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }, (err: BusinessError) => {
      console.error(TAG, testName + ' seekTimeWithoutCallback play filed,error message is :' + err.message);
    })
    let start = Date.now();
    console.info(TAG, testName + ` seekTimeWithoutCallback start time is : ${start}`);
    await avPlayer?.seek(100);
    end = Date.now();
    console.info(TAG, testName + ` seekTimeWithoutCallback end time is : ${end}`);
    let execution = (end - start);
    console.info(TAG, testName + ' seekTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' seekTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' seekTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function seekTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await seekTimeCallback(avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

function seekTimeCallback(avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  let start = 0;
  let end = 0;
  let execution = 0;
  let loopTime = 0;
  let totalTime = 0;
  console.info(TAG, testName + ` case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' seekTimeCallback play state is INITIALIZED');
        avPlayer?.prepare((err: BusinessError) => {
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName + ' seekTimeCallback play state is prepared');
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info(TAG, testName + ' seekTimeCallback avPlayer state is prepared');
        avPlayer?.play();
        break;
      case PLAYING:
        console.info(TAG, testName + ' seekTimeCallback play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        start = Date.now();
        console.info(TAG, testName + ` seekTimeCallback start time is : ${start}`);
        loopTime += 20;
        if (loopTime == 220) {
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' seekTimeCallback avPlayer is release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info(TAG, testName + ' seekTimeCallback avg time is :' + avg);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          avPlayer?.seek(loopTime);
        }
        break;
      case PAUSED:
        console.info(TAG, testName + ' seekTimeCallback play state is PAUSED');
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.play().then(() => {
          console.info(TAG, testName + ' seekTimeCallback avPlayer from pause to play');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('seekDone', async (seekDoneTime) => {
    end = Date.now();
    console.info(TAG, testName + ` seekTimeCallback end time is : ${end}`);
    execution = (end - start);
    console.info(TAG, testName + ' seekTimeCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    console.info(TAG, testName + ` case seekDone called seekDoneTime is ${seekDoneTime}`);
    avPlayer?.pause();
  });
}

export async function getTrackDescriptionTimeWithoutCallback(src: string | media.AVFileDescriptor,
  avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' getTrackDescriptionTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    await avPlayer?.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info(TAG, testName + ' getTrackDescriptionTimeWithoutCallback avPlayer state is prepared');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    await avPlayer?.play().then(() => {
      console.info(TAG, testName + ' getTrackDescriptionTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }, (err: BusinessError) => {
      console.error(TAG,
        testName + ' getTrackDescriptionTimeWithoutCallback play filed,error message is :' + err.message);
    })
    let arrayDescription: Array<media.MediaDescription>;
    let start = Date.now();
    console.info(TAG, testName + ` getTrackDescriptionTimeWithoutCallback start time is : ${start}`);
    let end = 0;
    await avPlayer?.getTrackDescription().then((arrList) => {
      if (arrList != null) {
        arrayDescription = arrList;
      } else {
        console.info(TAG, testName + ' video getTrackDescription fail');
      }
    }).catch((error: BusinessError) => {
      console.info(TAG, testName + ` video catchCallback, error:${error}`);
    });
    end = Date.now();
    console.info(TAG, testName + ` getTrackDescriptionTimeWithoutCallback end time is : ${end}`);
    let execution = (end - start);
    console.info(TAG, testName + ' getTrackDescriptionTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' getTrackDescriptionTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' getTrackDescriptionTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function getTrackDescriptionTimeWithCallback(src: string | media.AVFileDescriptor,
  avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await getTrackDescriptionTimeCallback(avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

function getTrackDescriptionTimeCallback(avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  let start = 0;
  let end = 0;
  let execution = 0;
  let loopTime = 0;
  let totalTime = 0;
  let arrayDescription: Array<media.MediaDescription>;
  console.info(TAG, testName + ` case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' getTrackDescriptionTimeCallback play state is INITIALIZED');
        avPlayer?.prepare((err: BusinessError) => {
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName + ' getTrackDescriptionTimeCallback play state is prepared');
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info(TAG, testName + ' getTrackDescriptionTimeCallback avPlayer state is prepared');
        avPlayer?.play();
        break;
      case PLAYING:
        console.info(TAG, testName + ' getTrackDescriptionTimeCallback play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        start = Date.now();
        console.info(TAG, testName + ` getTrackDescriptionTimeCallback start time is : ${start}`);
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' getTrackDescriptionTimeCallback avPlayer is release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info(TAG, testName + ' getTrackDescriptionTimeCallback avg time is :' + avg);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          loopTime++;
          avPlayer?.getTrackDescription().then((arrList) => {
            if (arrList != null) {
              arrayDescription = arrList;
              end = Date.now();
              console.info(TAG, testName + ` getTrackDescriptionTimeCallback end time is : ${end}`);
              execution = (end - start);
              console.info(TAG, testName + ' getTrackDescriptionTimeCallback execution time  is :' + execution);
              totalTime = totalTime + execution;
            } else {
              console.info(TAG, testName + ' video getTrackDescription fail');
            }
          }).catch((error: BusinessError) => {
            console.info(TAG, testName + ` video catchCallback, error:${error}`);
          });
          setTimeout(() => {
            avPlayer?.pause();
          }, 200);
        }
        break;
      case PAUSED:
        console.info(TAG, testName + ' getTrackDescriptionTimeCallback play state is PAUSED');
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.play().then(() => {
          console.info(TAG, testName + ' getTrackDescriptionTimeCallback avPlayer from pause to play');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
}

export async function setSpeedTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' setSpeedTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    await avPlayer?.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info(TAG, testName + ' setSpeedTimeWithoutCallback avPlayer state is prepared');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    console.info(TAG, testName + ` setSpeedTimeWithoutCallback start time is : ${start}`);
    await avPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
    let end = Date.now();
    console.info(TAG, testName + ` setSpeedTimeWithoutCallback end time is : ${end}`);
    let execution = (end - start);
    console.info(TAG, testName + ' setSpeedTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' setSpeedTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' setSpeedTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function setSpeedTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await setSpeedTimeCallback(avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

function setSpeedTimeCallback(avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  let start = 0;
  let end = 0;
  let execution = 0;
  let loopTime = 0;
  let totalTime = 0;
  console.info(TAG, testName + ` case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' setSpeedTimeCallback play state is INITIALIZED');
        // step 1: initialized -> prepared
        avPlayer?.prepare((err: BusinessError) => {
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName + ' setSpeedTimeCallback play state is prepared');
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info(TAG, testName + ' setSpeedTimeCallback avPlayer state is prepared');
        avPlayer?.play();
        break;
      case PLAYING:
        console.info(TAG, testName + ' setSpeedTimeCallback play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        if (loopTime == 10) {
          avPlayer?.off('speedDone');
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' setSpeedTimeCallback avPlayer is release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            let avg = totalTime / 10;
            console.info(TAG, testName + ' setSpeedTimeCallback avg time  is :' + avg);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          start = Date.now();
          console.info(TAG, testName + ` setSpeedTimeCallback start time is : ${start}`);
          loopTime++;
          avPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
        }
        break;
      case PAUSED:
        console.info(TAG, testName + ' setSpeedTimeCallback play state is PAUSED');
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.play().then(() => {
          console.info(TAG, testName + ' setSpeedTimeCallback avPlayer from pause to play');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('speedDone', async (speed) => {
    end = Date.now();
    console.info(TAG, testName + ` setSpeedTimeCallback end time is : ${end}`);
    execution = (end - start);
    console.info(TAG, testName + ' setSpeedTimeCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    console.info(TAG, testName + ' speedDone success,and speed value is:' + speed);
    avPlayer?.pause();
  });
}

export async function setBitrateTimeWithoutCallback(src: string | media.AVFileDescriptor,
  avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' setBitrateTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    await avPlayer?.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info(TAG, testName + ' setBitrateTimeWithoutCallback avPlayer state is prepared');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    console.info(TAG, testName + ` setBitrateTimeWithoutCallback start time is : ${start}`);
    let bitrate = 96000;
    await avPlayer?.setBitrate(bitrate);
    let end = Date.now();
    console.info(TAG, testName + ` setBitrateTimeWithoutCallback end time is : ${end}`);
    let execution = (end - start);
    console.info(TAG, testName + ' setBitrateTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' setBitrateTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' setBitrateTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function setVolumeTimeWithoutCallback(src: string | media.AVFileDescriptor,
  avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let totalTime = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer, testName);
    await setSource(avPlayer, src, testName);
    console.info(TAG, testName + ' setVolumeTimeWithoutCallback setSource');
    await sleep(SLEEP_TIME_20);
    if (avPlayer) {
      avPlayer.surfaceId = surfaceID;
    }
    await avPlayer?.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info(TAG, testName + ' setVolumeTimeWithoutCallback avPlayer state is prepared');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    console.info(TAG, testName + ` setVolumeTimeWithoutCallback start time is : ${start}`);
    let volume = 1.0;
    avPlayer?.setVolume(volume);
    let end = Date.now();
    console.info(TAG, testName + ` setVolumeTimeWithoutCallback end time is : ${end}`);
    let execution = (end - start);
    console.info(TAG, testName + ' setVolumeTimeWithoutCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    await avPlayer?.release().then(() => {
      console.info(TAG, testName + ' setVolumeTimeWithoutCallback avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info(TAG, testName + ' setVolumeTimeWithoutCallback avg time  is :' + avg);
  done();
}

export async function setVolumeTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  await setVolumeTimeCallback(avPlayer, done, testName);
  await setSource(avPlayer, src, testName);
}

function setVolumeTimeCallback(avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  let start = 0;
  let end = 0;
  let execution = 0;
  let loopTime = 0;
  let totalTime = 0;
  console.info(TAG, testName + ` case setVolumeTimeCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' setVolumeTimeCallback play state is INITIALIZED');
        // step 1: initialized -> prepared
        avPlayer?.prepare((err: BusinessError) => {
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info(TAG, testName + ' setVolumeTimeCallback play state is prepared');
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info(TAG, testName + ' setVolumeTimeCallback avPlayer state is prepared');
        avPlayer?.play();
        break;
      case PLAYING:
        console.info(TAG, testName + ' setVolumeTimeCallback play state is PLAYING');
        expect(avPlayer?.state).assertEqual(PLAYING);
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info(TAG, testName + ' setVolumeTimeCallback avPlayer is release');
            expect(avPlayer?.state).assertEqual(RELEASED);
            let avg = totalTime / 10;
            console.info(TAG, testName + ' setVolumeTimeCallback avg time  is :' + avg);
            done();
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          start = Date.now();
          console.info(TAG, testName + ` setVolumeTimeCallback start time is : ${start}`);
          loopTime++;
          let volume = 1.0;
          avPlayer.setVolume(volume);
        }
        break;
      case PAUSED:
        console.info(TAG, testName + ' setVolumeTimeCallback play state is PAUSED');
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.play().then(() => {
          console.info(TAG, testName + ' setVolumeTimeCallback avPlayer from pause to play');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('volumeChange', (vol) => {
    end = Date.now();
    console.info(TAG, testName + ` setVolumeTimeCallback end time is : ${end}`);
    execution = (end - start);
    console.info(TAG, testName + ' setVolumeTimeCallback execution time  is :' + execution);
    totalTime = totalTime + execution;
    console.info(TAG, testName + ' volumeChange success,and new volume is :' + vol);
    avPlayer?.pause();
  });
}

export async function firstFrameTime(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  let start = 0;
  avPlayer = await idle(src, avPlayer, testName);
  await setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' firstFrameTime setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  await avPlayer?.prepare().then(() => {
    expect(avPlayer?.state).assertEqual(PREPARED);
    console.info(TAG, testName + ' firstFrameTime avPlayer state is prepared');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  await avPlayer?.on('startRenderFrame', () => {
    console.info(TAG, testName + ' startRenderFrame success');
    let end = Date.now();
    console.info(TAG, testName + ` firstFrameTime end time is : ${end}`);
    let execution = (end - start);
    console.info(TAG, testName + ' firstFrameTime execution time  is :' + execution);
    avPlayer?.off('startRenderFrame');
    avPlayer?.release().then(() => {
      console.info(TAG, testName + ' firstFrameTime avPlayer is release');
      expect(avPlayer?.state).assertEqual(RELEASED);
      avPlayer = null;
      done();
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  });
  start = Date.now();
  console.info(TAG, testName + ` firstFrameTime start time is : ${start}`);
  await avPlayer?.play().then(() => {
    console.info(TAG, testName + ' firstFrameTime play success');
  }, (err: BusinessError) => {
    console.error(TAG, testName + ' firstFrameTime play filed,error message is :' + err.message);
  })
}

async function playToPauseLoop(avPlayer: media.AVPlayer, testName: string) {
  await avPlayer?.play().then(() => {
    console.info(TAG, testName + ' playToPauseLoop play success');
    expect(avPlayer?.state).assertEqual(PLAYING);
  }, (err: BusinessError) => {
    console.error(TAG, testName + ' playToPauseLoop play filed,error message is :' + err.message);
  })
  if (avPlayer.state == PLAYING) {
    avPlayer.loop = true;
    await mediaTestBase.msleepAsync(SLEEP_TIME_2);
    console.info(TAG, testName + ' playToPauseLoop avPlayer from play to pause');
  }
  await avPlayer?.pause().then(() => {
    console.info(TAG, testName + ' playToPauseLoop pause success');
    expect(avPlayer?.state).assertEqual(PAUSED);
  }, (err: BusinessError) => {
    console.error(TAG, testName + ' playToPauseLoop pause filed,error message is :' + err.message);
  })
}

async function setAVPlayerPlay(avPlayer: media.AVPlayer | null, done: Function, testName: string): Promise<void> {
  return new Promise((resolve, reject) => {
    let surfaceID: string = globalThis.value;
    console.info(TAG, testName + ` case setAVPlayerPlay in, surfaceID is ${surfaceID}`);
    avPlayer?.on('stateChange', async (state, reason) => {
      console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
      switch (state) {
        case INITIALIZED:
          if (avPlayer) {
            avPlayer.surfaceId = surfaceID;
          }
          console.info(TAG, testName + '  setAVPlayerPlay play state is INITIALIZED');
          // step 1: initialized -> prepared -> play
          await avPlayer?.prepare().then(() => {
            console.info(TAG, testName + ' setAVPlayerPlayer prepared success.');
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          break;
        case PREPARED:
          await avPlayer?.play();
          break;
        case PLAYING:
          console.info(TAG, testName + ' setAVPlayerPlay play state is PLAYING duration =' + avPlayer?.duration);
          expect(avPlayer?.state).assertEqual(PLAYING);
          if (avPlayer && avPlayer.duration > SLEEP_TIME_2000) {
            await mediaTestBase.msleepAsync(SLEEP_TIME_500);
            console.info(TAG, testName + 'start to seek');
            avPlayer?.seek(avPlayer.duration - SLEEP_TIME_500, media.SeekMode.SEEK_NEXT_SYNC);
          } else {
            await mediaTestBase.msleepAsync(SLEEP_TIME_500);
            avPlayer?.seek(avPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC);
          }
          break;
        case COMPLETED:
          expect(avPlayer?.currentTime).assertEqual(avPlayer?.duration);
          expect(avPlayer?.state).assertEqual('completed');
          await avPlayer?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          break;
        case RELEASED:
          expect(avPlayer?.state).assertEqual('released');
          avPlayer = null;
          done();
          resolve();
          break;
        case ERROR:
          expect().assertFail();
          avPlayer?.off('stateChange');
          avPlayer?.off('error');
	  await avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          reject();
          break;
        default:
          break;
      }
    });
    avPlayer?.on('error', async (err: BusinessError) => {
      console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
      expect().assertFail();
      reject();
      await avPlayer?.release().then(() => {
        avPlayer = null;
      });
    });
  });
}

export async function avPlayerPlay(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  await setAVPlayerPlay(avPlayer, done, testName);
}

export async function testAVPlayerFun(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  playTest: PlayTest, playTime: number, done: Function, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`);
  await media.createAVPlayer().then((video) => {
    if (typeof (video) != 'undefined') {
      console.info(TAG, testName + ' case createAVPlayer success');
      avPlayer = video;
      expect(avPlayer?.state).assertEqual(IDLE);
    } else {
      console.error(TAG, testName + ' case createAVPlayer failed');
      expect().assertFail();
      done();
    }
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  setAVPlayerFunCb(src, avPlayer, playTest, playTime, done, testName);
  setSource(avPlayer, src, testName);
}

export function setAVPlayerSeekCb(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  playTest: PlayTest, playTime: number, done: Function, testName: string) {
  let volumeCnt = [0];
  let endOfStreamCnt = 0;
  let seekDoneCnt = 0;
  let speedDoneCnt = [0];
  let playCnt = 0;
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case setAVPlayerSeekCb in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    if (reason == media.StateChangeReason.BACKGROUND) {
      avPlayer?.release().then(() => {
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
    }
    switch (state) {
      case INITIALIZED:
        expect(avPlayer?.state).assertEqual(INITIALIZED);
        if (avPlayer) {
          avPlayer.surfaceId = surfaceID;
        }
        console.info(TAG, testName + ' case initialized -> prepared');
        // step 1,10: initialized -> prepared
        avPlayer?.prepare((err: BusinessError) => {
          if (avPlayer) {
            avPlayer.loop = true;
          }
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            checkPlayTest(avPlayer, playTest);
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        checkPlayTest(avPlayer, playTest);
        expect(avPlayer?.currentTime).assertEqual(0);
        offCallback(avPlayer, ['volumeChange'], testName);
        // step 2,11: prepared -> seek 0
        avPlayer?.seek(0, 2); // 2: CLOSEST SYNC
        break;
      case PLAYING:
        playCnt++;
        if (playCnt == 1) {
          // step 4: seek + pause
          expect(avPlayer?.state).assertEqual(PLAYING);
          avPlayer?.seek(avPlayer.duration / 2, media.SeekMode.SEEK_PREV_SYNC);
          avPlayer?.pause((err: BusinessError) => {
            if (err != null) {
              mediaTestBase.assertErr('pause', err, done);
            }
          });
        } else if (playCnt == 3) {
          // step 12: seek duration
          avPlayer?.seek(avPlayer.duration, media.SeekMode.SEEK_PREV_SYNC);
          avPlayer?.stop((err: BusinessError) => {
            if (err == null) {
              avPlayer?.release((err: BusinessError) => {
                if (err != null) {
                  mediaTestBase.assertErr('release', err, done);
                }
              })
            } else {
              mediaTestBase.assertErr('stop', err, done);
            }
          });
        }
        break;
      case RELEASED:
        expect(avPlayer?.state).assertEqual(RELEASED);
        // step 18: release -> done
        avPlayer = null;
        expect(volumeCnt[0]).assertEqual(0);
        expect(endOfStreamCnt).assertLarger(0);
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {}, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.on('endOfStream', () => {
    console.info(TAG, testName + ` case endOfStream called`);
    endOfStreamCnt++;
    // step 9: seek + reset
    avPlayer?.seek(avPlayer.duration / 2, 3); // 3: CLOSEST
    avPlayer?.reset((err: BusinessError) => {
      if (err == null) {
        expect(avPlayer?.state).assertEqual(IDLE);
        console.info(TAG, testName + ' case reset success!!');
        setSource(avPlayer, src, testName);
      } else {
        mediaTestBase.assertErr('reset', err, done);
      }
    });
  });
  avPlayer?.on('seekDone', async (seekDoneTime) => {
    seekDoneCnt++;
    console.info(TAG,
      testName + ` case seekDone called, seekDoneCnt is ${seekDoneCnt}, seekDoneTime is ${seekDoneTime}`);
    switch (seekDoneCnt) {
      case 1:
        expect(avPlayer?.state).assertEqual(PREPARED);
        // step 3: seek(prepared) -> play
        avPlayer?.play((err: BusinessError) => {
          if (err != null) {
            mediaTestBase.assertErr('play', err, done);
          }
        });
        break;
      case 2:
        // step 5: seek + play
        avPlayer?.seek(avPlayer.duration / 2, media.SeekMode.SEEK_NEXT_SYNC);
        avPlayer?.play();
        break;
      case 3:
        // step 6: seek  + setVolume
        avPlayer?.setVolume(0.5);
        avPlayer?.seek(avPlayer.duration / 2, media.SeekMode.SEEK_CLOSEST);
        avPlayer?.play();
        break;
      case 4:
        // step 7: seek + seek
        avPlayer?.seek(avPlayer.duration / 2);
        avPlayer?.seek(avPlayer.duration, media.SeekMode.SEEK_NEXT_SYNC);
        avPlayer?.play();
        break;
      case 5:
        // step 8: seek duration
        avPlayer?.seek(avPlayer.duration, media.SeekMode.SEEK_PREV_SYNC);
        break;
      default:
        avPlayer?.play();
        break;
    }
  });
  setCallback(avPlayer, 'volumeChange', volumeCnt, testName);
  setCallback(avPlayer, 'speedDone', speedDoneCnt, testName);
  setCallback(avPlayer, 'bitrateDone', null, testName);
  setCallback(avPlayer, 'timeUpdate', null, testName);
  setCallback(avPlayer, 'bufferingUpdate', null, testName);
  setCallback(avPlayer, 'durationUpdate', null, testName);
  setCallback(avPlayer, 'startRenderFrame', null, testName);
  setCallback(avPlayer, 'videoSizeChange', null, testName);
  setCallback(avPlayer, 'audioInterrupt', null, testName);
  setCallback(avPlayer, 'availableBitrates', null, testName);
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
  });
}

export async function testAVPlayerSeek(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  playTest: PlayTest, playTime: number, done: Function, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`);
  media.createAVPlayer((err, video) => {
    console.info(TAG, testName + ` case media err: ${err}`);
    if (typeof (video) != 'undefined') {
      console.info(TAG, testName + ' case createAVPlayer success');
      avPlayer = video;
      setAVPlayerSeekCb(src, avPlayer, playTest, playTime, done, testName);
      setSource(avPlayer, src, testName);
    }
    if (err != null) {
      console.error(TAG, testName + ` case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}