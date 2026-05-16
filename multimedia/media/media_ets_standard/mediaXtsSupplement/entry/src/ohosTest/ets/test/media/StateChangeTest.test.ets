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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';
import { media } from '@kit.MediaKit';

const TAG = "MediaXts.OnStateChangeTest";

let avPlayer: media.AVPlayer;
media.createAVPlayer((error: BusinessError, video: media.AVPlayer) => {
  if (video != null) {
    avPlayer = video;
    console.info('Succeeded in creating AVPlayer');
  } else {
    console.error(`Failed to create AVPlayer, error message:${error.message}`);
  }
});

let avRecorder: media.AVRecorder;
media.createAVRecorder((error: BusinessError, recorder: media.AVRecorder) => {
  if (recorder != null) {
    avRecorder = recorder;
    console.info('Succeeded in creating AVRecorder');
  } else {
    console.error(`Failed to create AVRecorder, error message:${error.message}`);
  }
});
async function createAVRecorder(): Promise<media.AVRecorder> {
  const recorder = await media.createAVRecorder();
  if (!recorder) throw new Error(`${TAG} AVRecorder创建失败`);
  return recorder;
}
async function createAVPlayer(): Promise<media.AVPlayer> {
  const player = await media.createAVPlayer();
  if (!player) throw new Error('AVPlayer创建失败');
  return player;
}
async function TestAVPlayerStateOffChange(
  testName: string,
  callback: ESObject,
) {
  avPlayer = await createAVPlayer();
  try {
    console.info(TAG, testName, '开始测试off(stateChange)空回调');
    avPlayer.off('stateChange', callback);
    console.info(TAG, testName, 'off(stateChange)传入空回调执行完成');
  } catch (error) {
    console.error(TAG, testName, `off(stateChange)空回调测试失败: ${error}, code: ${(error as BusinessError)?.code}`);
  }
  await avPlayer.release()
}
async function TestAVPlayerOnStateChange(
  testName: string,
  callback: ESObject,
) {
  avPlayer = await createAVPlayer();
  try {
    console.info(TAG, testName, '开始测试on(stateChange)空回调');
    avPlayer.on('stateChange', callback);
    console.info(TAG, testName, 'on(stateChange)传入空回调执行完成');
  } catch (error) {
    console.error(TAG, testName, `on(stateChange)空回调测试失败: ${error}, code: ${(error as BusinessError)?.code}`);
  }
  await avPlayer.release()
}
async function TestAVRecorderOnStateChange(
  testName: string,
  callback: ESObject,
) {
  avRecorder = await createAVRecorder();
  try {
    console.info(TAG, testName, '开始测试on(stateChange)空回调');
    avPlayer.on('stateChange', callback);
    console.info(TAG, testName, 'on(stateChange)传入空回调执行完成');
  } catch (error) {
    console.error(TAG, testName, `on(stateChange)空回调测试失败: ${error}, code: ${(error as BusinessError)?.code}`);
  }
}
export default function StateChangeTest() {
  describe('StateChangeTest', () => {
    beforeAll(async () => {
      console.info(TAG,'beforeAll case');
    });

    beforeEach(() => {
      console.info(TAG,'afterEach case');
    });

    afterEach(async () => {
      console.info(TAG,'afterEach case');
    });

    afterAll(async () => {
      console.info(TAG,'afterAll case');
    });
    /**
     * @tc.number    SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_001
     * @tc.name      SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_001
     * @tc.desc      Testing AVPlayerStateChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_001", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_001';
      try {
        await TestAVPlayerOnStateChange(testName, null);
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_002
     * @tc.name      SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_002
     * @tc.desc      Testing AVPlayerStateChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_002", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_002';
      try {
        await TestAVPlayerOnStateChange(testName, '');
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_003
     * @tc.name      SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_003
     * @tc.desc      Testing AVPlayerStateChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_003", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_003';
      try {
        await TestAVPlayerOnStateChange(testName, undefined);
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_004
     * @tc.name      SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_004
     * @tc.desc      Testing AVPlayerStateChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_004", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_004';
      try {
        await TestAVPlayerStateOffChange(testName, null);
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_005
     * @tc.name      SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_005
     * @tc.desc      Testing AVPlayerStateChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_005", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_005';
      try {
        await TestAVPlayerStateOffChange(testName, undefined);
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_006
     * @tc.name      SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_006
     * @tc.desc      Testing AVPlayerStateChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_006", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVPLAYER_STATECHANGE_NULL_CALLBACK_006';
      try {
        await TestAVPlayerStateOffChange(testName, '');
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_007
     * @tc.name      SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_007
     * @tc.desc      Testing AVRecorderStateChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_007", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_007';
      try {
        await TestAVRecorderOnStateChange(testName, null);
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_008
     * @tc.name      SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_008
     * @tc.desc      Testing AVRecorderStateChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_008", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_008';
      try {
        await TestAVRecorderOnStateChange(testName, undefined);
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
    /**
     * @tc.number    SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_009
     * @tc.name      SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_009
     * @tc.desc      Testing AVRecorderStateChange
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_009", Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MEDIA_AVRECORDER_STATECHANGE_NULL_CALLBACK_009';
      try {
        await TestAVRecorderOnStateChange(testName, '');
        done();
      } catch (error) {
        const errCode = (error as BusinessError).code;
        console.error(TAG, testName, `failed; error: ${error}, code: ${errCode}`);
        expect(errCode).assertEqual('401');
        done();
      }
    });
  })
}

