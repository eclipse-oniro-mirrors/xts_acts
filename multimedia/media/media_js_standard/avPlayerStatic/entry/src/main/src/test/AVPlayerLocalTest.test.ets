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

import MediaTestBase from './MediaTestBase.test';
import media from '@ohos.multimedia.media'
import audio from '@ohos.multimedia.audio';
import { testAVPlayerFun, setSource, setSubtitle, PlayTest } from './AVPlayerTestBase.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';
import { globalThis } from './Util.test';
import drm from '@ohos.multimedia.drm'
import fs, {ReadOptions} from '@ohos.file.fs';

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
let fileDescriptor: media.AVFileDescriptor | undefined;
let fileDescriptor_mkv: media.AVFileDescriptor | undefined;
let fileDescriptor2: media.AVFileDescriptor | undefined;
let fileDescriptor3: media.AVFileDescriptor | undefined;
let avPlayer: media.AVPlayer | undefined;
let fdPath = '';
let fdNumber = 0;
let subtitleFdSrc: media.AVFileDescriptor | undefined;
let mediaTestBase = new MediaTestBase()


function setAVPlayerTrackCb(avPlayer: media.AVPlayer | null, descriptionKey: Array<Array<string>>,
  descriptionValue: Array<Array<number>>, done: () => void) {
  let arrayDescription: Array<media.MediaDescription> | undefined = undefined;
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
        expect(avPlayer!!.state).assertEqual(INITIALIZED);
        avPlayer!!.prepare((err) => {
          console.info('case prepare called' + err);
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err!!.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer!!.duration);
          }
        });
        break;
      case PREPARED:
        waitForCompletion(async () => {
          await avPlayer!!.getTrackDescription().then((arrayList: Array<media.MediaDescription>) => {
            console.info('case getTrackDescription called!!');
            if (typeof (arrayList) != 'undefined') {
              arrayDescription = arrayList;
            } else {
              console.info('case getTrackDescription is failed');
              expect().assertFail();
            }
          }).catch(mediaTestBase.catchCallback);
        });
        expect(descriptionKey.length).assertEqual(arrayDescription?.length);
        if (arrayDescription != undefined) {
          for (let i = 0; i < arrayDescription!!.length; i++) {
            mediaTestBase.checkDescription(arrayDescription!![i], descriptionKey[i], descriptionValue[i]);
          }
        }
        avPlayer!!.getTrackDescription((error: BusinessError | null, arrayList: Array<media.MediaDescription>|undefined) => {
          if (error == null) {
            for (let i = 0; i < arrayList!!.length; i++) {
              mediaTestBase.checkDescription(arrayList!![i], descriptionKey[i], descriptionValue[i]);
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
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  })
}

async function testCheckTrackDescription(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  descriptionKey: Array<Array<string>>, descriptionValue: Array<Array<number>>, done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setAVPlayerTrackCb(avPlayer!, descriptionKey, descriptionValue, done)
      setSource(avPlayer!, src);
    }
    if (err != null) {
      console.log("error.code =", err!!.code);
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}

function setPlaybackInfoCb(avPlayer: media.AVPlayer | null, descriptionKey: Array<string>,
  descriptionValue: Array<string>, done: () => void) {
  let arrayDescription: media.PlaybackInfo | undefined = undefined;
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
        expect(avPlayer!!.state).assertEqual(INITIALIZED);
        avPlayer?.prepare((err) => {
          console.info('case prepare called' + err);
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err!!.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer!!.duration);
          }
        });
        break;
      case PREPARED:
        waitForCompletion(async () => {
          await avPlayer!.getPlaybackInfo().then(res => {
            console.info('case getPlaybackInfo called!!');
            if (res) {
              arrayDescription = res;
            }
            else {
              console.info('case getPlaybackInfo is failed');
              expect().assertFail();
            }
          }).catch(mediaTestBase.catchCallback);
        });
        if (arrayDescription) {
          mediaTestBase.checkPlaybackInfo(arrayDescription as media.PlaybackInfo, descriptionKey as Array<string>, descriptionValue as Array<string>);
        }
        waitForCompletion(async () => {
          await avPlayer!.release();
        });
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  })
}

async function testCheckPlaybackInfo(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  descriptionKey: Array<string>, descriptionValue: Array<string>, done: () => void) {

  console.info(`case media source: ${src}`)
  console.info(`case media source111111: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    if (err != null) {
      console.log("err!!.code =", err!!.code)
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    } else {
      if (video) {
        console.info('case createAVPlayer success');
        avPlayer = video;
        setPlaybackInfoCb(avPlayer!, descriptionKey, descriptionValue, done)
        console.info('case fdsrc test');
        avPlayer!!.fdSrc = src;
      } else {
        console.error(`case createAVPlayer failed`);
        expect().assertFail();
        done();
      }
    }
  });
}

async function setAVPlayerScaleCb(avPlayer: media.AVPlayer | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let count = 0;
  avPlayer?.onStateChange((state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        console.info(`case INITIALIZED`);
        expect(avPlayer!!.state).assertEqual(INITIALIZED);
        avPlayer!!.surfaceId = surfaceID;
        avPlayer!!.prepare((err) => {
          console.info('case prepare called' + err);
          if (avPlayer) {
            avPlayer!!.loop = true;
          }

          if(err != null){
            console.error(`case prepare error, errMessage is ${err!!.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer!!.duration);
          }
        });
        break;
      case PREPARED:
        console.info('case prepare called');
        avPlayer?.play((err) => {
          console.info('case play called' + err);
          if(err != null){
            console.error(`case play error, errMessage is ${err!!.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer!!.duration);
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
            avPlayer!!.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT_CROP;
            count = 1;
          } else {
            console.info('case set  videoScaleType : 0');
            avPlayer!!.videoScaleType = media.VideoScaleType.VIDEO_SCALE_TYPE_FIT;
            count = 0;
          }
          console.info('case set  videoScaleType : 22222');
        }
        console.info('loop !!!!111');
        avPlayer!!.loop = false;
        console.info('loop !!!!222');
        break;
      case COMPLETED:
        expect(avPlayer?.state).assertEqual(COMPLETED);
        expect(avPlayer?.currentTime).assertEqual(avPlayer?.duration);
        console.info('COMPLETED !!!!111');
        avPlayer?.release();
        break;
      case RELEASED:
        console.info('COMPLETED !!!!222');
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  })
}

async function testVideoScaleType(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setAVPlayerScaleCb(avPlayer!, done)
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = src;
    }
    if(err != null){
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function setOnCallback(avPlayer: media.AVPlayer | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let count = 0;
  let playCount = 0;
  avPlayer?.onEndOfStream(() => {
    count++;
    console.info(TAG + 'endOfStream success')
    avPlayer?.offEndOfStream();
  })

  avPlayer?.onStateChange((state, reason) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        console.info(`case INITIALIZED`);
        expect(avPlayer!!.state).assertEqual(INITIALIZED);
        avPlayer!!.surfaceId = surfaceID;
        avPlayer!!.prepare((err) => {
          console.info('case prepare called' + err);
          if (err != null) {
            console.error(`case prepare error, errMessage is ${err!!.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer!!.duration);
          }
        });
        break;
      case PREPARED:
        console.info('case prepare called');
        avPlayer?.play().then(() => {
          console.info('prepare play called success')
        }).catch(mediaTestBase.catchCallback);
        break;
      case PLAYING:
        if (playCount == 0) {
          console.log("playcount = ",playCount)
          playCount++;
          avPlayer?.pause().then(() => {
            console.info('111play called success')
          }).catch(mediaTestBase.catchCallback);
        }
        console.info('case playing called');
        break;
      case PAUSED:
        avPlayer?.play((err) => {
          console.info('case play called');
          if (err != null) {
            console.error(`case play error, errMessage is ${err!!.message}`);
            expect().assertFail();
            done();
          } else if (avPlayer) {
            console.info('case avPlayer.duration: ' + avPlayer!!.duration);
          }
        });
        console.info('case pause called');
        break;
      case STOPPED:
        expect(count).assertEqual(1);
        console.info('case stop called');
        avPlayer?.release().then(() => {
          console.info('play stop success')
        }).catch(mediaTestBase.catchCallback);
        break;
      case COMPLETED:
        console.log("playcountCompl = ",playCount)
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        expect(avPlayer!!.state).assertEqual(COMPLETED);
        expect(avPlayer!!.currentTime).assertEqual(avPlayer!!.duration);
        if (playCount == 1) {
          playCount++
          avPlayer?.play().then(() => {
          }).catch(mediaTestBase.catchCallback);
        } else {
          avPlayer?.stop().then(() => {
            console.info('play stop success')
          }).catch(mediaTestBase.catchCallback);
        }
        break;
      case RELEASED:
        avPlayer = null;
        done();
        avPlayer?.offEndOfStream()
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  })
}

function setPlayerPlaybackStrategy(avPlayer: media.AVPlayer | undefined, playbackStrategy: media.PlaybackStrategy) {
  avPlayer?.setPlaybackStrategy(playbackStrategy).catch((error: Error) => {
    console.error(`setPlaybackStrategy failed, err code ${(error as BusinessError).code} msg ${error.message}`)
    expect().assertFail();
  })
}

function setPlaybackStrategyDASH(avPlayer: media.AVPlayer | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let playbackStrategy: media.PlaybackStrategy = { mutedMediaType: media.MediaType.MEDIA_TYPE_AUD,preferredAudioLanguage:"und", preferredSubtitleLanguage:"eng" }
  let pauseCount = 0
  const stateChangeCallback = (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        setPlayerPlaybackStrategy(avPlayer!, playbackStrategy)
        done();
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
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        expect().assertFail();
        break;
      default:
        break;
    }
  }
  avPlayer?.onStateChange(stateChangeCallback)
}

function setPlaybackStrategy(avPlayer: media.AVPlayer | null, done: () => void,
  playbackStrategy: media.PlaybackStrategy) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0
  const stateChangeCallback = (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        setPlayerPlaybackStrategy(avPlayer!, playbackStrategy)
        done();
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
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        expect().assertFail();
        break;
      default:
        break;
    }
  }
  avPlayer?.onStateChange(stateChangeCallback)
}

function setPlayerMediaMuted(avPlayer: media.AVPlayer | undefined) {
  avPlayer?.setMediaMuted(media.MediaType.MEDIA_TYPE_AUD, true).catch((error: Error) => {
    console.error(`setMediaMuted failed, err code ${(error as BusinessError).code} msg ${error.message}`)
    expect().assertFail();
  })
}

function setMediaMuted(avPlayer: media.AVPlayer | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0
  const stateChangeCallback = (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        avPlayer!!.prepare()
        break;
      case PREPARED:
        setPlayerMediaMuted(avPlayer!)
        avPlayer?.play()
        break;
      case PLAYING:
        setPlayerMediaMuted(avPlayer!)
        if (pauseCount++ > 0) {
          break
        }
        avPlayer?.pause()
        break;
      case PAUSED:
        setPlayerMediaMuted(avPlayer!)
        avPlayer?.play()
        break;
      case COMPLETED:
        setPlayerMediaMuted(avPlayer!)
        waitForCompletion(async () => {
          await mediaTestBase.msleepAsync(1000);
        });
        avPlayer?.release()
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  }
  avPlayer?.onStateChange(stateChangeCallback)
}

async function testOffCallback(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined, done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setOnCallback(avPlayer!, done)
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = src;
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function testSubtitle(src: media.AVFileDescriptor, subtitleSrc: string | media.AVFileDescriptor,
  avPlayer: media.AVPlayer | undefined, done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) !== 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setOnCallback(avPlayer!, done)
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = src;
      setSubtitle(avPlayer!, subtitleSrc);
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function testSetPlaybackStrategy(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void, playbackStrategy: media.PlaybackStrategy) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer |undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setPlaybackStrategy(avPlayer!, done, playbackStrategy)
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = src;
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}
async function testSetPlaybackStrategyDASH(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setPlaybackStrategyDASH(avPlayer!, done)
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = src;
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}

async function testSetMediaMuted(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setMediaMuted(avPlayer!, done)
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = src;
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}

function getPlaybackPosition(avPlayer: media.AVPlayer | null, done: () => void) {
  let playbackPosition: number = -1;
  const stateChangeCallback = (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer!!.prepare()
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
        playbackPosition = avPlayer!!.getPlaybackPosition();
        console.info(`AVPlayer getPlaybackPosition == ${playbackPosition} ms`);
        expect(playbackPosition).assertLargerOrEqual(0 as number);
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
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        break;
      default:
        break;
    }
  }
  avPlayer?.onStateChange(stateChangeCallback)
}

async function testGetPlaybackPosition(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      getPlaybackPosition(avPlayer!, done);
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = src;
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}

function setAVPlayerSeekContinuousCb(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | null, done: () => void) {
  let isSeekContinuousSupported: boolean  = false;
  let unsupportedSeekContinuousErr = false;
  let firstPlay = true;
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    if (reason == media.StateChangeReason.BACKGROUND) {
      avPlayer?.release().then(() => {
      }).catch(mediaTestBase.catchCallback);
    }
    switch (state) {
      case INITIALIZED:
        expect(avPlayer?.state).assertEqual(INITIALIZED);
        console.info('case initialized -> prepared');
        avPlayer?.prepare();
        break;
      case PREPARED:
        expect(avPlayer?.state).assertEqual(PREPARED);
        if (avPlayer) {
          isSeekContinuousSupported = avPlayer!!.isSeekContinuousSupported();
        }
        avPlayer?.seek(1000, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.seek(2000, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.seek(-1, media.SeekMode.SEEK_CONTINUOUS);
        avPlayer?.play();
        break;
      case PLAYING:
        expect(avPlayer?.state).assertEqual(PLAYING);
        if (firstPlay) {
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
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  });

  avPlayer?.onError((err: BusinessError) => {
    console.log("wwwwww-----")
    console.error(`case error called, errMessage is ${err!!.message}`);
    console.log("averrorcode = ",err!!.code)
    if (err!!.code == media.AVErrorCode.AVERR_SEEK_CONTINUOUS_UNSUPPORTED) {
      unsupportedSeekContinuousErr = true;
    }
  });
}

async function testAVPlayerSeekContinuous(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    console.info('case createAVPlayer success');
    avPlayer = video;
    setAVPlayerSeekContinuousCb(src, avPlayer!, done);
    setSource(avPlayer!, src);
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}

function openFileFailed() {
  console.info('case file fail');
}

function setPlaybackRange(avPlayer: media.AVPlayer | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0
  avPlayer!.onSubtitleUpdate((info: media.SubtitleInfo) => {
    if (info) {
      let text = (!info.text) ? '' : info.text
      let startTime = (!info.startTime) ? 0 : info.startTime
      let duration = (!info.duration) ? 0 : info.duration
      console.info('subtitleUpdate info: text=' + text + ' startTime=' + startTime +' duration=' + duration);
    } else {
      console.info('subtitleUpdate info is null');
    }
  });
  avPlayer!.offSubtitleUpdate();
  const stateChangeCallback = (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        avPlayer!.setPlaybackRange(0, 6000, media.SeekMode.SEEK_CLOSEST).then(() => {
          console.info('Succeeded setPlaybackRange');
        }).catch((err: Error) => {
          console.error('Failed to setPlaybackRange' + err.message);
        });
        avPlayer!!.prepare()
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
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        expect().assertFail();
        break;
      default:
        break;
    }
  }
  avPlayer?.onStateChange(stateChangeCallback)
}

async function testSetPlaybackRange(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setPlaybackRange(avPlayer!, done)
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = src;
    }
    if (err!!.code != 0) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}
function OnOffSubtitleUpdate(avPlayer: media.AVPlayer | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0
  avPlayer!.onSubtitleUpdate((info: media.SubtitleInfo) => {
    if (info) {
      let text = (!info.text) ? '' : info.text
      let startTime = (!info.startTime) ? 0 : info.startTime
      let duration = (!info.duration) ? 0 : info.duration
      console.info('subtitleUpdate info: text=' + text + ' startTime=' + startTime +' duration=' + duration);
    } else {
      console.info('subtitleUpdate info is null');
    }
  });
  avPlayer!.offSubtitleUpdate();
  const stateChangeCallback = (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        avPlayer!!.prepare()
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
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        expect().assertFail();
        break;
      default:
        break;
    }
  }
  avPlayer?.onStateChange(stateChangeCallback)
}
async function testOnOffSubtitleUpdate(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      OnOffSubtitleUpdate(avPlayer!, done)
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = src;
    }
    if (err!!.code != 0) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}
function OffSeiMessageReceived(avPlayer: media.AVPlayer | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0
  avPlayer!.onSeiMessageReceived([5], (messages: Array<media.SeiMessage>, playbackPosition?: number) => {
    console.info('seiMessageReceived playbackPosition ' + playbackPosition);
  });
  avPlayer!.offSeiMessageReceived();
  done();
}

async function testOffSeiMessageReceived(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      OffSeiMessageReceived(avPlayer!, done)
      setSource(avPlayer!, src);
    }
    if (err!!.code != 0) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}
function OnOffAudioOutputDeviceChangeWithInfo(avPlayer: media.AVPlayer | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0
  avPlayer!.onAudioOutputDeviceChangeWithInfo((data: audio.AudioStreamDeviceChangeInfo) => {
    console.info(`${JSON.stringify(data)}`);
  });
  avPlayer!.offAudioOutputDeviceChangeWithInfo();
  done();
}

async function testOnOffAudioOutputDeviceChangeWithInfo(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      OnOffAudioOutputDeviceChangeWithInfo(avPlayer!, done)
      setSource(avPlayer!, src);
    }
    if (err!!.code != 0) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}
function OnOffMediaKeySystemInfoUpdate(avPlayer: media.AVPlayer | null, done: () => void) {
  avPlayer!.onMediaKeySystemInfoUpdate((mediaKeySystemInfo: Array<drm.MediaKeySystemInfo>) => {
  });
  avPlayer!.offMediaKeySystemInfoUpdate();
  done();
}
async function testOnOffmediaKeySystemInfoUpdate(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      OnOffMediaKeySystemInfoUpdate(avPlayer!, done)
      setSource(avPlayer!, src);
    }
    if (err!!.code != 0) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}
function OnOffAudioInterrupt(avPlayer: media.AVPlayer | null, done: () => void) {
  avPlayer!.onAudioInterrupt((data: audio.InterruptEvent) => {
  });
  avPlayer!.offAudioInterrupt();
  done();
}
async function testOnOffAudioInterrupt(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      OnOffAudioInterrupt(avPlayer!, done)
      setSource(avPlayer!, src);
    }
    if (err!!.code != 0) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}
function OnOffBitrateDone(avPlayer: media.AVPlayer | null, done: () => void) {
  avPlayer!.onBitrateDone((data: int) => {
  });
  avPlayer!.offBitrateDone();
  done();
}
async function testOnOffBitrateDone(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      OnOffBitrateDone(avPlayer!, done)
      setSource(avPlayer!, src);
    }
    if (err!!.code != 0) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}
function setAvPlayerDataSrc(avPlayer: media.AVPlayer | null, dataSrc: media.AVDataSrcDescriptor, done: () => void) {
  const stateChangeCallback = (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer!!.surfaceId = globalThis.value;
        avPlayer!!.prepare()
        break;
      case PREPARED:
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
        }).catch(mediaTestBase.catchCallback);
        break;
      default:
        break;
    }
  }
  avPlayer?.onStateChange(stateChangeCallback)
  avPlayer!.dataSrc = dataSrc;
}
async function testAvPlayerDataSrc(src: string | media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      let stat = fs.statSync((src as media.AVFileDescriptor).fd);
      let size = stat.size;
      let dataSrc: media.AVDataSrcDescriptor = {
        fileSize: size,
        callback: (buffer: ArrayBuffer, len: long, pos?: long) => {
          if (buffer == undefined || len == undefined || pos == undefined) {
            console.error(TAG, `dataSrc callback param invalid`);
            return -1;
          }
          let options: ReadOptions = {
            offset: pos,
            length: len
          };
          let num = fs.readSync((src as media.AVFileDescriptor).fd, buffer, options);
          console.info(TAG, 'readAt end, num: ' + num);
          if (num > 0 && size >= pos) {
            return num.toInt();
          }
          return -1;
        }
      };
      setAvPlayerDataSrc(avPlayer!, dataSrc, done);
    }
    if (err!!.code != 0) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}
function OnOffTrackInfoUpdate(avPlayer: media.AVPlayer | null, done: () => void) {
  let surfaceID: string = globalThis.value;
  let pauseCount = 0
  avPlayer!.onTrackInfoUpdate((info: Array<media.MediaDescription>) => {
    if (info) {
      for (let i = 0; i < info.length; i++) {
        let propertyIndex: Object | undefined = info[i][media.MediaDescriptionKey.MD_KEY_TRACK_INDEX];
        let propertyType: Object | undefined = info[i][media.MediaDescriptionKey.MD_KEY_TRACK_TYPE];
        console.info('track info: index=' + propertyIndex + ' tracktype=' + propertyType);
      }
    } else {
      console.info('track info is null');
    }
  });
  avPlayer!.offTrackInfoUpdate();
  const stateChangeCallback = (state: media.AVPlayerState) => {
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          break;
        }
        avPlayer!!.surfaceId = surfaceID;
        avPlayer!!.prepare()
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
        }).catch(mediaTestBase.catchCallback);
        avPlayer = null;
        expect().assertFail();
        break;
      default:
        break;
    }
  }
  avPlayer?.onStateChange(stateChangeCallback)
}

async function testOnOffTrackInfoUpdate(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | undefined,
  done: () => void) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
    console.info(`case media err: ${err}`)
    if (video) {
      console.info('case createAVPlayer success');
      avPlayer = video;
      OnOffTrackInfoUpdate(avPlayer!, done)
      console.info('case fdsrc test');
      avPlayer!!.fdSrc = src;
    }
    if (err!!.code != 0) {
      console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
      expect().assertFail();
      done();
    }
  });
}

export default function AVPlayerLocalTest() {
  describe('AVPlayerLocalTest', () => {
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
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res: media.AVFileDescriptor) => {
        fileDescriptor = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(SUBTITLE, openFileFailed).then((res: media.AVFileDescriptor) => {
        subtitleFdSrc = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE_MKV, openFileFailed).then((res: media.AVFileDescriptor) => {
        fileDescriptor_mkv = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE, openFileFailed).then((res: media.AVFileDescriptor) => {
        fileDescriptor2 = res;
      });
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_NOAUDIO, openFileFailed).then((res: media.AVFileDescriptor) => {
        fileDescriptor3 = res;
      });

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
      if (fileDescriptor) {

      }
      await mediaTestBase.closeFdNumber(fileDescriptor!.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor_mkv!.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor2!.fd);
      await mediaTestBase.closeFdNumber(fileDescriptor3!.fd);
      await mediaTestBase.closeFdNumber(subtitleFdSrc!.fd);
      await mediaTestBase.clearRouter()
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETPLAYBACKINFO_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETPLAYBACKINFO_static_0100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_GETPLAYBACKINFO_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let descriptionKey =
        new Array<string>('server_ip_address', 'average_download_rate', 'download_rate', 'is_downloading', 'buffer_duration');
      let descriptionValue = new Array<string>('', '0', '0', '0', '0');
      if (fileDescriptor) {
        testCheckPlaybackInfo(fileDescriptor!, avPlayer, descriptionKey, descriptionValue, done);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_VIDEOSCALETYPE_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_VIDEOSCALETYPE_static_0100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_VIDEOSCALETYPE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (fileDescriptor) {
        testVideoScaleType(fileDescriptor!, avPlayer, done);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_OFF_CALLBACK_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_OFF_CALLBACK_static_0100
     * @tc.desc   Local Video playback control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_PLAYER_OFF_CALLBACK_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (fileDescriptor) {
        testOffCallback(fileDescriptor!, avPlayer, done);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_static_0100
     * @tc.desc   Local Video subtitle control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (fileDescriptor && subtitleFdSrc) {
        testSubtitle(fileDescriptor!, subtitleFdSrc!, avPlayer, done);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_static_0200
     * @tc.desc   Local Video subtitle control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SUBTILE_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (fileDescriptor && subtitleFdSrc) {
        testSubtitle(fileDescriptor!, `fd://${subtitleFdSrc!.fd}`, avPlayer, done);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_static_0100
     * @tc.desc   Local Video subtitle control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (fileDescriptor) {
        let playbackStrategy: media.PlaybackStrategy = { mutedMediaType: media.MediaType.MEDIA_TYPE_AUD }
        testSetPlaybackStrategy(fileDescriptor!, avPlayer, done, playbackStrategy);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_static_0200
     * @tc.desc   Local Video subtitle control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (fileDescriptor) {
        let playbackStrategy: media.PlaybackStrategy = { showFirstFrameOnPrepare: true }
        testSetPlaybackStrategy(fileDescriptor!, avPlayer, done, playbackStrategy);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_static_0100
     * @tc.desc   Local Video subtitle control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_MUTE_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (fileDescriptor) {
        testSetMediaMuted(fileDescriptor!, avPlayer, done);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_DASH_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_DASH_static_0100
     * @tc.desc   Local Video preferred audio language control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_SET_PLAYBACK_STRATEGY_DASH_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (fileDescriptor) {
        testSetPlaybackStrategyDASH(fileDescriptor!, avPlayer, done);
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_VIDEO_GET_PLAYBACK_POSITION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_VIDEO_GET_PLAYBACK_POSITION_static_0100
     * @tc.desc   Local Video getPlaybackPosition control test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_VIDEO_GET_PLAYBACK_POSITION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      if (fileDescriptor) {
        testGetPlaybackPosition(fileDescriptor!, avPlayer, done);
      }
    });

     /**
      * @tc.name   SUB_MULTIMEDIA_PLAYER_SETPLAYBACKRANGE_FUNCTION_static_0100
      * @tc.number SUB_MULTIMEDIA_PLAYER_SETPLAYBACKRANGE_FUNCTION_static_0100
      * @tc.desc   test function setPlaybackRange
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('SUB_MULTIMEDIA_PLAYER_SETPLAYBACKRANGE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        if (fileDescriptor) {
          expect(fileDescriptor).not().assertNull();
          testSetPlaybackRange(fileDescriptor!, avPlayer, done);
        }
      });
 
      /**
       * @tc.name   SUB_MULTIMEDIA_PLAYER_ON_OFF_SUBTITLEUPDATE_FUNCTION_static_0100
       * @tc.number SUB_MULTIMEDIA_PLAYER_ON_OFF_SUBTITLEUPDATE_FUNCTION_static_0100
       * @tc.desc   test on/off trackinfoupdate
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MULTIMEDIA_PLAYER_ON_OFF_SUBTITLEUPDATE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        if (fileDescriptor) {
          expect(fileDescriptor).not().assertNull();
          testOnOffSubtitleUpdate(fileDescriptor!, avPlayer, done);
        }
      })
 
      /**
       * @tc.name   SUB_MULTIMEDIA_PLAYER_ON_OFF_TRACKINFOUPDATE_FUNCTION_static_0100
       * @tc.number SUB_MULTIMEDIA_PLAYER_ON_OFF_TRACKINFOUPDATE_FUNCTION_static_0100
       * @tc.desc   test on/off trackinfoupdate
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MULTIMEDIA_PLAYER_ON_OFF_TRACKINFOUPDATE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        if (fileDescriptor) {
          expect(fileDescriptor).not().assertNull();
          testOnOffTrackInfoUpdate(fileDescriptor!, avPlayer, done);
        }
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_PLAYER_SETBITRATE_FUNCTION_static_0100
       * @tc.number SUB_MULTIMEDIA_PLAYER_SETBITRATE_FUNCTION_static_0100
       * @tc.desc   test setBitrate function
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MULTIMEDIA_PLAYER_SETBITRATE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        let bitrate: int = 96000;
        media.createAVPlayer((err: BusinessError | null, video: media.AVPlayer | undefined) => {
          console.info(`case media err: ${err}`)
          if (typeof (video) != 'undefined') {
            console.info('case createAVPlayer success');
            avPlayer = video;
            avPlayer!.setBitrate(bitrate);
            done();
          }
          if (err!!.code == 0 ) {
            console.log("error.code =", err!!.code);
            console.error(`case createAVPlayer error, errMessage is ${err!!.message}`);
            expect().assertFail();
            done();
          }
        });
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_PLAYER_OFF_SEIMESSAGERECEIVED_FUNCTION_static_0100
       * @tc.number SUB_MULTIMEDIA_PLAYER_OFF_SEIMESSAGERECEIVED_FUNCTION_static_0100
       * @tc.desc   test off seiMessageReceived function
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MULTIMEDIA_PLAYER_OFF_SEIMESSAGERECEIVED_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        if (fileDescriptor) {
          expect(fileDescriptor).not().assertNull();
          testOffSeiMessageReceived(fileDescriptor!, avPlayer, done);
        }
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_PLAYER_ON_OFF_AUDIOOUTPUTDEVICECHANGEWITHINFO_FUNCTION_static_0100
       * @tc.number SUB_MULTIMEDIA_PLAYER_ON_OFF_AUDIOOUTPUTDEVICECHANGEWITHINFO_FUNCTION_static_0100
       * @tc.desc   test on/off audioOutputDeviceChangeWithInfo
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MULTIMEDIA_PLAYER_ON_OFF_AUDIOOUTPUTDEVICECHANGEWITHINFO_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        if (fileDescriptor) {
          expect(fileDescriptor).not().assertNull();
          testOnOffAudioOutputDeviceChangeWithInfo(fileDescriptor!, avPlayer, done);
        }
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_PLAYER_DRM_SETDECRYPTIONCONFIG_FUNCTION_static_0100
       * @tc.number SUB_MULTIMEDIA_PLAYER_DRM_SETDECRYPTIONCONFIG_FUNCTION_static_0100
       * @tc.desc   test setDecryptionConfig funciton
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MULTIMEDIA_PLAYER_DRM_SETDECRYPTIONCONFIG_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        let systemName:string;
        let isClearPlay = drm.isMediaKeySystemSupported("com.clearplay.drm");
        if (isClearPlay) {
          systemName = "com.clearplay.drm";
        } else {
          systemName = "com.wiseplay.drm";
        }
        let keySystem:drm.MediaKeySystem|undefined= drm.createMediaKeySystem(systemName);
        expect(keySystem).not().assertNull();
        let keySession:drm.MediaKeySession|undefined = keySystem?.createMediaKeySession(drm.ContentProtectionLevel.CONTENT_PROTECTION_LEVEL_SW_CRYPTO);
        expect(keySession).not().assertNull();
        let secureVideoPath:boolean = false;
        avPlayer!.setDecryptionConfig(keySession!, secureVideoPath);
        done()
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_PLAYER_DRM_GETMEDIAKEYSYSTEMINFOS_FUNCTION_static_0100
       * @tc.number SUB_MULTIMEDIA_PLAYER_DRM_GETMEDIAKEYSYSTEMINFOS_FUNCTION_static_0100
       * @tc.desc   test getMediaKeySystemInfos funciton
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MULTIMEDIA_PLAYER_DRM_GETMEDIAKEYSYSTEMINFOS_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        let avPlayer = await media.createAVPlayer()
        expect(avPlayer).not().assertNull();
        const infos = avPlayer!.getMediaKeySystemInfos();
        console.info('GetMediaKeySystemInfos count: ' + infos.length);
        done()
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_PLAYER_ON_OFF_MEDIAKEYSYSTEMINFOUPDATE_FUNCTION_static_0100
       * @tc.number SUB_MULTIMEDIA_PLAYER_ON_OFF_MEDIAKEYSYSTEMINFOUPDATE_FUNCTION_static_0100
       * @tc.desc   test on/off mediaKeySystemInfoUpdate
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MULTIMEDIA_PLAYER_ON_OFF_MEDIAKEYSYSTEMINFOUPDATE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        if (fileDescriptor) {
          expect(fileDescriptor).not().assertNull();
          testOnOffmediaKeySystemInfoUpdate(fileDescriptor!, avPlayer, done);
        }
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_PLAYER_ON_OFF_AUDIOINTERRUPT_FUNCTION_static_0100
       * @tc.number SUB_MULTIMEDIA_PLAYER_ON_OFF_AUDIOINTERRUPT_FUNCTION_static_0100
       * @tc.desc   test on/off audioInterrupt
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MULTIMEDIA_PLAYER_ON_OFF_AUDIOINTERRUPT_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        if (fileDescriptor) {
          expect(fileDescriptor).not().assertNull();
          testOnOffAudioInterrupt(fileDescriptor!, avPlayer, done);
        }
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_PLAYER_ON_OFF_BITRATEDONE_FUNCTION_static_0100
       * @tc.number SUB_MULTIMEDIA_PLAYER_ON_OFF_BITRATEDONE_FUNCTION_static_0100
       * @tc.desc   test on/off bitrateDone
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL0
       */
      it('SUB_MULTIMEDIA_PLAYER_ON_OFF_BITRATEDONE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        if (fileDescriptor) {
          expect(fileDescriptor).not().assertNull();
          testOnOffBitrateDone(fileDescriptor!, avPlayer, done);
        }
      })

       /**
        * @tc.name   SUB_MULTIMEDIA_PLAYER_DATASRC_FUNCTION_static_0100
        * @tc.number SUB_MULTIMEDIA_PLAYER_DATASRC_FUNCTION_static_0100
        * @tc.desc   test avplayer data src
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
       it('SUB_MULTIMEDIA_PLAYER_DATASRC_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
        if (fileDescriptor) {
          expect(fileDescriptor).not().assertNull();
          testAvPlayerDataSrc(fileDescriptor!, avPlayer, done);
        }
      })
  })
}
