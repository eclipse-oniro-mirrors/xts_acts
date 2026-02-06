/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs'
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';
import resourceManager from '@ohos.resourceManager';
import media from '@ohos.multimedia.media';
import router, { RouterOptions } from '@system.router';

const IDLE = 'idle';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const COMPLETED = 'completed';
const STOPPED = 'stopped';
const RELEASED = 'released';
const ERROR = 'error';

type OptionFunc = (avPlayer: media.AVPlayer) => Promise<void>;

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}
export async function toNewPage(pagePath: string) {
  let options: RouterOptions = {
    uri: pagePath,
  }
  try {
    router.push(options);
  } catch {
    console.info('case route failed');
  }
}

function setAVPlayerCb(avPlayer: media.AVPlayer | null, preOpt: OptionFunc, getSpeedOption: OptionFunc, done: Function) {
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
        await preOpt(avPlayer!!);
        await avPlayer?.play();
        break;
      case PLAYING:
        setTimeout(async () => {
          await getSpeedOption(avPlayer!!);
        }, 2000)
        break;
      case RELEASED:
        avPlayer = null;
        done();
        break;
      case ERROR:
        expect().assertFail();
        avPlayer?.release();
        avPlayer = null;
        break;
      default:
        break;
    }
  })
}

async function testGetPlaybackSpeed(src: media.AVFileDescriptor, avPlayer: media.AVPlayer | null, preOpt: OptionFunc, getSpeedOption: OptionFunc, done: Function) {
  console.info(`case media source: ${src}`)
  media.createAVPlayer((err, video) => {
    console.info(`case media err: ${err}`)
    if (typeof (video) != 'undefined') {
      console.info('case createAVPlayer success');
      avPlayer = video;
      setAVPlayerCb(avPlayer, preOpt, getSpeedOption, done)
      avPlayer.fdSrc = src;
    }
    if (err != null) {
      console.error(`case createAVPlayer error, errMessage is ${err.message}`);
      expect().assertFail();
      done();
    }
  });
}

export default function OhAVPlayerJsTest() {
  describe('OhAVPlayerJsTest', () => {
    let fileDescriptor: resourceManager.RawFileDescriptor;
    let testContext: common.UIAbilityContext;
    let filePath: string;
    let fileSize: number;
    beforeAll(async () => {
      await toNewPage("testability/pages/PreviewArea");
      testContext = AppStorage.get('testContext') as common.UIAbilityContext;
      filePath = testContext.filesDir + "/H264_AAC.mp4"
      let file = await fs.open(filePath)
      let stat = await fs.stat(filePath)
      fileSize = stat.size;
      fileDescriptor = {
        fd: file.fd,
        offset: 0,
        length: stat.size
      }
    });
    beforeEach(async () => {
    });
    afterEach(async () => {
    });
    afterAll(async () => {
      await fs.close(fileDescriptor.fd);
    });

    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0001
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0001
     * @tc.desc   Test getPlaybackSpeed interface, verify return value after setSpeed
     *            test avPlayer getPlaybackSpeed, set speed SPEED_FORWARD_0_75_X
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0001', Level.LEVEL0,async (done: Function) => {
      let opt = async (avPlayer: media.AVPlayer) => {
        let speed = await avPlayer.getPlaybackRate();
        console.info(`case SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0001 speed: ${speed}`);
        expect(speed).assertEqual(0.75);
        await avPlayer?.release();
        done();
      }
      let prepareOpt = async (avPlayer: media.AVPlayer) => {
        avPlayer.setPlaybackRate(0.75);
      }
      let avPlayer: media.AVPlayer | null = null;
      await testGetPlaybackSpeed(fileDescriptor, avPlayer, prepareOpt, opt, done);
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0002
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0002
     * @tc.desc   Test getPlaybackSpeed interface, verify return value after setSpeed
     *            test avPlayer getPlaybackSpeed, set speed 1
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0002', Level.LEVEL0,async (done: Function) => {
      let opt = async (avPlayer: media.AVPlayer) => {
        let speed = await avPlayer.getPlaybackRate();
        console.info(`case SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0002 speed: ${speed}`);
        expect(speed).assertEqual(1.00);
        await avPlayer?.release();
        done();
      }
      let prepareOpt = async (avPlayer: media.AVPlayer) => {
        avPlayer.setPlaybackRate(1.00);
      }
      let avPlayer: media.AVPlayer | null = null;
      await testGetPlaybackSpeed(fileDescriptor, avPlayer, prepareOpt, opt, done);
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0003
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0003
     * @tc.desc   Test getPlaybackSpeed interface, verify return value after setSpeed
     *            test avPlayer getPlaybackSpeed, set speed 0.125
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0003', Level.LEVEL0,async (done: Function) => {
      let opt = async (avPlayer: media.AVPlayer) => {
        let speed = await avPlayer.getPlaybackRate();
        console.info(`case SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0003 speed: ${speed}`);
        expect(speed).assertEqual(1.25);
        await avPlayer?.release();
        done();
      }
      let prepareOpt = async (avPlayer: media.AVPlayer) => {
        avPlayer.setPlaybackRate(1.25);
      }
      let avPlayer: media.AVPlayer | null = null;
      await testGetPlaybackSpeed(fileDescriptor, avPlayer, prepareOpt, opt, done);
    });

    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0004
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0004
     * @tc.desc   Test getPlaybackSpeed interface, verify return value after setSpeed
     *            test avPlayer getPlaybackSpeed, set speed SPEED_FORWARD_1_75_X
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0004', Level.LEVEL0,async (done: Function) => {
      let opt = async (avPlayer: media.AVPlayer) => {
        let speed = await avPlayer.getPlaybackRate();
        console.info(`case SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0004 speed: ${speed}`);
        expect(speed).assertEqual(1.75);
        await avPlayer?.release();
        done();
      }
      let prepareOpt = async (avPlayer: media.AVPlayer) => {
        avPlayer.setPlaybackRate(1.75);
      }
      let avPlayer: media.AVPlayer | null = null;
      await testGetPlaybackSpeed(fileDescriptor, avPlayer, prepareOpt, opt, done);
    });

    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0005
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0005
     * @tc.desc   Test getPlaybackSpeed interface, verify return value after setSpeed
     *            test avPlayer getPlaybackSpeed, set speed SPEED_FORWARD_2_00_X
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0005', Level.LEVEL0,async (done: Function) => {
      let opt = async (avPlayer: media.AVPlayer) => {
        let speed = await avPlayer.getPlaybackRate();
        console.info(`case SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0005 speed: ${speed}`);
        expect(speed).assertEqual(2.00);
        await avPlayer?.release();
        done();
      }
      let prepareOpt = async (avPlayer: media.AVPlayer) => {
        avPlayer.setPlaybackRate(2.00);
      }
      let avPlayer: media.AVPlayer | null = null;
      await testGetPlaybackSpeed(fileDescriptor, avPlayer, prepareOpt, opt, done);
    });
    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0006
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0006
     * @tc.desc   Test getPlaybackSpeed interface, verify return value after setSpeed
     *            test avPlayer getPlaybackSpeed, set speed SPEED_FORWARD_0_50_X
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0006', Level.LEVEL0,async (done: Function) => {
      let opt = async (avPlayer: media.AVPlayer) => {
        let speed = await avPlayer.getPlaybackRate();
        console.info(`case SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0006 speed: ${speed}`);
        expect(speed).assertEqual(0.50);
        await avPlayer?.release();
        done();
      }
      let prepareOpt = async (avPlayer: media.AVPlayer) => {
        avPlayer.setPlaybackRate(0.50);
      }
      let avPlayer: media.AVPlayer | null = null;
      await testGetPlaybackSpeed(fileDescriptor, avPlayer, prepareOpt, opt, done);
    });

    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0007
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0007
     * @tc.desc   Test getPlaybackSpeed interface, verify return value after setSpeed
     *            test avPlayer getPlaybackSpeed, set speed SPEED_FORWARD_1_50_X
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0007', Level.LEVEL0,async (done: Function) => {
      let opt = async (avPlayer: media.AVPlayer) => {
        let speed = await avPlayer.getPlaybackRate();
        console.info(`case SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0007 speed: ${speed}`);
        expect(speed).assertEqual(1.50);
        await avPlayer?.release();
        done();
      }
      let prepareOpt = async (avPlayer: media.AVPlayer) => {
        avPlayer.setPlaybackRate(1.50);
      }
      let avPlayer: media.AVPlayer | null = null;
      await testGetPlaybackSpeed(fileDescriptor, avPlayer, prepareOpt, opt, done);
    });

    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0008
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0008
     * @tc.desc   Test getPlaybackSpeed interface, verify return value after setSpeed
     *            test avPlayer getPlaybackSpeed, set speed SPEED_FORWARD_3_00_X
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0008', Level.LEVEL0,async (done: Function) => {
      let opt = async (avPlayer: media.AVPlayer) => {
        let speed = await avPlayer.getPlaybackRate();
        console.info(`case SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0008 speed: ${speed}`);
        expect(speed).assertEqual(3.00);
        await avPlayer?.release();
        done();
      }
      let prepareOpt = async (avPlayer: media.AVPlayer) => {
        avPlayer.setPlaybackRate(3.00);
      }
      let avPlayer: media.AVPlayer | null = null;
      await testGetPlaybackSpeed(fileDescriptor, avPlayer, prepareOpt, opt, done);
    });

    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0009
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0009
     * @tc.desc   Test getPlaybackSpeed interface, verify return value after setSpeed
     *            test avPlayer getPlaybackSpeed, set speed SPEED_FORWARD_0_25_X
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0009', Level.LEVEL0,async (done: Function) => {
      let opt = async (avPlayer: media.AVPlayer) => {
        let speed = await avPlayer.getPlaybackRate();
        console.info(`case SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0008 speed: ${speed}`);
        expect(speed).assertEqual(0.25);
        await avPlayer?.release();
        done();
      }
      let prepareOpt = async (avPlayer: media.AVPlayer) => {
        avPlayer.setPlaybackRate(0.25);
      }
      let avPlayer: media.AVPlayer | null = null;
      await testGetPlaybackSpeed(fileDescriptor, avPlayer, prepareOpt, opt, done);
    });

    /**
     * @tc.number SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0010
     * @tc.name   SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0010
     * @tc.desc   Test getPlaybackSpeed interface, verify return value after setSpeed
     *            test avPlayer getPlaybackSpeed, set speed SPEED_FORWARD_0_125_X
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0010', Level.LEVEL0,async (done: Function) => {
      let opt = async (avPlayer: media.AVPlayer) => {
        let speed = await avPlayer.getPlaybackRate();
        console.info(`case SUB_MULTIMEIDA_MEDIA_OHAVPLAYER_GETPLAYBACKSPEED_0010 speed: ${speed}`);
        expect(speed).assertEqual(0.125);
        await avPlayer?.release();
        done();
      }
      let prepareOpt = async (avPlayer: media.AVPlayer) => {
        avPlayer.setPlaybackRate(0.125);
      }
      let avPlayer: media.AVPlayer | null = null;
      await testGetPlaybackSpeed(fileDescriptor, avPlayer, prepareOpt, opt, done);
    });
  });
}