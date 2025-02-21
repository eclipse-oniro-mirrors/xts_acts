/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

import { sleep, Constant, AudioConcurrencyMode, AudioSessionDeactivatedReason } from './Common.test';
import { BusinessError } from '@ohos.base';
import audio from '@ohos.multimedia.audio';

let sessionManager: audio.AudioSessionManager;
let audioManager: audio.AudioManager;
const isDone: boolean = true;

// 创建音频会话管理器
async function getSessionManager() {
  audioManager = audio.getAudioManager();
  expect(audioManager).not().assertUndefined();
  expect(audioManager).not().assertNull();
  console.info('getAudioManager audioManager:' + audioManager);
  sessionManager = audioManager.getSessionManager();
  expect(sessionManager).not().assertUndefined();
  expect(sessionManager).not().assertNull();
  console.info('getSessionManager sessionManager:' + sessionManager);
}

// 设置音频并发模式并调用激活接口
export async function activateAudioSession(strategy: audio.AudioSessionStrategy | undefined | null, done: Function,
  isDone: boolean) {
  let bl: boolean = false;
  await sessionManager.activateAudioSession(strategy).then(() => {
    console.info('activateAudioSession SUCCESS');
    bl = true;
    expect(bl).assertTrue();
    if (isDone) {
      done();
    }
  }).catch((err: BusinessError) => {
    console.error(`ERROR: ${err}`);
    expect(err.code).assertEqual(Constant.SYS_EORRCODE);
    if (isDone) {
      done();
    }
  });
}

// 设置音频并发模式并调用去激活接口
export async function deactivateAudioSession(done: Function, isDone: boolean) {
  let bl: boolean = false;
  await sessionManager.deactivateAudioSession().then(() => {
    console.info('deactivateAudioSession SUCCESS');
    bl = true;
    expect(bl).assertTrue();
    if (isDone) {
      done();
    }
  }).catch((err: BusinessError) => {
    console.error(`ERROR: ${err}`);
    expect(err.code).assertEqual(Constant.EORRCODE);
    if (isDone) {
      done();
    }
  });
}

// 查询激活状态-激活状态
export async function isAudioSessionActivatedTrue(done: Function, isDone: boolean) {
  let activationStatus: boolean = sessionManager.isAudioSessionActivated();
  expect(activationStatus).assertTrue();
  if (isDone) {
    done();
  }
}

// 查询激活状态-未激活状态
export function isAudioSessionActivatedFalse(done: Function, isDone: boolean) {
  let activationStatus: boolean = sessionManager.isAudioSessionActivated();
  expect(activationStatus).assertFalse();
  if (isDone) {
    done();
  }
}

const sessionDeactivatedEvent = (event: audio.AudioSessionDeactivatedEvent) => {
  expect(event.reason).assertEqual(Constant.DEACTIVATED_TIMEOUT);
}

export default function audioSessionManagerTest() {
  describe('AudioSessionManagerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.

    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      getSessionManager();
      sessionManager.on('audioSessionDeactivated', sessionDeactivatedEvent);

    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      sessionManager.off('audioSessionDeactivated', sessionDeactivatedEvent);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /* *
		* @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_0
		* @tc.name      : test AudioSessionManager basic API by promise
		* @tc.desc      : test AudioSessionManager operation:设置音频并发模式为null,查询音频会话状态是否激活,预期结果是未激活,调用去激活预期结果是未激活
		* @tc.size      : AudioTest
		* @tc.type      : Function
		* @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_0', 0, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy | undefined | null = null;
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedFalse(done, !isDone);
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_1
    * @tc.name      : test AudioSessionManager basic API by promise
    * @tc.desc      : test AudioSessionManager operation:调用去激活预期结果是未激活,设置音频并发模式为默认模式,查询音频会话状态是否激活,预期结果是激活
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_1', 1, async (done: Function) => {
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, !isDone);
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_2
    * @tc.name      : test AudioSessionManager basic API by promise
    * @tc.desc      : test AudioSessionManager operation:设置音频并发模式为混音模式,查询音频会话状态是否激活,预期结果是激活
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_2', 2, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, !isDone);
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_3
    * @tc.name      : test AudioSessionManager basic API by promise
    * @tc.desc      : test AudioSessionManager operation:设置音频并发模式为混音降低音量模式,查询音频会话状态是否激活,预期结果是激活
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_3', 3, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_DUCK_OTHERS
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_4
    * @tc.name      : test AudioSessionManager basic API by promise
    * @tc.desc      : test AudioSessionManager operation:设置音频并发模式为暂停模式,查询音频会话状态是否激活,预期结果是激活
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_4', 4, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_PAUSE_OTHERS
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_5
    * @tc.name      : test AudioSessionManager basic API by promise
    * @tc.desc      : test AudioSessionManager operation: 设置音频并发模式为undefined,查询音频会话状态是否激活,预期结果是未激活
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_5', 5, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy | undefined = undefined;
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, !isDone);
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_6
    * @tc.name      : test AudioSessionManager basic API by promise
    * @tc.desc      : test AudioSessionManager operation: 调用去激活,查询音频会话状态是否激活,预期结果是未激活
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_6', 6, async (done: Function) => {
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_7
    * @tc.name      : test AudioSessionManager basic API by promise
    * @tc.desc      : test AudioSessionManager operation:调用激活-激活,查询音频会话状态是否激活,预期结果是激活
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_7', 7, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_8
    * @tc.name      : test AudioSessionManager basic API by promise
    * @tc.desc      : test AudioSessionManager operation:调用激活-激活,查询音频会话状态是否激活,预期结果是激活
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_8', 8, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, !isDone);
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_9
    * @tc.name      : test AudioSessionManager basic API by promise
    * @tc.desc      : test AudioSessionManager operation:调用未激活-激活,查询音频会话状态是否激活,预期结果是激活
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_9', 9, async (done: Function) => {
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, !isDone);
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /* *
    * @tc.number    : SUB_AUDIO_AUDIOSESSIONMANAGER_API_10
    * @tc.name      : test AudioSessionManager basic API by promise
    * @tc.desc      : test AudioSessionManager operation:调用AudioSessionManager注册事件和关闭注册事件覆盖参数
    * @tc.size      : AudioTest
    * @tc.type      : Function
    * @tc.level     : Level3
    */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_10', 10, async (done: Function) => {
      sessionManager.on('audioSessionDeactivated', (audioSessionDeactivatedEvent: audio.AudioSessionDeactivatedEvent) => {
        if(audioSessionDeactivatedEvent.reason === AudioSessionDeactivatedReason.DEACTIVATED_LOWER_PRIORITY){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }else if(audioSessionDeactivatedEvent.reason === AudioSessionDeactivatedReason.DEACTIVATED_TIMEOUT){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }
      });
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      sessionManager.off('audioSessionDeactivated', (audioSessionDeactivatedEvent: audio.AudioSessionDeactivatedEvent) => {
        if(audioSessionDeactivatedEvent.reason === AudioSessionDeactivatedReason.DEACTIVATED_LOWER_PRIORITY){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }else if(audioSessionDeactivatedEvent.reason === AudioSessionDeactivatedReason.DEACTIVATED_TIMEOUT){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }
      });
      isAudioSessionActivatedTrue(done, isDone);
    })

  })
}