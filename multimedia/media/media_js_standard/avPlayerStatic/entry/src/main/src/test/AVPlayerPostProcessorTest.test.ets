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
let avPlayer: media.AVPlayer | undefined;
let mediaTestBase = new MediaTestBase()

type AsyncVoidCallback = () => Promise<void>

async function resetAndCallbackOff() {
  console.info('case now stopped, to reset');
  await avPlayer!!.reset().then(() => {
    console.info('case reset AVPlayer success');
  }).catch(mediaTestBase.catchCallback);
  avPlayer!!.offStateChange();
  avPlayer!!.offSuperResolutionChanged();
  avPlayer!!.offError();
  avPlayer!!.offEndOfStream();
  console.info('case now stopped, to release');
  await avPlayer!!.release().then(() => {
    console.info('case release AVPlayer success');
  }).catch(mediaTestBase.catchCallback);
}

async function handleState(state: string, initializedOp: AsyncVoidCallback, preparedOp: AsyncVoidCallback, playedOp: AsyncVoidCallback, stoppedOp: AsyncVoidCallback, done: () => void) {
  switch (state) {
    case INITIALIZED:
      expect(avPlayer!!.state).assertEqual(INITIALIZED);
      let surfaceID: string = globalThis.value;
      avPlayer!!.surfaceId = surfaceID;
      console.info(`case avPlayer.surfaceId is ${avPlayer!!.surfaceId}`);
      await initializedOp();
      done();
      break;
    case PREPARED:
      expect(avPlayer!!.state).assertEqual(PREPARED);
      expect(avPlayer!!.currentTime).assertEqual(0);
      await preparedOp();
      console.info('case to play AVPlayer');
      await avPlayer!!.play().then(() => {
        console.info('case play AVPlayer success');
      }).catch(mediaTestBase.catchCallback);
      break;
    case PLAYING:
      expect(avPlayer!!.state).assertEqual(PLAYING);
      await playedOp();
      if (!avPlayer!!.loop) {
        await avPlayer!!.stop().then(() => {
          console.info('case stop AVPlayer success');
        }).catch(mediaTestBase.catchCallback);
      } else {
        console.log("avPlayer.loop is true")
      }
      break;
    case STOPPED:
      expect(avPlayer!!.state).assertEqual(STOPPED);
      await stoppedOp();
      break;
    case ERROR:
      expect(avPlayer!!.state).assertEqual(ERROR);
      expect().assertFail();
      avPlayer!!.release().then(() => {
        console.info('case release AVPlayer success');
      }).catch(mediaTestBase.catchCallback);
      break;
    default:
      break;
  }
}

async function testPostProcessor(fd: media.AVFileDescriptor, initializedOp: AsyncVoidCallback, preparedOp: AsyncVoidCallback, playedOp: AsyncVoidCallback,
  stoppedOp: AsyncVoidCallback, extraOp: AsyncVoidCallback | undefined, done: () => void) {
  console.info(`case media source: ${fd}`)
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
    await handleState(state.toString(), initializedOp, preparedOp, playedOp, stoppedOp, done);
  });
  avPlayer!!.onError((err: BusinessError) => {
    console.error(`case error called, errMessage is ${err.message}`);
  });
  avPlayer!!.onEndOfStream(() => {
    if (extraOp) {
      extraOp();
    }
  });
  avPlayer!!.onSuperResolutionChanged((enabled: boolean) => {
    try {
      console.info('Received SEI message at playbackPosition: ' + enabled);
    } catch (error) {
      console.error('Error in superResolutionChanged', error);
      expect().assertFail();
    }
  });
  console.info('case fdsrc test');
  avPlayer!!.fdSrc = fd;
}

function openFileFailed() {
  console.info('case file fail');
}

export default function AVPlayerPostProcessorTest() {
  describe('AVPlayerPostProcessorTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await mediaTestBase.getFdRead(VIDEO_SOURCE, openFileFailed).then((testNumber: number) => {
        fileDescriptor = {
          fd: testNumber as int
        }
      });
    });
    beforeEach(async () => {
      console.info('beforeEach case');
    });
    afterEach(async () => {
      if (avPlayer != null) {
        await avPlayer!!.release().then(() => {
        }).catch(mediaTestBase.catchCallback);
      }
      console.info('afterEach case');
    });
    afterAll(async () => {
      console.info('afterAll case');
      await mediaTestBase.closeFdNumber(fileDescriptor.fd)
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_static_0100
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_static_0100
     * @tc.desc   test normal super resolution condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let initializedOperation = async () => {
        let playbackStrategy: media.PlaybackStrategy = { enableSuperResolution : true, mutedMediaType: media.MediaType.MEDIA_TYPE_AUD };
        avPlayer!!.setPlaybackStrategy(playbackStrategy).catch((error: Error) => {
          console.error(`setPlaybackStrategy failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect().assertFail();
        })
        await mediaTestBase.msleepAsync(200);
        avPlayer!!.setSuperResolution(true).catch((error: Error) => {
          console.error(`setSuperResolution failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect().assertFail();
        })
        avPlayer!!.setVideoWindowSize(1080, 720).catch((error: Error) => {
          console.error(`setVideoWindowSize failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect().assertFail();
        })
      }

      let preparedOperation = async () => {
        avPlayer!!.setSuperResolution(false).catch((error: Error) => {
          console.error(`setSuperResolution failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED).assertTrue()
        })
        avPlayer!!.setVideoWindowSize(1080, 720).catch((error: Error) => {
          console.error(`setVideoWindowSize failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED).assertTrue()
        })
      }

      let playedOperation = async () => {
        avPlayer!!.setSuperResolution(false).catch((error: Error) => {
          console.error(`setSuperResolution failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED).assertTrue()
        })
        avPlayer!!.setVideoWindowSize(1080, 720).catch((error: Error) => {
          console.error(`setVideoWindowSize failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_UNSUPPORTED).assertTrue()
        })
      }

      let stoppedOperation = async () => {
        await resetAndCallbackOff();
        done();
      }
      await testPostProcessor(fileDescriptor, initializedOperation, preparedOperation, playedOperation, stoppedOperation, undefined, done);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_static_0200
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_static_0200
     * @tc.desc   test super resolution without enabling it
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let initializedOperation = async () => {
        avPlayer!!.setSuperResolution(true).catch((error: Error) => {
          console.error(`setSuperResolution failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
        await mediaTestBase.msleepAsync(200);
        avPlayer!!.setVideoWindowSize(1080, 720).catch((error: Error) => {
          console.error(`setVideoWindowSize failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
      }

      let preparedOperation = async () => {
        avPlayer!!.setSuperResolution(false).catch((error: Error) => {
          console.error(`setSuperResolution failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
        avPlayer!!.setVideoWindowSize(1080, 720).catch((error: Error) => {
          console.error(`setVideoWindowSize failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
      }

      let playedOperation = async () => {
        avPlayer!!.setSuperResolution(true).catch((error: Error) => {
          console.error(`setSuperResolution failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
        avPlayer!!.setVideoWindowSize(1080, 720).catch((error: Error) => {
          console.error(`setVideoWindowSize failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_SUPER_RESOLUTION_NOT_ENABLED).assertTrue()
        })
      }

      let stoppedOperation = async () => {
        await resetAndCallbackOff();
        done();
      }

      await testPostProcessor(fileDescriptor, initializedOperation, preparedOperation, playedOperation, stoppedOperation, undefined, done);
    });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_static_0300
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_static_0300
     * @tc.desc   test super resolution invalid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SUPER_RESOLUTION_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      let initializedOperation = async () => {
        let playbackStrategy: media.PlaybackStrategy = { enableSuperResolution : true, mutedMediaType: media.MediaType.MEDIA_TYPE_AUD };
        avPlayer!!.setPlaybackStrategy(playbackStrategy).catch((error: Error) => {
          console.error(`setPlaybackStrategy failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect().assertFail();
        })
        await mediaTestBase.msleepAsync(200);
        avPlayer!!.setVideoWindowSize(100, 100).catch((error: Error) => {
          console.error(`setVideoWindowSize failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_INVALID_PARAMETER).assertTrue()
        })
        avPlayer!!.setVideoWindowSize(10000, 10000).catch((error: Error) => {
          console.error(`setVideoWindowSize failed, err code ${(error as BusinessError).code} msg ${error.message}`)
          expect((error as BusinessError).code == media.AVErrorCode.AVERR_INVALID_PARAMETER).assertTrue()
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