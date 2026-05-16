/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../hypium/index';
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@ohos.base';
import fileio from '@ohos.file.fs'
import { globalThis } from './Util.test';

const TAG = 'xts.AVPlayerGetLoadedTimeRangesTest';
const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';
let avPlayer: media.AVPlayer | undefined;

async function getFdRead(pathName: string): Promise<int> {
  let fdReturn: int = 0;
  let testContext: common.UIAbilityContext = globalThis.getContext() as common.UIAbilityContext;
  const path = testContext.filesDir + "/" + pathName;
  console.log(TAG,"pathName is " + path)
  await fileio.open(path).then(async (fdNumber: fileio.File) => {
    fdReturn = fdNumber.fd;
    console.info(TAG,'[fileio]case open fd success, fd is ' + fdReturn);
  })
  return fdReturn;
}

async function closeFdNumber(fdNumber: int) {
  await fileio.close(fdNumber);
}

async function setStateChangeCb(avPlayer: media.AVPlayer | undefined, done: () => void, testName: string, funcs: Record<string, () => Promise<void>>) {
  let surfaceID: string = globalThis.value;
  avPlayer?.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
    if (funcs[state] != undefined) {
      funcs[state]!();
    }
    switch (state) {
      case INITIALIZED:
        if (!avPlayer) {
          console.info(TAG, testName + ` avPlayer is null`);
          break;
        }
        console.info(TAG, testName + ` case INITIALIZED`);
        avPlayer!.surfaceId = surfaceID;
        avPlayer?.prepare((err) => {
          console.info(TAG, testName + ' case prepare called ' + JSON.stringify(err));
        });
        break;
      case PREPARED:
        if (!avPlayer) {
          console.info(TAG, testName + ` avPlayer is null`);
          break;
        }
        console.info(TAG, testName + ` case PREPARED`);
        avPlayer?.play()
        break;
      case RELEASED:
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release()
        break;
      default:
        break;
    }
  })
}

export default function AVPlayerGetLoadedTimeRangesTest() {
  describe('AVPlayerGetLoadedTimeRangesTest', () => {
    let fdNumber: int = -1;
    let fileName = "H264_AAC.mp4";
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      fdNumber = await getFdRead(fileName);
    });
    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });
    afterEach(async () => {
      console.info(TAG, 'afterEach case');
    });
    afterAll(async () => {
      console.info(TAG, 'afterAll case');
      await closeFdNumber(fdNumber);
    });
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0100
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0100
     * @tc.desc   AVPlayer_getLoadedTimeRanges
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0100';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PREPARED] = async () => {
        await avPlayer!.getLoadedTimeRanges().then(async (timeRanges: Array<media.Range>) => {
          console.info(TAG, testName + ` getLoadedTimeRanges success: ` + JSON.stringify(timeRanges));
          expect(timeRanges.length == 1).assertTrue();
          expect(timeRanges[0].min == 0).assertTrue();
          expect(timeRanges[0].max == avPlayer?.duration).assertTrue();
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` getLoadedTimeRanges failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer?.release();
        });
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0200
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0200
     * @tc.desc   AVPlayer_getLoadedTimeRanges
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0200';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      await avPlayer!.getLoadedTimeRanges().then(async (timeRanges: Array<media.Range>) => {
        console.info(TAG, testName + ` getLoadedTimeRanges success: ` + JSON.stringify(timeRanges));
        expect(timeRanges.length == 0).assertTrue();
        await avPlayer!.release();
      }).catch((error: Error) => {
        console.info(TAG, testName + ` getLoadedTimeRanges failed: ` + JSON.stringify(error));
        expect().assertFail();
        avPlayer?.release();
      });
      done();
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0300
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0300
     * @tc.desc   AVPlayer_getLoadedTimeRanges
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0300';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      avPlayer?.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
        switch (state) {
          case INITIALIZED:
            avPlayer!.getLoadedTimeRanges().then(async (timeRanges: Array<media.Range>) => {
              console.info(TAG, testName + ` getLoadedTimeRanges success: ` + JSON.stringify(timeRanges));
              expect(timeRanges.length == 0).assertTrue();
              await avPlayer!.release();
              done();
            }).catch((error: Error) => {
              console.info(TAG, testName + ` getLoadedTimeRanges failed: ` + JSON.stringify(error));
              expect().assertFail();
              avPlayer!.release();
              done();
            });
            break;
          default:
            break;
        }
      })
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0400
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0400
     * @tc.desc   AVPlayer_getLoadedTimeRanges
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0400';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PLAYING] = async () => {
        await avPlayer!.getLoadedTimeRanges().then(async (timeRanges: Array<media.Range>) => {
          console.info(TAG, testName + ` getLoadedTimeRanges success: ` + JSON.stringify(timeRanges));
          expect(timeRanges.length == 1).assertTrue();
          expect(timeRanges[0].min == 0).assertTrue();
          expect(timeRanges[0].max == avPlayer!.duration).assertTrue();
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` getLoadedTimeRanges failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer!.release();
        });
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0500
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0500
     * @tc.desc   AVPlayer_getLoadedTimeRanges
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0500';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PAUSED] = async () => {
        await avPlayer!.getLoadedTimeRanges().then(async (timeRanges: Array<media.Range>) => {
          console.info(TAG, testName + ` getLoadedTimeRanges success: ` + JSON.stringify(timeRanges));
          expect(timeRanges.length == 1).assertTrue();
          expect(timeRanges[0].min == 0).assertTrue();
          expect(timeRanges[0].max == avPlayer!.duration).assertTrue();
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` getLoadedTimeRanges failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer!.release();
        });
      }
      stateChangeFuncs[PLAYING] = async () => {
        avPlayer!.pause();
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0600
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0600
     * @tc.desc   AVPlayer_getLoadedTimeRanges
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0600';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      let duration = 0;
      stateChangeFuncs[STOPPED] = async () => {
        await avPlayer!.getLoadedTimeRanges().then(async (timeRanges: Array<media.Range>) => {
          console.info(TAG, testName + ` getLoadedTimeRanges success: ` + JSON.stringify(timeRanges));
          expect(timeRanges.length == 0).assertTrue();
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` getLoadedTimeRanges failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer!.release();
        });
      }
      stateChangeFuncs[PLAYING] = async () => {
        duration = avPlayer!.duration;
        avPlayer!.stop();
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0700
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0700
     * @tc.desc   AVPlayer_getLoadedTimeRanges
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0700';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[COMPLETED] = async () => {
        await avPlayer!.getLoadedTimeRanges().then(async (timeRanges: Array<media.Range>) => {
          console.info(TAG, testName + ` getLoadedTimeRanges success: ` + JSON.stringify(timeRanges));
          expect(timeRanges.length == 1).assertTrue();
          expect(timeRanges[0].min == 0).assertTrue();
          expect(timeRanges[0].max == avPlayer!.duration).assertTrue();
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` getLoadedTimeRanges failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer!.release();
        });
      }
      stateChangeFuncs[PLAYING] = async () => {
        avPlayer!.seek(avPlayer!.duration);
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0800
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0800
     * @tc.desc   AVPlayer_getLoadedTimeRanges
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_GETLOADEDTIMERANGES_STATIC_0800';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[RELEASED] = async () => {
        await avPlayer!.getLoadedTimeRanges().then(async (timeRanges: Array<media.Range>) => {
          console.info(TAG, testName + ` getLoadedTimeRanges success: ` + JSON.stringify(timeRanges));
          expect(timeRanges.length == 0).assertTrue();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` getLoadedTimeRanges failed: ` + JSON.stringify(error));
          expect().assertFail();
        });
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      await avPlayer!.release();
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
  })
}