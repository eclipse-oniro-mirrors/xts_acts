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
import { expect } from "../../../hypium/index";
import MediaTestBase from './MediaTestBase.test';
import audio from '@ohos.multimedia.audio';
import { BusinessError } from '@ohos.base';
import { globalThis } from './Util.test';

const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';
const SLEEP_TIME = 200;

let mediaTestBase = new MediaTestBase()

export interface PlayTest {
  width: number,
  height: number,
  duration: number
}

export async function setSource(avPlayer: media.AVPlayer | null, src: string | media.AVFileDescriptor | undefined) {
  if (!avPlayer) {
    console.error('case avPlayer is null');
  } else {
    if (typeof (src) == 'string') {
      console.info('case src test');
      avPlayer.url = src as string;
    } else {
      console.info('case fdsrc test');
      avPlayer.fdSrc = src as media.AVFileDescriptor;
    }
  }
}

export function setSubtitle(avPlayer: media.AVPlayer | null, src: string | media.AVFileDescriptor) {
  if (!avPlayer) {
    console.error('case avPlayer is null');
    return;
  }
  if (typeof (src) === 'string') {
    console.info('case src test');
    avPlayer.addSubtitleFromUrl(src as string);
  } else {
    const descriptor = src as media.AVFileDescriptor;
    console.info('case fdsrc test setSubtitle');
    avPlayer.addSubtitleFromFd(descriptor.fd, descriptor.offset, descriptor.length);
  }
}

function checkPlayTest(avPlayer: media.AVPlayer | null, playTest: PlayTest) {
  if (avPlayer == null) {
    return;
  }
  expect(Math.abs(avPlayer!!.duration - playTest.duration)).assertLess(500);
  if (playTest.width > 0) {
    expect(avPlayer?.width).assertEqual(playTest.width);
    expect(avPlayer?.height).assertEqual(playTest.height);
  }
}

function toPreparePromise(avPlayer: media.AVPlayer | null, playTest: PlayTest) {
  if (!avPlayer) {
    console.info('case avPlayer is null');
    return;
  }
  avPlayer?.prepare().then(() => {
    console.info('case prepare called');
    console.info('case avPlayer.duration: ' + avPlayer.duration);
    checkPlayTest(avPlayer, playTest);
  }).catch(mediaTestBase.catchCallback);
}

async function preparePromise(avPlayer: media.AVPlayer | null) {
  if (!avPlayer) {
    console.info('case avPlayer is null');
  } else {
    await avPlayer!!.prepare()
    .then(() => {
      console.info('case prepare called');
      console.info('case avPlayer.duration: ' + avPlayer.duration);
    }).catch(mediaTestBase.catchCallback);
  }
}

function addCnt(countArr: Array<number> | null) {
  if (countArr != null) {
    countArr[0]++;
  }
}

export function setCallback(avPlayer: media.AVPlayer | null, type: string, countArr: Array<number> | null) {
  if (avPlayer == null) {
    return;
  }
  switch (type) {
    case 'volumeChange':
      avPlayer?.onVolumeChange((volume) => {
        console.info(`case volumeChange called, volume is ${volume}`);
        addCnt(countArr);
      });
      break;
    case 'endOfStream':
      avPlayer?.onEndOfStream(() => {
        console.info(`case endOfStream called`);
        addCnt(countArr);
      });
      break;
    case 'speedDone':
      avPlayer?.onSpeedDone((speedMode) => {
        console.info(`case speedDone called, speedMode is ${speedMode}`);
        addCnt(countArr);
      });
      break;
    case 'bitrateDone':
      avPlayer?.onBitrateDone((bitrate) => {
        console.info(`case bitrateDone called, bitrate is ${bitrate}`);
      });
      break;
    case 'timeUpdate':
      avPlayer?.onTimeUpdate((time) => {
        console.info('case timeUpdate callback, time:' + time);
      });
      break;
    case 'bufferingUpdate':
      avPlayer?.onBufferingUpdate((infoType, value) => {
      });
      break;
    case 'durationUpdate':
      avPlayer?.onDurationUpdate((duration) => {
        console.info('case durationUpdate called,duration:' + duration);
        addCnt(countArr);
      });
      break;
    case 'startRenderFrame':
      avPlayer?.onStartRenderFrame(() => {
        console.info('case startRenderFrame called');
        addCnt(countArr);
      });
      break;
    case 'videoSizeChange':
      avPlayer?.onVideoSizeChange((w, h) => {
        console.info(`case videoSizeChange called, weight is ${w}, height is ${h}`);
        addCnt(countArr);
      });
      break;
    case 'audioInterrupt':
      break;
    case 'availableBitrates':
      avPlayer?.onAvailableBitrates((bitrates) => {
        for (let i = 0; i < bitrates.length; i++) {
          console.info('case availableBitrates : ' + bitrates[i]);
        }
        addCnt(countArr);
      });
      break;
    default:
      break;
  }
}

export function offCallback(avPlayer: media.AVPlayer | null, typeArr: Array<string>) {
  if (avPlayer == null) {
    console.log('avPlayer is null')
    return;
  }
  for (let i = 0; i < typeArr.length; i++) {
    switch (typeArr[i]) {
      case 'stateChange':
        avPlayer.offStateChange();
        break;
      case 'volumeChange':
        avPlayer.offVolumeChange();
        break;
      case 'endOfStream':
        avPlayer.offEndOfStream();
        break;
      case 'seekDone':
        avPlayer.offSeekDone();
        break;
      case 'speedDone':
        avPlayer.offSpeedDone();
        break;
      case 'timeUpdate':
        avPlayer.offTimeUpdate();
        break;
      case 'durationUpdate':
        avPlayer.offDurationUpdate();
        break;
      case 'bufferingUpdate':
        avPlayer.offBufferingUpdate();
        break;
      case 'startRenderFrame':
        avPlayer.offStartRenderFrame();
        break;
      case 'videoSizeChange':
        avPlayer.offVideoSizeChange();
        break;
      case 'audioInterrupt':
        break;
      case 'availableBitrates':
        avPlayer.offAvailableBitrates();
        break;
      case 'error':
        avPlayer.offError();
        break;
      default:
        break;
    }
  }
}

export function setAVPlayerFunCb(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  playTest: PlayTest,
  playTime: number, done: () => void) {
  let volumeCnt: number[] = [0];
  let endOfStreamCnt: number[] = [0];
  let speedDoneCnt: number[] = [0];
  let videoSizeCnt: number[] = [0];
  let startRenderFrameCnt: number[] = [0];
  let durationUpdateCnt: number[] = [0];
  let seekDoneCnt: number[] = [0];
  let prepareCnt = 0;
  let playCnt = 0;
  let completedCnt = 0;
  let surfaceID: string = globalThis.value;
  console.info(`case setAVPlayerFunCb in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    if (reason == media.StateChangeReason.BACKGROUND) {
      console.info(`case media.StateChangeReason.BACKGROUND`);
      await avPlayer!!.release().then(() => {
      }).catch(mediaTestBase.catchCallback);
    }
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        expect(avPlayer?.state).assertEqual(INITIALIZED);
        if (avPlayer != null) {
          avPlayer!!.surfaceId = surfaceID;
          let info: audio.AudioRendererInfo = {
            usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
            rendererFlags: 0
          }
          toPreparePromise(avPlayer, playTest);
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
            }).catch(mediaTestBase.catchCallback);
          } else {
            // step 14: prepared -> seek
            avPlayer?.seek(avPlayer!!.duration);
          }
        }
        break;
      case PLAYING:
        playCnt++;
        if (!avPlayer) {
          console.log('avPlayer is null')
          break;
        } else if (playCnt == 1) {
          expect(avPlayer?.state).assertEqual(PLAYING);
          // step 3: playing -> seek duration/3
          await mediaTestBase.msleepAsync(playTime);
          avPlayer?.seek(avPlayer!!.duration / 3);
        } else if (playCnt == 2) {
          expect(avPlayer?.state).assertEqual(PLAYING);
          //  step 7: playing -> seek duration when loop true
          avPlayer?.seek(avPlayer!!.duration, media.SeekMode.SEEK_NEXT_SYNC);
        } else if (playCnt == 3) {
          // step 10: playing -> stop
          avPlayer?.stop().then(() => {
          }).catch(mediaTestBase.catchCallback);
        }
        break;
      case PAUSED:
        if (avPlayer) {
          expect(avPlayer?.state).assertEqual(PAUSED);
          // step 5: pause -> seek 0
          avPlayer!!.loop = true;
          avPlayer?.seek(0, media.SeekMode.SEEK_NEXT_SYNC);
        }
        break;
      case COMPLETED:
        completedCnt++;
        if (avPlayer) {
          expect(avPlayer?.currentTime).assertEqual(avPlayer!!.duration);
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
            }).catch(mediaTestBase.catchCallback);
          }).catch(mediaTestBase.catchCallback);
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
            setSource(avPlayer!, src);
          }
        }).catch(mediaTestBase.catchCallback);
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
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onSeekDone((seekDoneTime: int) => {
    seekDoneCnt[0]++;
    console.info(`case seekDone called, seekDoneCnt is ${seekDoneCnt}, seekDoneTime is ${seekDoneTime}`);
    let count: int = Math.floor(seekDoneCnt[0]) as int;
    switch (count) {
      case 2:
        // step 6: seek(paused) -> play
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.play();
        avPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_2_00_X);
        avPlayer?.setVolume(0.5);
        break;
      case 1:
        expect(avPlayer?.state).assertEqual(PLAYING);
        // step 4: seek(playing) -> pause
        avPlayer?.pause().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      case 3:
      case 4:
      case 5:
        if (!avPlayer) {
          console.log('avPlayer is null')
          break;
        }
        let nowTime = avPlayer!!.currentTime;
        if (avPlayer!!.state == PREPARED) {
          // step 15: prepared -> play
          avPlayer?.play();
        }
        if (nowTime > avPlayer!!.duration / 2) {
          avPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
          await mediaTestBase.msleepAsync(avPlayer!!.duration - nowTime + playTime);
        }
        if (avPlayer!!.loop == true) {
          // step 8: playing -> seek duration when loop false
          expect(avPlayer?.state).assertEqual(PLAYING);
          avPlayer!!.loop = false;
          avPlayer?.seek(avPlayer!!.duration, media.SeekMode.SEEK_NEXT_SYNC);
        }
        break;
    }
  });
  setCallback(avPlayer, 'volumeChange', volumeCnt);
  setCallback(avPlayer, 'endOfStream', endOfStreamCnt);
  setCallback(avPlayer, 'speedDone', speedDoneCnt);
  setCallback(avPlayer, 'bitrateDone', null);
  setCallback(avPlayer, 'timeUpdate', null);
  setCallback(avPlayer, 'bufferingUpdate', null);
  setCallback(avPlayer, 'durationUpdate', durationUpdateCnt);
  setCallback(avPlayer, 'startRenderFrame', startRenderFrameCnt);
  setCallback(avPlayer, 'videoSizeChange', videoSizeCnt);
  setCallback(avPlayer, 'availableBitrates', null);
  avPlayer?.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer!!.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export function sleep(time: number) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok");
    }, time.toInt());
  }).then(() => {
    console.info(`sleep ${time} over...`);
  });
}

async function setAVPlayerPlayAndPauseWithCallBack(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, playTime: number, done: () => void) {
  let playPauseCount = 0;
  let surfaceID: string = globalThis.value;
  console.info(`case setAVPlayerPlayAndPauseWithCallBack in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.log('avPlayer is null')
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        console.info('playPauseLoopWithCallBack play state is INITIALIZED')
        preparePromise(avPlayer);
        break;
      case PREPARED:
        // step 1: initialized -> prepared -> play
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info('playPauseLoopWithCallBack play state is PREPARED')
        avPlayer?.play()
        break;
      case PLAYING:
        if (!avPlayer) {
          console.log('avPlayer is null')
          break;
        }
        avPlayer!!.loop = true;
        console.info('playPauseLoopWithCallBack play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        playPauseCount++;
        await mediaTestBase.msleepAsync(playTime);
        if (playPauseCount == 1001) {
          // step 4: playing -> stop -> release
          avPlayer?.stop().then(() => {
            console.info('playPauseLoopWithCallBack avPlayer from play to stop')
            avPlayer?.release().then(() => {
              console.info('playPauseLoopWithCallBack avPlayer from stop to release')
              done();
            }).catch(mediaTestBase.catchCallback);
          }).catch(mediaTestBase.catchCallback);
        } else {
          // step 2: playing -> pause loop
          avPlayer?.pause().then(() => {
            console.info('playPauseLoopWithCallBack avPlayer from play to pause,time is :' + playPauseCount)
          }).catch(mediaTestBase.catchCallback);
        }
        break;
      case PAUSED:
        console.info('playPauseLoopWithCallBack play state is PAUSED')
        expect(avPlayer?.state).assertEqual(PAUSED);
        // step 3: pause -> playing loop
        avPlayer?.play().then(() => {
          console.info('playPauseLoopWithCallBack avPlayer from pause to play,time is :' + playPauseCount)
        }).catch(mediaTestBase.catchCallback);
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer!!.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

async function idle(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined) {
  console.info(`case media source: ${src}`)
  await media.createAVPlayer().then((video: media.AVPlayer | undefined) => {
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
    } else {
      console.error('case createAVPlayer failed');
      expect().assertFail();
    }
  }).catch(mediaTestBase.catchCallback);
  return avPlayer;
}

export async function avPlayerWithCallBack(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, playTime: number, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await setAVPlayerPlayAndPauseWithCallBack(src, avPlayer!, playTime, done);
  await setSource(avPlayer!, src);
}

let createToReleaseLoopCount = 0;

async function createToReleaseLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  console.info(`case createToReleaseLoop in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case IDLE:
        if (!avPlayer) {
          console.log('avPlayer is null')
          break;
        }
        expect(avPlayer?.state).assertEqual(IDLE);
        setSource(avPlayer!, src);
        break;
      case INITIALIZED:
        if (!avPlayer) {
          console.log('avPlayer is null')
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        console.info('createToReleaseLoop play state is INITIALIZED')
        // step 1: initialized -> prepared -> play
        avPlayer?.release()
        break;
      case RELEASED:
        expect(avPlayer?.state).assertEqual(RELEASED);
        createToReleaseLoopCount++
        if (createToReleaseLoopCount == 1001) {
          done();
        } else {
          avPlayer = await idle(src, avPlayer!)
          await createToReleaseLoop(src, avPlayer!, done)
          await setSource(avPlayer!, src);
        }
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer!!.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function createToRelease(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer!)
  await createToReleaseLoop(src, avPlayer!, done)
  await setSource(avPlayer!, src);
  console.info('CreateToRelease setSource');
}

export async function playToCompleted(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await playToCompletedLoop(src, avPlayer!, done);
  await setSource(avPlayer!, src);
}

async function playToCompletedLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: () => void) {
  let playToCompletedCount = 0;
  let surfaceID: string = globalThis.value;
  console.info(`case playToCompletedLoop in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.log('avPlayer is null')
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        console.info('playToCompletedLoop play state is INITIALIZED')
        // step 1: initialized -> prepared -> play
        await preparePromise(avPlayer!);
        await sleep(2000);
        avPlayer?.play()
        break;
      case PLAYING:
        if (!avPlayer) {
          console.log('avPlayer is null')
          break;
        }
        avPlayer!!.loop = false;
        console.info('playToCompletedLoop play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        playToCompletedCount++;
        if (playToCompletedCount == 1001) {
          // step 4: playing -> stop -> release
          avPlayer?.stop().then(() => {
            console.info('playToCompletedLoop avPlayer from play to stop')
            avPlayer?.release().then(() => {
              console.info('playToCompletedLoop avPlayer from stop to release')
              done();
            }).catch(mediaTestBase.catchCallback);
          }).catch(mediaTestBase.catchCallback);
        } else {
          // step 2: playing -> seek loop
          avPlayer?.seek(10034, media.SeekMode.SEEK_NEXT_SYNC)
          console.info('playToCompletedLoop avPlayer from play to seek,time is :' + playToCompletedCount)
        }
        break;
      case COMPLETED:
        expect(avPlayer?.currentTime).assertEqual(avPlayer?.duration);
        expect(avPlayer?.state).assertEqual(COMPLETED);
        console.info('playToCompletedLoop avPlayer from COMPLETED to play')
        // step 3: COMPLETED -> play loop
        avPlayer?.play();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer!!.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function seekLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer!)
  await setSource(avPlayer!, src);
  console.info('seekLoop setSource');
  await sleep(20);
  if (avPlayer && avPlayer.state == INITIALIZED) {
    avPlayer.surfaceId = surfaceID;
    console.info('seekLoop case prepare success');
    await preparePromise(avPlayer);
    await sleep(2000);
  }
  await avPlayer!!.play().then(() => {
    console.info('seekLoop play success');
    expect(avPlayer?.state).assertEqual(PLAYING);
  }).catch(mediaTestBase.catchCallback);
  if (avPlayer) {
    await seekLoopWithCallback(avPlayer)
    console.info('seekLoop avPlayer from play to seek')
  }
  // play seek loop 1000 times
  await avPlayer!!.stop().then(() => {
    console.info('seekLoopWithCallback avPlayer from play to stop')
  }).catch(mediaTestBase.catchCallback);
  await avPlayer!!.release().then(() => {
    console.info('seekLoopWithCallback avPlayer from stop to release')
    expect(avPlayer?.state).assertEqual(RELEASED);
    done();
  }).catch(mediaTestBase.catchCallback);
}

async function seekLoopWithCallback(avPlayer: media.AVPlayer) {
  for (let loopTime = 0; loopTime < 5000; loopTime += 5) {
    new Promise<string>((resolve, reject) => {
      avPlayer?.onSeekDone(seekDoneTime => {
        console.info(`case seekDone called seekDoneTime is ${seekDoneTime}`);
        resolve("ok");
      });
      avPlayer.seek(loopTime);
      console.info(`case seekLoopWithCallback loopTime is ${loopTime}`);
    });
  }
}

async function seekLoopWithoutCallbackLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: () => void) {
  let seekLoopWithoutCallbackLoop = 0;
  let surfaceID: string = globalThis.value;
  console.info(`case seekLoopWithoutCallbackLoop in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.log('avPlayer is null')
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        console.info('seekLoopWithoutCallbackLoop play state is INITIALIZED')
        // step 1: prepare
        preparePromise(avPlayer!);
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        // step 2: sop
        avPlayer?.play()
        break;
      case PLAYING:
        console.info('seekLoopWithoutCallbackLoop play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        // step 5: PLAYING-IDLE
        for (let loopTime = 0; loopTime < 1000; loopTime++) {
          avPlayer?.seek(loopTime)
          console.info(`case seekLoopWithoutCallbackLoop loopTime is ${loopTime}`);
          if (loopTime == 999) {
            avPlayer?.stop().then(() => {
              console.info('seekLoopWithoutCallbackLoop avPlayer from play to stop')
              avPlayer?.release().then(() => {
                console.info('seekLoopWithoutCallbackLoop avPlayer from stop to release')
                expect(avPlayer?.state).assertEqual(RELEASED);
                done();
              }).catch(mediaTestBase.catchCallback);
            }).catch(mediaTestBase.catchCallback);
          }
        }
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer!!.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function seekLoopWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await seekLoopWithoutCallbackLoop(src, avPlayer!, done)
  await setSource(avPlayer!, src);
  console.info('seekLoopWithoutCallback setSource');
}

async function prepareToStopLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: () => void) {
  let prepareToStopLoopCount = 0;
  let surfaceID: string = globalThis.value;
  console.info(`case prepareToStopLoop in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.log('avPlayer is null')
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        console.info('prepareToStopLoop play state is INITIALIZED')
        // step 1: prepare
        preparePromise(avPlayer!);
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        // step 2: sop
        avPlayer?.stop()
        break;
      case STOPPED:
        expect(avPlayer?.state).assertEqual(STOPPED);
        prepareToStopLoopCount++
        if (prepareToStopLoopCount == 1001) {
          // end: release
          avPlayer?.release().then(() => {
            console.info('prepareToStopLoop avPlayer from stop to release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          preparePromise(avPlayer!);
        }
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer!!.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function prepareToStop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await prepareToStopLoop(src, avPlayer!, done)
  setSource(avPlayer!, src);
  console.info('prepareToStopLoop setSource');
}

async function prepareToResetLoop(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: () => void) {
  let prepareToResetLoopCount = 0;
  let surfaceID: string = globalThis.value;
  console.info(`case prepareToResetLoop in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      // step 1: create-Idle
      case IDLE:
        expect(avPlayer?.state).assertEqual(IDLE);
        prepareToResetLoopCount++;
        if (prepareToResetLoopCount == 1001) {
          // end: release
          avPlayer?.release().then(() => {
            console.info('prepareToResetLoop avPlayer from stop to release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          // step 2: idle-INITIALIZED
          setSource(avPlayer!, src);
          console.info('prepareToResetLoop avPlayer from play to seek,time is :' + prepareToResetLoopCount)
        }
        break;
      case INITIALIZED:
        if (!avPlayer) {
          console.error('case avPlayer is null');
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        console.info('prepareToResetLoop play state is INITIALIZED')
        // step 3: INITIALIZED-PREPARED
        preparePromise(avPlayer!);
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        // step 4: PREPARED-PLAYING
        avPlayer?.play()
        break;
      case PLAYING:
        console.info('prepareToResetLoop play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        // step 5: PLAYING-IDLE
        avPlayer?.reset()
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer!!.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function prepareToReset(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  // url -> prepare -> play -> reset loop 1000 times
  await prepareToResetLoop(src, avPlayer!, done)
  await setSource(avPlayer!, src);
}

let createToReleaseLoopCount2 = 0;

async function createToReleaseLoop2(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null | undefined, done: () => void) {
  let surfaceID: string = globalThis.value;
  console.info(`case createToReleaseLoop2 in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case IDLE:
        expect(avPlayer?.state).assertEqual(IDLE);
        setSource(avPlayer!, src);
        break;
      case INITIALIZED:
        if (!avPlayer) {
          console.error('case avPlayer is null');
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        console.info('createToReleaseLoop2 play state is INITIALIZED')
        preparePromise(avPlayer!);
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        // step 4: PREPARED-PLAYING
        avPlayer?.play()
        break;
      case PLAYING:
        console.info('createToReleaseLoop2 play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        avPlayer?.release()
        break;
      case RELEASED:
        expect(avPlayer?.state).assertEqual(RELEASED);
        createToReleaseLoopCount2++
        if (createToReleaseLoopCount2 == 1001) {
          done();
        } else {
          avPlayer = await idle(src, avPlayer!)
          await createToReleaseLoop2(src, avPlayer!, done)
          await setSource(avPlayer!, src);
        }
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer!!.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function createToRelease2(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await createToReleaseLoop2(src, avPlayer!, done)
  await setSource(avPlayer!, src);
  console.info('createToRelease2 setSource');
}

let createLoopTime: number = 0;
let createTotalTime: number = 0;
let createStart: number = 0;

export async function createTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  createStart = Date.now();
  console.info(`createTimeWithCallback createStart time is : ${createStart}`)
  createTimeCallback(src, avPlayer!, done)
}

function createTimeCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: () => void) {
  let end: number;
  let execution: number;
  avPlayer?.onStateChange((state, reason) => {
    console.info(`createTimeCallback stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`createTimeCallback state is ${state}`);
    switch (state) {
      case IDLE:
        expect(avPlayer?.state).assertEqual(IDLE);
        end = Date.now();
        console.info(`createTimeCallback end time is : ${end}`)
        execution = (end - createStart)
        createTotalTime = createTotalTime + execution;
        console.info("createTimeCallback execution time  is :" + execution)
        createLoopTime++;
        avPlayer?.release()
      case RELEASED:
        console.info('createTimeCallback play state is release')
        expect(avPlayer?.state).assertEqual(RELEASED);
        if (createLoopTime == 10) {
          let avg = createTotalTime / 10;
          console.info("createTimeCallback avg time  is :" + avg)
          createLoopTime = 0;
          createTotalTime = 0;
          done();
        } else {
          avPlayer = null;
          createTimeWithCallback(src, avPlayer!, done)
        }
        break;
      default:
        break;
    }
  });
}

export async function createTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  for (let i = 0; i < 10; i++) {
    let start = Date.now();
    console.info(`createTimeWithoutCallback start time is : ${start}`)
    avPlayer = await idle(src, avPlayer!)
    let end = Date.now()
    let execution = (end - start)
    console.info("createTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('createTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("createTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function prepareTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('prepareTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    let start = Date.now();
    console.info(`prepareTimeWithoutCallback start time is : ${start}`)
    let end: number = 0;
    await avPlayer!!.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info('prepareTimeWithoutCallback avPlayer state is prepared')
      end = Date.now()
      console.info(`prepareTimeWithoutCallback end time is : ${end}`)
    }).catch(mediaTestBase.catchCallback);
    await mediaTestBase.msleepAsync(SLEEP_TIME)
    let execution = (end - start)
    console.info("prepareTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('prepareTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("prepareTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function prepareTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await prepareTimeCallback(src, avPlayer!, done)
  await setSource(avPlayer!, src);
}

async function prepareTimeCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number;
  let end: number;
  let execution: number;
  let loopTime = 0;
  let totalTime: number = 0;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case IDLE:
        expect(avPlayer?.state).assertEqual(IDLE);
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info('prepareTimeWithCallback avPlayer is release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info("prepareTimeWithCallback avg time is :" + avg)
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          setSource(avPlayer!, src)
        }
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('prepareTimeWithCallback play state is INITIALIZED')
        // step 1: initialized -> prepared
        start = Date.now();
        console.info(`prepareTimeWithCallback start time is : ${start}`)
        avPlayer?.prepare()
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info('prepareTimeWithCallback avPlayer state is prepared')
        end = Date.now();
        console.info(`prepareTimeWithCallback end time is : ${end}`)
        execution = (end - start)
        console.info("prepareTimeWithCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        loopTime++;
        avPlayer?.reset()
        break;
      default:
        break;
    }
  });
}

export async function playTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null |undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('playTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    await avPlayer!!.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info('playTimeWithoutCallback avPlayer state is prepared')
    }).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    let end: number = 0;
    console.info(`playTimeWithoutCallback start time is : ${start}`)
    await avPlayer!!.play().then(() => {
      end = Date.now();
      console.info(`playTimeWithoutCallback end time is : ${end}`)
      console.info('playTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }).catch(mediaTestBase.catchCallback);
    let execution = (end - start)
    console.info("playTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('playTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
      avPlayer = null;
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("playTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function playTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await playTimeCallback(avPlayer, done)
  await setSource(avPlayer!, src);
}

export async function playTimeCallback(avPlayer: media.AVPlayer | undefined | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number = 0;
  let end: number = 0;
  let execution: number = 0;
  let loopTime: number = 0;
  let totalTime: number = 0;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('playTimeCallback play state is INITIALIZED')
        // step 1: initialized -> prepared
        avPlayer?.prepare((err: BusinessError | null) => {
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info('playTimeCallback play state is prepared')
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info('playTimeCallback avPlayer state is prepared')
        start = Date.now();
        console.info(`playTimeCallback start time is : ${start}`)
        // step 2: prapared -> play
        avPlayer?.play()
        break;
      case PLAYING:
        console.info('playTimeCallback play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        end = Date.now();
        console.info(`playTimeCallback end time is : ${end}`)
        execution = (end - start)
        console.info("playTimeCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        loopTime++;
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info('playTimeCallback avPlayer is release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info("playTimeWithCallback avg time is :" + avg)
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          // step 3: playing -> pause loop
          setTimeout(() => {
            avPlayer?.pause()
          }, 200);
        }
        break;
      case PAUSED:
        console.info('playTimeWithCallback play state is PAUSED')
        expect(avPlayer?.state).assertEqual('paused');
        start = Date.now();
        console.info(`playTimeCallback start time is : ${start}`)
        avPlayer?.play()
        break;
      default:
        break;
    }
  });
}

export async function pauseTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    let execution: number = 0;
    let end: number = 0;
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('pauseTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    await avPlayer!!.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info('pauseTimeWithoutCallback avPlayer state is prepared')
    }).catch(mediaTestBase.catchCallback);
    await avPlayer!!.play().then(() => {
      console.info('pauseTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }).catch(mediaTestBase.catchCallback);
    let start = Date.now();

    console.info(`pauseTimeWithoutCallback start time is : ${start}`)
    await avPlayer!!.pause().then(() => {
      console.info('pauseTimeWithoutCallback pause success');
      expect(avPlayer?.state).assertEqual(PAUSED);
      end = Date.now();
      console.info(`pauseTimeWithoutCallback end time is : ${end}`)
      execution = (end - start)
      console.info("pauseTimeWithoutCallback execution time  is :" + execution)
    }).catch(mediaTestBase.catchCallback);
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('pauseTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("pauseTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function pauseTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await pauseTimeCallback(avPlayer, done)
  await setSource(avPlayer!, src);
}

async function pauseTimeCallback(avPlayer: media.AVPlayer | undefined | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number = 0;
  let end: number = 0;
  let execution: number = 0;
  let loopTime: number = 0;
  let totalTime: number = 0;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('pauseTimeCallback play state is INITIALIZED')
        // step 1: initialized -> prepared
        avPlayer?.prepare((err: BusinessError | null) => {
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info('pauseTimeCallback play state is prepared')
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info('pauseTimeCallback avPlayer state is prepared')
        avPlayer?.play()
        break;
      case PLAYING:
        console.info('pauseTimeCallback play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        setTimeout(() => {
          start = Date.now();
          console.info(`pauseTimeCallback start time is : ${start}`)
          avPlayer?.pause()
        }, 200);
        break;
      case PAUSED:
        expect(avPlayer?.state).assertEqual(PAUSED);
        end = Date.now();
        console.info(`pauseTimeCallback end time is : ${end}`)
        execution = (end - start)
        console.info("pauseTimeCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        loopTime++;
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info('pauseTimeCallback avPlayer is release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info("pauseTimeCallback avg time is :" + avg)
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          avPlayer?.play()
        }
        break;
      default:
        break;
    }
  });
}

export async function stopTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('stopTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    await avPlayer!!.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info('stopTimeWithoutCallback avPlayer state is prepared')
    }).catch(mediaTestBase.catchCallback);
    await avPlayer!!.play().then(() => {
      console.info('stopTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    console.info(`stopTimeWithoutCallback start time is : ${start}`)
    let end: number = 0;
    await avPlayer!!.stop().then(() => {
      end = Date.now();
      console.info(`stopTimeWithoutCallback end time is : ${end}`)
      expect(avPlayer?.state).assertEqual(STOPPED);
      console.info('stopTimeWithoutCallback avPlayer state is stop')
    }).catch(mediaTestBase.catchCallback);
    let execution = (end - start)
    console.info("stopTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('stopTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("stopTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function stopTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await stopTimeCallback(src, avPlayer, done)
  await setSource(avPlayer!, src);
}

async function stopTimeCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number = 0;
  let end: number = 0;
  let execution: number = 0;
  let loopTime: number = 0;
  let totalTime: number = 0;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case IDLE:
        setSource(avPlayer!, src);
        break;
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('stopTimeCallback play state is INITIALIZED')
        // step 1: initialized -> prepared
        avPlayer?.prepare((err: BusinessError | null) => {
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info('stopTimeCallback play state is prepared')
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info('stopTimeCallback avPlayer state is prepared')
        start = Date.now();
        console.info(`stopTimeCallback start time is : ${start}`)
        loopTime++;
        avPlayer?.stop()
        break;
      case STOPPED:
        expect(avPlayer?.state).assertEqual(STOPPED);
        end = Date.now();
        console.info(`stopTimeCallback end time is : ${end}`)
        execution = (end - start)
        console.info("stopTimeCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info('stopTimeCallback avPlayer is release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info("stopTimeCallback avg time is :" + avg)
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          avPlayer?.reset()
        }
        break;
      default:
        break;
    }
  });
}

export async function resetTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('resetTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    await avPlayer!!.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info('resetTimeWithoutCallback avPlayer state is prepared')
    }).catch(mediaTestBase.catchCallback);
    let end: number = 0;
    await avPlayer!!.play().then(() => {
      console.info('resetTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    console.info(`resetTimeWithoutCallback start time is : ${start}`)
    await avPlayer!!.reset().then(() => {
      end = Date.now();
      console.info(`resetTimeWithoutCallback end time is : ${end}`)
      console.info('reset success');
      expect(avPlayer?.state).assertEqual(IDLE);
    }).catch(mediaTestBase.catchCallback);
    let execution = (end - start)
    console.info("resetTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('resetTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("resetTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function resetTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await resetTimeCallback(src, avPlayer, done)
  await setSource(avPlayer!, src);
}

async function resetTimeCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number = 0;
  let end: number = 0;
  let execution: number = 0;
  let loopTime: number = 0;
  let totalTime: number = 0;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case IDLE:
        expect(avPlayer?.state).assertEqual(IDLE);
        end = Date.now();
        console.info(`resetTimeCallback end time is : ${end}`)
        execution = (end - start)
        console.info("resetTimeCallback execution time  is :" + execution)
        totalTime = totalTime + execution;
        loopTime++;
        if (loopTime == 10) {
          avPlayer!!.release().then(() => {
            console.info('resetTimeCallback avPlayer is release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info("resetTimeCallback avg time is :" + avg)
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          setSource(avPlayer!, src)
        }
        break;
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('resetTimeCallback play state is INITIALIZED')
        start = Date.now();
        console.info(`resetTimeCallback start time is : ${start}`)
        avPlayer?.reset().then(() => {
          console.info('reset success');
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
}

export async function releaseTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('releaseTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    let start = Date.now();
    console.info(`releaseTimeWithoutCallback start time is : ${start}`)
    let end: number = 0;
    await avPlayer!!.release().then(() => {
      console.info('releaseTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
    end = Date.now();
    console.info(`releaseTimeWithoutCallback end time is : ${end}`)
    let execution = (end - start)
    console.info("releaseTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
  }
  let avg = totalTime / 10;
  console.info("releaseTimeWithoutCallback avg time  is :" + avg)
  done();
}

let releaseTotalTime: number = 0;
let releaseLoop: number = 0;

export async function releaseTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await releaseTimeCallback(src, avPlayer, done)
  await setSource(avPlayer!, src);
}

async function releaseTimeCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number = 0;
  let end: number = 0;
  let execution: number = 0;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('releaseTimeCallback play state is INITIALIZED')
        start = Date.now();
        console.info(`releaseTimeCallback start time is : ${start}`)
        avPlayer?.release()
        break;
      case RELEASED:
        console.info('releaseTimeCallback play state is release')
        expect(avPlayer?.state).assertEqual(RELEASED);
        end = Date.now();
        console.info(`releaseTimeCallback end time is : ${end}`)
        execution = (end - start)
        console.info("releaseTimeCallback execution time  is :" + execution)
        releaseTotalTime = releaseTotalTime + execution;
        releaseLoop++;
        if (releaseLoop == 10) {
          let avg = releaseTotalTime / 10;
          console.info("releaseTimeCallback avg time  is :" + avg)
          releaseTotalTime = 0;
          releaseLoop = 0;
          done();
        } else {
          avPlayer = null;
          releaseTimeWithCallback(src, avPlayer!, done)
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

export async function seekTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('seekTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    await avPlayer!!.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info('seekTimeWithoutCallback avPlayer state is prepared')
    }).catch(mediaTestBase.catchCallback);
    let end: number = 0;
    await avPlayer!!.play().then(() => {
      console.info('seekTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    console.info(`seekTimeWithoutCallback start time is : ${start}`)
    avPlayer!!.seek(100)
    end = Date.now();
    console.info(`seekTimeWithoutCallback end time is : ${end}`)
    let execution = (end - start)
    console.info("seekTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('seekTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("seekTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function seekTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await seekTimeCallback(avPlayer, done)
  await setSource(avPlayer!, src);
}

async function seekTimeCallback(avPlayer: media.AVPlayer | undefined | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number = 0;
  let end: number = 0;
  let execution: number = 0;
  let loopTime: number = 0;
  let totalTime: number = 0;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('seekTimeCallback play state is INITIALIZED')
        avPlayer?.prepare((err: BusinessError | null) => {
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info('seekTimeCallback play state is prepared')
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info('seekTimeCallback avPlayer state is prepared')
        avPlayer?.play()
        break;
      case PLAYING:
        console.info('seekTimeCallback play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        start = Date.now();
        console.info(`seekTimeCallback start time is : ${start}`)
        loopTime += 20;
        if (loopTime == 220) {
          avPlayer?.release().then(() => {
            console.info('seekTimeCallback avPlayer is release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info("seekTimeCallback avg time is :" + avg)
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          avPlayer?.seek(loopTime as int)
        }
        break;
      case PAUSED:
        console.info('seekTimeCallback play state is PAUSED')
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.play().then(() => {
          console.info('seekTimeCallback avPlayer from pause to play')
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onSeekDone((seekDoneTime) => {
    end = Date.now();
    console.info(`seekTimeCallback end time is : ${end}`)
    execution = (end - start)
    console.info("seekTimeCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    console.info(`case seekDone called seekDoneTime is ${seekDoneTime}`);
    avPlayer?.pause()
  });
}

export async function getTrackDescriptionTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('getTrackDescriptionTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    await avPlayer!!.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info('getTrackDescriptionTimeWithoutCallback avPlayer state is prepared')
    }).catch(mediaTestBase.catchCallback);
    await avPlayer!!.play().then(() => {
      console.info('getTrackDescriptionTimeWithoutCallback play success');
      expect(avPlayer?.state).assertEqual(PLAYING);
    }).catch(mediaTestBase.catchCallback);
    let arrayDescription: Array<media.MediaDescription>;
    let start = Date.now();
    console.info(`getTrackDescriptionTimeWithoutCallback start time is : ${start}`)
    let end: number = 0;
    await avPlayer!!.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
      if (arrList != null) {
        arrayDescription = arrList;
      } else {
        console.log('video getTrackDescription fail');
      }
    }).catch((error: Error) => {
      console.info(`video catchCallback, error:${error}`);
    });
    end = Date.now();
    console.info(`getTrackDescriptionTimeWithoutCallback end time is : ${end}`)
    let execution = (end - start)
    console.info("getTrackDescriptionTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('getTrackDescriptionTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("getTrackDescriptionTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function getTrackDescriptionTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await getTrackDescriptionTimeCallback(avPlayer, done)
  await setSource(avPlayer!, src);
}

async function getTrackDescriptionTimeCallback(avPlayer: media.AVPlayer | undefined | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number = 0;
  let end: number = 0;
  let execution: number = 0;
  let loopTime: number = 0;
  let totalTime: number = 0;
  let arrayDescription: Array<media.MediaDescription>;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('getTrackDescriptionTimeCallback play state is INITIALIZED')
        avPlayer?.prepare((err: BusinessError | null) => {
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info('getTrackDescriptionTimeCallback play state is prepared')
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info('getTrackDescriptionTimeCallback avPlayer state is prepared')
        avPlayer?.play()
        break;
      case PLAYING:
        console.info('getTrackDescriptionTimeCallback play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        start = Date.now();
        console.info(`getTrackDescriptionTimeCallback start time is : ${start}`)
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info('getTrackDescriptionTimeCallback avPlayer is release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            avPlayer = null;
            let avg = totalTime / 10;
            console.info("getTrackDescriptionTimeCallback avg time is :" + avg)
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          loopTime++;
          avPlayer?.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
            if (arrList != null) {
              arrayDescription = arrList;
              end = Date.now();
              console.info(`getTrackDescriptionTimeCallback end time is : ${end}`)
              execution = (end - start)
              console.info("getTrackDescriptionTimeCallback execution time  is :" + execution)
              totalTime = totalTime + execution;

            } else {
              console.log('video getTrackDescription fail');
            }
          }).catch((error: Error) => {
            console.info(`video catchCallback, error:${error}`);
          });
          setTimeout(() => {
            avPlayer?.pause()
          }, 200);
        }
        break;
      case PAUSED:
        console.info('getTrackDescriptionTimeCallback play state is PAUSED')
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.play().then(() => {
          console.info('getTrackDescriptionTimeCallback avPlayer from pause to play')
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
}

export async function setSpeedTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('setSpeedTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    await avPlayer!!.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info('setSpeedTimeWithoutCallback avPlayer state is prepared')
    }).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    console.info(`setSpeedTimeWithoutCallback start time is : ${start}`)
    avPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
    let end = Date.now();
    console.info(`setSpeedTimeWithoutCallback end time is : ${end}`)
    let execution = (end - start)
    console.info("setSpeedTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('setSpeedTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("setSpeedTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function setSpeedTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await setSpeedTimeCallback(avPlayer, done)
  await setSource(avPlayer!, src);
}

async function setSpeedTimeCallback(avPlayer: media.AVPlayer | undefined, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number = 0;
  let end: number = 0;
  let execution: number = 0;
  let loopTime: number = 0;
  let totalTime: number = 0;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('setSpeedTimeCallback play state is INITIALIZED')
        // step 1: initialized -> prepared
        avPlayer?.prepare((err: BusinessError | null) => {
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info('setSpeedTimeCallback play state is prepared')
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info('setSpeedTimeCallback avPlayer state is prepared')
        avPlayer?.play()
        break;
      case PLAYING:
        console.info('setSpeedTimeCallback play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info('setSpeedTimeCallback avPlayer is release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            let avg = totalTime / 10;
            console.info("setSpeedTimeCallback avg time  is :" + avg)
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          start = Date.now();
          console.info(`setSpeedTimeCallback start time is : ${start}`)
          loopTime++
          avPlayer?.setSpeed(media.PlaybackSpeed.SPEED_FORWARD_1_00_X);
        }
        break;
      case PAUSED:
        console.info('setSpeedTimeCallback play state is PAUSED')
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.play().then(() => {
          console.info('setSpeedTimeCallback avPlayer from pause to play')
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onSpeedDone((speed) => {
    end = Date.now();
    console.info(`setSpeedTimeCallback end time is : ${end}`)
    execution = (end - start)
    console.info("setSpeedTimeCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    console.info('speedDone success,and speed value is:' + speed)
    avPlayer?.pause()
  });
}

export async function setBitrateTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('setBitrateTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    await avPlayer!!.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info('setBitrateTimeWithoutCallback avPlayer state is prepared')
    }).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    console.info(`setBitrateTimeWithoutCallback start time is : ${start}`)
    let bitrate = 96000
    // await avPlayer!!.setBitrate(bitrate)  // 不在本次范围
    let end = Date.now();
    console.info(`setBitrateTimeWithoutCallback end time is : ${end}`)
    let execution = (end - start)
    console.info("setBitrateTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('setBitrateTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("setBitrateTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function setVolumeTimeWithoutCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let totalTime: number = 0;
  let surfaceID: string = globalThis.value;
  for (let i = 0; i < 10; i++) {
    avPlayer = await idle(src, avPlayer!)
    await setSource(avPlayer!, src);
    console.info('setVolumeTimeWithoutCallback setSource');
    await sleep(20)
    if (avPlayer) {
      avPlayer!!.surfaceId = surfaceID;
    }
    await avPlayer!!.prepare().then(() => {
      expect(avPlayer?.state).assertEqual(PREPARED);
      console.info('setVolumeTimeWithoutCallback avPlayer state is prepared')
    }).catch(mediaTestBase.catchCallback);
    let start = Date.now();
    console.info(`setVolumeTimeWithoutCallback start time is : ${start}`)
    let volume = 1.0
    avPlayer?.setVolume(volume)
    let end = Date.now();
    console.info(`setVolumeTimeWithoutCallback end time is : ${end}`)
    let execution = (end - start)
    console.info("setVolumeTimeWithoutCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    await avPlayer!!.release().then(() => {
      console.info('setVolumeTimeWithoutCallback avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
    }).catch(mediaTestBase.catchCallback);
  }
  let avg = totalTime / 10;
  console.info("setVolumeTimeWithoutCallback avg time  is :" + avg)
  done();
}

export async function setVolumeTimeWithCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, avPlayer!)
  await setVolumeTimeCallback(avPlayer, done)
  await setSource(avPlayer!, src);
}

async function setVolumeTimeCallback(avPlayer: media.AVPlayer | undefined, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number = 0;
  let end: number = 0;
  let execution: number = 0;
  let loopTime: number = 0;
  let totalTime: number = 0;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('setVolumeTimeCallback play state is INITIALIZED')
        // step 1: initialized -> prepared
        avPlayer?.prepare((err: BusinessError | null) => {
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.info('setVolumeTimeCallback play state is prepared')
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        console.info('setVolumeTimeCallback avPlayer state is prepared')
        avPlayer?.play()
        break;
      case PLAYING:
        console.info('setVolumeTimeCallback play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        if (loopTime == 10) {
          avPlayer?.release().then(() => {
            console.info('setVolumeTimeCallback avPlayer is release')
            expect(avPlayer?.state).assertEqual(RELEASED);
            let avg = totalTime / 10;
            console.info("setVolumeTimeCallback avg time  is :" + avg)
            done();
          }).catch(mediaTestBase.catchCallback);
        } else {
          start = Date.now();
          console.info(`setVolumeTimeCallback start time is : ${start}`)
          loopTime++
          let volume = 1.0
          avPlayer!!.setVolume(volume)
        }
        break;
      case PAUSED:
        console.info('setVolumeTimeCallback play state is PAUSED')
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.play().then(() => {
          console.info('setVolumeTimeCallback avPlayer from pause to play')
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onVolumeChange((vol) => {
    end = Date.now();
    console.info(`setVolumeTimeCallback end time is : ${end}`)
    execution = (end - start)
    console.info("setVolumeTimeCallback execution time  is :" + execution)
    totalTime = totalTime + execution;
    console.info('volumeChange success,and new volume is :' + vol)
    avPlayer?.pause()
  });
}

export async function firstFrameTime(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let start: number = 0;
  avPlayer = await idle(src, avPlayer!)
  await setSource(avPlayer!, src);
  console.info('firstFrameTime setSource');
  await sleep(20)
  if (avPlayer) {
    avPlayer!!.surfaceId = surfaceID;
  }
  await avPlayer!!.prepare().then(() => {
    expect(avPlayer?.state).assertEqual(PREPARED);
    console.info('firstFrameTime avPlayer state is prepared')
  }).catch(mediaTestBase.catchCallback);
  avPlayer?.onStartRenderFrame(() => {
    console.info('startRenderFrame success')
    let end = Date.now();
    console.info(`firstFrameTime end time is : ${end}`)
    let execution = (end - start)
    console.info("firstFrameTime execution time  is :" + execution)
    sleep(100)
    avPlayer?.release().then(() => {
      console.info('firstFrameTime avPlayer is release')
      expect(avPlayer?.state).assertEqual(RELEASED);
      avPlayer = null;
      done();
    }).catch(mediaTestBase.catchCallback);
  })
  start = Date.now();
  console.info(`firstFrameTime start time is : ${start}`)
  await avPlayer!!.play().then(() => {
    console.info('firstFrameTime play success');
  }).catch(mediaTestBase.catchCallback);
}

async function playToPauseLoop(avPlayer: media.AVPlayer) {
  await avPlayer!!.play().then(() => {
    console.info('playToPauseLoop play success');
    expect(avPlayer?.state).assertEqual(PLAYING);
  }).catch(mediaTestBase.catchCallback);
  if (avPlayer.state == PLAYING) {
    avPlayer.loop = true;
    await mediaTestBase.msleepAsync(2);
    console.info('playToPauseLoop avPlayer from play to pause')
  }
  await avPlayer!!.pause().then(() => {
    console.info('playToPauseLoop pause success');
    expect(avPlayer?.state).assertEqual(PAUSED);
  }).catch(mediaTestBase.catchCallback);
}

export async function avPlayerWithoutCallBack(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  let surfaceID: string = globalThis.value;
  console.info(`case avPlayerWithoutCallBack Initialized in, surfaceID is ${surfaceID}`);
  avPlayer = await idle(src, avPlayer!)
  setSource(avPlayer!, src);
  console.info('avPlayerWithoutCallBack setSource');
  await sleep(20);
  if (avPlayer && avPlayer.state == INITIALIZED) {
    avPlayer!!.surfaceId = surfaceID;
    await preparePromise(avPlayer);
    await sleep(2000);
  }
  if (avPlayer && avPlayer.state == PREPARED) {
    console.info('avPlayerWithoutCallBack avPlayer from PREPARED to play')
    // play to pause loop 1000 times
    for (let i = 0; i < 1000; i++) {
      await playToPauseLoop(avPlayer)
      console.info(`case avPlayerWithoutCallBack playToPauseLoop is ${i}`);
    }
  }
  await avPlayer!!.stop().then(() => {
    console.info('avPlayerWithoutCallBack avPlayer from play to stop')
    avPlayer?.release().then(() => {
      console.info('avPlayerWithoutCallBack avPlayer from stop to release')
      expect(avPlayer?.state).assertEqual(RELEASED);
      done();
    }).catch(mediaTestBase.catchCallback);
  }).catch(mediaTestBase.catchCallback);
}

async function setAVPlayerPlay(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  console.info(`case setAVPlayerPlay in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    console.info(`case state is ${state}`);
    switch (state) {
      case INITIALIZED:
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('setAVPlayerPlay play state is INITIALIZED')
        // step 1: initialized -> prepared -> play
        avPlayer?.prepare().then(() => {
          avPlayer?.play()
        }).catch(mediaTestBase.catchCallback);
        break;
      case PLAYING:
        console.info('setAVPlayerPlay play state is PLAYING')
        expect(avPlayer?.state).assertEqual(PLAYING);
        if (avPlayer && avPlayer.duration > 3000) {
          await mediaTestBase.msleepAsync(3000);
          avPlayer?.seek(avPlayer!!.duration, media.SeekMode.SEEK_NEXT_SYNC)
        } else {
          await mediaTestBase.msleepAsync(500);
          avPlayer?.seek(avPlayer!!.duration, media.SeekMode.SEEK_NEXT_SYNC)
        }
        break;
      case COMPLETED:
        expect(avPlayer?.currentTime).assertEqual(avPlayer?.duration);
        expect(avPlayer?.state).assertEqual('completed');
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      case RELEASED:
        expect(avPlayer?.state).assertEqual('released');
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });
  avPlayer?.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
    expect().assertFail();
    await avPlayer!!.release().then(() => {
      avPlayer = null;
      done();
    });
  });
}

export async function avPlayerPlay(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  avPlayer = await idle(src, undefined)
  await setAVPlayerPlay(src, avPlayer, done);
  await setSource(avPlayer!, src);
}

export async function testAVPlayerFun(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, playTest: PlayTest, playTime: number, done: () => void) {
  console.info(`case media source: ${src}`)
  await media.createAVPlayer().then((video: media.AVPlayer | undefined) => {
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      expect(avPlayer?.state).assertEqual(IDLE);
    } else {
      console.error('case createAVPlayer failed');
      expect().assertFail();
      done();
    }
  }).catch(mediaTestBase.catchCallback);
  setAVPlayerFunCb(src, avPlayer!, playTest, playTime, done);
  setSource(avPlayer!, src);
}

export function setAVPlayerSeekCb(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined | null, playTest: PlayTest, playTime: number, done: () => void) {
  let volumeCnt: number[] = [0];
  let endOfStreamCnt: int = 0;
  let seekDoneCnt: int = 0;
  let speedDoneCnt: number[] = [0];
  let playCnt: int = 0;
  let surfaceID: string = globalThis.value;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    if (reason == media.StateChangeReason.BACKGROUND) {
      avPlayer?.release().then(() => {
      }).catch(mediaTestBase.catchCallback);
    }
    switch (state) {
      case INITIALIZED:
        expect(avPlayer?.state).assertEqual(INITIALIZED);
        if (avPlayer) {
          avPlayer!!.surfaceId = surfaceID;
        }
        console.info('case initialized -> prepared');
        // step 1,10: initialized -> prepared
        avPlayer?.prepare((err: BusinessError | null) => {
          if (avPlayer) {
            avPlayer!!.loop = true;
          }
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else {
            checkPlayTest(avPlayer!, playTest);
          }
        });
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        checkPlayTest(avPlayer!, playTest);
        expect(avPlayer?.currentTime).assertEqual(0);
        offCallback(avPlayer!, ['volumeChange']);
        // step 2,11: prepared -> seek 0
        // avPlayer?.seek(0, 2); // 2: CLOSEST SYNC  // 不在本次范围内
        break;
      case PLAYING:
        playCnt++;
        if (playCnt == 1) {
          // step 4: seek + pause
          expect(avPlayer?.state).assertEqual(PLAYING);
          avPlayer?.seek(avPlayer!!.duration / 2, media.SeekMode.SEEK_PREV_SYNC);
          avPlayer?.pause((err: BusinessError | null) => {
            if (err != null) {
              mediaTestBase.assertErr('pause', err, done);
            }
          });
        } else if (playCnt == 3) {
          // step 12: seek duration
          avPlayer?.seek(avPlayer!!.duration, media.SeekMode.SEEK_PREV_SYNC);
          avPlayer?.stop((err: BusinessError | null) => {
            if (err == null) {
              avPlayer?.release((err: BusinessError | null) => {
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
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });

  avPlayer?.onEndOfStream(() => {
    console.info(`case endOfStream called`);
    endOfStreamCnt++;
    // step 9: seek + reset
    avPlayer?.reset((err: BusinessError | null) => {
      if (err == null) {
        expect(avPlayer?.state).assertEqual(IDLE);
        console.info('case reset success!!');
        setSource(avPlayer!, src);
      } else {
        mediaTestBase.assertErr('reset', err, done);
      }
    });
  });
  avPlayer?.onSeekDone((seekDoneTime) => {
    seekDoneCnt++;
    console.info(`case seekDone called, seekDoneCnt is ${seekDoneCnt}, seekDoneTime is ${seekDoneTime}`);
    switch (seekDoneCnt) {
      case 1:
        expect(avPlayer?.state).assertEqual(PREPARED);
        // step 3: seek(prepared) -> play
        avPlayer?.play((err: BusinessError | null) => {
          if (err != null) {
            mediaTestBase.assertErr('play', err, done);
          }
        });
        break;
      case 2:
        // step 5: seek + play
        avPlayer?.seek(avPlayer!!.duration / 2, media.SeekMode.SEEK_NEXT_SYNC);
        avPlayer?.play();
        break;
      case 3:
        // step 6: seek  + setVolume
        avPlayer?.setVolume(0.5);
        avPlayer?.seek(avPlayer!!.duration / 2, media.SeekMode.SEEK_CLOSEST);
        avPlayer?.play();
        break;
      case 4:
        // step 7: seek + seek
        avPlayer?.seek(avPlayer!!.duration / 2);
        avPlayer?.seek(avPlayer!!.duration, media.SeekMode.SEEK_NEXT_SYNC);
        avPlayer?.play();
        break;
      case 5:
        // step 8: seek duration
        avPlayer?.seek(avPlayer!!.duration, media.SeekMode.SEEK_PREV_SYNC);
        break;
      default:
        avPlayer?.play();
        break;
    }
  });
  setCallback(avPlayer!, 'volumeChange', volumeCnt);
  setCallback(avPlayer!, 'speedDone', speedDoneCnt);
  setCallback(avPlayer!, 'bitrateDone', null);
  setCallback(avPlayer!, 'timeUpdate', null);
  setCallback(avPlayer!, 'bufferingUpdate', null);
  setCallback(avPlayer!, 'durationUpdate', null);
  setCallback(avPlayer!, 'startRenderFrame', null);
  setCallback(avPlayer!, 'videoSizeChange', null);
  setCallback(avPlayer!, 'audioInterrupt', null);
  setCallback(avPlayer!, 'availableBitrates', null);
  avPlayer?.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
  });
}

export async function testAVPlayerSeek(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, playTest: PlayTest, playTime: number, done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setAVPlayerSeekCb(src, avPlayer, playTest, playTime, done);
      setSource(avPlayer!, src);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}