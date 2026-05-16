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

import media from '@ohos.multimedia.media';
import resourceManager from '@ohos.resourceManager';
import MediaTestBase from './MediaTestBase.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import HashMap from '@ohos.util.HashMap';
import fs from '@ohos.file.fs';
import { globalThis } from './Util.test';

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
const FILE_LENGTH: Long = 1894335;
const URL_TO_HEADER: Record<string, Record<string, string>> =
  { "https://xxx/xx.mp4" : {"content-length": "1894335"} }

let avPlayer: media.AVPlayer | undefined;
let mediaSource: media.MediaSource | undefined;
let resourceLoader: media.MediaSourceLoader;
let requests: HashMap<number, media.MediaSourceLoadingRequest> = new HashMap<number, media.MediaSourceLoadingRequest>(); // uuid:request
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

function createEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig, steps: Array<string>, done: () => void) {
  media.createAVPlayer().then((avplayer: media.AVPlayer | undefined) => {
    if (avplayer != null) {
      console.info('Succeeded in creating avplayer');
      avPlayer = avplayer;
      toNextStep(avPlayer, config, steps, done);
    } else {
      console.error('Failed to create avplayer');
      done();
    }
  }).catch((error: Error) => {
    console.error(`Failed to create avplayer, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

async function setCallbackEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void) {
  console.info(`case setAVPlayerCb`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case state: ${state}, reason: ${state}`);
    switch (state) {
      case 'playing':
        break;
      case 'initialized':
        avPlayer!!.surfaceId = globalThis.value;
      default:
        toNextStep(avPlayer, config, steps, done);
    }
  })
  avPlayer?.onError((err) => {
    console.info(`case on error: ${err}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
  toNextStep(avPlayer, config, steps, done);
}

async function respondHeader(uuid: int, config: PreDownConfig) {
  let request = requests.get(uuid);
  if (request) {
    let url = request.url;
    let header = URL_TO_HEADER[url];
    console.log(`case in respondHeader`)
    request.respondHeader(uuid, header);
    config.needHeader = false;
  }
}

async function respondData(uuid: Long, offset: Long, length: Long) {
  let request = requests.get(uuid);
  if (request) {
    let buf = new ArrayBuffer(length);
    if (fileDescriptor) {
      console.log("offset" + fileDescriptor!!.offset + "length:" +  fileDescriptor!!.length);
      let num = fs.readSync(fileDescriptor!!.fd, buf, { offset: (fileDescriptor!!.offset + offset).toLong(), length: length.toLong()});
      console.log(`respondData uuid: ${uuid},num: ${num}`);
      let bufArr = new Uint8Array(buf)
      console.info(`case in respondData ArrayBuffer: ${bufArr}`);
      try {
        request.respondData(uuid, offset, buf);
      } catch(e: Error) {
        console.error(`Failed to respondData, error message:${JSON.stringify(e)}`);
      }
      
      console.info(`case in respondData end uuid: ${uuid}, offset: ${offset}, length: ${length}`);
    }
  }
}

async function finishLoading(uuid: Long, config: PreDownConfig) {
  let request = requests.get(uuid);
  if (request) {
    console.log(`case in finishLoading loadingError ${config.loadingError}`)
    // request.finishLoading(uuid.toLong(), config.loadingError as media.LoadingRequestError);
    let loadingErr = media.LoadingRequestError.LOADING_ERROR_SUCCESS;
    if (config.loadingError == 1) {
      loadingErr = media.LoadingRequestError.LOADING_ERROR_NOT_READY
    } else if (config.loadingError == 2) {
      loadingErr = media.LoadingRequestError.LOADING_ERROR_NO_RESOURCE
    } else if (config.loadingError == 3) {
      loadingErr = media.LoadingRequestError.LOADING_ERROR_INVAID_HANDLE
    } else if (config.loadingError == 4) {
      loadingErr = media.LoadingRequestError.LOADING_ERROR_ACCESS_DENIED
    } else if (config.loadingError == 5) {
      loadingErr = media.LoadingRequestError.LOADING_ERROR_ACCESS_TIMEOUT
    } else if (config.loadingError == 6) {
      loadingErr = media.LoadingRequestError.LOADING_ERROR_AUTHORIZE_FAILED
    }
    request.finishLoading(uuid, loadingErr);
  }
}

function initResourceLoader(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void) {
  resourceLoader = {
    open: (request: media.MediaSourceLoadingRequest) => {
      if (!request) {
        console.error('request nullptr');
        expect().assertFail();
      }
      uuid += 1;
      requests.set(uuid, request);
      return uuid.toLong();
    },
    read: (uuid: Long, requestedOffset: Long, requestedLength: Long) => {
      if (!requests.hasKey(uuid)) {
        console.warn('uuid not find')
        return;
      }
      if (config.needHeader) {
        respondHeader(uuid.toInt(), config);
      }
      console.info(`case in respondDataCount ${config.respondDataCount}`);
      if (config.respondDataCount == 0) {
        finishLoading(uuid, config);
      } else {
        config.respondDataCount -= 1;
        console.info(`case in loadingError ${config.loadingError}`);
        if (config.loadingError == media.LoadingRequestError.LOADING_ERROR_NOT_READY as number) {
          finishLoading(uuid, config);
          config.loadingError = 0;
          return;
        }
        console.info(`case in respondData uuid: ${uuid}, requestedOffset: ${requestedOffset}, requestedLength: ${requestedLength}`);
        respondData(uuid, requestedOffset, requestedLength);
        if ((requestedOffset + requestedLength) == FILE_LENGTH
          && (config.loadingError == media.LoadingRequestError.LOADING_ERROR_SUCCESS as number)) {
            console.info(`case in finishLoading uuid: ${uuid}`);
          finishLoading(uuid, config);
        }
        console.info(`case in respondDataCount2 ${config.respondDataCount}`);
      }
    },
    close: (uuid: Long) => {
      requests.remove(uuid);
      config.needHeader = true;
    }
  }
  mediaSource = media.createMediaSourceWithUrl(config.url);
  mediaSource!!.setMediaResourceLoaderDelegate(resourceLoader);
}

function setMediaSourceEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void) {
  console.info('case setSourceEvent');
  let playStrategy : media.PlaybackStrategy = { preferredBufferDuration: 0 };
  initResourceLoader(avPlayer, config, steps, done);
  avPlayer?.setMediaSource(mediaSource!, playStrategy).catch((error: Error) => {
    console.error(`Failed to setMediaSource, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

function prepareEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void)
{
  console.info('case prepareEvent');
  avPlayer?.prepare().catch((error: Error) => {
    console.error(`Failed to prepare, error message:${error}`);
  })
}

function playEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void)
{
  console.info('case playEvent');
  avPlayer?.play().then(() => {
    console.info('play success');
    setTimeout(() => {
      toNextStep(avPlayer, config, steps, done);
  }, 3000)
  }).catch((error: Error) => {
    console.error(`Failed to play, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

async function playingEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void)
{
  console.log('playingEvent enter');
  if (config.playTime == -1) {
  } else {
    await mediaTestBase.msleepAsync(config.playTime);
    toNextStep(avPlayer, config, steps, done);
  }
}

function pauseEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig, steps: Array<string>, done: () => void)
{
  console.info('case pauseEvent');
  console.info(`case pauseEvent, state is ${avPlayer?.state}`);
  avPlayer?.pause().catch((error: Error) => {
    console.error(`Failed to play, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

function releaseEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig, steps: Array<string>, done: () => void)
{
  console.info('case releaseEvent');
  avPlayer?.release().catch((error: Error) => {
    console.error(`Failed to relese, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

function toNextStep(avPlayer: media.AVPlayer | undefined, config: PreDownConfig, steps: Array<string>, done: () => void) {
  if (steps[0] == END_EVENT) {
    console.info('case success!!');
    done();
  }
  console.log("Current step:", steps[0]);
  console.log("Is it PLAY_EVENT?", steps[0] === PLAY_EVENT);
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
  mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, () => {}).then((res: media.AVFileDescriptor) => {
    fileDescriptor = { fd: res!.fd, length: 0, offset: 0 } as resourceManager.RawFileDescriptor;
  });
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
      console.log(`fileDescriptor: ${JSON.stringify(fileDescriptor)}`);
      console.log(`laamy ${Number.MAX_VALUE}`)
    })
    beforeEach(() => { })
    afterEach(() => { })
    afterAll(() => {
      if (fileDescriptor) {
        fs.closeSync(fileDescriptor!.fd);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_static_0100
     * @tc.desc   start-pause-resume-stop-release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_0100 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: MAX_COUNT
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT,
    
        SET_CALLBACK_EVENT,
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
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_0100 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0100
     * @tc.desc   LOADING_ERROR_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0100 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: -1,
        respondDataCount: MAX_COUNT,
        loadingError: media.LoadingRequestError.LOADING_ERROR_SUCCESS
      }
      let mySteps = new Array<string>(
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
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0100 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0200
     * @tc.desc   LOADING_ERROR_NOT_READY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0200 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: MAX_COUNT,
        loadingError: media.LoadingRequestError.LOADING_ERROR_NOT_READY
      }
      let mySteps = new Array<string>(
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
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0200 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0300
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0300
     * @tc.desc   LOADING_ERROR_NO_RESOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0300 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_NO_RESOURCE
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0300 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0400
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0400
     * @tc.desc   LOADING_ERROR_INVAID_HANDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0400 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_INVAID_HANDLE
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0400 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0500
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0500
     * @tc.desc   LOADING_ERROR_ACCESS_DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0500 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_ACCESS_DENIED
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0500 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0600
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0600
     * @tc.desc   LOADING_ERROR_ACCESS_TIMEOUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0600 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_ACCESS_TIMEOUT
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0600 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0700
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0700
     * @tc.desc   LOADING_ERROR_AUTHORIZE_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0700 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_AUTHORIZE_FAILED
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0700 end');
    });
  })
}