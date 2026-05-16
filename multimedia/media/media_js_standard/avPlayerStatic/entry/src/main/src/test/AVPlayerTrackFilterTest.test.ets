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

const TAG = 'xts.AVPlayerTrackFilterTest';
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
  await fileio.open(path).then((fdNumber) => {
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

function assertArrayEqual(arr1: string[], arr2: string[]): boolean {
  if (arr1.length !== arr2.length) {
    return false;
  }
  for (let i = 0; i < arr1.length; i++) {
    if (arr1[i] !== arr2[i]) {
      return false;
    }
  }
  return true;
}

function assertNullTrackSelectionFilter(filter: media.TrackSelectionFilter): boolean {
  if (filter.maxVideoBitrate == undefined &&
    filter.minVideoBitrate == undefined &&
    filter.maxVideoFrameRate == undefined &&
    filter.minVideoFrameRate == undefined &&
    filter.maxAudioBitrate == undefined &&
    filter.minAudioBitrate == undefined &&
    filter.maxAudioChannels == undefined &&
    filter.maxVideoResolution == undefined &&
    filter.minVideoResolution == undefined &&
    filter.preferredVideoMimeTypes == undefined &&
    filter.preferredAudioMimeTypes == undefined &&
    filter.preferredAudioLanguages == undefined &&
    filter.preferredSubtitleLanguages == undefined
  ) {
    return true;
  }
  return false;
}

export default function AVPlayerTrackFilterTest() {
  describe('AVPlayerTrackFilterTest', () => {
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
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_GETTRACKSELECTIONFILTER_STATIC_0100
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_GETTRACKSELECTIONFILTER_STATIC_0100
     * @tc.desc   AVPlayer_getTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_GETTRACKSELECTIONFILTER_STATIC_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_GETTRACKSELECTIONFILTER_STATIC_0100';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      avPlayer?.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
        switch (state) {
          case INITIALIZED:
            avPlayer!.getTrackSelectionFilter().then(async (filter: media.TrackSelectionFilter) => {
              console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
              expect(assertNullTrackSelectionFilter(filter)).assertTrue();
              await avPlayer!.release();
              done();
            }).catch((error: Error) => {
              console.info(TAG, testName + ` getTrackSelectionFilter failed: ` + JSON.stringify(error));
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
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_GETTRACKSELECTIONFILTER_STATIC_0200
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_GETTRACKSELECTIONFILTER_STATIC_0200
     * @tc.desc   AVPlayer_getTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_GETTRACKSELECTIONFILTER_STATIC_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_GETTRACKSELECTIONFILTER_STATIC_0200';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[RELEASED] = async () => {
        await avPlayer!.getTrackSelectionFilter().then((filter: media.TrackSelectionFilter) => {
          console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
          expect().assertFail();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` getTrackSelectionFilter failed: ` + JSON.stringify(error));
          expect((error as BusinessError).code == 5400102).assertTrue();
        });
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      await avPlayer!.release();
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0100
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0100
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0100';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      avPlayer?.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
        switch (state) {
          case INITIALIZED:
            let filterConfig: media.TrackSelectionFilter = {
              maxVideoBitrate: 2097152,
              minVideoBitrate: 1048576,
            }
            avPlayer!.setTrackSelectionFilter(filterConfig).then(async () => {
              let filter = await avPlayer!.getTrackSelectionFilter();
              console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
              expect(filter.maxVideoBitrate == 2097152).assertTrue();
              expect(filter.minVideoBitrate == 1048576).assertTrue();
              await avPlayer!.release();
              done();
            }).catch((error: Error) => {
              console.info(TAG, testName + ` setTrackSelectionFilter failed: ` + JSON.stringify(error));
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
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0200
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0200
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0200';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PREPARED] = async () => {
        let filterConfig: media.TrackSelectionFilter = {
          maxVideoFrameRate: 60,
          minVideoFrameRate: 30,
        }
        await avPlayer!.setTrackSelectionFilter(filterConfig).then(async () => {
          let filter = await avPlayer!.getTrackSelectionFilter();
          console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
          expect(filter.maxVideoFrameRate == 60).assertTrue();
          expect(filter.minVideoFrameRate == 30).assertTrue();
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` setTrackSelectionFilter failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer!.release();
        });
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0300
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0300
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0300';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PLAYING] = async () => {
        let filterConfig: media.TrackSelectionFilter = {
          maxVideoResolution: { width: 720, height: 480 },
          minVideoResolution: { width: 320, height: 240 },
        }
        await avPlayer!.setTrackSelectionFilter(filterConfig).then(async () => {
          let filter = await avPlayer!.getTrackSelectionFilter();
          console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
          expect(filter.maxVideoResolution?.width).assertEqual(720);
          expect(filter.maxVideoResolution?.height).assertEqual(480);
          expect(filter.minVideoResolution?.width).assertEqual(320);
          expect(filter.minVideoResolution?.height).assertEqual(240);
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` setTrackSelectionFilter failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer!.release();
        });
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0400
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0400
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0400';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PAUSED] = async () => {
        let filterConfig: media.TrackSelectionFilter = {
          preferredVideoMimeTypes: ['video/avc', 'video/h263'],
          preferredAudioMimeTypes: ['audio/aac', 'audio/vorbis'],
        }
        await avPlayer!.setTrackSelectionFilter(filterConfig).then(async () => {
          let filter = await avPlayer!.getTrackSelectionFilter();
          console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
          expect(filter.preferredVideoMimeTypes?.length == 2).assertTrue();
          expect(filter.preferredAudioMimeTypes?.length == 2).assertTrue();
          expect(assertArrayEqual(filter.preferredVideoMimeTypes!, filterConfig.preferredVideoMimeTypes!)).assertTrue();
          expect(assertArrayEqual(filter.preferredAudioMimeTypes!, filterConfig.preferredAudioMimeTypes!)).assertTrue();
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` setTrackSelectionFilter failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer!.release();
        });
      }
      stateChangeFuncs[PLAYING] = async () => {
        await avPlayer!.pause();
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0500
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0500
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0500';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[STOPPED] = async () => {
        let filterConfig: media.TrackSelectionFilter = {
          maxAudioBitrate: 98304,
          minAudioBitrate: 49152,
        }
        await avPlayer!.setTrackSelectionFilter(filterConfig).then(async () => {
          let filter = await avPlayer!.getTrackSelectionFilter();
          console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
          expect(filter.maxAudioBitrate).assertEqual(98304);
          expect(filter.minAudioBitrate).assertEqual(49152);
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` setTrackSelectionFilter failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer!.release();
        });
      }
      stateChangeFuncs[PLAYING] = async () => {
        await avPlayer!.stop();
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0600
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0600
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0600';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[COMPLETED] = async () => {
        let filterConfig: media.TrackSelectionFilter = {
          maxAudioChannels: 4,
        }
        await avPlayer!.setTrackSelectionFilter(filterConfig).then(async () => {
          let filter = await avPlayer!.getTrackSelectionFilter();
          console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
          expect(filter.maxAudioChannels).assertEqual(4);
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` setTrackSelectionFilter failed: ` + JSON.stringify(error));
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
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0700
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0700
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0700';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PLAYING] = async () => {
        let filterConfig: media.TrackSelectionFilter = {
          preferredAudioLanguages: ['ung', 'eng', 'chi'],
          preferredSubtitleLanguages: ['ung', 'eng', 'chi'],
        }
        await avPlayer!.setTrackSelectionFilter(filterConfig).then(async () => {
          let filter = await avPlayer!.getTrackSelectionFilter();
          console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
          expect(filter.preferredAudioLanguages?.length == 3).assertTrue();
          expect(filter.preferredSubtitleLanguages?.length == 3).assertTrue();
          expect(assertArrayEqual(filter.preferredAudioLanguages!, filterConfig.preferredAudioLanguages!)).assertTrue();
          expect(assertArrayEqual(filter.preferredSubtitleLanguages!, filterConfig.preferredSubtitleLanguages!)).assertTrue();
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` setTrackSelectionFilter failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer!.release();
        });
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0800
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0800
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0800';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PLAYING] = async () => {
        let filterConfig: media.TrackSelectionFilter = {
          maxVideoBitrate: 2097152,
          minVideoBitrate: 1048576,
          maxVideoFrameRate: 60,
          minVideoFrameRate: 30,
          maxAudioBitrate: 98304,
          minAudioBitrate: 49152,
          maxAudioChannels: 4,
          maxVideoResolution: { width: 720, height: 480 },
          minVideoResolution: { width: 320, height: 240 },
          preferredVideoMimeTypes: ['video/avc', 'video/h263'],
          preferredAudioMimeTypes: ['audio/aac', 'audio/vorbis'],
          preferredAudioLanguages: ['ung', 'eng', 'chi'],
          preferredSubtitleLanguages: ['ung', 'eng', 'chi'],
        }
        await avPlayer!.setTrackSelectionFilter(filterConfig).then(async () => {
          let filter = await avPlayer!.getTrackSelectionFilter();
          console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
          expect(filter.maxVideoBitrate).assertEqual(2097152);
          expect(filter.minVideoBitrate).assertEqual(1048576);
          expect(filter.maxVideoFrameRate).assertEqual(60);
          expect(filter.minVideoFrameRate).assertEqual(30);
          expect(filter.maxAudioBitrate).assertEqual(98304);
          expect(filter.minAudioBitrate).assertEqual(49152);
          expect(filter.maxAudioChannels).assertEqual(4);
          expect(filter.maxVideoResolution?.width).assertEqual(720);
          expect(filter.maxVideoResolution?.height).assertEqual(480);
          expect(filter.minVideoResolution?.width).assertEqual(320);
          expect(filter.minVideoResolution?.height).assertEqual(240);
          expect(assertArrayEqual(filter.preferredVideoMimeTypes!, filterConfig.preferredVideoMimeTypes!)).assertTrue();
          expect(assertArrayEqual(filter.preferredAudioMimeTypes!, filterConfig.preferredAudioMimeTypes!)).assertTrue();
          expect(assertArrayEqual(filter.preferredAudioLanguages!, filterConfig.preferredAudioLanguages!)).assertTrue();
          expect(assertArrayEqual(filter.preferredSubtitleLanguages!, filterConfig.preferredSubtitleLanguages!)).assertTrue();
          await avPlayer!.release();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` setTrackSelectionFilter failed: ` + JSON.stringify(error));
          expect().assertFail();
          avPlayer!.release();
        });
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0900
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0900
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_0900';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PLAYING] = async () => {
        let filterConfig: media.TrackSelectionFilter = {
          maxVideoBitrate: 2097152,
          minVideoBitrate: 1048576,
          maxVideoFrameRate: 60,
          minVideoFrameRate: 30,
          maxAudioBitrate: 98304,
          minAudioBitrate: 49152,
          maxAudioChannels: 4,
          maxVideoResolution: { width: 720, height: 480 },
          minVideoResolution: { width: 320, height: 240 },
          preferredVideoMimeTypes: ['video/avc', 'video/h263'],
          preferredAudioMimeTypes: ['audio/aac', 'audio/vorbis'],
          preferredAudioLanguages: ['ung', 'eng', 'chi'],
          preferredSubtitleLanguages: ['ung', 'eng', 'chi'],
        }
        await avPlayer!.setTrackSelectionFilter(filterConfig);
        let filter = await avPlayer!.getTrackSelectionFilter();
        console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
        expect(filter.maxVideoBitrate).assertEqual(2097152);
        expect(filter.minVideoBitrate).assertEqual(1048576);
        expect(filter.maxVideoFrameRate).assertEqual(60);
        expect(filter.minVideoFrameRate).assertEqual(30);
        expect(filter.maxAudioBitrate).assertEqual(98304);
        expect(filter.minAudioBitrate).assertEqual(49152);
        expect(filter.maxAudioChannels).assertEqual(4);
        expect(filter.maxVideoResolution?.width).assertEqual(720);
        expect(filter.maxVideoResolution?.height).assertEqual(480);
        expect(filter.minVideoResolution?.width).assertEqual(320);
        expect(filter.minVideoResolution?.height).assertEqual(240);
        expect(assertArrayEqual(filter.preferredVideoMimeTypes!, filterConfig.preferredVideoMimeTypes!)).assertTrue();
        expect(assertArrayEqual(filter.preferredAudioMimeTypes!, filterConfig.preferredAudioMimeTypes!)).assertTrue();
        expect(assertArrayEqual(filter.preferredAudioLanguages!, filterConfig.preferredAudioLanguages!)).assertTrue();
        expect(assertArrayEqual(filter.preferredSubtitleLanguages!, filterConfig.preferredSubtitleLanguages!)).assertTrue();
        await avPlayer!.setTrackSelectionFilter({});
        let filter1 = await avPlayer!.getTrackSelectionFilter();
        console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter1));
        expect(assertNullTrackSelectionFilter(filter1)).assertTrue();
        await avPlayer!.release();
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1000
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1000
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1000';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PLAYING] = async () => {
        let filterConfig: media.TrackSelectionFilter = {
          maxVideoBitrate: 2097152,
          minVideoBitrate: 1048576,
          maxVideoFrameRate: 60,
          minVideoFrameRate: 30,
          maxAudioBitrate: 98304,
          minAudioBitrate: 49152,
          maxAudioChannels: 4,
          maxVideoResolution: { width: 720, height: 480 },
          minVideoResolution: { width: 320, height: 240 },
          preferredVideoMimeTypes: ['video/avc', 'video/h263'],
          preferredAudioMimeTypes: ['audio/aac', 'audio/vorbis'],
          preferredAudioLanguages: ['ung', 'eng', 'chi'],
          preferredSubtitleLanguages: ['ung', 'eng', 'chi'],
        }
        let filterConfig1: media.TrackSelectionFilter = {
          maxVideoBitrate: 0,
          minVideoBitrate: -1,
          maxVideoFrameRate: 0,
          minVideoFrameRate: -1,
          maxAudioBitrate: 0,
          minAudioBitrate: -1,
          maxAudioChannels: -1,
          maxVideoResolution: { width: 0, height: 0 },
          minVideoResolution: { width: -1, height: -1 },
          preferredVideoMimeTypes: ['codec1', 'codectest2'],
          preferredAudioMimeTypes: ['codec3', 'codec4'],
          preferredAudioLanguages: ['lan1', 'lan2'],
          preferredSubtitleLanguages: ['lan1', 'lan2'],
        }
        await avPlayer!.setTrackSelectionFilter(filterConfig1);
        await avPlayer!.setTrackSelectionFilter(filterConfig);
        let filter = await avPlayer!.getTrackSelectionFilter();
        console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
        expect(filter.maxVideoBitrate).assertEqual(2097152);
        expect(filter.minVideoBitrate).assertEqual(1048576);
        expect(filter.maxVideoFrameRate).assertEqual(60);
        expect(filter.minVideoFrameRate).assertEqual(30);
        expect(filter.maxAudioBitrate).assertEqual(98304);
        expect(filter.minAudioBitrate).assertEqual(49152);
        expect(filter.maxAudioChannels).assertEqual(4);
        expect(filter.maxVideoResolution?.width).assertEqual(720);
        expect(filter.maxVideoResolution?.height).assertEqual(480);
        expect(filter.minVideoResolution?.width).assertEqual(320);
        expect(filter.minVideoResolution?.height).assertEqual(240);
        expect(assertArrayEqual(filter.preferredVideoMimeTypes!, filterConfig.preferredVideoMimeTypes!)).assertTrue();
        expect(assertArrayEqual(filter.preferredAudioMimeTypes!, filterConfig.preferredAudioMimeTypes!)).assertTrue();
        expect(assertArrayEqual(filter.preferredAudioLanguages!, filterConfig.preferredAudioLanguages!)).assertTrue();
        expect(assertArrayEqual(filter.preferredSubtitleLanguages!, filterConfig.preferredSubtitleLanguages!)).assertTrue();
        await avPlayer!.release();
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1100
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1100
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1100';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[PLAYING] = async () => {
        let filterConfig: media.TrackSelectionFilter = {
          maxVideoBitrate: 2097152,
          minVideoBitrate: 1048576,
          maxVideoFrameRate: 60,
          minVideoFrameRate: 30,
          maxAudioBitrate: 98304,
          minAudioBitrate: 49152,
          maxAudioChannels: 4,
          maxVideoResolution: { width: 720, height: 480 },
          minVideoResolution: { width: 320, height: 240 },
          preferredVideoMimeTypes: ['video/avc', 'video/h263'],
          preferredAudioMimeTypes: ['audio/aac', 'audio/vorbis'],
          preferredAudioLanguages: ['ung', 'eng', 'chi'],
          preferredSubtitleLanguages: ['ung', 'eng', 'chi'],
        }
        let filterConfig1: media.TrackSelectionFilter = {
          maxVideoBitrate:0,
          minVideoBitrate:-1,
          maxVideoFrameRate:90,
          minVideoFrameRate:60, 
        }
        await avPlayer!.setTrackSelectionFilter(filterConfig1);
        await avPlayer!.setTrackSelectionFilter(filterConfig);
        let filter = await avPlayer!.getTrackSelectionFilter();
        console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
        expect(filter.maxVideoBitrate).assertEqual(2097152);
        expect(filter.minVideoBitrate).assertEqual(1048576);
        expect(filter.maxVideoFrameRate).assertEqual(60);
        expect(filter.minVideoFrameRate).assertEqual(30);
        expect(filter.maxAudioBitrate).assertEqual(98304);
        expect(filter.minAudioBitrate).assertEqual(49152);
        expect(filter.maxAudioChannels).assertEqual(4);
        expect(filter.maxVideoResolution!.width).assertEqual(720);
        expect(filter.maxVideoResolution!.height).assertEqual(480);
        expect(filter.minVideoResolution!.width).assertEqual(320);
        expect(filter.minVideoResolution!.height).assertEqual(240);
        expect(assertArrayEqual(filter.preferredVideoMimeTypes!, filterConfig.preferredVideoMimeTypes!)).assertTrue();
        expect(assertArrayEqual(filter.preferredAudioMimeTypes!, filterConfig.preferredAudioMimeTypes!)).assertTrue();
        expect(assertArrayEqual(filter.preferredAudioLanguages!, filterConfig.preferredAudioLanguages!)).assertTrue();
        expect(assertArrayEqual(filter.preferredSubtitleLanguages!, filterConfig.preferredSubtitleLanguages!)).assertTrue();
        await avPlayer!.release();
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      avPlayer!.fdSrc = { fd: fdNumber } as media.AVFileDescriptor;
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1200
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1200
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1200';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let stateChangeFuncs: Record<string, () => Promise<void>> = {};
      stateChangeFuncs[RELEASED] = async () => {
        await avPlayer!.setTrackSelectionFilter({}).then(async () => {
          expect().assertFail();
        }).catch((error: Error) => {
          console.info(TAG, testName + ` getTrackSelectionFilter failed: ` + JSON.stringify(error));
          expect((error as BusinessError).code == 5400102).assertTrue();
        });
      }
      await setStateChangeCb(avPlayer, done, testName, stateChangeFuncs);
      await avPlayer!.release();
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1300
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1300
     * @tc.desc   AVPlayer_setTrackSelectionFilter
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_AVPLAYER_SETTRACKSELECTIONFILTER_STATIC_1300';
      avPlayer = await media.createAVPlayer();
      console.info(TAG, testName, "AVPlayer created successfully");
      let filterConfig: media.TrackSelectionFilter = {
        maxAudioBitrate: 98304,
        minAudioBitrate: 49152,
      }
      await avPlayer!.setTrackSelectionFilter(filterConfig).then(async () => {
        let filter = await avPlayer!.getTrackSelectionFilter();
        console.info(TAG, testName + ` getTrackSelectionFilter success: ` + JSON.stringify(filter));
        expect(filter.maxAudioBitrate).assertEqual(98304);
        expect(filter.minAudioBitrate).assertEqual(49152);
        await avPlayer!.release();
      }).catch((error: Error) => {
        console.info(TAG, testName + ` setTrackSelectionFilter failed: ` + JSON.stringify(error));
        expect().assertFail();
        avPlayer?.release();
      });
      console.info(TAG, testName, "AVPlayer fdSrc set successfully");
      done();
    })
  })
}