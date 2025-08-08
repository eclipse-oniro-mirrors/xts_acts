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
import media from '@ohos.multimedia.media'
import audio from '@ohos.multimedia.audio';
import { testAVPlayerFun, setSource, setSubtitle, PlayTest } from './AVPlayerTestBase';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { resourceManager } from '@kit.LocalizationKit';

const VIDEO_SOURCE = 'H264_AAC.mp4';
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
let avPlayer: media.AVPlayer;
let mediaTestBase = new MediaTestBase()

async function resetAndCallbackOff() {
  console.info('case now stopped, to reset');
  await avPlayer.reset().then(() => {
    console.info('case reset AVPlayer success');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
  avPlayer.off('stateChange');
  avPlayer.off('superResolutionChanged');
  avPlayer.off('error');
  avPlayer.off('endOfStream');
  console.info('case now stopped, to release');
  await avPlayer.release().then(() => {
    console.info('case release AVPlayer success');
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
}

async function handleState(state: string, initializedOp: Function, preparedOp: Function, playedOp: Function, stoppedOp: Function) {
  switch (state) {
    case INITIALIZED:
      expect(avPlayer.state).assertEqual(INITIALIZED);
      let surfaceID: string = globalThis.value;
      avPlayer.surfaceId = surfaceID;
      console.info(`case avPlayer.surfaceId is ${avPlayer.surfaceId}`);
      await initializedOp();
      await avPlayer.prepare().then(() => {
        console.info('case prepare called');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      break;
    case PREPARED:
      expect(avPlayer.state).assertEqual(PREPARED);
      expect(avPlayer.currentTime).assertEqual(0);
      await preparedOp();
      console.info('case to play AVPlayer');
      await avPlayer.play().then(() => {
        console.info('case play AVPlayer success');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      break;
    case PLAYING:
      expect(avPlayer.state).assertEqual(PLAYING);
      await mediaTestBase.msleepAsync(PLAY_TIME);
      await playedOp();
      if (!avPlayer.loop) {
        await avPlayer.stop().then(() => {
          console.info('case stop AVPlayer success');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      } else {
        console.log("avPlayer.loop is true")
      }
      break;
    case STOPPED:
      expect(avPlayer.state).assertEqual(STOPPED);
      await stoppedOp();
      break;
    case ERROR:
      expect(avPlayer.state).assertEqual(ERROR);
      expect().assertFail();
      avPlayer.release().then(() => {
        console.info('case release AVPlayer success');
      }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      break;
    default:
      break;
  }
}

async function testPostProcessor(fd: media.AVFileDescriptor, initializedOp: Function, preparedOp: Function, playedOp: Function,
  stoppedOp: Function, extraOp: Function | undefined, done: Function) {
  console.info(`case media source: ${fd}`)
  await media.createAVPlayer().then((video) => {
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
    } else {
      console.error('case createAVPlayer failed');
      expect().assertFail();
      done();
    }
  }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);

  avPlayer.on('stateChange', async (state, reason) => {
    console.info(`case stateChange called, state is ${state}, reason is ${reason}`);
    await handleState(state, initializedOp, preparedOp, playedOp, stoppedOp);
  });
  avPlayer.on('error', async (err) => {
    console.error(`case error called, errMessage is ${err.message}`);
  });
  avPlayer.on('endOfStream', async () => {
    if (extraOp) {
      extraOp();
    }
  });
  avPlayer.on('superResolutionChanged', (enabled: boolean) => {
    try {
      console.info('Received SEI message at playbackPosition: ' + enabled);
    } catch (error) {
      console.error('Error in superResolutionChanged', error);
      expect().assertFail();
    }
  });
  setSource(avPlayer, fd);
}

function openFileFailed() {
  console.info('case file fail');
}

export default function AVPlayerPostProcessorTest() {
  describe('AVPlayerPostProcessorTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFdRead(VIDEO_SOURCE, openFileFailed).then((testNumber) => {
        fileDescriptor = {
          fd: testNumber
        }
      });
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      if (avPlayer != null) {
        await avPlayer.release().then(() => {
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      }
      await mediaTestBase.msleepAsync(2000);
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await mediaTestBase.closeFdNumber(fileDescriptor.fd)
    });

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_0100
        * @tc.name      : 001.test super resolution
        * @tc.desc      : test normal super resolution condition
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_0100', 0, async (done: Function) => {
      let initializedOperation = async () => {
        let playbackStrategy: media.PlaybackStrategy = { enableSuperResolution : true, mutedMediaType: media.MediaType.MEDIA_TYPE_AUD };
        avPlayer.setPlaybackStrategy(playbackStrategy).catch((error: BusinessError) => {
          console.error(`setPlaybackStrategy failed, err code ${error.code} msg ${error.message}`)
          expect().assertFail();
        })
        avPlayer.setSuperResolution(true).catch((error: BusinessError) => {
          console.error(`setSuperResolution failed, err code ${error.code} msg ${error.message}`)
          expect().assertFail();
        })
        avPlayer.setVideoWindowSize(1080, 720).catch((error: BusinessError) => {
          console.error(`setVideoWindowSize failed, err code ${error.code} msg ${error.message}`)
          expect().assertFail();
        })
      }

      let preparedOperation = async () => {
        avPlayer.setSuperResolution(false).catch((error: BusinessError) => {
          console.error(`setSuperResolution failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED).assertTrue()
        })
        avPlayer.setVideoWindowSize(1080, 720).catch((error: BusinessError) => {
          console.error(`setVideoWindowSize failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED).assertTrue()
        })
      }

      let playedOperation = async () => {
        avPlayer.setSuperResolution(false).catch((error: BusinessError) => {
          console.error(`setSuperResolution failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED).assertTrue()
        })
        avPlayer.setVideoWindowSize(1080, 720).catch((error: BusinessError) => {
          console.error(`setVideoWindowSize failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED).assertTrue()
        })
      }

      let stoppedOperation = async () => {
        await resetAndCallbackOff();
        done();
      }

      await testPostProcessor(fileDescriptor, initializedOperation, preparedOperation, playedOperation, stoppedOperation, undefined, done);
    });

    /* *
        * @tc.number    : SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_0200
        * @tc.name      : 002.test super resolution
        * @tc.desc      : test super resolution without enabling it
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_0200', 0, async (done: Function) => {
      let initializedOperation = async () => {
        avPlayer.setSuperResolution(true).catch((error: BusinessError) => {
          console.error(`setSuperResolution failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
        avPlayer.setVideoWindowSize(1080, 720).catch((error: BusinessError) => {
          console.error(`setVideoWindowSize failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
      }

      let preparedOperation = async () => {
        avPlayer.setSuperResolution(false).catch((error: BusinessError) => {
          console.error(`setSuperResolution failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
        avPlayer.setVideoWindowSize(1080, 720).catch((error: BusinessError) => {
          console.error(`setVideoWindowSize failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
      }

      let playedOperation = async () => {
        avPlayer.setSuperResolution(true).catch((error: BusinessError) => {
          console.error(`setSuperResolution failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
        avPlayer.setVideoWindowSize(1080, 720).catch((error: BusinessError) => {
          console.error(`setVideoWindowSize failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
      }

      let stoppedOperation = async () => {
        await resetAndCallbackOff();
        done();
      }

      await testPostProcessor(fileDescriptor, initializedOperation, preparedOperation, playedOperation, stoppedOperation, undefined, done);
    });


    /* *
        * @tc.number    : SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_0300
        * @tc.name      : 003.test super resolution
        * @tc.desc      : test super resolution invalid parameters
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level1
    */
    it('SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_0300', 0, async (done: Function) => {
      let initializedOperation = async () => {
        let playbackStrategy: media.PlaybackStrategy = { enableSuperResolution : true, mutedMediaType: media.MediaType.MEDIA_TYPE_AUD };
        avPlayer.setPlaybackStrategy(playbackStrategy).catch((error: BusinessError) => {
          console.error(`setPlaybackStrategy failed, err code ${error.code} msg ${error.message}`)
          expect().assertFail();
        })
        avPlayer.setVideoWindowSize(100, 100).catch((error: BusinessError) => {
          console.error(`setVideoWindowSize failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_INVALID_PARAMETER).assertTrue()
        })
        avPlayer.setVideoWindowSize(10000, 10000).catch((error: BusinessError) => {
          console.error(`setVideoWindowSize failed, err code ${error.code} msg ${error.message}`)
          expect(error.code == media.AVErrorCode.AVERR_INVALID_PARAMETER).assertTrue()
        })
      }

      let preparedOperation = async () => {
      }

      let playedOperation = async () => {
      }

      let stoppedOperation = async () => {
        await resetAndCallbackOff();
        done();
      }

      await testPostProcessor(fileDescriptor, initializedOperation, preparedOperation, playedOperation, stoppedOperation, undefined, done);
    });
  })
}
