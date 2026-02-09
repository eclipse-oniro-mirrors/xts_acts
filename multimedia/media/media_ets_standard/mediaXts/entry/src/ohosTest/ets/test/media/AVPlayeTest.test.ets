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

import MediaTestBase from './MediaTestBase';
import media from '@ohos.multimedia.media';
import { idle, offCallback, PlayTest, setSource, setSubtitle, testAVPlayerFun, } from './AVPlayerTestBase';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { BusinessError, Callback } from '@kit.BasicServicesKit';
import {
  LOG_TAG,
  SLEEP_TIME_500,
  SLEEP_TIME_3000,
  SLEEP_TIME_20,
  SLEEP_TIME_200,
  MediaErrorCode,
  SLEEP_TIME_100,
  SLEEP_TIME_2000,
} from '../Constants';
import { getUrl, sleep } from '../common';
import { audio } from '@kit.AudioKit';
import { http } from '@kit.NetworkKit';

const TAG = LOG_TAG + 'AVPlayerLocalTest';

const VIDEO_SOURCE = 'H264_AAC.mp4';
const VIDEO_SOURCE_MKV = 'H264_AAC.mkv';
const AUDIO_SOURCE = '01.mp3';
const VIDEO_NO_AUDIO = 'H264_NONE.mp4';
const VIDEO_SOURCE_M3U8 = 'H264_AAC.m3u8';
const SUBTITLE = 'srt_2800.srt';
const PLAY_TIME = 3000;
const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';
let fileDescriptor: media.AVFileDescriptor;
let fileDescriptor_mkv: media.AVFileDescriptor;
let fileDescriptor2: media.AVFileDescriptor;
let fileDescriptor3: media.AVFileDescriptor;
let fileDescriptor_m3u8: media.AVFileDescriptor;
let avPlayer: media.AVPlayer | null = null;
let subtitleFdSrc: media.AVFileDescriptor;
let mediaTestBase = new MediaTestBase();
let audioTrackList: Array<Object> = [];
let selectedTrack: number | undefined;
let selectedTrackList: Array<number> = [];
let currentTrack: number = 0;
let payloadTypes: Array<number> = [];
let dataCanBeRead: boolean = false;
const expectType: number = 5;

function testGetTrackDescriptionPromise(avPlayer: media.AVPlayer | null, descriptionKey: Array<Array<string>>,
  descriptionValue: Array<Array<number>>, done: Function, testName: string) {
  let arrayDescription: Array<media.MediaDescription> | undefined = undefined;
  let surfaceID: string = globalThis.value;
  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ` avPlayer is null`);
          break;
        }
        console.info(TAG, testName + ` case INITIALIZED`);
        avPlayer.surfaceId = surfaceID;
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer.prepare((err) => {
          console.info(TAG, testName + ' case prepare called ' + err);
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info(TAG, testName + ' case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        break;
      case PREPARED:
        await avPlayer?.getTrackDescription().then((arrayList) => {
          console.info(TAG, testName + ' case getTrackDescription called!!');
          if (typeof (arrayList) != 'undefined') {
            arrayDescription = arrayList;
          } else {
            console.info(TAG, testName + ' case getTrackDescription is failed');
            expect().assertFail();
          }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        expect(descriptionKey.length).assertEqual(arrayDescription?.length);
        if (arrayDescription) {
          for (let i = 0; i < arrayDescription.length; i++) {
            mediaTestBase.checkDescription(arrayDescription[i], descriptionKey[i], descriptionValue[i]);
          }
        }
        avPlayer?.release();
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  })
}

function testGetTrackDescriptionCallback(avPlayer: media.AVPlayer | null, descriptionKey: Array<Array<string>>,
  descriptionValue: Array<Array<number>>, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ` avPlayer is null`);
          break;
        }
        console.info(TAG, testName + ` case INITIALIZED`);
        avPlayer.surfaceId = surfaceID;
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer.prepare((err) => {
          console.info(TAG, testName + ' case prepare called ' + err);
          if (err != null) {
            console.error(TAG, testName + ' case prepare error, code: ' + err.code + ', msg: ' + err.message);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info(TAG, testName + ' case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        break;
      case PREPARED:
        avPlayer?.getTrackDescription((error, arrayList) => {
          if (error == null) {
            for (let i = 0; i < arrayList.length; i++) {
              mediaTestBase.checkDescription(arrayList[i], descriptionKey[i], descriptionValue[i]);
            }
          } else {
            console.info(TAG, testName + ' getTrackDescription failed, message is:' + error.message);
            expect().assertFail();
            done();
          }
          avPlayer?.release();
        })
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  });
}

async function checkTrackDescriptionPromise(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  descriptionKey: Array<Array<string>>, descriptionValue: Array<Array<number>>, done: Function, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`);
  media.createAVPlayer((err, video) => {
    console.info(TAG, testName + ` case media err: ${err}`);
    if (typeof (video) != 'undefined') {
      console.info(TAG, testName + ' case createAVPlayer success');
      avPlayer = video;
      setSource(avPlayer, src, testName);
      testGetTrackDescriptionPromise(avPlayer, descriptionKey, descriptionValue, done, testName);
    }
    if (err != null) {
      console.error(TAG, testName + ` case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function checkTrackDescriptionCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  descriptionKey: Array<Array<string>>, descriptionValue: Array<Array<number>>, done: Function, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`);
  media.createAVPlayer((err, video) => {
    console.info(TAG, testName + ` case media err: ${err}`);
    if (typeof (video) != 'undefined') {
      console.info(TAG, testName + ' case createAVPlayer success');
      avPlayer = video;
      testGetTrackDescriptionCallback(avPlayer, descriptionKey, descriptionValue, done, testName);
      setSource(avPlayer, src, testName);
    }
    if (err != null) {
      console.error(TAG, testName + ` case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

function setPlaybackInfoCb(avPlayer: media.AVPlayer | null, descriptionKey: Array<string>,
  descriptionValue: Array<string>, done: Function, testName: string) {
  let arrayDescription: media.PlaybackInfo | undefined = undefined;
  let surfaceID: string = globalThis.value;
  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ` avPlayer is null`);
          break;
        }
        console.info(TAG, testName + ` case INITIALIZED`);
        avPlayer.surfaceId = surfaceID;
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer?.prepare((err) => {
          console.info(TAG, testName + ' case prepare called ' + err);
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info(TAG, testName + ' case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        break;
      case PREPARED:
        await avPlayer?.getPlaybackInfo().then(res => {
          console.info(TAG, testName + ' case getPlaybackInfo called!!');
          if (typeof (res) != 'undefined') {
            arrayDescription = res;
          } else {
            console.info(TAG, testName + ' case getPlaybackInfo is failed');
            expect().assertFail();
          }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        if (arrayDescription) {
          mediaTestBase.checkPlaybackInfo(arrayDescription, descriptionKey, descriptionValue);
        }
        avPlayer?.release();
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  })
}

async function testCheckPlaybackInfo(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  descriptionKey: Array<string>, descriptionValue: Array<string>, done: Function, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    if (err != null) {
      console.error(TAG, testName + ` case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    } else {
      console.info(TAG, testName + ` case media err: ${err}`);
      if (typeof (video) != 'undefined') {
        console.info(TAG, testName + ' case createAVPlayer success');
        avPlayer = video;
        setPlaybackInfoCb(avPlayer, descriptionKey, descriptionValue, done, testName);
        setSource(avPlayer, src, testName);
      } else {
        console.error(TAG, testName + ` case createAVPlayer failed`);
        expect().assertFail();
        done();
      }
    }
  });
}

async function setOnCallback(avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  let count = 0;
  let playCount = 0;
  avPlayer?.on('endOfStream', () => {
    count++;
    console.info(TAG + 'endOfStream success');
    avPlayer?.off('endOfStream');
  });
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ' setOnCallback state =' + state);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ` avPlayer is null`);
          break;
        }
        console.info(TAG, testName + ` case INITIALIZED`);
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer.surfaceId = surfaceID;
        avPlayer.prepare((err) => {
          console.info(TAG, testName + ' case prepare called ' + err);
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info(TAG, testName + ' case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        break;
      case PREPARED:
        console.info(TAG, testName + ' case prepare called');
        avPlayer?.play().then(() => {
          console.info(TAG, testName + ' play called success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case PLAYING:
        if (playCount == 0) {
          playCount++;
          avPlayer?.pause().then(() => {
            console.info(TAG, testName + ' play called success');
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        console.info(TAG, testName + ' case playing called');
        break;
      case PAUSED:
        avPlayer?.play((err) => {
          console.info(TAG, testName + ' case play called');
          if (err != null) {
            console.error(TAG, testName + ` case play error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info(TAG, testName + ' case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        console.info(TAG, testName + ' case pause called');
        break;
      case STOPPED:
        expect(count).assertEqual(1);
        console.info(TAG, testName + ' case stop called');
        avPlayer?.release().then(() => {
          console.info(TAG, testName + ' play release success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case COMPLETED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        expect(avPlayer.state).assertEqual(COMPLETED);
        expect(avPlayer.currentTime).assertEqual(avPlayer.duration);
        if (playCount == 1) {
          playCount++;
          avPlayer?.play().then(() => {
            console.info(TAG, testName + ' play called success');
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          avPlayer?.stop().then(() => {
            console.info(TAG, testName + ' play stop success');
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        done();
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  });
}

async function testEndOfStream(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: Function,
  testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`);
  media.createAVPlayer((err, video) => {
    console.info(TAG, testName + ` case media err: ${err}`);
    if (typeof (video) != 'undefined') {
      console.info(TAG, testName + ' case createAVPlayer success');
      avPlayer = video;
      setOnCallback(avPlayer, done, testName);
      setSource(avPlayer, src, testName);
    }
    if (err != null) {
      console.error(TAG, testName + ` case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function getPlaybackPosition(avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  let playbackPosition: number = -1;
  let isFirstTime = true;
  let stateChangeCallback = async (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        await avPlayer.prepare();
        break;
      case PREPARED:
        await avPlayer?.play();
        break;
      case PLAYING:
        await sleep(SLEEP_TIME_3000);
        if (isFirstTime) {
          await avPlayer?.pause();
          isFirstTime = false;
        }
        break;
      case PAUSED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        await avPlayer?.play();
        playbackPosition = avPlayer.getPlaybackPosition();
        console.info(TAG, testName + ` AVPlayer getPlaybackPosition == ${playbackPosition} ms`);
        expect(playbackPosition).assertLargerOrEqual(0);
        break;
      case COMPLETED:
        await avPlayer?.release();
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  }
  avPlayer?.on('stateChange', stateChangeCallback);
}

async function testGetPlaybackPosition(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`);
  media.createAVPlayer((err, video) => {
    console.info(TAG, testName + ` case media err: ${err}`);
    if (video) {
      console.info(TAG, testName + ' case createAVPlayer success');
      avPlayer = video;
      getPlaybackPosition(avPlayer, done, testName);
      setSource(avPlayer, src, testName);
    }
    if (err != null) {
      console.error(TAG, testName + ` case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

function setAVPlayerSeekContinuousCb(avPlayer: media.AVPlayer | null, seekTime: number, seekMode: media.SeekMode,
  done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  console.info(TAG, testName + ` case setCallback in, surfaceID is ${surfaceID}`);
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
        await avPlayer?.prepare();
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        avPlayer?.seek(seekTime, seekMode);
        await avPlayer?.play();
        break;
      case PLAYING:
        expect(avPlayer?.state).assertEqual(PLAYING);
        avPlayer?.seek(seekTime + 100, seekMode);
        break;
      case COMPLETED:
        expect(avPlayer?.state).assertEqual(COMPLETED);
        await avPlayer?.release();
        break;
      case RELEASED:
        expect(avPlayer?.state).assertEqual(RELEASED);
        done();
        break;
      case ERROR:
        await avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        done();
        break;
      default:
        break;
    }
  });

  avPlayer?.on('seekDone', (seekDoneTime: number) => {
    console.info(TAG, testName + ' seekDone called,and seek time is:' + seekDoneTime + '， state=' + avPlayer?.state);
    if (avPlayer?.state == PREPARED) {
      expect(seekDoneTime).assertEqual(seekTime);
    } else if (avPlayer?.state == PAUSED) {
      expect(seekDoneTime).assertEqual(seekTime + 100);
    }
  })

  avPlayer?.on('error', (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, code: ${err.code}, msg: ${err.message}`);
    expect(err.code).not().assertUndefined();
  });
}

function testAVPlayerSeekContinuous(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  seekTime: number, seekMode: media.SeekMode, done: Function, testName: string) {
  media.createAVPlayer((err, video) => {
    if (err) {
      console.error(TAG, testName + ` case createAVPlayer error, errMessage is ${err?.message}`);
      expect().assertFail();
      done();
    }
    console.info(TAG, testName + ' case createAVPlayer success');
    avPlayer = video;
    setSource(avPlayer, src, testName);
    setAVPlayerSeekContinuousCb(avPlayer, seekTime, seekMode, done, testName);
  });
}

function openFileFailed() {
  console.info(TAG, 'openFileFailed case file fail');
}

async function subtitleUpdateON(avPlayer: media.AVPlayer, done: Function, testName: string) {
  let loopTime = 0;
  avPlayer.on('subtitleUpdate', async (info: media.SubtitleInfo) => {
    if (info) {
      loopTime++;
      let text = (!info.text) ? '' : info.text;
      let startTime = (!info.startTime) ? 0 : info.startTime;
      let duration = (!info.duration) ? 0 : info.duration;
      console.info(TAG,
        testName + ' subtitleUpdateON info: text=' + text + ' startTime=' + startTime + ' duration=' + duration);
      avPlayer.off('subtitleUpdate');
      expect(loopTime).assertEqual(1);
    } else {
      console.info(TAG, testName + ' subtitleUpdate info is null');
      expect(false).assertTrue();
      done();
    }
  });
}

async function testSubtitleUpdateListening(src: string | media.AVFileDescriptor,
  subtitleSrc: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, subtitleUpdateListening: Function,
  done: Function, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`);
  media.createAVPlayer((err, video) => {
    if (err) {
      console.error(TAG, testName + ` case createAVPlayer error, errMessage is ${err?.message},${err?.code}`);
      expect().assertFail();
      done();
    }
    console.info(TAG, testName + ' case createAVPlayer success');
    avPlayer = video;
    subtitleUpdateListening(avPlayer, done, testName);
    setOnCallback(avPlayer, done, testName);
    setSource(avPlayer, src, testName);
    setSubtitle(avPlayer, subtitleSrc, testName);
  });
}

async function testSubtitle(src: string | media.AVFileDescriptor, subtitleSrc: string | media.AVFileDescriptor,
  avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`);
  media.createAVPlayer((err, video) => {
    if (typeof (video) !== 'undefined') {
      console.info(TAG, testName + ' case createAVPlayer success');
      avPlayer = video;
      setOnCallback(avPlayer, done, testName);
      setSource(avPlayer, src, testName);
      setSubtitle(avPlayer, subtitleSrc, testName);
    }
    if (err != null) {
      console.error(TAG, testName + ` case createAVPlayer error, errMessage is ${err?.message},${err?.code}`);
      expect().assertFail();
      done();
    }
  });
}

async function getSelectedTracksPromise(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' getSelectedTracksPromise setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
  });
  console.info(TAG, testName + ' avPlayer.state: ' + avPlayer?.state);
  await avPlayer?.prepare().then(() => {
    expect(avPlayer?.state).assertEqual(PREPARED);
    console.info(TAG, testName + ' getSelectedTracksPromise avPlayer state is prepared');
  }).catch((error: BusinessError) => {
    console.error(TAG, testName + ' Failed to set MediaSource, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  });
  await getCurrentSelectedTrack(testName);
  done();
}

async function getAudioTracks(testName: string) {
  console.info(TAG, testName + ' case to getTrackDescription');
  await avPlayer?.getTrackDescription().then((arrayList) => {
    console.info(TAG, testName + ' case getTrackDescription called!!');
    if (typeof (arrayList) == 'undefined') {
      console.info(TAG, testName + ' case getTrackDescription is failed');
      expect().assertFail();
      return;
    }
    console.info(TAG, testName + ' case arrayList.length is  ' + arrayList.length);
    for (let i = 0; i < arrayList.length; i++) {
      console.info(TAG, testName + ' case track_name is  ' + arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_NAME]);
      console.info(TAG, testName + ' case hdr_type is  ' + arrayList[i][media.MediaDescriptionKey.MD_KEY_HDR_TYPE]);
      if (arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE] == 0) {
        audioTrackList.push(arrayList[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX]);
      }
    }
  })
  console.info('case audioTrackList is: ' + audioTrackList);
}

async function getCurrentAudioTrack(testName: string) {
  await avPlayer?.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
    for (let i = 0; i < arrList.length; i++) {
      let propertyIndex: Object = arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX]
      let propertyType: Object = arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE]
      if (propertyType == 0 && currentTrack != propertyIndex as number) {
        currentTrack = propertyIndex as number;
        console.info(TAG, testName + ' currentTrack is ' + currentTrack);
        break;
      }
    }
  })
}

async function getCurrentSelectedTrack(testName: string) {
  await avPlayer?.getSelectedTracks().then((trackList) => {
    if (typeof (selectedTrackList) == 'undefined') {
      console.info(TAG, testName + ' case getSelectedTracks is failed');
      expect().assertFail();
      return;
    }
    console.info(TAG, testName + ' case trackList.length is  ' + trackList.length);
    for (let i = 0; i < trackList.length; i++) {
      selectedTrackList.push(trackList[i]);
    }
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

async function changeAudioTrack(testName: string) {
  for (let i = 0; i < audioTrackList.length; i++) {
    if (audioTrackList[i] != currentTrack) {
      selectedTrack = audioTrackList[i] as number;
      console.info(TAG, testName + ' case new audio track is:' + selectedTrack);
      break;
    } else {
      continue;
    }
  }
}

async function beforeSelectTrack(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' beforeSelectTrack setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  await avPlayer?.prepare().then(() => {
    expect(avPlayer?.state).assertEqual(PREPARED);
    console.info(TAG, testName + ' beforeSelectTrack avPlayer state is prepared');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  await avPlayer?.getTrackDescription().then((arrList) => {
    if (arrList != null) {
      for (let i = 0; i < arrList.length; i++) {
        if (i != 0) {
          let propertyIndex: Object = arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX];
          let propertyType: Object = arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE];
          if (propertyType == 0 && currentTrack != propertyIndex as number) {
            currentTrack = propertyIndex as number;
            console.info(TAG, testName + ' currentTrack is ' + currentTrack);
            break;
          }
        }
      }
    } else {
      console.info(TAG, testName + ' video getTrackDescription fail');
    }
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

async function selectTrack(index: number, testName: string) {
  await avPlayer?.selectTrack(index);
  console.info(TAG, testName + ' case selectTrack is succeed.');
}

async function deselectTrack(index: number, testName: string) {
  await avPlayer?.deselectTrack(index);
  console.info(TAG, testName + ' case deselectTrack is succeed.');
}

async function setMediaSourcePromise(done: Function, testName: string, src: media.AVFileDescriptor,
  avPlayer: media.AVPlayer | null, strategy: media.PlaybackStrategy) {
  let headers: Record<string, string> = { "User-Agent": "User-Agent-Value" };
  let mediaSource: media.MediaSource = media.createMediaSourceWithUrl(getUrl(src), headers);
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' setMediaSourcePromise setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  mediaSource.setMimeType(media.AVMimeTypes.APPLICATION_M3U8);
  console.info(TAG, testName + ' mediaSource: ' + mediaSource == undefined);
  await avPlayer?.prepare().then(() => {
    expect(avPlayer?.state).assertEqual(PREPARED);
    console.info(TAG, testName + ' setMediaSourcePromise avPlayer state is prepared');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  await avPlayer?.setMediaSource(mediaSource, strategy).then(() => {
    console.info(TAG, testName + ' Succeeded in setting MediaSource.');
  }).catch((error: BusinessError) => {
    console.error(TAG, testName + ' Failed to set MediaSource, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  });
  done();
}

async function setMediaMutedPromise(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string, isMuted: boolean) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' setMediaMutedPromise setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  await avPlayer?.prepare().then(() => {
    expect(avPlayer?.state).assertEqual(PREPARED);
    console.info(TAG, testName + ' setMediaMutedPromise avPlayer state is prepared');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  await avPlayer?.setMediaMuted(media.MediaType.MEDIA_TYPE_AUD, isMuted).then(() => {
    if (isMuted) {
      console.info(TAG, testName + ' succeed to silent playback.');
    } else {
      console.info(TAG, testName + ' succeed to cancel mute playback.');
    }
    expect(true).assertTrue();
  }).catch(mediaTestBase.catchCallback);
  done();
}

async function setMediaMutedPromiseAbnormal(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string, mediaType: media.MediaType, isMuted: boolean) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' setMediaMutedPromiseAbnormal setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  await avPlayer?.prepare().then(() => {
    expect(avPlayer?.state).assertEqual(PREPARED);
    console.info(TAG, testName + ' setMediaMutedPromiseAbnormal avPlayer state is prepared');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  await avPlayer?.setMediaMuted(mediaType, isMuted).then(() => {
    if (isMuted) {
      console.info(TAG, testName + ' succeed to silent playback.');
    } else {
      console.info(TAG, testName + ' succeed to cancel mute playback.');
    }
    expect(true).assertTrue();
  }).catch((error: BusinessError) => {
    console.error(TAG, testName + ' Failed to set MediaMuted, code: ' + error.code + ', msg: ' + error.message);
    expect(error.code).assertEqual(MediaErrorCode.PARAMETER_ERROR);
    done();
  });
  done();
}

async function getSeekContinuousSupported(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' getSeekContinuousSupported setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  expect(avPlayer?.state).assertEqual(INITIALIZED);
  expect(avPlayer?.isSeekContinuousSupported()).assertFalse();
  console.info(TAG, testName + ' start prepare');
  await avPlayer?.prepare().then(() => {
    expect(avPlayer?.state).assertEqual(PREPARED);
    console.info(TAG, testName + ' getSeekContinuousSupported avPlayer state is prepared');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  let isSupported1 = avPlayer!.isSeekContinuousSupported();
  await sleep(SLEEP_TIME_20);
  await avPlayer?.play().then(() => {
    expect(avPlayer?.state).assertEqual(PLAYING);
    console.info(TAG, testName + ' getSeekContinuousSupported avPlayer state is playing');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  let isSupported2 = avPlayer!.isSeekContinuousSupported();
  await sleep(SLEEP_TIME_20);
  if (!isSupported1 && !isSupported2) {
    console.error(TAG, testName + ' No supported SEEK_CONTINUOUS mode.');
  }
  done();
}

async function setPlaybackStrategyPromise(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  strategy: media.PlaybackStrategy, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' setPlaybackStrategyPromise setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
    console.info(TAG, testName + ' surfaceId: ' + avPlayer.surfaceId);
  }
  await sleep(SLEEP_TIME_100);
  console.info(TAG, testName + ' surfaceId: ' + avPlayer?.surfaceId);
  expect(avPlayer?.state).assertEqual(INITIALIZED);
  avPlayer?.setPlaybackStrategy(strategy).then(() => {
    console.info(TAG, testName + ' succeed to set PlaybackStrategy');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  done();
}

async function setPlaybackRangePromise(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  startTimeMs: number, endTimeMs: number, mode: media.SeekMode, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' setPlaybackRangePromise setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  await sleep(SLEEP_TIME_20);
  console.info(TAG, testName + ' surfaceId: ' + avPlayer?.surfaceId);
  await avPlayer?.setPlaybackRange(startTimeMs, endTimeMs, mode).then(() => {
    console.info(TAG, testName + ' succeed to set PlaybackRange');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  done();
}

async function setSuperResolutionPromise(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  strategy: media.PlaybackStrategy, enabled: boolean, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' setSuperResolutionPromise setSource');
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        console.info(TAG, testName + ' play state is INITIALIZED');
        avPlayer.surfaceId = surfaceID;
        expect(avPlayer.state).assertEqual(INITIALIZED);
        await avPlayer?.setPlaybackStrategy(strategy).then(() => {
          console.info(TAG, testName + ' succeed to set PlaybackStrategy');
          expect(true).assertTrue();
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        console.info(TAG, testName + ' set PlaybackStrategy end');
        await avPlayer?.prepare();
        break;
      case PREPARED:
        console.info(TAG, testName + ' play state is PREPARED');
        expect(avPlayer?.state).assertEqual(PREPARED);
        await avPlayer?.setSuperResolution(enabled).then(() => {
          if (enabled) {
            console.info(TAG, testName + ' succeed to set SuperResolution opened');
          } else {
            console.info(TAG, testName + ' succeed to set SuperResolution closed');
          }
        }).catch(async (error: BusinessError) => {
          console.error(TAG,
            testName + ' Failed to set SuperResolution, code: ' + error.code + ', msg: ' + error.message);
          expect(error.code == MediaErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED ||
            error.code == MediaErrorCode.AVERR_UNSUPPORT_FORMAT).assertTrue();
          await avPlayer?.release().then(() => {
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        });
        await avPlayer?.stop();
        break;
      case STOPPED:
        console.info(TAG, testName + ' play state is STOPPED');
        await avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case RELEASED:
        console.info(TAG, testName + ' play state is RELEASED');
        avPlayer?.off('stateChange');
        avPlayer?.off('error');
        avPlayer = null;
        done();
        break;
      default:
        break;
    }
  });
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errCode: ${err.code}, errMessage is ${err.message}`);
    expect(err.code == MediaErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED ||
      err.code == MediaErrorCode.AVERR_UNSUPPORT_FORMAT).assertTrue();
    done();
  });
}

async function setSuperResolutionPromiseAbnormal(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  enabled: boolean, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' setSuperResolutionPromiseAbnormal setSource');
  await sleep(SLEEP_TIME_2000);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  await avPlayer?.setSuperResolution(enabled).then(() => {
    console.info(TAG, testName + ' succeed to set SuperResolution');
  }).catch((error: BusinessError) => {
    console.error(TAG, testName + ' Failed to set SuperResolution, code: ' + error.code + ', msg: ' + error.message);
    expect(error.code).assertEqual(MediaErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED);
    done();
  });
  done();
}

async function setVideoWindowSizePromise(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  width: number, height: number, done: Function, testName: string) {
  let strategy: media.PlaybackStrategy = { enableSuperResolution: true };
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' setVideoWindowSizePromise setSource');
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is null');
          break;
        }
        console.info(TAG, testName + ' play state is INITIALIZED');
        avPlayer.surfaceId = surfaceID;
        expect(avPlayer.state).assertEqual(INITIALIZED);
        await avPlayer?.setPlaybackStrategy(strategy).then(() => {
          console.info(TAG, testName + ' succeed to set PlaybackStrategy');
          expect(true).assertTrue();
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        console.info(TAG, testName + ' set PlaybackStrategy end');
        await avPlayer?.prepare();
        break;
      case PREPARED:
        console.info(TAG, testName + ' play state is PREPARED');
        expect(avPlayer?.state).assertEqual(PREPARED);
        await avPlayer?.setVideoWindowSize(width, height).then(() => {
          console.info(TAG, testName + ' succeed to set VideoWindowSize');
        }).catch(async (error: BusinessError) => {
          console.error(TAG,
            testName + ' Failed to set VideoWindowSize, code: ' + error.code + ', msg: ' + error.message);
          if (error.code == MediaErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED) {
            console.info(TAG, testName + ' This device does not super resolution.');
            return;
          } else {
            expect(error.code).assertEqual(MediaErrorCode.PARAMETER_ERROR);
            await avPlayer?.release().then(() => {
            }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          }
          done();
        });
        await avPlayer?.stop();
        break;
      case STOPPED:
        console.info(TAG, testName + ' play state is STOPPED');
        await avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case RELEASED:
        console.info(TAG, testName + ' play state is RELEASED');
        avPlayer?.off('stateChange');
        avPlayer?.off('error');
        avPlayer = null;
        done();
        break;
      case ERROR:
        console.info(TAG, testName + ' play state is ERROR');
        expect().assertFail();
        done();
        break;
      default:
        break;
    }
  });
  avPlayer?.on('error', async (err: BusinessError) => {
    console.error(TAG, testName + ` case error called, errCode: ${err.code}, errMessage is ${err.message}`);
  });
}

async function setVideoWindowSizePromiseAbnormal(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  width: number, height: number, done: Function, testName: string) {
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' setVideoWindowSizePromiseAbnormal setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  expect(avPlayer?.state).assertEqual(INITIALIZED);
  await avPlayer?.setVideoWindowSize(width, height).then(() => {
    console.info(TAG, testName + ' succeed to set VideoWindowSize');
  }).catch((error: BusinessError) => {
    console.error(TAG, testName + ' Failed to set VideoWindowSize, code: ' + error.code + ', msg: ' + error.message);
    expect(error.code).assertEqual(MediaErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED);
    done();
  });
  done();
}

async function superResolutionChangedListen(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  width: number, height: number, done: Function, testName: string) {
  let strategy: media.PlaybackStrategy = { enableSuperResolution: true };
  let surfaceID: string = globalThis.value;
  avPlayer = await idle(src, avPlayer, testName);
  setSource(avPlayer, src, testName);
  console.info(TAG, testName + ' setVideoWindowSizePromise setSource');
  await sleep(SLEEP_TIME_20);
  if (avPlayer) {
    avPlayer.surfaceId = surfaceID;
  }
  avPlayer?.on('superResolutionChanged', (enabled: boolean) => {
    console.info('superResolutionChanged called, and enabled is:' + enabled);
  });
  avPlayer?.setPlaybackStrategy(strategy).then(() => {
    console.info(TAG, testName + ' succeed to set PlaybackStrategy');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  await avPlayer?.prepare().then(() => {
    expect(avPlayer?.state).assertEqual(PREPARED);
    console.info(TAG, testName + ' getSeekContinuousSupported avPlayer state is prepared');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  await avPlayer?.setVideoWindowSize(width, height).then(() => {
    console.info(TAG, testName + ' succeed to set VideoWindowSize');
  }).catch((error: BusinessError) => {
    console.error(TAG, testName + ' Failed to set VideoWindowSize, code: ' + error.code + ', msg: ' + error.message);
    if (error.code == MediaErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED) {
      console.info(TAG, testName + ' This device does not super resolution.');
      done();
      return;
    } else {
      expect().assertFail();
      done();
    }
  });
  done();
}

async function changeTrackOn(avPlayer: media.AVPlayer, done: Function, testName: string) {
  let loopTime = 0;
  avPlayer.on('trackInfoUpdate', (info: Array<media.MediaDescription>) => {
    if (info) {
      loopTime++;
      for (let i = 0; i < info.length; i++) {
        let propertyIndex: Object = info[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX];
        let propertyType: Object = info[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE];
        console.info(TAG, testName + ' track info. index: ' + propertyIndex + ' trackType: ' + propertyType)
        avPlayer.off('trackInfoUpdate');
        expect(loopTime).assertEqual(1);
        done();
      }
    } else {
      console.info(TAG, testName + 'track info is null');
      expect(false).assertTrue();
      done();
    }
  });
}

async function amplitudeUpdateListen(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is: null');
          break;
        }
        avPlayer.surfaceId = globalThis.value;
        avPlayer.prepare();
        break;
      case PREPARED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is: null');
          break;
        }
        avPlayer.play();
        break;
      case PLAYING:
        await mediaTestBase.msleepAsync(PLAY_TIME);
        avPlayer?.release();
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      default:
        break;
    }
  });
  avPlayer?.on('amplitudeUpdate', (value) => {
    console.info(TAG, testName + ' get max amplitude: ' + value);
    expect(value.length).assertEqual(5);
  });
  setSource(avPlayer, fileDescriptor, testName);
}

async function audioOutputDeviceChangeWithInfoListen(src: string | media.AVFileDescriptor,
  avPlayer: media.AVPlayer | null, done: Function, testName: string) {
  avPlayer = await idle(src, avPlayer, testName);
  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is: null');
          break;
        }
        avPlayer.surfaceId = globalThis.value;
        avPlayer.prepare();
        break;
      case PREPARED:
        if (!avPlayer) {
          console.info(TAG, testName + ' avPlayer is: null');
          break;
        }
        avPlayer.play();
        break;
      case PLAYING:
        await mediaTestBase.msleepAsync(PLAY_TIME);
        avPlayer?.release();
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      default:
        break;
    }
  });
  avPlayer?.on('audioOutputDeviceChangeWithInfo', (data: audio.AudioStreamDeviceChangeInfo) => {
    console.info(TAG, testName + ' data: ' + JSON.stringify(data.devices) + ', changeReason: ' + data.changeReason);
    expect(data.changeReason).assertLargerOrEqual(0);
  });
  setSource(avPlayer, fileDescriptor, testName);
}

async function handleState(state: string, preparedOp: Function, playedOp: Function, stoppedOp: Function,
  testName: string) {
  switch (state) {
    case INITIALIZED:
      expect(avPlayer?.state).assertEqual(INITIALIZED);
      if (avPlayer) {
        avPlayer.surfaceId = globalThis.value;
      }
      console.info(TAG, testName + ` case avPlayer.surfaceId is ${avPlayer?.surfaceId}`);
      await avPlayer?.prepare();
      break;
    case PREPARED:
      expect(avPlayer?.state).assertEqual(PREPARED);
      expect(avPlayer?.currentTime).assertEqual(0);
      await preparedOp();
      console.info(TAG, testName + ' case to play AVPlayer');
      await avPlayer?.play();
      break;
    case PLAYING:
      expect(avPlayer?.state).assertEqual(PLAYING);
      await mediaTestBase.msleepAsync(SLEEP_TIME_20);
      await playedOp();
      if (!avPlayer?.loop) {
        await avPlayer?.stop().then(() => {
          console.info(TAG, testName + ' case stop AVPlayer success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      } else {
        console.info(TAG, testName + ' avPlayer.loop is true')
      }
      break;
    case STOPPED:
      expect(avPlayer?.state).assertEqual(STOPPED);
      await stoppedOp();
      break;
    case COMPLETED:
      await avPlayer?.stop().then(() => {
        console.info(TAG, testName + ' case stop AVPlayer success');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      break;
    case ERROR:
      expect(avPlayer?.state).assertEqual(ERROR);
      expect().assertFail();
      avPlayer?.release().then(() => {
        console.info('case release AVPlayer success');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      break;
    default:
      break;
  }
}

async function testChangeTrackListening(fd: media.AVFileDescriptor, preparedOp: Function, playedOp: Function,
  stoppedOp: Function, changeTrackListening: Function, done: Function, testName: string) {
  avPlayer = await idle(fd, avPlayer, testName);
  changeTrackListening(avPlayer, done, testName);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(TAG, testName + ` case stateChange called, state is ${state}, reason is ${reason}`);
    await handleState(state, preparedOp, playedOp, stoppedOp, testName);
  });
  avPlayer?.on('trackChange', async (index, isSelection) => {
    console.info(TAG, testName + ` case trackChange called, index is ${index}, isSelection is ${isSelection}`);
  });
  avPlayer?.on('error', async (err) => {
    console.error(TAG, testName + ` case error called, errMessage is ${err.message}`);
  });
  setSource(avPlayer, fd, testName);
}

export function checkDataCanBeRead(url: string, done: Function, testName: string) {
  let httpRequest = http.createHttp();

  httpRequest.on('headersReceive', (header) => {
    console.info(TAG, testName + ' Header received');
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
        console.info(TAG, testName + ' Data can be read.');
        dataCanBeRead = true;
      } else {
        console.error(TAG, testName + ' Failed to read data, err: ' + err.code + ', msg: ' + err.message);
        done();
      }

      httpRequest.off('headersReceive');
      httpRequest.destroy();
    }
  );
}

export async function testSeiMessage(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  payloadTypes: Array<number>, done: Function, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`);
  media.createAVPlayer((err, video) => {
    console.error(TAG, testName + ' case media err:' + err.code + ', msg: ' + err.message);
    if (typeof (video) !== 'undefined') {
      console.info(TAG, testName + ' case createAVPlayer success');
      avPlayer = video;
      setAVPlayerSeiMessageCb(avPlayer, payloadTypes, done, testName);
      setSource(avPlayer, src, testName);
    } else if (err != null) {
      console.error(TAG, testName + ' case createAVPlayer error:' + err.code + ', msg: ' + err.message);
      expect().assertFail();
      done();
    }
  });
}

export function setAVPlayerSeiMessageCb(avPlayer: media.AVPlayer | null, payloadTypes: Array<number>, done: Function,
  testName: string) {
  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ` avPlayer is null`);
          break;
        }
        console.info(TAG, testName + ` case INITIALIZED`);
        avPlayer.surfaceId = globalThis.value;
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer.prepare((err) => {
          console.error(TAG, testName + ' case prepare called, err: ' + err.code + ', msg: ' + err.message);
          if (err != null) {
            console.error(TAG, testName + ' case prepare error: ' + err.code + ', msg: ' + err.message);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info(TAG, testName + ' case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        break;
      case PREPARED:
        console.info(TAG, testName + ' case prepared');
        avPlayer?.play().then(() => {
          console.info(TAG, testName + ' Play started');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case PLAYING:
        console.info(TAG, testName + ' case playing');
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  });
  avPlayer?.on('seiMessageReceived', payloadTypes, (messages: Array<media.SeiMessage>, playbackPosition?: number) => {
    try {
      console.info(TAG, testName + ` Received SEI message at playbackPosition: ${playbackPosition}`);
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
      console.error(TAG, testName + ' Error in SEI message handling: ' + error + ', msg: ' + error.message);
      expect().assertFail();
      done();
    }
  });
}

function setPlaybackStatisticMetricsCb(avPlayer: media.AVPlayer | null, playBackMetricsKey: Array<string>, done: Function, testName: string) {
  let arrayPlaybackMetrics: media.PlaybackMetrics | undefined = undefined;
  let surfaceID: string = globalThis.value;
  let playCount = 0;
  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ` avPlayer is null`);
          break;
        }
        console.info(TAG, testName + ` case INITIALIZED`);
        avPlayer.surfaceId = surfaceID;
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer?.prepare((err) => {
          console.info(TAG, testName + ' case prepare called ' + err);
          if (err != null) {
            console.error(TAG, testName + ` case prepare error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info(TAG, testName + ' case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        break;
      case PREPARED:
        avPlayer?.play();
        break;
      case PLAYING:
        if (playCount == 0) {
          playCount++;
          avPlayer?.pause();
        }
        break;
      case PAUSED:
        await avPlayer?.getPlaybackStatisticMetrics().then(res => {
          console.info(TAG, testName + ' case getPlaybackStatisticMetrics called!!');
          if (typeof (res) != 'undefined') {
            arrayPlaybackMetrics = res;
          } else {
            console.info(TAG, testName + ' case getPlaybackStatisticMetrics is failed');
            expect().assertFail();
          }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        if (arrayPlaybackMetrics) {
          mediaTestBase.checkPlaybackStatisticMetrics(arrayPlaybackMetrics, playBackMetricsKey);
        }
        avPlayer?.play();
        break;
      case COMPLETED:
        await avPlayer?.getPlaybackStatisticMetrics().then(res => {
          console.info(TAG, testName + ' case getPlaybackStatisticMetrics called!!');
          if (typeof (res) != 'undefined') {
            arrayPlaybackMetrics = res;
          } else {
            console.info(TAG, testName + ' case getPlaybackStatisticMetrics is failed');
            expect().assertFail();
          }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        if (arrayPlaybackMetrics) {
          mediaTestBase.checkPlaybackStatisticMetrics(arrayPlaybackMetrics, playBackMetricsKey);
        }
        avPlayer?.release();
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  })
}

async function testCheckPlaybackStatisticMetrics(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  playBackMetricsKey: Array<string>, done: Function, testName: string) {
  console.info(TAG, testName + ` case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    if (err != null) {
      console.error(TAG, testName + ` case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    } else {
      console.info(TAG, testName + ` case media err: ${err}`);
      if (typeof (video) != 'undefined') {
        console.info(TAG, testName + ' case createAVPlayer success');
        avPlayer = video;
        setPlaybackStatisticMetricsCb(avPlayer, playBackMetricsKey, done, testName);
        setSource(avPlayer, src, testName);
      } else {
        console.error(TAG, testName + ` case createAVPlayer failed`);
        expect().assertFail();
        done();
      }
    }
  });
}

async function metricsON(avPlayer: media.AVPlayer, done: Function) {
  avPlayer.onMetricsEvent((eventArray: Array<media.AVMetricsEvent>) => {
    if (eventArray) {
      expect(eventArray.length).assertLarger(0);
      for (let i = 0; i < eventArray.length; i++) {
        console.info('onMetricsEvent info: AVMetricsEvent=' + JSON.stringify(eventArray[i]));
        expect(eventArray[i].event).assertLargerOrEqual(0);
        expect(eventArray[i].timeStamp).assertLargerOrEqual(0);
        expect(eventArray[i].playbackPosition).assertLargerOrEqual(0);
        expect(eventArray[i].details['mediaType']).assertLargerOrEqual(0);
        expect(eventArray[i].details['duration']).assertLargerOrEqual(0);
      }
      avPlayer.offMetricsEvent();
    } else {
      console.info('subtitleUpdate info is null');
      expect(false).assertTrue();
      done();
    }
  })
}

function metricsOFF(avPlayer: media.AVPlayer | null, done: Function, offFunc?: Callback<media.AVMetricsEvent[]>) {
  avPlayer?.on('stateChange', async (state, reason) =>{
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        console.info(`case INITIALIZED`);
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer.prepare((err) =>{
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
        avPlayer?.play();
        break;
      case COMPLETED:
        if (offFunc) {
          avPlayer?.offMetricsEvent(offFunc);
        } else {
          avPlayer?.offMetricsEvent();
        }
        avPlayer?.release()
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() =>{
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  })
}

async function testMetricsListening(src: string | media.AVFileDescriptor, testName: string,
  avPlayer: media.AVPlayer | null, metricsListening:Function, done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      metricsOFF(avPlayer, done);
      metricsListening(avPlayer,done);
      setSource(avPlayer, src, testName);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function testMetricsListening01(src: string | media.AVFileDescriptor, testName: string,
  avPlayer: media.AVPlayer | null, metricsListening:Function, done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      metricsOFF(avPlayer, done, (eventArray: Array<media.AVMetricsEvent>) => {
        if (eventArray) {
          for (let i = 0; i < eventArray.length; i++) {
            console.info('offMetricsEvent info: AVMetricsEvent=' + JSON.stringify(eventArray[i]));
            expect(eventArray[i].event).assertLargerOrEqual(0);
            expect(eventArray[i].timeStamp).assertLargerOrEqual(0);
            expect(eventArray[i].playbackPosition).assertLargerOrEqual(0);
            expect(eventArray[i].details['mediaType']).assertLargerOrEqual(0);
            expect(eventArray[i].details['duration']).assertLargerOrEqual(0);
          }
        }
      });
      metricsListening(avPlayer,done);
      setSource(avPlayer, src, testName);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

export default function AVPlayerTest() {
  describe('AVPlayerLocalTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case, check surfaceId is ' + globalThis.value);
      for (let i = 0; i < 10; i++) {
        if (!globalThis.value) {
          console.info(TAG, 'surfaceId is undefined');
          await mediaTestBase.msleepAsync(SLEEP_TIME_500);
        } else {
          console.info(TAG, 'surfaceId is ' + globalThis.value);
          break;
        }
      }
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE_MKV, openFileFailed).then((res) => {
        fileDescriptor_mkv = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor2 = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_NO_AUDIO, openFileFailed).then((res) => {
        fileDescriptor3 = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(SUBTITLE, openFileFailed).then((res) => {
        subtitleFdSrc = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE_M3U8, openFileFailed).then((res) => {
        fileDescriptor_m3u8 = res;
      });
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
      await sleep(SLEEP_TIME_500);
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach start');
      await sleep(SLEEP_TIME_500);
      if (avPlayer != null) {
        avPlayer.off('stateChange');
        console.info(TAG, 'afterEach case off stateChange-listen');
        avPlayer.off('error');
        console.info(TAG, 'afterEach case off error-listen');
        await avPlayer.release().then(() => {
          console.info(TAG, 'afterEach case release succeed.');
          avPlayer = null;
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      }
      console.info(TAG, 'afterEach end');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
      await mediaTestBase.closeFdNumber(fileDescriptor.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor_mkv.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor2.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor3.fd);
      await mediaTestBase.closeFdNumber(subtitleFdSrc.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor_m3u8.fd);
    });

    /**
     * @tc.name   createAVPlayer_callback_001
     * @tc.number AVPLAYER_LOCAL_TEST_001
     * @tc.desc   Creat aVPlayer callback test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVPlayer_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVPlayer_callback_001';
      media.createAVPlayer((error: BusinessError, video: media.AVPlayer) => {
        if (video != null) {
          avPlayer = video;
          console.info(TAG, testName + ' Succeeded in creating AVPlayer');
          expect(avPlayer.state).assertEqual(IDLE);
        } else {
          console.error(TAG, testName + `Failed to create AVPlayer, error message:${error.message}`);
          expect().assertFail();
        }
        done();
      });
    })

    /**
     * @tc.name   createAVPlayer_promise_001
     * @tc.number AVPLAYER_LOCAL_TEST_002
     * @tc.desc   Creat aVPlayer promise test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVPlayer_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVPlayer_promise_001';
      media.createAVPlayer().then((video: media.AVPlayer) => {
        if (video != null) {
          avPlayer = video;
          console.info(TAG, testName + ' Succeeded in creating AVPlayer');
          expect(avPlayer.state).assertEqual(IDLE);
        } else {
          console.error(TAG, testName + ' Failed to create AVPlayer');
          expect().assertFail();
        }
        done();
      }).catch((error: BusinessError) => {
        console.error(TAG, testName + ` Failed to create AVPlayer, error message:${error.message}`);
        done();
      });
    })

    /**
     * @tc.name   on_off_stateChange_001
     * @tc.number AVPLAYER_LOCAL_TEST_003
     * @tc.desc   Test on and off stateChange.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_stateChange_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_stateChange_001';
      let avPlayTest: PlayTest = {
        width: 720, height: 480, duration: 10100
      };
      if (fileDescriptor) {
        testAVPlayerFun(fileDescriptor, avPlayer, avPlayTest, PLAY_TIME, done, testName);
      }
    })

    /**
     * @tc.name   getTrackDescription_callback_001
     * @tc.number AVPLAYER_LOCAL_TEST_004
     * @tc.desc   Test getTrackDescription callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getTrackDescription_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getTrackDescription_callback_001';
      let videoTrackKey =
        new Array('bitrate', 'codec_mime', 'frame_rate', 'height', 'track_index', 'track_type', 'width');
      let audioTrackKey =
        new Array('bitrate', 'channel_count', 'codec_mime', 'sample_rate', 'track_index', 'track_type');
      let videoTrackValue = new Array(1366541, 0, 6000, 480, 0, 1, 720);
      let audioTrackValue = new Array(129207, 2, 1, 44100, 1, 0);
      let descriptionKey = new Array(videoTrackKey, audioTrackKey);
      let descriptionValue = new Array(videoTrackValue, audioTrackValue);
      if (fileDescriptor) {
        checkTrackDescriptionCallback(fileDescriptor, avPlayer, descriptionKey, descriptionValue, done, testName);
      }
    })

    /**
     * @tc.name   getTrackDescription_callback_002
     * @tc.number AVPLAYER_LOCAL_TEST_005
     * @tc.desc   Test getTrackDescription callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getTrackDescription_callback_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getTrackDescription_callback_002';
      let audioTrackKey = new Array('channel_count', 'codec_mime', 'sample_rate', 'track_index', 'track_type');
      let audioTrackValue = new Array(1, 2, 48000, 0, 0);
      let descriptionKey = new Array(audioTrackKey);
      let descriptionValue = new Array(audioTrackValue);
      if (fileDescriptor2) {
        checkTrackDescriptionCallback(fileDescriptor2, avPlayer, descriptionKey, descriptionValue, done, testName);
      }
    })

    /**
     * @tc.name   getTrackDescription_callback_003
     * @tc.number AVPLAYER_LOCAL_TEST_006
     * @tc.desc   Test getTrackDescription callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getTrackDescription_callback_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getTrackDescription_callback_003';
      let videoTrackKey =
        new Array('bitrate', 'codec_mime', 'frame_rate', 'height', 'track_index', 'track_type', 'width');
      let videoTrackValue = new Array(1506121, 0, 6000, 480, 0, 1, 720);
      let descriptionKey = new Array(videoTrackKey);
      let descriptionValue = new Array(videoTrackValue);
      if (fileDescriptor3) {
        checkTrackDescriptionCallback(fileDescriptor3, avPlayer, descriptionKey, descriptionValue, done, testName);
      }
    })

    /**
     * @tc.name   getTrackDescription_promise_001
     * @tc.number AVPLAYER_LOCAL_TEST_007
     * @tc.desc   Test getTrackDescription promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getTrackDescription_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getTrackDescription_promise_001';
      let videoTrackKey =
        new Array('bitrate', 'codec_mime', 'frame_rate', 'height', 'track_index', 'track_type', 'width');
      let audioTrackKey =
        new Array('bitrate', 'channel_count', 'codec_mime', 'sample_rate', 'track_index', 'track_type');
      let videoTrackValue = new Array(1366541, 0, 6000, 480, 0, 1, 720);
      let audioTrackValue = new Array(129207, 2, 1, 44100, 1, 0);
      let descriptionKey = new Array(videoTrackKey, audioTrackKey);
      let descriptionValue = new Array(videoTrackValue, audioTrackValue);
      if (fileDescriptor) {
        checkTrackDescriptionPromise(fileDescriptor, avPlayer, descriptionKey, descriptionValue, done, testName);
      }
    })

    /**
     * @tc.name   getTrackDescription_promise_002
     * @tc.number AVPLAYER_LOCAL_TEST_008
     * @tc.desc   Test getTrackDescription promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getTrackDescription_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'getTrackDescription_promise_002';
      let audioTrackKey = new Array('channel_count', 'codec_mime', 'sample_rate', 'track_index', 'track_type');
      let audioTrackValue = new Array(1, 2, 48000, 0, 0);
      let descriptionKey = new Array(audioTrackKey);
      let descriptionValue = new Array(audioTrackValue);
      if (fileDescriptor2) {
        checkTrackDescriptionPromise(fileDescriptor2, avPlayer, descriptionKey, descriptionValue, done, testName);
      }
    })

    /**
     * @tc.name   getTrackDescription_promise_003
     * @tc.number AVPLAYER_LOCAL_TEST_009
     * @tc.desc   Test getTrackDescription promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getTrackDescription_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'getTrackDescription_promise_003';
      let videoTrackKey =
        new Array('bitrate', 'codec_mime', 'frame_rate', 'height', 'track_index', 'track_type', 'width');
      let videoTrackValue = new Array(1506121, 0, 6000, 480, 0, 1, 720);
      let descriptionKey = new Array(videoTrackKey);
      let descriptionValue = new Array(videoTrackValue);
      if (fileDescriptor3) {
        checkTrackDescriptionPromise(fileDescriptor3, avPlayer, descriptionKey, descriptionValue, done, testName);
      }
    })

    /**
     * @tc.name   getPlaybackInfo_promise_001
     * @tc.number AVPLAYER_LOCAL_TEST_010
     * @tc.desc   Test getPlaybackInfo promise.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPlaybackInfo_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getPlaybackInfo_promise_001';
      let descriptionKey =
        new Array('server_ip_address', 'average_download_rate', 'download_rate', 'is_downloading', 'buffer_duration');
      let descriptionValue = new Array('', '0', '0', '0', '0');
      if (fileDescriptor) {
        testCheckPlaybackInfo(fileDescriptor, avPlayer, descriptionKey, descriptionValue, done, testName);
      }
    })

    /**
     * @tc.name   getPlaybackPosition_001
     * @tc.number AVPLAYER_LOCAL_TEST_012
     * @tc.desc   Test get the current playback position.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPlaybackPosition_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getPlaybackPosition_001';
      if (fileDescriptor) {
        await testGetPlaybackPosition(fileDescriptor, avPlayer, done, testName);
      }
    })

    /**
     * @tc.name   seek_time_and_mode_001
     * @tc.number AVPLAYER_LOCAL_TEST_014
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('seek_time_and_mode_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'seek_time_and_mode_001';
      if (fileDescriptor) {
        testAVPlayerSeekContinuous(fileDescriptor, avPlayer, 1000, media.SeekMode.SEEK_NEXT_SYNC, done, testName);
      }
    })

    /**
     * @tc.name   seek_time_and_mode_002
     * @tc.number AVPLAYER_LOCAL_TEST_015
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('seek_time_and_mode_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'seek_time_and_mode_002';
      if (fileDescriptor) {
        testAVPlayerSeekContinuous(fileDescriptor, avPlayer, 2000, media.SeekMode.SEEK_PREV_SYNC, done, testName);
      }
    })

    /**
     * @tc.name   seek_time_and_mode_003
     * @tc.number AVPLAYER_LOCAL_TEST_016
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('seek_time_and_mode_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'seek_time_and_mode_003';
      if (fileDescriptor) {
        testAVPlayerSeekContinuous(fileDescriptor, avPlayer, 3000, media.SeekMode.SEEK_CLOSEST, done, testName);
      }
    })

    /**
     * @tc.name   seek_time_and_mode_004
     * @tc.number AVPLAYER_LOCAL_TEST_017
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('seek_time_and_mode_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'seek_time_and_mode_004';
      if (fileDescriptor) {
        testAVPlayerSeekContinuous(fileDescriptor, avPlayer, 4000, media.SeekMode.SEEK_CLOSEST, done, testName);
      }
    })

    /**
     * @tc.name   seek_time_and_mode_005
     * @tc.number AVPLAYER_LOCAL_TEST_018
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('seek_time_and_mode_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'seek_time_and_mode_005';
      if (fileDescriptor) {
        testAVPlayerSeekContinuous(fileDescriptor, avPlayer, 5000, media.SeekMode.SEEK_NEXT_SYNC, done, testName);
      }
    })

    /**
     * @tc.name   selectTrack_promise_001
     * @tc.number AVPLAYER_LOCAL_TEST_020
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('selectTrack_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'selectTrack_promise_001';
      if (fileDescriptor) {
        await beforeSelectTrack(fileDescriptor, avPlayer, testName);
        selectTrack(currentTrack, testName);
        await sleep(SLEEP_TIME_20);
        console.info(TAG, testName + ' selectTrack currentTrack: ' + currentTrack);
        expect(currentTrack).assertLargerOrEqual(0);
        done();
      }
    })

    /**
     * @tc.name   deselectTrack_promise_001
     * @tc.number AVPLAYER_LOCAL_TEST_021
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('deselectTrack_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'deselectTrack_promise_001';
      if (fileDescriptor) {
        await beforeSelectTrack(fileDescriptor, avPlayer, testName);
        selectTrack(currentTrack, testName);
        await sleep(SLEEP_TIME_20);
        console.info(TAG, testName + ' selectTrack currentTrack: ' + currentTrack);
        deselectTrack(currentTrack, testName);
        await sleep(SLEEP_TIME_20);
        console.info(TAG, testName + ' deselectTrack currentTrack: ' + currentTrack);
        expect(currentTrack).assertLargerOrEqual(0);
        done();
      }
    })

    /**
     * @tc.name   setMediaMuted_promise_001
     * @tc.number AVPLAYER_LOCAL_TEST_023
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setMediaMuted_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setMediaMuted_promise_001';
      if (fileDescriptor) {
        setMediaMutedPromise(fileDescriptor, avPlayer, done, testName, true);
      }
    })

    /**
     * @tc.name   setMediaMuted_promise_002
     * @tc.number AVPLAYER_LOCAL_TEST_024
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setMediaMuted_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setMediaMuted_promise_002';
      if (fileDescriptor) {
        await setMediaMutedPromise(fileDescriptor, avPlayer, done, testName, false);
      }
    })

    /**
     * @tc.name   setMediaMuted_promise_003
     * @tc.number AVPLAYER_LOCAL_TEST_025
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setMediaMuted_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setMediaMuted_promise_003';
      if (fileDescriptor2) {
        await setMediaMutedPromise(fileDescriptor2, avPlayer, done, testName, true);
      }
    })

    /**
     * @tc.name   setMediaMuted_promise_abnormal_001
     * @tc.number AVPLAYER_LOCAL_TEST_026
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setMediaMuted_promise_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setMediaMuted_promise_abnormal_001';
      if (fileDescriptor) {
        await setMediaMutedPromiseAbnormal(fileDescriptor, avPlayer, done, testName, media.MediaType.MEDIA_TYPE_VID,
          true);
      }
    })

    /**
     * @tc.name   setMediaMuted_promise_normal_002
     * @tc.number AVPLAYER_LOCAL_TEST_027
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setMediaMuted_promise_normal_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setMediaMuted_promise_normal_002';
      if (fileDescriptor) {
        await setMediaMutedPromiseAbnormal(fileDescriptor, avPlayer, done, testName,
          media.MediaType.MEDIA_TYPE_SUBTITLE, false);
      }
    })

    /**
     * @tc.name   isSeekContinuousSupported_normal_001
     * @tc.number AVPLAYER_LOCAL_TEST_028
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isSeekContinuousSupported_normal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'isSeekContinuousSupported_normal_001';
      if (fileDescriptor) {
        await getSeekContinuousSupported(fileDescriptor, avPlayer, done, testName);
      }
    })

    /**
     * @tc.name   setPlaybackStrategy_promise_001
     * @tc.number AVPLAYER_LOCAL_TEST_029
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPlaybackStrategy_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setPlaybackStrategy_promise_001';
      let playbackStrategy: media.PlaybackStrategy = { preferredBufferDuration: 20 };
      if (fileDescriptor) {
        await setPlaybackStrategyPromise(fileDescriptor, avPlayer, playbackStrategy, done, testName);
      }
    })

    /**
     * @tc.name   setPlaybackStrategy_promise_002
     * @tc.number AVPLAYER_LOCAL_TEST_030
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPlaybackStrategy_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setPlaybackStrategy_promise_002';
      let playbackStrategy: media.PlaybackStrategy = {
        mutedMediaType: media.MediaType.MEDIA_TYPE_AUD,
        preferredAudioLanguage: "und",
        preferredSubtitleLanguage: "eng"
      }
      if (fileDescriptor) {
        await setPlaybackStrategyPromise(fileDescriptor, avPlayer, playbackStrategy, done, testName);
      }
    })

    /**
     * @tc.name   setPlaybackStrategy_promise_003
     * @tc.number AVPLAYER_LOCAL_TEST_031
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPlaybackStrategy_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setPlaybackStrategy_promise_003';
      let playbackStrategy: media.PlaybackStrategy = {
        mutedMediaType: media.MediaType.MEDIA_TYPE_AUD,
        preferredAudioLanguage: undefined,
        preferredSubtitleLanguage: undefined
      }
      if (fileDescriptor) {
        await setPlaybackStrategyPromise(fileDescriptor, avPlayer, playbackStrategy, done, testName);
      }
    })

    /**
     * @tc.name   setPlaybackStrategy_promise_004
     * @tc.number AVPLAYER_LOCAL_TEST_032
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPlaybackStrategy_promise_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'setPlaybackStrategy_promise_004';
      let playbackStrategy: media.PlaybackStrategy = {
        preferredWidth: 1,
        preferredHeight: 2,
        preferredBufferDuration: 3,
        preferredHdr: false,
        enableSuperResolution: true,
        mutedMediaType: media.MediaType.MEDIA_TYPE_VID,
        preferredBufferDurationForPlaying: 1,
        thresholdForAutoQuickPlay: 5
      };
      if (fileDescriptor) {
        await setPlaybackStrategyPromise(fileDescriptor, avPlayer, playbackStrategy, done, testName);
      }
    })

    /**
     * @tc.name   setPlaybackRange_promise_001
     * @tc.number AVPLAYER_LOCAL_TEST_033
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPlaybackRange_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setPlaybackRange_promise_001';
      if (fileDescriptor) {
        let startTimeMs: number = 1000;
        let endTimeMs: number = 3000;
        let mode: media.SeekMode = media.SeekMode.SEEK_CLOSEST;
        expect(startTimeMs).assertLargerOrEqual(-1);
        await setPlaybackRangePromise(fileDescriptor, avPlayer, startTimeMs, endTimeMs, mode, done, testName);
      }
    })

    /**
     * @tc.name   setPlaybackRange_promise_002
     * @tc.number AVPLAYER_LOCAL_TEST_034
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setPlaybackRange_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setPlaybackRange_promise_002';
      if (fileDescriptor) {
        let startTimeMs: number = -1;
        let endTimeMs: number = -1;
        let mode: media.SeekMode = media.SeekMode.SEEK_CLOSEST;
        expect(startTimeMs).assertLargerOrEqual(-1);
        await setPlaybackRangePromise(fileDescriptor, avPlayer, startTimeMs, endTimeMs, mode, done, testName);
      }
    })

    /**
     * @tc.name   setSuperResolution_promise_001
     * @tc.number AVPLAYER_LOCAL_TEST_035
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setSuperResolution_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setSuperResolution_promise_001';
      let strategy: media.PlaybackStrategy = { enableSuperResolution: true };
      if (fileDescriptor) {
        await setSuperResolutionPromise(fileDescriptor, avPlayer, strategy, true, done, testName);
      }
    })

    /**
     * @tc.name   setSuperResolution_promise_002
     * @tc.number AVPLAYER_LOCAL_TEST_035
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setSuperResolution_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setSuperResolution_promise_002';
      let strategy: media.PlaybackStrategy = { enableSuperResolution: true };
      if (fileDescriptor) {
        await setSuperResolutionPromise(fileDescriptor, avPlayer, strategy, false, done, testName);
      }
    })

    /**
     * @tc.name   setSuperResolution_promise_abnormal_001
     * @tc.number AVPLAYER_LOCAL_TEST_036
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setSuperResolution_promise_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setSuperResolution_promise_abnormal_001';
      if (fileDescriptor) {
        await setSuperResolutionPromiseAbnormal(fileDescriptor, avPlayer, true, done, testName);
      }
    })

    /**
     * @tc.name   setVideoWindowSize_promise_001
     * @tc.number AVPLAYER_LOCAL_TEST_037
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVideoWindowSize_promise_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setVideoWindowSize_promise_001';
      if (fileDescriptor) {
        await setVideoWindowSizePromise(fileDescriptor, avPlayer, 640, 480, done, testName);
      }
    })

    /**
     * @tc.name   setVideoWindowSize_promise_002
     * @tc.number AVPLAYER_LOCAL_TEST_038
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVideoWindowSize_promise_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'setVideoWindowSize_promise_002';
      if (fileDescriptor) {
        await setVideoWindowSizePromise(fileDescriptor, avPlayer, 320, 320, done, testName);
      }
    })

    /**
     * @tc.name   setVideoWindowSize_promise_003
     * @tc.number AVPLAYER_LOCAL_TEST_039
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVideoWindowSize_promise_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'setVideoWindowSize_promise_003';
      if (fileDescriptor) {
        await setVideoWindowSizePromise(fileDescriptor, avPlayer, 200, 200, done, testName);
      }
    })

    /**
     * @tc.name   setVideoWindowSize_promise_abnormal_001
     * @tc.number AVPLAYER_LOCAL_TEST_040
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setVideoWindowSize_promise_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setVideoWindowSize_promise_abnormal_001';
      if (fileDescriptor) {
        await setVideoWindowSizePromiseAbnormal(fileDescriptor, avPlayer, 640, 480, done, testName);
      }
    })

    /**
     * @tc.name   on_off_superResolutionChanged_001
     * @tc.number AVPLAYER_LOCAL_TEST_041
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_superResolutionChanged_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_superResolutionChanged_001';
      if (fileDescriptor) {
        await superResolutionChangedListen(fileDescriptor, avPlayer, 320, 320, done, testName);
      }
    })

    /**
     * @tc.name   on_off_trackChange_trackInfoUpdate_001
     * @tc.number AVPLAYER_LOCAL_TEST_044
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_trackChange_trackInfoUpdate_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_trackChange_trackInfoUpdate_001';
      if (fileDescriptor) {
        let preparedOperation = async () => {
          await getAudioTracks(testName);
          await getCurrentSelectedTrack(testName);
          await getCurrentAudioTrack(testName);
          selectTrack(currentTrack, testName);
          await mediaTestBase.msleepAsync(SLEEP_TIME_500);
          deselectTrack(currentTrack, testName);
          console.info(TAG,
            testName + ' preparedOperation currentTrack is ' + currentTrack + ', selectedTrack is ' + selectedTrack);
          expect(currentTrack != selectedTrack).assertTrue();
        };

        let playedOperation = async () => {
          await changeAudioTrack(testName);
          avPlayer?.selectTrack(selectedTrack, media.SwitchMode.SEGMENT);
          await mediaTestBase.msleepAsync(SLEEP_TIME_500);
          await getCurrentAudioTrack(testName);
          console.info(TAG,
            testName + ' playedOperation currentTrack is ' + currentTrack + ', selectedTrack is ' + selectedTrack);
        };

        let stoppedOperation = async () => {
          console.info(TAG, testName + ' case now stopped, to reset');
          await avPlayer?.reset().then(() => {
            console.info(TAG, testName + ' case reset AVPlayer success');
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          offCallback(avPlayer, ['stateChange', 'trackChange', 'trackInfoUpdate', 'error'], testName);
          await avPlayer?.release().then(() => {
            console.info(TAG, testName + ' case release AVPlayer success');
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
          done();
        };

        await testChangeTrackListening(fileDescriptor, preparedOperation, playedOperation, stoppedOperation,
          changeTrackOn, done, testName);
      }
    })

    /**
     * @tc.name   on_off_amplitudeUpdate_001
     * @tc.number AVPLAYER_LOCAL_TEST_045
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_amplitudeUpdate_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_amplitudeUpdate_001';
      if (fileDescriptor) {
        await amplitudeUpdateListen(fileDescriptor, avPlayer, done, testName);
      }
    })

    /**
     * @tc.name   on_off_audioOutputDeviceChangeWithInfo_001
     * @tc.number AVPLAYER_LOCAL_TEST_046
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_audioOutputDeviceChangeWithInfo_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_audioOutputDeviceChangeWithInfo_001';
      if (fileDescriptor) {
        await audioOutputDeviceChangeWithInfoListen(fileDescriptor, avPlayer, done, testName);
      }
    })

    /**
     * @tc.name   on_off_seiMessageReceived_001
     * @tc.number AVPLAYER_LOCAL_TEST_047
     * @tc.desc   Test jump to the specified playback location.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('on_off_seiMessageReceived_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_seiMessageReceived_001';
      const videoSrc = 'http://media.iyuns.top:1003/live/SEI-H264.flv';
      payloadTypes = [5];
      await checkDataCanBeRead(videoSrc, done, testName);
      if (dataCanBeRead) {
        await testSeiMessage(videoSrc, avPlayer, payloadTypes, done, testName);
      } else {
        done();
      }
    })

    /**
     * @tc.name   getPlaybackStatisticMetrics_001
     * @tc.number AVPLAYER_LOCAL_TEST_048
     * @tc.desc   Test getPlaybackStatisticMetrics promise.
     * @tc.size   MediumTest
     * @tc.type   Function test
     * @tc.level  Level0
     */
    it('getPlaybackStatisticMetrics_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'getPlaybackStatisticMetrics_001';
      let playBackMetricsKey =
        new Array('prepare_duration', 'resource_connection_duration', 'first_frame_decapsulation_duration', 
          'total_playback_time', 'loading_requests_count', 'total_loading_time', 'total_loading_bytes',
          'stalling_count', 'total_stalling_time');
      expect(fileDescriptor.fd).assertLarger(0);
      if (fileDescriptor) {
        testCheckPlaybackStatisticMetrics(fileDescriptor, avPlayer, playBackMetricsKey, done, testName);
      }
    })

    /**
     * @tc.name   metricsControl_001
     * @tc.number AVPLAYER_LOCAL_TEST_049
     * @tc.desc   Local Video metrics control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('metricsControl_001', Level.LEVEL0,async (done: Function) => {
      expect(fileDescriptor.fd).assertLarger(0);     
      if (fileDescriptor && subtitleFdSrc) {
        testMetricsListening(fileDescriptor, "SUB_MULTIMEDIA_MEDIA_VIDEO_METRICS_ON_0100", avPlayer, metricsON, done);
      }
    });

    /**
     * @tc.name   metricsControl_002
     * @tc.number AVPLAYER_LOCAL_TEST_050
     * @tc.desc   Local Video metrics control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('metricsControl_002', Level.LEVEL0,async (done: Function) => {
      expect(fileDescriptor.fd).assertLarger(0);
      if (fileDescriptor && subtitleFdSrc) {
        testMetricsListening01(fileDescriptor, "metricsControl_002", avPlayer, metricsON, done);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_METRICS_ENUM_0100
     * @tc.number AVPLAYER_LOCAL_TEST_051
     * @tc.desc   Local Video metrics enum test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_METRICS_ENUM_0100', Level.LEVEL0,async (done: Function) => {
      expect(media.AVMetricsEventType.AV_METRICS_EVENT_STALLING).assertEqual(1);
      expect(media.PlaybackMetricsKey.PREPARE_DURATION).assertEqual("prepare_duration");
      expect(media.PlaybackMetricsKey.RESOURCE_CONNECTION_DURATION).assertEqual("resource_connection_duration");
      expect(media.PlaybackMetricsKey.FIRST_FRAME_DECAPSULATION_DURATION).assertEqual("first_frame_decapsulation_duration");
      expect(media.PlaybackMetricsKey.TOTAL_PLAYING_TIME).assertEqual("total_playback_time");
      expect(media.PlaybackMetricsKey.DOWNLOAD_REQUESTS_COUNT).assertEqual("loading_requests_count");
      expect(media.PlaybackMetricsKey.TOTAL_DOWNLOAD_TIME).assertEqual("total_loading_time");
      expect(media.PlaybackMetricsKey.TOTAL_DOWNLOAD_SIZE).assertEqual("total_loading_bytes");
      expect(media.PlaybackMetricsKey.STALLING_COUNT).assertEqual("stalling_count");
      expect(media.PlaybackMetricsKey.TOTAL_STALLING_TIME).assertEqual("total_stalling_time");
      done();
    });
  })
}