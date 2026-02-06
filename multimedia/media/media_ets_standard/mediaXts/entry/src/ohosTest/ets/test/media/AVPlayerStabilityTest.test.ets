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
import {
  avPlayerPlay,
  createTimeWithoutCallback,
  firstFrameTime,
  getTrackDescriptionTimeWithCallback,
  getTrackDescriptionTimeWithoutCallback,
  offCallback,
  pauseTimeWithCallback,
  pauseTimeWithoutCallback,
  PlayTest,
  playTimeWithCallback,
  prepareTimeWithCallback,
  releaseTimeWithCallback,
  releaseTimeWithoutCallback,
  resetTimeWithCallback,
  resetTimeWithoutCallback,
  seekLoop,
  seekLoopWithoutCallback,
  setBitrateTimeWithoutCallback,
  setSpeedTimeWithCallback,
  setVolumeTimeWithCallback,
  stopTimeWithCallback,
  stopTimeWithoutCallback,
  testAVPlayerFun,
  testAVPlayerSeek
} from './AVPlayerTestBase';
import media from '@ohos.multimedia.media';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import { LOG_TAG, PLAY_TIME, SLEEP_TIME_20, SLEEP_TIME_500, VIDEO_SOURCES } from '../Constants';
import { fileIo as fs } from '@kit.CoreFileKit';

const TAG = LOG_TAG + "AVPlayerStabilityTest";

async function getStageFdRead(pathName: string) {
  pathName = globalThis.abilityContext.filesDir + '/' + pathName;
  console.log(TAG, 'pathName is ' + pathName);
  let file = await fs.open(pathName);
  console.info(TAG, '[fileio]case open fd success, fd is ' + file.fd);
  return file;
}

function openFileFailed() {
  console.info(TAG, 'openFileFailed case file fail');
}

export default function AVPlayerStabilityTest() {

  let avPlayer: media.AVPlayer | null = null;
  let fdNumbers: number[] = [];
  let mediaTestBase = new MediaTestBase();
  let fileDescriptor: media.AVFileDescriptor;

  describe('AVPlayerStabilityTest', () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      for (let i = 0; i < 10; i++) {
        if (!globalThis.value) {
          console.info(TAG, 'surfaceId is undefined');
          await mediaTestBase.msleepAsync(SLEEP_TIME_500);
        } else {
          console.info(TAG, 'surfaceId is ' + globalThis.value);
          break;
        }
      }
      await mediaTestBase.msleepAsync(SLEEP_TIME_20);
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
      await mediaTestBase.msleepAsync(SLEEP_TIME_500);
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach start');
      if (avPlayer != null) {
        avPlayer.off('stateChange');
        console.info(TAG, 'afterEach case off stateChange-listen');
        await avPlayer.release().then(() => {
        console.info(TAG, 'afterEach case release succeed.');
        }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback);
      }
      console.info(TAG, 'afterEach case release end');
      await mediaTestBase.closeFdNumber(fdNumbers[0]);
      fdNumbers = [];
      console.info(TAG, 'afterEach end');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
    });

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_001
     * @tc.name      : avplayer_func_promise_001
     * @tc.desc      : Local Video play source (H264_AAC)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level0
     */
    it('avplayer_func_promise_001', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      await avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_002
     * @tc.name      : avplayer_func_promise_002
     * @tc.desc      : Local Video play source (H263_AAC)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_002', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_002';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[1], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_003
     * @tc.name      : avplayer_func_promise_003
     * @tc.desc      : Local Video play source (H263_MP3)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_003', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_003';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[2], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_004
     * @tc.name      : avplayer_func_promise_004
     * @tc.desc      : Local Video play source (MPEG2_AAC)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_004', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_004';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[3], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_005
     * @tc.name      : avplayer_func_promise_005
     * @tc.desc      : Local Video play source (MPEG2_MP3)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_005', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_005';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[4], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_006
     * @tc.name      : avplayer_func_promise_006
     * @tc.desc      : Local Video play source (MPEG2_MP3)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_006', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_006';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[5], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_007
     * @tc.name      : avplayer_func_promise_007
     * @tc.desc      : Local Video play source (h263.mov)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_007', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_007';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[6], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_008
     * @tc.name      : avplayer_func_promise_008
     * @tc.desc      : Local Video play source (mpeg2.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_008', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_008';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[7], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_009
     * @tc.name      : avplayer_func_promise_009
     * @tc.desc      : Local Video play source (h264_aac.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_009', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_009';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[8], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_010
     * @tc.name      : avplayer_func_promise_010
     * @tc.desc      : Local Video play source (h264_mp3.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_010', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_010';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[9], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_011
     * @tc.name      : avplayer_func_promise_011
     * @tc.desc      : Local Video play source (h263_aac.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_011', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_011';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[10], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_012
     * @tc.name      : avplayer_func_promise_012
     * @tc.desc      : Local Video play source (h263_mp3.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_012', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_012';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[11], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })


    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_013
     * @tc.name      : avplayer_func_promise_013
     * @tc.desc      : Local Video play source (mpeg2_aac.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_013', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_013';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[12], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_014
     * @tc.name      : avplayer_func_promise_014
     * @tc.desc      : Local Video play source (mpeg2_mp3.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_014', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_014';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[13], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_015
     * @tc.name      : avplayer_func_promise_015
     * @tc.desc      : Local Video play source (mpeg4_aac.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_015', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_015';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[14], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_016
     * @tc.name      : avplayer_func_promise_016
     * @tc.desc      : Local Video play source (mpeg4_mp3.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_016', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_016';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[15], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_018
     * @tc.name      : avplayer_func_promise_018
     * @tc.desc      : Local Video play source (h263.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_018', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_018';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[17], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_019
     * @tc.name      : avplayer_func_promise_019
     * @tc.desc      : Local Video play source (mpeg2.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_019', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_019';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[18], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_020
     * @tc.name      : avplayer_func_promise_020
     * @tc.desc      : Local Video play source (mpeg4.ts)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_020', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_020';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[19], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_021
     * @tc.name      : avplayer_func_promise_021
     * @tc.desc      : Local Video play source (H264_AAC.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_021', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_021';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[20], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_022
     * @tc.name      : avplayer_func_promise_022
     * @tc.desc      : Local Video play source (H264_MP3.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_022', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_022';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[21], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_023
     * @tc.name      : avplayer_func_promise_023
     * @tc.desc      : Local Video play source (H263_AAC.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_023', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_023';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[22], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_024
     * @tc.name      : avplayer_func_promise_024
     * @tc.desc      : Local Video play source (H263_MP3.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_024', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_024';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[23], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_025
     * @tc.name      : avplayer_func_promise_025
     * @tc.desc      : Local Video play source (MPEG2_AAC.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_025', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_025';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[24], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_026
     * @tc.name      : avplayer_func_promise_026
     * @tc.desc      : Local Video play source (mpeg2_mp3.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_026', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_026';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[25], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_027
     * @tc.name      : avplayer_func_promise_027
     * @tc.desc      : Local Video play source (mpeg4_aac.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_027', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_027';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[26], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_028
     * @tc.name      : avplayer_func_promise_028
     * @tc.desc      : Local Video play source (MPEG4_MP3.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_028', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_028';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[27], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_029
     * @tc.name      : avplayer_func_promise_029
     * @tc.desc      : Local Video play source (h264.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_029', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_029';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[28], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_030
     * @tc.name      : avplayer_func_promise_030
     * @tc.desc      : Local Video play source (h263.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_030', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_030';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[29], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_031
     * @tc.name      : avplayer_func_promise_031
     * @tc.desc      : Local Video play source (MPEG2.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_031', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_031';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[30], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_032
     * @tc.name      : avplayer_func_promise_032
     * @tc.desc      : Local Video play source (mpeg4.mkv)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_032', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_032';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[31], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_033
     * @tc.name      : avplayer_func_promise_033
     * @tc.desc      : Local Video play source (aac_audio.aac)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_033', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_033';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[32], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_034
     * @tc.name      : avplayer_func_promise_034
     * @tc.desc      : Local Video play source (MP3_AUDIO.mp3)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_034', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_034';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[33], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_035
     * @tc.name      : avplayer_func_promise_035
     * @tc.desc      : Local Video play source (m4a_audio.m4a)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_035', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_035';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[34], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_036
     * @tc.name      : avplayer_func_promise_036
     * @tc.desc      : Local Video play source (ogg_audio.ogg)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_036', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_036';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[35], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_037
     * @tc.name      : avplayer_func_promise_037
     * @tc.desc      : Local Video play source (wav_audio.wav)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_037', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_037';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[36], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_038
     * @tc.name      : avplayer_func_promise_038
     * @tc.desc      : Local Video play source (flac_audio.flac)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_038', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_038';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[37], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_039
     * @tc.name      : avplayer_func_promise_039
     * @tc.desc      : Local Video play short source
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level2
     */
    it('avplayer_func_promise_039', Level.LEVEL2, async (done: Function) => {
      const testName = 'avplayer_func_promise_039';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[38], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      avPlayerPlay(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_040
     * @tc.name      : seek_avplayer_001
     * @tc.desc      : Local Video play->seek (1000 times)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('seek_avplayer_001', Level.LEVEL3, async (done: Function) => {
      const testName = 'seek_avplayer_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      seekLoop(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_041
     * @tc.name      : seek_avplayer_002
     * @tc.desc      : Local Video play->seek (1000 times)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('seek_avplayer_002', Level.LEVEL3, async (done: Function) => {
      const testName = 'seek_avplayer_002';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      seekLoopWithoutCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_042
     * @tc.name      : create_avplayer_time_001
     * @tc.desc      : Local Video test create time (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('create_avplayer_time_001', Level.LEVEL3, async (done: Function) => {
      const testName = 'create_avplayer_time_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      createTimeWithoutCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_043
     * @tc.name      : prepare_avplayer_time_001
     * @tc.desc      : Local Video test prepare time (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('prepare_avplayer_time_001', Level.LEVEL3, async (done: Function) => {
      const testName = 'prepare_avplayer_time_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      prepareTimeWithCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_044
     * @tc.name      : play_avplayer_time_001
     * @tc.desc      : Local Video test play time (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('play_avplayer_time_001', Level.LEVEL3, async (done: Function) => {
      const testName = 'play_avplayer_time_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      playTimeWithCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_045
     * @tc.name      : pause_avplayer_time_001
     * @tc.desc      : Local Video test pause time (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('pause_avplayer_time_001', Level.LEVEL3, async (done: Function) => {
      const testName = 'pause_avplayer_time_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      pauseTimeWithCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_046
     * @tc.name      : pause_avplayer_time_002
     * @tc.desc      : Local Video pause prepare time (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('pause_avplayer_time_002', Level.LEVEL3, async (done: Function) => {
      const testName = 'pause_avplayer_time_002';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      pauseTimeWithoutCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_047
     * @tc.name      : stop_avplayer_time_001
     * @tc.desc      : Local Video test stop time (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('stop_avplayer_time_001', Level.LEVEL3, async (done: Function) => {
      const testName = 'stop_avplayer_time_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      stopTimeWithCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_048
     * @tc.name      : stop_avplayer_time_002
     * @tc.desc      : Local Video stop prepare time (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('stop_avplayer_time_002', Level.LEVEL3, async (done: Function) => {
      const testName = 'stop_avplayer_time_002';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      stopTimeWithoutCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_049
     * @tc.name      : reset_avplayer_time_001
     * @tc.desc      : Local Video test reset time (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('reset_avplayer_time_001', Level.LEVEL3, async (done: Function) => {
      const testName = 'reset_avplayer_time_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      resetTimeWithCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_050
     * @tc.name      : reset_avplayer_time_002
     * @tc.desc      : Local Video test reset time (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('reset_avplayer_time_002', Level.LEVEL3, async (done: Function) => {
      const testName = 'reset_avplayer_time_002';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      await resetTimeWithoutCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_051
     * @tc.name      : release_avplayer_time_001
     * @tc.desc      : Local Video test release time (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('release_avplayer_time_001', Level.LEVEL3, async (done: Function) => {
      const testName = 'release_avplayer_time_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      releaseTimeWithCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_052
     * @tc.name      : release_avplayer_time_002
     * @tc.desc      : Local Video release prepare time (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('release_avplayer_time_002', Level.LEVEL3, async (done: Function) => {
      const testName = 'release_avplayer_time_002';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      releaseTimeWithoutCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_053
     * @tc.name      : getTrackDescription_time_001
     * @tc.desc      : Local Video test getTrackDescription time (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('getTrackDescription_time_001', Level.LEVEL3, async (done: Function) => {
      const testName = 'getTrackDescription_time_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      getTrackDescriptionTimeWithCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_053
     * @tc.name      : getTrackDescription_time_002
     * @tc.desc      : Local Video test getTrackDescription time (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('getTrackDescription_time_002', Level.LEVEL3, async (done: Function) => {
      const testName = 'getTrackDescription_time_002';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      await getTrackDescriptionTimeWithoutCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_054
     * @tc.name      : setSpeed_avplayer_001
     * @tc.desc      : Local Video test setSpeed time (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('setSpeed_avplayer_001', Level.LEVEL3, async (done: Function) => {
      const testName = 'setSpeed_avplayer_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      setSpeedTimeWithCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_055
     * @tc.name      : setBitrate_avplayer_001
     * @tc.desc      : Local Video test setBitrate time (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('setBitrate_avplayer_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setBitrate_avplayer_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      setBitrateTimeWithoutCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_056
     * @tc.name      : setVolume_avplayer_001
     * @tc.desc      : Local Video test setVolume time (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('setVolume_avplayer_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'setVolume_avplayer_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      setVolumeTimeWithCallback(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_057
     * @tc.name      : on_off_startRenderFrame_001
     * @tc.desc      : Local Video test firstFrame time
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('on_off_startRenderFrame_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_startRenderFrame_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      firstFrameTime(fileDescriptor, avPlayer, done, testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_058
     * @tc.name      : on_off_volumeChange_001
     * @tc.desc      : Local Video test volumeChange listen (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('on_off_volumeChange_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_volumeChange_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      setVolumeTimeWithCallback(fileDescriptor, avPlayer, done, testName);
      offCallback(avPlayer, ['volumeChange'], testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_059
     * @tc.name      : on_off_bitrateDone_availableBitrates_001
     * @tc.desc      : Local Video test bitrateDone/availableBitrates listen
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('on_off_bitrateDone_availableBitrates_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_bitrateDone_availableBitrates_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      let avPlayTest: PlayTest = { width: 720, height: 480, duration: 10034 };
      testAVPlayerFun(fileDescriptor, avPlayer, avPlayTest, PLAY_TIME, done, testName);
      offCallback(avPlayer, ['bitrateDone', 'availableBitrates'], testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_060
     * @tc.name      : on_off_seekDone_001
     * @tc.desc      : Local Video test seekDone listen (wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('on_off_seekDone_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_seekDone_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      let avPlayTest: PlayTest = { width: 720, height: 480, duration: 10034 };
      testAVPlayerSeek(fileDescriptor, avPlayer, avPlayTest, PLAY_TIME, done, testName);
      offCallback(avPlayer, ['seekDone'], testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_061
     * @tc.name      : on_off_speedDone_001
     * @tc.desc      : Local Video test speedDone listen (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('on_off_speedDone_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_speedDone_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      let avPlayTest: PlayTest = { width: 720, height: 480, duration: 10034 };
      testAVPlayerFun(fileDescriptor, avPlayer, avPlayTest, PLAY_TIME, done, testName);
      offCallback(avPlayer, ['speedDone'], testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_062
     * @tc.name      : on_off_timeUpdate_001
     * @tc.desc      : Local Video test timeUpdate listen (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('on_off_timeUpdate_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_timeUpdate_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      let avPlayTest: PlayTest = { width: 720, height: 480, duration: 10034 };
      testAVPlayerSeek(fileDescriptor, avPlayer, avPlayTest, PLAY_TIME, done, testName);
      offCallback(avPlayer, ['timeUpdate'], testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_063
     * @tc.name      : on_off_durationUpdate_001
     * @tc.desc      : Local Video test durationUpdate listen (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('on_off_durationUpdate_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_durationUpdate_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      let avPlayTest: PlayTest = { width: 720, height: 480, duration: 10034 };
      testAVPlayerSeek(fileDescriptor, avPlayer, avPlayTest, PLAY_TIME, done, testName);
      offCallback(avPlayer, ['durationUpdate'], testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_064
     * @tc.name      : on_off_videoSizeChange_001
     * @tc.desc      : Local Video test videoSizeChange listen (not wait callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('on_off_videoSizeChange_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_videoSizeChange_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      let avPlayTest: PlayTest = { width: 720, height: 480, duration: 10034 };
      testAVPlayerSeek(fileDescriptor, avPlayer, avPlayTest, PLAY_TIME, done, testName);
      offCallback(avPlayer, ['videoSizeChange'], testName);
      console.info(TAG, testName + ' end');
    })

    /**
     * @tc.number    : AVPLAYER_STABILITY_TEST_065
     * @tc.name      : on_off_bufferingUpdate_audioInterrupt_001
     * @tc.desc      : Local Video test bufferingUpdate/audioInterrupt listen
     * @tc.size      : MediumTest
     * @tc.type      : Function test
     * @tc.level     : Level3
     */
    it('on_off_bufferingUpdate_audioInterrupt_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'on_off_bufferingUpdate_audioInterrupt_001';
      console.info(TAG, testName + ' start');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCES[0], openFileFailed).then((res) => {
        fileDescriptor = res;
        fdNumbers.push(fileDescriptor.fd);
      });
      let avPlayTest: PlayTest = { width: 720, height: 480, duration: 10034 };
      testAVPlayerFun(fileDescriptor, avPlayer, avPlayTest, PLAY_TIME, done, testName);
      offCallback(avPlayer, ['bufferingUpdate'], testName);
      offCallback(avPlayer, ['audioInterrupt'], testName);
      console.info(TAG, testName + ' end');
    })
  })
}