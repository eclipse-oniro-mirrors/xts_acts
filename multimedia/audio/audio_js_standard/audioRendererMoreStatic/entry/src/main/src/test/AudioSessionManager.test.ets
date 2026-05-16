/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from "../../../hypium/index";

import { BusinessError } from '@ohos.base';
import audio from '@ohos.multimedia.audio';

let sessionManager: audio.AudioSessionManager;
let audioManager: audio.AudioManager;
const isDone: boolean = true;
const SYS_EORRCODE: number = 6800101;
const EORRCODE: number = 6800301;
const DEACTIVATED_TIMEOUT:number = 1;
// 创建音频会话管理器
let getSessionManager = async ()=> {
  audioManager = audio.getAudioManager();
  expect(audioManager).not().assertUndefined();
  expect(audioManager).not().assertNull();
  if (audioManager == null) {
    expect(false).assertTrue()
  }
  console.info('getAudioManager audioManager:' + audioManager);
  sessionManager = audioManager.getSessionManager();
  expect(sessionManager).not().assertUndefined();
  expect(sessionManager).not().assertNull();
  if (sessionManager == null) {
    expect(false).assertTrue()
  }
  console.info('getSessionManager sessionManager:' + sessionManager);
}

// 设置音频并发模式并调用激活接口
export let activateAudioSession = async (strategy: audio.AudioSessionStrategy, done: () => void,
  isDone: boolean)=> {
  let bl: boolean = false;
  try {
    await sessionManager.activateAudioSession(strategy);
    console.info('activateAudioSession SUCCESS');
    bl = true;
    expect(bl).assertTrue();
    if (isDone) {
      done();
    }
  } catch (err: BusinessError) {
    console.error(`ERROR: ${err}`);
    expect(err.code).assertEqual(SYS_EORRCODE);
    if (isDone) {
      done();
    }
  }
}

// 设置音频并发模式并调用去激活接口
export let deactivateAudioSession = async (done: () => void, isDone: boolean)=> {
  let bl: boolean = false;
  try {
    await sessionManager.deactivateAudioSession();
    console.info('deactivateAudioSession SUCCESS');
    bl = true;
    expect(bl).assertTrue();
    if (isDone) {
      done();
    }
  } catch (err: BusinessError) {
    console.error(`ERROR: ${err}`);
    expect(err.code).assertEqual(EORRCODE);
    if (isDone) {
      done();
    }
  }
}

// 查询激活状态-激活状态
export let isAudioSessionActivatedTrue = async (done: () => void, isDone: boolean)=> {
  let activationStatus: boolean = sessionManager.isAudioSessionActivated();
  expect(activationStatus).assertTrue();
  if (isDone) {
    done();
  }
}

// 查询激活状态-未激活状态
export let isAudioSessionActivatedFalse = (done: () => void, isDone: boolean)=> {
  let activationStatus: boolean = sessionManager.isAudioSessionActivated();
  expect(activationStatus).assertFalse();
  if (isDone) {
    done();
  }
}

const sessionDeactivatedEvent = (event: audio.AudioSessionDeactivatedEvent) => {
  expect(event.reason).assertEqual(DEACTIVATED_TIMEOUT);
}

const sessionStateChangedEvent = (event: audio.AudioSessionStateChangedEvent) => {
  console.info(`sessionStateChanged stateChangeHint is :${event.stateChangeHint}`);
}

const sessionDeviceChangedChangedEvent = (event: audio.CurrentOutputDeviceChangedEvent) => {
  console.info(`sessionDeviceChangedChanged recommendedAction is :${event.recommendedAction}`);
  console.info(`sessionDeviceChangedChanged changeReason is :${event.changeReason}`);
}

export default function audioSessionManagerTest() {
  describe('AudioSessionManagerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    let TAG = 'AudioSessionManagerTest';
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      getSessionManager();
      sessionManager.onAudioSessionDeactivated(sessionDeactivatedEvent);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      sessionManager.offAudioSessionDeactivated(sessionDeactivatedEvent);
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_1
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_1
     * @tc.desc   test AudioSessionManager operation:调用去激活预期结果是未激活,设置音频并发模式为默认模式,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, !isDone);
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_2
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_2
     * @tc.desc   test AudioSessionManager operation:设置音频并发模式为混音模式,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, !isDone);
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_3
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_3
     * @tc.desc   test AudioSessionManager operation:设置音频并发模式为混音降低音量模式,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DUCK_OTHERS
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_4
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_4
     * @tc.desc   test AudioSessionManager operation:设置音频并发模式为暂停模式,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: () => void): Promise<void> => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_PAUSE_OTHERS
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_6
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_6
     * @tc.desc   test AudioSessionManager operation: 调用去激活,查询音频会话状态是否激活,预期结果是未激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_7
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_7
     * @tc.desc   test AudioSessionManager operation:调用激活-激活,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_8
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_8
     * @tc.desc   test AudioSessionManager operation:调用激活-激活,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, !isDone);
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_9
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_9
     * @tc.desc   test AudioSessionManager operation:调用未激活-激活,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, !isDone);
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_10
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_10
     * @tc.desc   test AudioSessionManager operation:调用AudioSessionManager注册事件和关闭注册事件覆盖参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      sessionManager.onAudioSessionDeactivated((audioSessionDeactivatedEvent: audio.AudioSessionDeactivatedEvent) => {
        if(audioSessionDeactivatedEvent.reason === audio.AudioSessionDeactivatedReason.DEACTIVATED_LOWER_PRIORITY){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }else if(audioSessionDeactivatedEvent.reason === audio.AudioSessionDeactivatedReason.DEACTIVATED_TIMEOUT){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }
      });
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      sessionManager.offAudioSessionDeactivated((audioSessionDeactivatedEvent: audio.AudioSessionDeactivatedEvent) => {
        if(audioSessionDeactivatedEvent.reason === audio.AudioSessionDeactivatedReason.DEACTIVATED_LOWER_PRIORITY){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }else if(audioSessionDeactivatedEvent.reason === audio.AudioSessionDeactivatedReason.DEACTIVATED_TIMEOUT){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }
      });
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_11
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_11
     * @tc.desc   test AudioSessionManager operation:调用AudioSessionManager注册事件和关闭注册事件覆盖参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        sessionManager.onAudioSessionStateChanged((AudioSessionStateChangedEvent: audio.AudioSessionStateChangedEvent) => {
        if (AudioSessionStateChangedEvent.stateChangeHint === audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_RESUME) {
          console.info(`reason of audioSessionDeactivated: ${AudioSessionStateChangedEvent.stateChangeHint} `);
        }
      });
      } catch (err: BusinessError) {
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_12
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_12
     * @tc.desc   test AudioSessionManager operation:调用AudioSessionManager注册事件和关闭注册事件覆盖参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        sessionManager.onCurrentOutputDeviceChanged((CurrentOutputDeviceChangedEvent: audio.CurrentOutputDeviceChangedEvent) => {
        console.info(`devices of currentOutputDeviceChanged: ${CurrentOutputDeviceChangedEvent.devices} `);
        console.info(`changeReason of currentOutputDeviceChanged: ${CurrentOutputDeviceChangedEvent.changeReason} `);
        console.info(`recommendedAction of currentOutputDeviceChanged: ${CurrentOutputDeviceChangedEvent.recommendedAction} `);
      });
      } catch (err: BusinessError) {
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_13
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_13
     * @tc.desc   test AudioSessionManager operation: setAudioSessionScene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        sessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        console.info(`setAudioSessionScene AUDIO_SESSION_SCENE_MEDIA value PASS`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        console.info(`setAudioSessionScene AUDIO_SESSION_SCENE_MEDIA value Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_14
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_14
     * @tc.desc   test AudioSessionManager operation: audioSessionStateChanged register with param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        sessionManager.onAudioSessionStateChanged(sessionStateChangedEvent);
        console.info(`on audioSessionStateChanged registration PASS`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        console.info(`on audioSessionStateChanged registration Error :${err.message}`);
        expect(false).assertTrue();
      }
      try {
        sessionManager.offAudioSessionStateChanged(sessionStateChangedEvent);
        console.info(`off audioSessionStateChanged unregistration PASS`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        console.info(`off audioSessionStateChanged unregistration Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_15
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_15
     * @tc.desc   test AudioSessionManager operation: audioSessionStateChanged register with no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        sessionManager.onAudioSessionStateChanged(sessionStateChangedEvent);
        console.info(`on audioSessionStateChanged registration PASS`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        console.info(`on audioSessionStateChanged registration Error :${err.message}`);
        expect(false).assertTrue();
      }
      try {
        sessionManager.offAudioSessionStateChanged();
        console.info(`off audioSessionStateChanged all function unregistration PASS`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        console.info(`off audioSessionStateChanged all function unregistration Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_16
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_16
     * @tc.desc   test AudioSessionManager operation: getDefaultOutputDevice/setDefaultOutputDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let data = sessionManager.getDefaultOutputDevice();
        console.info(`getDefaultOutputDevice success`);
        expect(data).assertEqual(audio.DeviceType.INVALID);
      } catch (err: BusinessError) {
        console.info(`getDefaultOutputDevice value failed, Error :${err.message}`);
        expect(false).assertTrue();
      }

      try {
        await sessionManager.setDefaultOutputDevice(audio.DeviceType.DEFAULT);
        console.info(`setDefaultOutputDevice DEFAULT value PASS`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        if (err.code != audio.AudioErrors.ERROR_SYSTEM) {
          console.info(`setDefaultOutputDevice DEFAULT value Error :${err.message}`);
          expect(false).assertTrue();
        }
      }

      try {
        let data = sessionManager.getDefaultOutputDevice();
        console.info(`getDefaultOutputDevice success`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        console.info(`getDefaultOutputDevice value failed, Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_17
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_17
     * @tc.desc   test AudioSessionManager operation: currentOutputDeviceChanged register with param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        sessionManager.onCurrentOutputDeviceChanged(sessionDeviceChangedChangedEvent);
        console.info(`on currentOutputDeviceChanged registration PASS`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        console.info(`on currentOutputDeviceChanged registration Error :${err.message}`);
        expect(false).assertTrue();
      }
      try {
        sessionManager.offCurrentOutputDeviceChanged(sessionDeviceChangedChangedEvent);
        console.info(`off currentOutputDeviceChanged unregistration PASS`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        console.info(`off currentOutputDeviceChanged unregistration Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_18
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_18
     * @tc.desc   test AudioSessionManager operation: currentOutputDeviceChanged register with no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        sessionManager.onCurrentOutputDeviceChanged(sessionDeviceChangedChangedEvent);
        console.info(`on currentOutputDeviceChanged registration PASS`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        console.info(`on currentOutputDeviceChanged registration Error :${err.message}`);
        expect(false).assertTrue();
      }
      try {
        sessionManager.offCurrentOutputDeviceChanged();
        console.info(`off currentOutputDeviceChanged all function unregistration PASS`);
        expect(true).assertTrue();
      } catch (err: BusinessError) {
        console.info(`off currentOutputDeviceChanged all function unregistration Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_19
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_19
     * @tc.desc   test AudioSessionManager operation: currentOutputDeviceChanged register with no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_STATIC_19', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      try {
        sessionManager.onAudioSessionDeactivated((audioSessionDeactivatedEvent: audio.AudioSessionDeactivatedEvent) => {
          if(audioSessionDeactivatedEvent.reason === audio.AudioSessionDeactivatedReason.DEACTIVATED_LOWER_PRIORITY){
            console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
          }else if(audioSessionDeactivatedEvent.reason === audio.AudioSessionDeactivatedReason.DEACTIVATED_TIMEOUT){
            console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
          }
        });
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await activateAudioSession(strategy, done, !isDone);
        sessionManager.offAudioSessionDeactivated();
        isAudioSessionActivatedTrue(done, isDone);
        done();
      } catch (err: BusinessError) {
        expect(false).assertTrue();
        console.info(`${TAG}: err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_STATIC_0100
     * @tc.desc   setDefaultOutputDevice -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.INVALID);
        expect(false).assertTrue();
        done();
      } catch (err: BusinessError) {
        expect(Number(err.code)).assertEqual(6800101);
        console.info(`${TAG}: err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETDEFAULTOUTPUTDEVICE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETDEFAULTOUTPUTDEVICE_STATIC_0100
     * @tc.desc   inputAudioDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETDEFAULTOUTPUTDEVICE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioManager: audio.AudioManager = audio.getAudioManager();
      let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
      try{
        let deviceType: audio.DeviceType = audioSessionManager.getDefaultOutputDevice();
        if(deviceType == audio.DeviceType.DEFAULT) {
          expect(deviceType).assertEqual(1000);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType == audio.DeviceType.EARPIECE){
          expect(deviceType).assertEqual(1);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.SPEAKER){
          expect(deviceType).assertEqual(2);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.INVALID){
          expect(deviceType).assertEqual(0);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.WIRED_HEADSET){
          expect(deviceType).assertEqual(3);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.WIRED_HEADPHONES){
          expect(deviceType).assertEqual(4);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.BLUETOOTH_SCO){
          expect(deviceType).assertEqual(7);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.BLUETOOTH_A2DP){
          expect(deviceType).assertEqual(8);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.MIC){
          expect(deviceType).assertEqual(15);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.USB_HEADSET){
          expect(deviceType).assertEqual(22);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.DISPLAY_PORT){
          expect(deviceType).assertEqual(23);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.REMOTE_CAST){
          expect(deviceType).assertEqual(24);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.USB_DEVICE){
          expect(deviceType).assertEqual(25);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.ACCESSORY){
          expect(deviceType).assertEqual(26);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.HDMI){
          expect(deviceType).assertEqual(27);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.LINE_DIGITAL){
          expect(deviceType).assertEqual(28);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.REMOTE_DAUDIO){
          expect(deviceType).assertEqual(29);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.HEARING_AID){
          expect(deviceType).assertEqual(30);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        } else if(deviceType = audio.DeviceType.NEARLINK){
          expect(deviceType).assertEqual(31);
          console.info(`getDefaultOutputDevice success: ${deviceType}`);
        }
      }catch (err: BusinessError){
        console.log('getDefaultOutputDevice failed, err :' + err.message)
        expect(false).assertTrue();
      }
      done();
    })
  })
}
