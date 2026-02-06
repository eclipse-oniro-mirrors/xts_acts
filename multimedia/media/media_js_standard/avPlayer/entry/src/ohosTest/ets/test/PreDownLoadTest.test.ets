/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import media from '@ohos.multimedia.media';
import resourceManager from '@ohos.resourceManager';
import MediaTestBase from './MediaTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { BusinessError } from '@kit.BasicServicesKit';
import { HashMap } from '@kit.ArkTS';
import { fileIo as fs } from '@kit.CoreFileKit';

const MAX_COUNT = 999999999;
const CREAT_PROMISE_EVENT = 'createPromise';
const SET_CALLBACK_EVENT = 'setCallback';
const SET_MEDIA_SOURCE_EVENT = 'setMediaSource';
const PREPARE_EVENT = 'prepare';
const PLAY_EVENT = 'play';
const PLAYING_EVENT = 'playing';
const PAUSE_EVENT = 'pause'
const RELEASE_EVENT = 'release'
const ERROR_EVENT = 'error';
const END_EVENT = 'end';
const VIDEO_SOURCE = 'H264_AAC.mp4';
const FILE_LENGTH = 1894335;
const URL_TO_HEADER: Record<string, Record<string, string>> =
  { "https://xxx/xx.mp4" : {"content-length": "1894335"} }

let avPlayer: media.AVPlayer | null = null;
let mediaSource: media.MediaSource;
let resourceLoader: media.MediaSourceLoader;
let requests: HashMap<number, media.MediaSourceLoadingRequest> = new HashMap(); // uuid:request
let fileDescriptor: resourceManager.RawFileDescriptor | undefined;
let mgr: resourceManager.ResourceManager;
let uuid: number = 0;
let count: number = 0;
let mediaTestBase = new MediaTestBase()

interface PreDownConfig {
  url: string,
  playTime: number, // Used to PLAYING_EVENT, -1 means wait for end callback
  respondDataCount: number, // test for finishLoading
  needHeader: boolean,
  loadingError?: number
}

function createEvent(avPlayer: media.AVPlayer | null, config: PreDownConfig, steps: Array<string>, done: Function) {
  media.createAVPlayer().then((avplayer) => {
    if (avplayer != null) {
      console.info('Succeeded in creating avplayer');
      avPlayer = avplayer;
      toNextStep(avPlayer, config, steps, done);
    } else {
      console.error('Failed to create avplayer');
      done();
    }
  }).catch((error: BusinessError) => {
    console.error(`Failed to create avplayer, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

async function setCallbackEvent(avPlayer: media.AVPlayer | null, config: PreDownConfig,
    steps: Array<string>, done: Function) {
  console.info(`case setAVPlayerCb`);
  avPlayer?.on('stateChange', async (State, reason) => {
    console.info(`case state: ${State}, reason: ${State}`);
    switch (State) {
      case 'playing':
        break;
      case 'initialized':
        avPlayer.surfaceId = globalThis.value;
      default:
        toNextStep(avPlayer, config, steps, done);
    }
  })
  avPlayer?.on('error', (err) => {
    console.info(`case on error: ${err}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
  toNextStep(avPlayer, config, steps, done);
}

async function respondHeader(uuid: number, config: PreDownConfig) {
  let request = requests.get(uuid);
  if (request) {
    let url = request.url;
    let header = URL_TO_HEADER[url];
    console.log(`case in respondHeader`)
    request.respondHeader(uuid, header);
    config.needHeader = false;
  }
}

async function respondData(uuid: number, offset: number, length: number) {
  let request = requests.get(uuid);
  if (request) {
    let buf = new ArrayBuffer(length);
    if (fileDescriptor) {
      console.log("offset" + fileDescriptor.offset + "length:" +  fileDescriptor.length);
      let num = fs.readSync(fileDescriptor.fd, buf, { offset: fileDescriptor.offset + offset, length: length});
      console.log(`respondData uuid: ${uuid},num: ${num}`);
      request.respondData(uuid, offset, buf);
    }
  }
}

async function finishLoading(uuid: number, config: PreDownConfig) {
  let request = requests.get(uuid);
  if (request) {
    console.log(`case in finishLoading loadingError ${config.loadingError}`)
    request.finishLoading(uuid, config.loadingError);
  }
}

function initResourceLoader(avPlayer: media.AVPlayer | null, config: PreDownConfig,
    steps: Array<string>, done: Function) {
  resourceLoader = {
    open: (request: media.MediaSourceLoadingRequest) => {
      if (!request) {
        console.error('request nullptr');
        expect().assertFail();
      }
      uuid += 1;
      requests.set(uuid, request);
      return uuid;
    },
    read: (uuid: number, requestedOffset: number, requestedLength: number) => {
      if (!requests.hasKey(uuid)) {
        console.warn('uuid not find')
        return;
      }
      if (config.needHeader) {
        respondHeader(uuid, config);
      }
      if (config.respondDataCount == 0) {
        finishLoading(uuid, config);
      } else {
        config.respondDataCount -= 1;
        if (config.loadingError == media.LoadingRequestError.LOADING_ERROR_NOT_READY) {
          finishLoading(uuid, config);
          config.loadingError = 0;
          return;
        }
        respondData(uuid, requestedOffset, requestedLength);
        if (requestedOffset + requestedLength == FILE_LENGTH
            && config.loadingError == media.LoadingRequestError.LOADING_ERROR_SUCCESS) {
          finishLoading(uuid, config);
        }
      }
    },
    close: (uuid: number) => {
      requests.remove(uuid);
      config.needHeader = true;
    }
  }
  mediaSource = media.createMediaSourceWithUrl(config.url);
  mediaSource.setMediaResourceLoaderDelegate(resourceLoader);
}

function setMediaSourceEvent(avPlayer: media.AVPlayer | null, config: PreDownConfig,
    steps: Array<string>, done: Function) {
  console.info('case setSourceEvent');
  let playStrategy : media.PlaybackStrategy = { preferredBufferDuration: 0 };
  initResourceLoader(avPlayer, config, steps, done);
  avPlayer?.setMediaSource(mediaSource, playStrategy).catch((error: BusinessError) => {
    console.error(`Failed to setMediaSource, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

function prepareEvent(avPlayer: media.AVPlayer | null, config: PreDownConfig,
  steps: Array<string>, done: Function)
{
  console.info('case prepareEvent');
  avPlayer?.prepare().catch((error: BusinessError) => {
    console.error(`Failed to play, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

function playEvent(avPlayer: media.AVPlayer | null, config: PreDownConfig,
  steps: Array<string>, done: Function)
{
  console.info('case playEvent');
  avPlayer?.play().then(() => {
    console.info('play success');
    toNextStep(avPlayer, config, steps, done);
  }).catch((error: BusinessError) => {
    console.error(`Failed to play, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

async function playingEvent(avPlayer: media.AVPlayer | null, config: PreDownConfig,
  steps: Array<string>, done: Function)
{
  console.log('playingEvent enter');
  if (config.playTime == -1) {
    return;
  }
  await mediaTestBase.msleepAsync(config.playTime);
  toNextStep(avPlayer, config, steps, done);
}

function pauseEvent(avPlayer: media.AVPlayer | null, config: PreDownConfig, steps: Array<string>, done: Function)
{
  console.info('case pauseEvent');
  avPlayer?.pause().catch((error: BusinessError) => {
    console.error(`Failed to play, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

function releaseEvent(avPlayer: media.AVPlayer | null, config: PreDownConfig, steps: Array<string>, done: Function)
{
  console.info('case releaseEvent');
  avPlayer?.release().catch((error: BusinessError) => {
    console.error(`Failed to relese, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

function toNextStep(avPlayer: media.AVPlayer | null, config: PreDownConfig, steps: Array<string>, done: Function) {
  if (steps[0] == END_EVENT) {
    console.info('case success!!');
    done();
  }
  switch (steps[0]) {
    case CREAT_PROMISE_EVENT:
      steps.shift();
      createEvent(avPlayer, config, steps, done);
      break;
    case SET_CALLBACK_EVENT:
      steps.shift();
      setCallbackEvent(avPlayer, config, steps, done);
      break;
    case SET_MEDIA_SOURCE_EVENT:
      steps.shift();
      setMediaSourceEvent(avPlayer, config, steps, done);
      break;
    case PREPARE_EVENT:
      steps.shift();
      prepareEvent(avPlayer, config, steps, done);
      break;
    case PLAY_EVENT:
      steps.shift();
      playEvent(avPlayer, config, steps, done);
      break;
    case PLAYING_EVENT:
      steps.shift();
      playingEvent(avPlayer, config, steps, done);
      break;
    case PAUSE_EVENT:
      steps.shift();
      pauseEvent(avPlayer, config, steps, done);
      break;
    case RELEASE_EVENT:
      steps.shift();
      releaseEvent(avPlayer, config, steps, done);
      break;
    default:
      break;
  }
}

function getFd(path: string) {
  mgr = globalThis.getContext().resourceManager;
  fileDescriptor = mgr.getRawFdSync(path);
}

export default function PreDownLoadTest() {

  describe('PreDownLoadTest', () => {
    beforeAll(async () => {
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
      getFd(VIDEO_SOURCE);
      console.log(`laamy ${Number.MAX_VALUE}`)
    })
    beforeEach(() => { })
    afterEach(() => { })
    afterAll(() => {
      if (fileDescriptor) {
        mgr.closeRawFdSync(VIDEO_SOURCE);
      }
    })

    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_0100
    * @tc.name      : 001.test createSource -> avplayer -> setSource -> prepare -> play -> pause -> release
    * @tc.desc      : start-pause-resume-stop-release
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_0100', Level.LEVEL0,async (done: Function) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_0100 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: MAX_COUNT
      }
      let mySteps = new Array(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // play player
        PLAY_EVENT,
        // playing preConfig.playTime
        PLAYING_EVENT,
        // pause player
        PAUSE_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_0100 end');
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0100
    * @tc.name      : 001.test finishLoading
    * @tc.desc      : LOADING_ERROR_SUCCESS
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0100', Level.LEVEL0,async (done: Function) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0100 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: -1,
        respondDataCount: MAX_COUNT,
        loadingError: media.LoadingRequestError.LOADING_ERROR_SUCCESS
      }
      let mySteps = new Array(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // play
        PLAY_EVENT,
        // playing
        PLAYING_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0100 end');
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0200
    * @tc.name      : 001.test finishLoading LOADING_ERROR_NOT_READY
    * @tc.desc      : LOADING_ERROR_NOT_READY
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0200', Level.LEVEL0,async (done: Function) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0200 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: MAX_COUNT,
        loadingError: media.LoadingRequestError.LOADING_ERROR_NOT_READY
      }
      let mySteps = new Array(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // play player
        PLAY_EVENT,
        // pause player
        PAUSE_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0200 end');
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0100
    * @tc.name      : 001.test finishLoading LOADING_ERROR_NO_RESOURCE
    * @tc.desc      : LOADING_ERROR_NO_RESOURCE
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0300', Level.LEVEL0,async (done: Function) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0300 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_NO_RESOURCE
      }
      let mySteps = new Array(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT, ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0300 end');
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0400
    * @tc.name      : 001.test finishLoading LOADING_ERROR_INVAID_HANDLE
    * @tc.desc      : LOADING_ERROR_INVAID_HANDLE
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0400', Level.LEVEL0,async (done: Function) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0400 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_INVAID_HANDLE
      }
      let mySteps = new Array(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT, ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0400 end');
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0500
    * @tc.name      : 001.test finishLoading LOADING_ERROR_ACCESS_DENIED
    * @tc.desc      : LOADING_ERROR_ACCESS_DENIED
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0500', Level.LEVEL0,async (done: Function) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0500 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_ACCESS_DENIED
      }
      let mySteps = new Array(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT, ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0500 end');
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0600
    * @tc.name      : 001.test finishLoading LOADING_ERROR_ACCESS_TIMEOUT
    * @tc.desc      : LOADING_ERROR_ACCESS_TIMEOUT
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0600', Level.LEVEL0,async (done: Function) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0600 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_ACCESS_TIMEOUT
      }
      let mySteps = new Array(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT, ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0600 end');
    });
    /* *
    * @tc.number    : SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0700
    * @tc.name      : 001.test finishLoading LOADING_ERROR_AUTHORIZE_FAILED
    * @tc.desc      : LOADING_ERROR_AUTHORIZE_FAILED
    * @tc.size      : MediumTest
    * @tc.type      : Function test
    * @tc.level     : Level2
    */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0700', Level.LEVEL0,async (done: Function) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0700 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_AUTHORIZE_FAILED
      }
      let mySteps = new Array(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT, ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0700 end');
    });
  })
}