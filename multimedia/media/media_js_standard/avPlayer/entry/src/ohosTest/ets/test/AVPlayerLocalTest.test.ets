/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import media from '@ohos.multimedia.media'
import audio from '@ohos.multimedia.audio';
import { testAVPlayerFun, setSource, setSubtitle, PlayTest } from './AVPlayerTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';

const VIDEO_SOURCE = 'H264_AAC.mp4';
const VIDEO_SOURCE_MKV = 'H264_AAC.mkv'
const AUDIO_SOURCE = '01.mp3';
const VIDEO_NOAUDIO = 'H264_NONE.mp4'
const SUBTITLE = 'srt_2800.srt'
const PLAY_TIME = 3000;
const TAG = 'AVPlayerLocalTest:';
const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';
const PAGE_PATH = "testability/pages/Surface"
let fileDescriptor: media.AVFileDescriptor;
let fileDescriptor_mkv: media.AVFileDescriptor;
let fileDescriptor2: media.AVFileDescriptor;
let fileDescriptor3: media.AVFileDescriptor;
let avPlayer: media.AVPlayer | null = null;
let fdPath = '';
let fdNumber = 0;
let loopTime: number = 0;
let subtitleFdSrc: media.AVFileDescriptor;
let invalidPlaybackStrategy = false;
let checkPlaybackStrategySuccess = false;
let mediaTestBase = new MediaTestBase()

function setAVPlayerTrackCb(avPlayer: media.AVPlayer | null, descriptionKey: Array<Array<string>>,
  descriptionValue: Array<Array<number>>, done: Function) {
  let arrayDescription: Array<media.MediaDescription> | undefined = undefined;
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
        await avPlayer?.getTrackDescription().then((arrayList) => {
          console.info('case getTrackDescription called!!');
          if (typeof (arrayList) != 'undefined') {
            arrayDescription = arrayList;
          } else {
            console.info('case getTrackDescription is failed');
            expect().assertFail();
          }
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        expect(descriptionKey.length).assertEqual(arrayDescription?.length);
        if (arrayDescription) {
          for (let i = 0; i < arrayDescription.length; i++) {
            mediaTestBase.checkDescription(arrayDescription[i], descriptionKey[i], descriptionValue[i]);
          }
        }
        avPlayer?.getTrackDescription((error, arrayList) => {
          if (error == null) {
            for (let i = 0; i < arrayList.length; i++) {
              mediaTestBase.checkDescription(arrayList[i], descriptionKey[i], descriptionValue[i]);
            }
          } else {
            console.info('getTrackDescription failed, message is:' + error.message);
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
  })
}

async function testCheckTrackDescription(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  descriptionKey: Array<Array<string>>, descriptionValue: Array<Array<number>>, done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setAVPlayerTrackCb(avPlayer, descriptionKey, descriptionValue, done)
      setSource(avPlayer, src);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

function setPlaybackInfoCb(avPlayer: media.AVPlayer | null, descriptionKey: Array<string>,
  descriptionValue: Array<string>, done: Function) {
  let arrayDescription: media.PlaybackInfo | undefined = undefined;
  ;
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
        avPlayer?.prepare((err) => {
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
        await avPlayer?.getPlaybackInfo().then(res => {
          console.info('case getPlaybackInfo called!!');
          if (typeof (res) != 'undefined') {
            arrayDescription = res;
          } else {
            console.info('case getPlaybackInfo is failed');
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
  descriptionKey: Array<string>, descriptionValue: Array<string>, done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    } else {
      console.info(`case media err: ${err}`)
      if (typeof (video) != 'undefined') {
        console.info('case createAVPlayer success');
        avPlayer = video;
        setPlaybackInfoCb(avPlayer, descriptionKey, descriptionValue, done)
        setSource(avPlayer, src);
      } else {
        console.error(`case createAVPlayer failed`);
        expect().assertFail();
        done();
      }
    }
  });
}

async function setAVPlayerScaleCb(avPlayer: media.AVPlayer | null, done: Function) {
  let surfaceID: string = globalThis.value;
  let count = 0;
  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        console.info(`case INITIALIZED`);
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer.surfaceId = surfaceID;
        avPlayer.prepare((err) => {
          console.info('case prepare called' + err);
          if (avPlayer) {
            avPlayer.loop = true;
          }

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
        console.info('case prepare called');
        avPlayer?.play((err) => {
          console.info('case play called' + err);
          if (err != null) {
            console.error(`case play error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        break;
      case PLAYING:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        console.info('case playing called');
        for (let i = 0; i < 20; i++) {
          if (count == 0) {
            console.info('case set  videoScaleType : 1');
            avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
            count = 1;
          } else {
            console.info('case set  videoScaleType : 0');
            avPlayer.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
            count = 0;
          }
          await mediaTestBase.msleepAsync(500);
        }
        avPlayer.loop = false;
        break;
      case COMPLETED:
        expect(avPlayer?.state).assertEqual(COMPLETED);
        expect(avPlayer?.currentTime).assertEqual(avPlayer?.duration);
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

async function testVideoScaleType(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setAVPlayerScaleCb(avPlayer, done)
      setSource(avPlayer, src);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function setOnCallback(avPlayer: media.AVPlayer | null, done: Function) {
  let surfaceID: string = globalThis.value;
  let count = 0;
  let playCount = 0;
  avPlayer?.on('endOfStream', () => {
    count++;
    console.info(TAG + 'endOfStream success')
    avPlayer?.off('endOfStream')
  })
  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        console.info(`case INITIALIZED`);
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer.surfaceId = surfaceID;
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
        console.info('case prepare called');
        avPlayer?.play().then(() => {
          console.info('play called success')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case PLAYING:
        if (playCount == 0) {
          playCount++;
          avPlayer?.pause().then(() => {
            console.info('play called success')
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        console.info('case playing called');
        break;
      case PAUSED:
        avPlayer?.play((err) => {
          console.info('case play called');
          if (err != null) {
            console.error(`case play error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        console.info('case pause called');
        break;
      case STOPPED:
        expect(count).assertEqual(1);
        console.info('case stop called');
        avPlayer?.release().then(() => {
          console.info('play stop success')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case COMPLETED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        expect(avPlayer.state).assertEqual(COMPLETED);
        expect(avPlayer.currentTime).assertEqual(avPlayer.duration);
        if (playCount == 1) {
          playCount++
          avPlayer?.play().then(() => {
            console.info('play called success')
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          avPlayer?.stop().then(() => {
            console.info('play stop success')
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
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

async function SetPlaybackRange(startTimeMs: number, endTimeMs: number, mode: media.SeekMode,
    avPlayer: media.AVPlayer | null, done: Function) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0;
  let stateChangeCallback = async (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer.surfaceId = surfaceID;
        avPlayer.setPlaybackRange(startTimeMs, endTimeMs, mode).then(() => {
        }).catch((err: BusinessError) => {
          console.error(`setPlaybackRange failed, err code ${err.code} msg ${err.message}`);
          expect().assertFail();
        });
        avPlayer.prepare();
        break;
      case PREPARED:
        if (startTimeMs > 0) {
          expect(avPlayer?.currentTime).assertEqual(startTimeMs);
        } else if (startTimeMs == -1) {
          expect(avPlayer?.currentTime).assertEqual(0);
        }
        expect(avPlayer?.state).assertEqual(PREPARED);
        avPlayer?.play();
        break;
      case PLAYING:
        if (pauseCount++ == 0) {
          avPlayer?.pause();
        }
        break;
      case PAUSED:
        avPlayer?.play();
        break;
      case COMPLETED:
        if (endTimeMs > 0) {
          expect(avPlayer?.currentTime).assertLessOrEqual(endTimeMs);
        } else if (endTimeMs == -1) {
          expect(avPlayer?.currentTime).assertEqual(avPlayer?.duration);
        }
        expect(avPlayer?.state).assertEqual(COMPLETED);
        avPlayer?.release();
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        console.info(`An error occurred during playback`);
        avPlayer?.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        expect().assertFail();
        done();
        break;
      default:
        break;
    }
  }
  avPlayer?.on('stateChange', stateChangeCallback);
}

async function testSetPlaybackRange(src: string | media.AVFileDescriptor, startTimeMs: number, endTimeMs: number,
  mode: media.SeekMode, avPlayer: media.AVPlayer | null, done: Function) {
  console.info(`case media source: ${src}`);
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`);
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      expect(avPlayer?.state).assertEqual(IDLE);
      SetPlaybackRange(startTimeMs, endTimeMs, mode, avPlayer, done);
      setSource(avPlayer, src);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

function setPlayerPlaybackStrategy(avPlayer: media.AVPlayer | null, playbackStrategy: media.PlaybackStrategy) {
  avPlayer?.setPlaybackStrategy(playbackStrategy).catch((error: BusinessError) => {
    console.error(`setPlaybackStrategy failed, err code ${error.code} msg ${error.message}`)
    expect().assertFail();
  })
}

async function setInvalidPlayerPlaybackStrategy(avPlayer: media.AVPlayer | null,
  playbackStrategy: media.PlaybackStrategy) {
  avPlayer?.setPlaybackStrategy(playbackStrategy).catch((error: BusinessError) => {
    console.error(`setPlaybackStrategy failed, err code ${error.code} msg ${error.message}`)
     if (error.code == media.AVErrorCode.AVERR_INVALID_PARAMETER && invalidPlaybackStrategy) {
      checkPlaybackStrategySuccess = true;
    } else {
      expect().assertFail();
    }
  });
}

async function setPlaybackStrategyDASH(avPlayer: media.AVPlayer | null, done: Function) {
  let surfaceID: string = globalThis.value;
  let playbackStrategy: media.PlaybackStrategy = { mutedMediaType: media.MediaType.MEDIA_TYPE_AUD,preferredAudioLanguage:"und", preferredSubtitleLanguage:"eng" }
  let pauseCount = 0
  let stateChangeCallback = async (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer.surfaceId = surfaceID;
        setPlayerPlaybackStrategy(avPlayer, playbackStrategy)
        avPlayer.prepare()
        break;
      case PREPARED:
        avPlayer?.play()
        break;
      case PLAYING:
        if (pauseCount++ == 0) {
          avPlayer?.pause()
        }
        break;
      case PAUSED:
        avPlayer?.play()
        break;
      case COMPLETED:
        avPlayer?.release()
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        avPlayer?.release().then(() => {
        },
          mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        expect().assertFail();
        break;
      default:
        break;
    }
  }
  avPlayer?.on('stateChange', stateChangeCallback)
}

async function setPlaybackStrategy(avPlayer: media.AVPlayer | null, done: Function,
  playbackStrategy: media.PlaybackStrategy) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0
  let stateChangeCallback = async (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer.surfaceId = surfaceID;
        setPlayerPlaybackStrategy(avPlayer, playbackStrategy)
        avPlayer.prepare()
        break;
      case PREPARED:
        avPlayer?.play()
        break;
      case PLAYING:
        if (pauseCount++ == 0) {
          avPlayer?.pause()
        }
        break;
      case PAUSED:
        avPlayer?.play()
        break;
      case COMPLETED:
        avPlayer?.release()
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        avPlayer?.release().then(() => {
        },
          mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        expect().assertFail();
        break;
      default:
        break;
    }
  }
  avPlayer?.on('stateChange', stateChangeCallback)
}

async function setPlaybackStrategyFlv(avPlayer: media.AVPlayer | null, done: Function,
  playbackStrategy: media.PlaybackStrategy) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0
  let stateChangeCallback = async (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer.surfaceId = surfaceID;
        await setInvalidPlayerPlaybackStrategy(avPlayer, playbackStrategy);
        avPlayer.prepare()
        break;
      case PREPARED:
        avPlayer?.play()
        break;
      case PLAYING:
        if (pauseCount++ == 0) {
          avPlayer?.pause()
        }
        break;
      case PAUSED:
        avPlayer?.play()
        break;
      case COMPLETED:
        avPlayer?.release()
        break;
      case RELEASED:
        avPlayer = null;
        expect(checkPlaybackStrategySuccess == invalidPlaybackStrategy).assertTrue();
        done();
        break;
      case ERROR:
        avPlayer?.release().then(() => {
        },
          mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        expect().assertFail();
        break;
      default:
        break;
    }
  }
  avPlayer?.on('stateChange', stateChangeCallback)
}

interface MediaMutedParams{
  MediaType: media.MediaType,
  isMuted: boolean,
  result: boolean,
  errorCode?: number
}
function setPlayerMediaMuted(mediaMutedParams: MediaMutedParams, isErrorMonitoring: boolean = false) {
  exceptFail = isErrorMonitoring
  try {
    avPlayer?.setMediaMuted(mediaMutedParams.MediaType, mediaMutedParams.isMuted).then(() => {
      if(mediaMutedParams.result){
        console.info(`setMediaMuted success - is expected`)
      }else{
        console.error(`setMediaMuted success - is not expected`)
        expect().assertFail()
      }
    }).catch((error: BusinessError) => {
      if(mediaMutedParams.result){
        console.error(`setMediaMuted failed - is not expected, err code ${error.code} msg ${error.message}`)
        expect().assertFail();
      }else{
        console.info(`setMediaMuted failed - is expected, err code ${error.code} msg ${error.message}`)
        expect(error.code).assertEqual(mediaMutedParams.errorCode)
      }
    })
  } catch (error) {
    if(!exceptFail){
      console.error(`function avPlayer.setMediaMuted run error, error: ${JSON.stringify(error)}`)
      Promise.resolve().then(() => expect().assertFail())
    }else{
      console.info(`function avPlayer.setMediaMuted run error, the error was triggered by avPlayer.on('error')`)
    }
  }finally{
    console.info(`current state is: ${avPlayer?.state}`)
  }
}

async function setMediaMutedNormal(params: MediaMutedParams, done: Function) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0
  let stateChangeCallback = async (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer.surfaceId = surfaceID;
        avPlayer.prepare()
        break;
      case PREPARED:
        setPlayerMediaMuted(params)
        avPlayer?.play()
        break;
      case PLAYING:
        if (pauseCount++ > 0) {
          break;
        }
        setPlayerMediaMuted(params)
        avPlayer?.pause()
        break;
      case PAUSED:
        setPlayerMediaMuted(params)
        avPlayer?.play()
        break;
      case COMPLETED:
        setPlayerMediaMuted(params)
        avPlayer?.release()
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        },
          mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  }
  avPlayer?.on('stateChange', stateChangeCallback)
}

let exceptFail = false
async function setMediaMutedInErrorState(params: MediaMutedParams, done: Function) {
  let surfaceID: string = globalThis.value;
  let stateChangeCallback = async (state: media.AVPlayerState) => {
    switch (state) {
      case IDLE:
        setPlayerMediaMuted(params, true)
        avPlayer?.release()
        break;
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer.surfaceId = surfaceID;
        setPlayerMediaMuted(params, true)
        avPlayer.prepare()
        break;
      case PREPARED:
        avPlayer?.stop()
        break;
      case STOPPED:
        setPlayerMediaMuted(params, true)
        avPlayer?.reset()
        break;
      case RELEASED:
        setPlayerMediaMuted(params, true)
        await mediaTestBase.msleepAsync(1000)
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        },
          mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  }
  avPlayer?.on('stateChange', stateChangeCallback)
  avPlayer?.on('error',(error: BusinessError) => {
    console.info(`function avPlayer.setMediaMuted run error, error: ${JSON.stringify(error)}`)
    expect(error.code).assertEqual(params.errorCode)
    exceptFail = false
  })
}

async function setMediaMutedUseUnsupportMediaType(params: MediaMutedParams, done: Function) {
  let surfaceID: string = globalThis.value;
  let stateChangeCallback = async (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer.surfaceId = surfaceID;
        avPlayer.prepare()
        break;
      case PREPARED:
        setPlayerMediaMuted(params)
        await mediaTestBase.msleepAsync(1000)
        avPlayer?.release()
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        },
          mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  }
  avPlayer?.on('stateChange', stateChangeCallback)
}

async function testOffCallback(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setOnCallback(avPlayer, done)
      setSource(avPlayer, src);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function testSubtitle(src: string | media.AVFileDescriptor, subtitleSrc: string | media.AVFileDescriptor,
  avPlayer: media.AVPlayer | null, done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setOnCallback(avPlayer, done)
      setSource(avPlayer, src);
      setSubtitle(avPlayer, subtitleSrc)
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function testSetPlaybackStrategy(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, playbackStrategy: media.PlaybackStrategy) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setPlaybackStrategy(avPlayer, done, playbackStrategy)
      setSource(avPlayer, src);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}
async function testSetPlaybackStrategyDASH(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setPlaybackStrategyDASH(avPlayer, done)
      setSource(avPlayer, src);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function testSetPlaybackStrategyFlv(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function, playbackStrategy: media.PlaybackStrategy) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setPlaybackStrategyFlv(avPlayer, done, playbackStrategy)
      setSource(avPlayer, src);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function testSetMediaMuted(src: string | media.AVFileDescriptor, params: MediaMutedParams, done: Function, setMediaMuted: Function = setMediaMutedNormal) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setMediaMuted(params, done)
      setSource(avPlayer, src);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function getPlaybackPosition(avPlayer: media.AVPlayer | null, done: Function) {
  let playbackPosition: number = -1;
  let stateChangeCallback = async (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer.prepare()
        break;
      case PREPARED:
        avPlayer?.play()
        break;
      case PLAYING:
        avPlayer?.pause()
        break;
      case PAUSED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer?.play()
        playbackPosition = avPlayer.getPlaybackPosition();
        console.info(`AVPlayer getPlaybackPosition == ${playbackPosition} ms`);
        expect(playbackPosition).assertLargerOrEqual(0);
        break;
      case COMPLETED:
        avPlayer?.release()
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        },
          mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  }
  avPlayer?.on('stateChange', stateChangeCallback)
}

async function testGetPlaybackPosition(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      getPlaybackPosition(avPlayer, done);
      setSource(avPlayer, src);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

function setAVPlayerSeekContinuousCb(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: Function) {
  let isSeekContinuousSupported: boolean  = false;
  let unsupportedSeekContinuousErr = false;
  let firstPlay = true;
  let surfaceID: string = globalThis.value;
  console.info(`case setCallback in, surfaceID is ${surfaceID}`);
  avPlayer?.on('stateChange', async (state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
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
        console.info('case initialized -> prepared');
        avPlayer?.prepare();
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        if (avPlayer) {
          isSeekContinuousSupported = avPlayer.isSeekContinuousSupported();
        }
        avPlayer?.seek(1000, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.seek(2000, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.seek(-1, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.play();
        break;
      case PLAYING:
        expect(avPlayer?.state).assertEqual(PLAYING);
        if (firstPlay) {
          await mediaTestBase.msleepAsync(1000);
          firstPlay = false;
          avPlayer?.pause();
        } else {
          avPlayer?.seek(1500, media.SeekMode.SEEK_CONTINUOUS);
          avPlayer?.seek(1000, media.SeekMode.SEEK_CONTINUOUS);
          avPlayer?.seek(-1, media.SeekMode.SEEK_CONTINUOUS);
        }
        break;
      case PAUSED:
        expect(avPlayer?.state).assertEqual(PAUSED);
        avPlayer?.seek(2000, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.seek(2500, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.seek(-1, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.play();
        break;
      case COMPLETED:
        expect(avPlayer?.state).assertEqual(COMPLETED);
        avPlayer?.seek(3000, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.seek(3500, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.seek(-1, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.release();
        break;
      case RELEASED:
        expect(avPlayer?.state).assertEqual(RELEASED);
        avPlayer = null;
        expect(isSeekContinuousSupported == unsupportedSeekContinuousErr).assertFalse();
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
    console.error(`case error called, errMessage is ${err.message}`);
    if (err.code == media.AVErrorCode.AVERR_SEEK_CONTINUOUS_UNSUPPORTED) {
      unsupportedSeekContinuousErr = true;
    }
  });
}

async function testAVPlayerSeekContinuous(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null,
  done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    console.info('case createAVPlayer success');
    avPlayer = video;
    setAVPlayerSeekContinuousCb(src, avPlayer, done);
    setSource(avPlayer, src);
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

function openFileFailed() {
  console.info('case file fail');
}
async function setOnCallbackSubtitleUpdate(avPlayer: media.AVPlayer | null, done: Function) {
  let surfaceID: string = globalThis.value;
  let count = 0;
  let playCount = 0;
  avPlayer?.on('endOfStream', () => {
    count++;
    console.info(TAG + 'endOfStream success')
    avPlayer?.off('endOfStream')
  })
  avPlayer?.on('stateChange', async (state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        console.info(`case INITIALIZED`);
        expect(avPlayer.state).assertEqual(INITIALIZED);
        avPlayer.surfaceId = surfaceID;
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
        console.info('case prepare called');
        avPlayer?.play().then(() => {
          console.info('play called success')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case PLAYING:
        if (playCount == 0) {
          playCount++;
          avPlayer?.pause().then(() => {
            console.info('play called success')
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        console.info('case playing called');
        break;
      case PAUSED:
        avPlayer?.play((err) => {
          console.info('case play called');
          if (err != null) {
            console.error(`case play error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer.duration);
          }
        });
        console.info('case pause called');
        break;
      case STOPPED:
        expect(count).assertEqual(1);
        console.info('case stop called');
        avPlayer?.release().then(() => {
          console.info('play stop success')
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        break;
      case COMPLETED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        expect(avPlayer.state).assertEqual(COMPLETED);
        expect(avPlayer.currentTime).assertEqual(avPlayer.duration);
        if (playCount == 1) {
          playCount++
          avPlayer?.play().then(() => {
            console.info('play called success')
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        } else {
          avPlayer?.stop().then(() => {
            console.info('play stop success')
          }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
        }
        break;
      case RELEASED:
        console.info('case into RELEASED info: loopTime=' + loopTime);
        expect(loopTime).assertEqual(1);
        loopTime = 0;
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
async function subtitleUpdateON(avPlayer: media.AVPlayer, done: Function) {
  avPlayer.on('subtitleUpdate', async (info: media.SubtitleInfo) => {
    if (info) {
      loopTime++;
      let text = (!info.text) ? '' : info.text;
      let startTime = (!info.startTime) ? 0 : info.startTime;
      let duration = (!info.duration) ? 0 : info.duration;
      console.info('subtitleUpdateON info: text=' + text + ' startTime=' + startTime +' duration=' + duration);
      console.info('subtitleUpdateON info: loopTime=' + loopTime);
      avPlayer.off('subtitleUpdate');
      expect(loopTime).assertEqual(1);
    } else {
      console.info('subtitleUpdate info is null');
      expect(false).assertTrue();
      done();
    }
  })
}
async function testsubtitleUpdateListening(src: string | media.AVFileDescriptor, subtitleSrc: string | media.AVFileDescriptor,
  avPlayer: media.AVPlayer | null, subtitleUpdateListening:Function, done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      subtitleUpdateListening(avPlayer,done);
      setOnCallbackSubtitleUpdate(avPlayer, done);
      setSource(avPlayer, src);
      setSubtitle(avPlayer, subtitleSrc);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

export default function AVPlayerLocalTest() {
  describe('AVPlayerLocalTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      // await mediaTestBase.toNewPage(PAGE_PATH, PAGE_PATH, 0)
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
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE_MKV, openFileFailed).then((res) => {
        fileDescriptor_mkv = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor2 = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_NOAUDIO, openFileFailed).then((res) => {
        fileDescriptor3 = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(SUBTITLE, openFileFailed).then((res) => {
        subtitleFdSrc = res;
      });
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
      if (fileDescriptor) {

      }
      await mediaTestBase.closeFdNumber(fileDescriptor.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor_mkv.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor2.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor3.fd);
      await mediaTestBase.closeFdNumber(subtitleFdSrc.fd);
      await mediaTestBase.clearRouter()
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FDSRC_0100
        * @tc.name      : 001.test fdsrc
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_FDSRC_0100', Level.LEVEL0,async (done: Function) => {
      let avPlayTest: PlayTest = {
        width: 720, height: 480, duration: 10100
      };
      if (fileDescriptor) {
        testAVPlayerFun(fileDescriptor, avPlayer, avPlayTest, PLAY_TIME, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0100
        * @tc.name      : 001.test getTrackDescription
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0100', Level.LEVEL0,async (done: Function) => {
      let videoTrackKey =
        new Array('bitrate', 'codec_mime', 'frame_rate', 'height', 'track_index', 'track_type', 'width');
      let audioTrackKey =
        new Array('bitrate', 'channel_count', 'codec_mime', 'sample_rate', 'track_index', 'track_type');
      let videoTrackValue = new Array(1366541, 0, 6000, 480, 0, 1, 720);
      let audioTrackValue = new Array(129207, 2, 1, 44100, 1, 0);
      let descriptionKey = new Array(videoTrackKey, audioTrackKey);
      let descriptionValue = new Array(videoTrackValue, audioTrackValue);
      if (fileDescriptor) {
        testCheckTrackDescription(fileDescriptor, avPlayer, descriptionKey, descriptionValue, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0200
        * @tc.name      : 002.test getTrackDescription
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0200', Level.LEVEL0,async (done: Function) => {
      let audioTrackKey = new Array('channel_count', 'codec_mime', 'sample_rate', 'track_index', 'track_type');
      let audioTrackValue = new Array(1, 2, 48000, 0, 0);
      let descriptionKey = new Array(audioTrackKey);
      let descriptionValue = new Array(audioTrackValue);
      if (fileDescriptor2) {
        testCheckTrackDescription(fileDescriptor2, avPlayer, descriptionKey, descriptionValue, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0300
        * @tc.name      : 003.test getTrackDescription
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETTRECKDESCRIPTION_0300', Level.LEVEL0,async (done: Function) => {
      let videoTrackKey =
        new Array('bitrate', 'codec_mime', 'frame_rate', 'height', 'track_index', 'track_type', 'width');
      let videoTrackValue = new Array(1506121, 0, 6000, 480, 0, 1, 720);
      let descriptionKey = new Array(videoTrackKey);
      let descriptionValue = new Array(videoTrackValue);
      if (fileDescriptor3) {
        testCheckTrackDescription(fileDescriptor3, avPlayer, descriptionKey, descriptionValue, done);
      }

    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETPLAYBACKINFO_0100
        * @tc.name      : 003.test getPlaybackInfo
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETPLAYBACKINFO_0100', Level.LEVEL0,async (done: Function) => {
      let descriptionKey =
        new Array('server_ip_address', 'average_download_rate', 'download_rate', 'is_downloading', 'buffer_duration');
      let descriptionValue = new Array('', '0', '0', '0', '0');
      if (fileDescriptor) {
        testCheckPlaybackInfo(fileDescriptor, avPlayer, descriptionKey, descriptionValue, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_VIDEOSCALETYPE_0100
        * @tc.name      : 001.test video player videoScaleTpe
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_VIDEOSCALETYPE_0100', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        testVideoScaleType(fileDescriptor, avPlayer, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_OFF_CALLBACK_0100
        * @tc.name      : 001.test off callback Function
        * @tc.desc      : Local Video playback control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_OFF_CALLBACK_0100', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        testOffCallback(fileDescriptor, avPlayer, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_0100
        * @tc.name      : 001.test subtitle Function
        * @tc.desc      : Local Video subtitle control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_0100', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor && subtitleFdSrc) {
        testSubtitle(fileDescriptor, subtitleFdSrc, avPlayer, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_0200
        * @tc.name      : 002.test subtitle Function
        * @tc.desc      : Local Video subtitle control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_0200', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor && subtitleFdSrc) {
        testSubtitle(fileDescriptor, `fd://${subtitleFdSrc.fd}`, avPlayer, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0100
        * @tc.name      : 001.test setPlaybackStrategy Function
        * @tc.desc      : Local Video subtitle control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0100', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        let playbackStrategy: media.PlaybackStrategy = { mutedMediaType: media.MediaType.MEDIA_TYPE_AUD }
        testSetPlaybackStrategy(fileDescriptor, avPlayer, done, playbackStrategy);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0200
        * @tc.name      : 002.test setPlaybackStrategy Function
        * @tc.desc      : Local Video subtitle control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0200', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        let playbackStrategy: media.PlaybackStrategy = { showFirstFrameOnPrepare: true }
        testSetPlaybackStrategy(fileDescriptor, avPlayer, done, playbackStrategy);
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0300
    * @tc.name      : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0300
    * @tc.desc      : Local Video subtitle control test
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0300', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        let playbackStrategy: media.PlaybackStrategy = { mutedMediaType: media.MediaType.MEDIA_TYPE_VID, keepDecodingOnMute:true}
        media.createAVPlayer((err, video) => {
          console.info(`case media err: ${err}`)
          if (typeof (video) !== 'undefined') {
            console.info('case createAVPlayer success');
            avPlayer = video;
            setPlaybackStrategy(avPlayer, done, playbackStrategy)
            setSource(avPlayer, fileDescriptor);
          }
          if (err != null) {
            console.error(`case createAVPlayer error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      }
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0400
    * @tc.name      : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0400
    * @tc.desc      : Local Video subtitle control test
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_0400', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        let playbackStrategy: media.PlaybackStrategy = { mutedMediaType: media.MediaType.MEDIA_TYPE_VID, keepDecodingOnMute:false}
        media.createAVPlayer((err, video) => {
          console.info(`case media err: ${err}`)
          if (typeof (video) !== 'undefined') {
            console.info('case createAVPlayer success');
            avPlayer = video;
            setPlaybackStrategy(avPlayer, done, playbackStrategy)
            setSource(avPlayer, fileDescriptor);
          }
          if (err != null) {
            console.error(`case createAVPlayer error, errMessage is ${err.message}`);
            expect().assertFail();
            done();
          }
        });
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_RANGE_0100
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_RANGE_0100
        * @tc.desc      : Local Video preferred set playback start position and end position control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_RANGE_0100', Level.LEVEL0, async (done: Function) => {
      if (fileDescriptor) {
        let startTimeMs : number = 1000;
        let endTimeMs : number = 3000;
        let mode : media.SeekMode = media.SeekMode.SEEK_CLOSEST;
        expect(startTimeMs).assertLargerOrEqual(-1);
        testSetPlaybackRange(fileDescriptor, startTimeMs, endTimeMs, mode, avPlayer, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_RANGE_0200
        * @tc.name      : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_RANGE_0200
        * @tc.desc      : Local Video preferred set playback start position and end position control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_RANGE_0200', Level.LEVEL0, async (done: Function) => {
      if (fileDescriptor) {
        let startTimeMs : number = -1;
        let endTimeMs : number = -1;
        let mode : media.SeekMode = media.SeekMode.SEEK_CLOSEST;
        expect(startTimeMs).assertLargerOrEqual(-1);
        testSetPlaybackRange(fileDescriptor, startTimeMs, endTimeMs, mode, avPlayer, done);
      }
    });
    
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0100
    * @tc.name      : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0100
    * @tc.desc      : Local Video subtitle control test
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0100', Level.LEVEL0,async (done: Function) => {
      expect(fileDescriptor).not().assertUndefined()
      const params: MediaMutedParams = {
        MediaType: media.MediaType.MEDIA_TYPE_AUD,
        isMuted: true,
        result: true
      }
      testSetMediaMuted(fileDescriptor, params, done);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0200
    * @tc.name      : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0200
    * @tc.desc      : Local Video subtitle control test
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0200', Level.LEVEL0,async (done: Function) => {
      expect(fileDescriptor).not().assertUndefined()
      const params: MediaMutedParams = {
        MediaType: media.MediaType.MEDIA_TYPE_VID,
        isMuted: true,
        result: true
      }
      testSetMediaMuted(fileDescriptor, params, done);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0300
    * @tc.name      : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0300
    * @tc.desc      : Local Video subtitle control test
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0300', Level.LEVEL0,async (done: Function) => {
      expect(fileDescriptor).not().assertUndefined()
      const params: MediaMutedParams = {
        MediaType: media.MediaType.MEDIA_TYPE_AUD,
        isMuted: false,
        result: true
      }
      testSetMediaMuted(fileDescriptor, params, done);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0400
    * @tc.name      : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0400
    * @tc.desc      : Local Video subtitle control test
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_0400', Level.LEVEL0,async (done: Function) => {
      expect(fileDescriptor).not().assertUndefined()
      const params: MediaMutedParams = {
        MediaType: media.MediaType.MEDIA_TYPE_VID,
        isMuted: false,
        result: true
      }
      testSetMediaMuted(fileDescriptor, params, done);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_ERROR_0100
    * @tc.name      : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_ERROR_0100
    * @tc.desc      : Local Video subtitle control test
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_ERROR_0100', Level.LEVEL0,async (done: Function) => {
      expect(fileDescriptor).not().assertUndefined()
      const params: MediaMutedParams = {
        MediaType: media.MediaType.MEDIA_TYPE_AUD,
        isMuted: true,
        result: false,
        errorCode: 5400102
      }
      testSetMediaMuted(fileDescriptor, params, done, setMediaMutedInErrorState);
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_ERROR_0200
    * @tc.name      : SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_ERROR_0200
    * @tc.desc      : Local Video subtitle control test
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_ERROR_0200', Level.LEVEL0,async (done: Function) => {
      expect(fileDescriptor).not().assertUndefined()
      const params: MediaMutedParams = {
        MediaType: media.MediaType.MEDIA_TYPE_SUBTITLE,
        isMuted: true,
        result: false,
        errorCode: 401
      }
      testSetMediaMuted(fileDescriptor, params, done, setMediaMutedUseUnsupportMediaType);
    });
    
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_DASH_0100
        * @tc.name      : 001.test setPlaybackStrategy Function
        * @tc.desc      : Local Video preferred audio language control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_DASH_0100', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        testSetPlaybackStrategyDASH(fileDescriptor, avPlayer, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_FLV_SET_PLAYBACK_STRATEGY_0100
        * @tc.name      : 001.test setPlaybackStrategy Function
        * @tc.desc      : flv live set thresholdForAutoQuickPlay to valid value
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_FLV_SET_PLAYBACK_STRATEGY_0100', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        let playbackStrategy: media.PlaybackStrategy = { thresholdForAutoQuickPlay: 5 }
        testSetPlaybackStrategyFlv(fileDescriptor, avPlayer, done, playbackStrategy);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_FLV_SET_PLAYBACK_STRATEGY_0200
        * @tc.name      : 001.test setPlaybackStrategy Function
        * @tc.desc      : flv live set thresholdForAutoQuickPlay to invalid value
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_FLV_SET_PLAYBACK_STRATEGY_0200', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        let playbackStrategy: media.PlaybackStrategy = { thresholdForAutoQuickPlay: 1 }
        invalidPlaybackStrategy = true;
        testSetPlaybackStrategyFlv(fileDescriptor, avPlayer, done, playbackStrategy);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_FLV_SET_PLAYBACK_STRATEGY_0300
        * @tc.name      : 001.test setPlaybackStrategy Function
        * @tc.desc      : flv live set thresholdForAutoQuickPlay to default value
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_FLV_SET_PLAYBACK_STRATEGY_0300', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        let playbackStrategy: media.PlaybackStrategy = {}
        testSetPlaybackStrategyFlv(fileDescriptor, avPlayer, done, playbackStrategy);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SEEK_CONTINUOUS_0100
        * @tc.name      : 001.test seek continuous Function
        * @tc.desc      : test local video seek continuous
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SEEK_CONTINUOUS_0100', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        testAVPlayerSeekContinuous(fileDescriptor, avPlayer, done);
      }
    });

    /* *
      * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SEEK_CONTINUOUS_0200
      * @tc.name      : 002.test seek continuous Function
      * @tc.desc      : test local video mkv seek continuous
      * @tc.size      : MediumTest
      * @tc.type      : Function test
      * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SEEK_CONTINUOUS_0200', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor_mkv) {
        testAVPlayerSeekContinuous(fileDescriptor_mkv, avPlayer, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_GET_PLAYBACK_POSITION_0100
        * @tc.name      : 001.test getPlaybackPosition Function
        * @tc.desc      : Local Video getPlaybackPosition control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_GET_PLAYBACK_POSITION_0100', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor) {
        testGetPlaybackPosition(fileDescriptor, avPlayer, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_ON_0000
        * @tc.name      : 001.test subtitle Function
        * @tc.desc      : Local Video subtitle control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_ON_0000', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor && subtitleFdSrc) {
        testsubtitleUpdateListening(fileDescriptor, subtitleFdSrc, avPlayer, subtitleUpdateON, done);
      }
    });
    /* *
        * @tc.number    : SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_ON_0100
        * @tc.name      : 002.test subtitle Function
        * @tc.desc      : Local Video subtitle control test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_ON_0100', Level.LEVEL0,async (done: Function) => {
      if (fileDescriptor && subtitleFdSrc) {
        testsubtitleUpdateListening(fileDescriptor, `fd://${subtitleFdSrc.fd}`, avPlayer, subtitleUpdateON, done);
      }
    });
  })
}
