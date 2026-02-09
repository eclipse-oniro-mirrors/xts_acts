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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

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

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_0
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_0
     * @tc.desc   test AudioSessionManager operation:设置音频并发模式为null,查询音频会话状态是否激活,预期结果是未激活,调用去激活预期结果是未激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy | undefined | null = null;
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedFalse(done, !isDone);
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_1
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_1
     * @tc.desc   test AudioSessionManager operation:调用去激活预期结果是未激活,设置音频并发模式为默认模式,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, !isDone);
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_2
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_2
     * @tc.desc   test AudioSessionManager operation:设置音频并发模式为混音模式,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, !isDone);
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_3
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_3
     * @tc.desc   test AudioSessionManager operation:设置音频并发模式为混音降低音量模式,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DUCK_OTHERS
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_4
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_4
     * @tc.desc   test AudioSessionManager operation:设置音频并发模式为暂停模式,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_4', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_PAUSE_OTHERS
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_5
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_5
     * @tc.desc   test AudioSessionManager operation: 设置音频并发模式为undefined,查询音频会话状态是否激活,预期结果是未激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy | undefined = undefined;
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, !isDone);
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_6
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_6
     * @tc.desc   test AudioSessionManager operation: 调用去激活,查询音频会话状态是否激活,预期结果是未激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_6', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_7
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_7
     * @tc.desc   test AudioSessionManager operation:调用激活-激活,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_7', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_8
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_8
     * @tc.desc   test AudioSessionManager operation:调用激活-激活,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_8', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, !isDone);
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_9
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_9
     * @tc.desc   test AudioSessionManager operation:调用未激活-激活,查询音频会话状态是否激活,预期结果是激活
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_9', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await deactivateAudioSession(done, !isDone);
      isAudioSessionActivatedFalse(done, !isDone);
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      isAudioSessionActivatedTrue(done, isDone);
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_10
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_10
     * @tc.desc   test AudioSessionManager operation:调用AudioSessionManager注册事件和关闭注册事件覆盖参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_10', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      sessionManager.on('audioSessionDeactivated', (audioSessionDeactivatedEvent: audio.AudioSessionDeactivatedEvent) => {
        if(audioSessionDeactivatedEvent.reason === audio.AudioSessionDeactivatedReason.DEACTIVATED_LOWER_PRIORITY){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }else if(audioSessionDeactivatedEvent.reason === audio.AudioSessionDeactivatedReason.DEACTIVATED_TIMEOUT){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }
      });
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: AudioConcurrencyMode.CONCURRENCY_DEFAULT
      }
      await activateAudioSession(strategy, done, !isDone);
      sessionManager.off('audioSessionDeactivated', (audioSessionDeactivatedEvent: audio.AudioSessionDeactivatedEvent) => {
        if(audioSessionDeactivatedEvent.reason === audio.AudioSessionDeactivatedReason.DEACTIVATED_LOWER_PRIORITY){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }else if(audioSessionDeactivatedEvent.reason === audio.AudioSessionDeactivatedReason.DEACTIVATED_TIMEOUT){
          console.info(`reason of audioSessionDeactivated: ${audioSessionDeactivatedEvent.reason} `);
        }
      });
      isAudioSessionActivatedTrue(done, isDone);
    })
    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_11
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_11
     * @tc.desc   test AudioSessionManager operation:调用AudioSessionManager注册事件和关闭注册事件覆盖参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_11', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sessionManager.on('audioSessionStateChanged', (AudioSessionStateChangedEvent: audio.AudioSessionStateChangedEvent) => {
        if(AudioSessionStateChangedEvent.stateChangeHint === audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_RESUME){
          console.info(`reason of audioSessionDeactivated: ${AudioSessionStateChangedEvent.stateChangeHint} `);
        }
      });
      } catch (err) {
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_12
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_12
     * @tc.desc   test AudioSessionManager operation:调用AudioSessionManager注册事件和关闭注册事件覆盖参数
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_12', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        sessionManager.on('currentOutputDeviceChanged', (CurrentOutputDeviceChangedEvent: audio.CurrentOutputDeviceChangedEvent) => {
        console.info(`devices of currentOutputDeviceChanged: ${CurrentOutputDeviceChangedEvent.devices} `);
        console.info(`changeReason of currentOutputDeviceChanged: ${CurrentOutputDeviceChangedEvent.changeReason} `);
        console.info(`recommendedAction of currentOutputDeviceChanged: ${CurrentOutputDeviceChangedEvent.recommendedAction} `);
      });
      } catch (err) {
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_13
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_13
     * @tc.desc   test AudioSessionManager operation: setAudioSessionScene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_13', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        console.info(`setAudioSessionScene AUDIO_SESSION_SCENE_MEDIA value PASS`);
        expect(true).assertTrue();
      } catch (err) {
        console.info(`setAudioSessionScene AUDIO_SESSION_SCENE_MEDIA value Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_14
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_14
     * @tc.desc   test AudioSessionManager operation: audioSessionStateChanged register with param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_14', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager.on('audioSessionStateChanged', sessionStateChangedEvent);
        console.info(`on audioSessionStateChanged registration PASS`);
        expect(true).assertTrue();
      } catch (err) {
        console.info(`on audioSessionStateChanged registration Error :${err.message}`);
        expect(false).assertTrue();
      }
      try {
        await sessionManager.off('audioSessionStateChanged', sessionStateChangedEvent);
        console.info(`off audioSessionStateChanged unregistration PASS`);
        expect(true).assertTrue();
      } catch (err) {
        console.info(`off audioSessionStateChanged unregistration Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_15
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_15
     * @tc.desc   test AudioSessionManager operation: audioSessionStateChanged register with no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_15', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager.on('audioSessionStateChanged', sessionStateChangedEvent);
        console.info(`on audioSessionStateChanged registration PASS`);
        expect(true).assertTrue();
      } catch (err) {
        console.info(`on audioSessionStateChanged registration Error :${err.message}`);
        expect(false).assertTrue();
      }
      try {
        await sessionManager.off('audioSessionStateChanged');
        console.info(`off audioSessionStateChanged all function unregistration PASS`);
        expect(true).assertTrue();
      } catch (err) {
        console.info(`off audioSessionStateChanged all function unregistration Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_16
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_16
     * @tc.desc   test AudioSessionManager operation: getDefaultOutputDevice/setDefaultOutputDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_16', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let data = await sessionManager.getDefaultOutputDevice();
        console.info(`getDefaultOutputDevice success`);
        expect(data).assertEqual(audio.DeviceType.INVALID);
      } catch (err) {
        console.info(`getDefaultOutputDevice value failed, Error :${err.message}`);
        expect(false).assertTrue();
      }

      try {
        await sessionManager.setDefaultOutputDevice(audio.DeviceType.DEFAULT);
        console.info(`setDefaultOutputDevice DEFAULT value PASS`);
        expect(true).assertTrue();
      } catch (err) {
        if (err.code != audio.AudioErrors.ERROR_SYSTEM) {
          console.info(`setDefaultOutputDevice DEFAULT value Error :${err.message}`);
          expect(false).assertTrue();
        }
      }

      try {
        let data = await sessionManager.getDefaultOutputDevice();
        console.info(`getDefaultOutputDevice success`);
        expect(true).assertTrue();
      } catch (err) {
        console.info(`getDefaultOutputDevice value failed, Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_17
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_17
     * @tc.desc   test AudioSessionManager operation: currentOutputDeviceChanged register with param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_17', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager.on('currentOutputDeviceChanged', sessionDeviceChangedChangedEvent);
        console.info(`on currentOutputDeviceChanged registration PASS`);
        expect(true).assertTrue();
      } catch (err) {
        console.info(`on currentOutputDeviceChanged registration Error :${err.message}`);
        expect(false).assertTrue();
      }
      try {
        await sessionManager.off('currentOutputDeviceChanged', sessionDeviceChangedChangedEvent);
        console.info(`off currentOutputDeviceChanged unregistration PASS`);
        expect(true).assertTrue();
      } catch (err) {
        console.info(`off currentOutputDeviceChanged unregistration Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIOSESSIONMANAGER_API_18
     * @tc.number SUB_AUDIO_AUDIOSESSIONMANAGER_API_18
     * @tc.desc   test AudioSessionManager operation: currentOutputDeviceChanged register with no param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIOSESSIONMANAGER_API_18', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await sessionManager.on('currentOutputDeviceChanged', sessionDeviceChangedChangedEvent);
        console.info(`on currentOutputDeviceChanged registration PASS`);
        expect(true).assertTrue();
      } catch (err) {
        console.info(`on currentOutputDeviceChanged registration Error :${err.message}`);
        expect(false).assertTrue();
      }
      try {
        await sessionManager.off('currentOutputDeviceChanged');
        console.info(`off currentOutputDeviceChanged all function unregistration PASS`);
        expect(true).assertTrue();
      } catch (err) {
        console.info(`off currentOutputDeviceChanged all function unregistration Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETAUDIOSESSIONSCENE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETAUDIOSESSIONSCENE_0100
     * @tc.desc   setAudioSessionScene -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETAUDIOSESSIONSCENE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        let audioSession:ESObject = "1";
        audioSessionManager.setAudioSessionScene(audioSession);
        expect(false).assertTrue();
        done();
      } catch (err) {
        expect(Number(err.code)).assertEqual(6800101);
        console.info(`${TAG}: err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_GETAVAILABLEDEVICE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_GETAVAILABLEDEVICE_0100
     * @tc.desc   setAudioSessionScene -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_GETAVAILABLEDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        let audioSession:ESObject = 100;
        audioSessionManager.getAvailableDevices(audioSession);
        expect(false).assertTrue();
        done();
      } catch (err) {
        expect(Number(err.code)).assertEqual(6800101);
        console.info(`${TAG}: err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_ONAVAILABLEDEVICE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_ONAVAILABLEDEVICE_0100
     * @tc.desc   setAudioSessionScene -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_ONAVAILABLEDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        let audioSession:ESObject = 100;
        audioSessionManager.on('availableDeviceChange',audioSession,(deviceChanged: audio.DeviceChangeAction) =>{
          console.info(`${TAG}: availbleDeviceChange errors`);
          expect(false).assertTrue();
        });
        done();
      } catch (err) {
        expect(Number(err.code)).assertEqual(6800101);
        console.info(`${TAG}: err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_0100
     * @tc.desc   setDefaultOutputDevice -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        audioSessionManager.setDefaultOutputDevice(audio.DeviceType.INVALID);
        expect(false).assertTrue();
        done();
      } catch (err) {
        expect(Number(err.code)).assertEqual(6800101);
        console.info(`${TAG}: err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_0200
     * @tc.desc   setDefaultOutputDevice -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        audioSessionManager.setDefaultOutputDevice(-1 as audio.DeviceType);
        expect(false).assertTrue();
        done();
      } catch (err) {
        expect(Number(err.code)).assertEqual(6800101);
        console.info(`${TAG}: err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_0300
     * @tc.desc   setDefaultOutputDevice -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSION_SETDEFAULTOUTPUTDEVICE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        let parm:ESObject = "1";
        audioSessionManager.setDefaultOutputDevice(parm);
        expect(false).assertTrue();
        done();
      } catch (err) {
        expect(Number(err.code)).assertEqual(6800101);
        console.info(`${TAG}: err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSION__SETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSION__SETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0100
     * @tc.desc   setBluetoothAndNearlinkPreferredRecordCategory -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSION__SETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        let recordCategory:ESObject = 5;
        audioSessionManager.setBluetoothAndNearlinkPreferredRecordCategory(recordCategory);
        expect(false).assertTrue();
        done();
      } catch (err) {
        expect(Number(err.code)).assertEqual(6800101);
        console.info(`${TAG}: err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSION__ONCURRENTINPUTDEVICECHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSION__ONCURRENTINPUTDEVICECHANGED_0100
     * @tc.desc   oncurrentInputDeviceChanged -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSION__ONCURRENTINPUTDEVICECHANGED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        await audioSessionManager.on('currentInputDeviceChanged', (event: audio.CurrentInputDeviceChangedEvent) => {
          console.info(`devices of currentInputDeviceChanged: ${event.devices} `);
          console.info(`changeReason of currentInputDeviceChanged: ${event.changeReason} `);
        });
        expect(true).assertTrue();
        done();
      } catch (err) {
        expect(false).assertTrue();
        console.info(`${TAG}: err.code: ${err.code}, err.message: ${err.message}`);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_0100
     * @tc.desc   inputAudioDevice -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      let inputAudioDevice : ESObject = {
        deviceRole: -100,
        deviceType:-100,
        id:-100,
        name:'1',
        address:'1',
        sampleRates:[1],
        channelCounts:[1],
        channelMasks:[1],
        displayName:'1',
        encodingTypes:[1],
        spatializationSupported:false,
        networkId:'1',
        interruptGroupId:1,
        volumeGroupId:1
      }
      await audioSessionManager.selectMediaInputDevice(inputAudioDevice).then(() => {
        console.info('Succeeded in doing selectMediaInputDevice.');
      }).catch((selectErr: BusinessError) => {
        expect(Number(selectErr.code)).assertEqual(6800101);
        console.error(`Failed to selectMediaInputDevice. Code: ${selectErr.code}, message: ${selectErr.message}`);
      });
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETSELECTMEDIAINPUTDEVICE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETSELECTMEDIAINPUTDEVICE_0100
     * @tc.desc   inputAudioDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETSELECTMEDIAINPUTDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager:audio.AudioManager = audio.getAudioManager();
      let audioSessionManager:audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        let data: audio.AudioDeviceDescriptors = await audioSessionManager.getAvailableDevices(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES);
        console.info('Succeeded in doing getAvailableDevices.');
        if (data[0]) {
          await audioSessionManager.selectMediaInputDevice(data[0]).then(() => {
            console.info('Succeeded in doing selectMediaInputDevice.');
            let device: audio.AudioDeviceDescriptor = audioSessionManager.getSelectedMediaInputDevice();
            console.info(`DeviceInfo id: ${device.id}`);
            expect(device.id).assertLargerOrEqual(0);
            console.info(`DeviceInfo type: ${device.deviceType}`);
            expect(device.deviceType).assertLargerOrEqual(0);
            console.info(`DeviceInfo role: ${device.deviceRole}`);
            expect(device.deviceRole).assertLargerOrEqual(0);
            console.info(`DeviceInfo name: ${device.name}`);
            expect(device.name).assertInstanceOf('String');
            console.info(`DeviceInfo address: ${device.address}`);
            expect(device.address).assertInstanceOf('String');
            console.info(`DeviceInfo samplerate: ${device.sampleRates[0]}`);
            expect(device.sampleRates[0]).assertLargerOrEqual(0);
            console.info(`DeviceInfo channelcount: ${device.channelCounts[0]}`);
            expect(device.channelCounts[0]).assertLargerOrEqual(0);
            console.info(`DeviceInfo channelMasks: ${device.channelMasks[0]}`);
            expect(device.channelMasks[0]).assertLargerOrEqual(0);
            console.info(`DeviceInfo displayName: ${device.displayName}`);
            expect(device.displayName).assertInstanceOf('String');
            console.info(`DeviceInfo encodingTypes: ${device.encodingTypes?.[0]}`);
            expect(device.encodingTypes?.[0]).assertLargerOrEqual(0);
            console.info(`DeviceInfo spatializationSupported: ${device.spatializationSupported}`);
            expect(device.spatializationSupported).assertInstanceOf('Boolean');
            console.info(`DeviceInfo model: ${device.model}`);
            expect(device.model).assertInstanceOf('String');
            console.info(`DeviceInfo capabilities: ${device.capabilities}`);
            expect(device.capabilities).assertInstanceOf('Array');
            console.info('Succeeded in doing getSelectedMediaInputDevice.');
            done();
          }).catch((selectErr: BusinessError) => {
            console.error(`Failed to selectMediaInputDevice. Code: ${selectErr.code}, message: ${selectErr.message}`);
          });
        }
        done();
      } catch (err) {
        console.error(`Failed to getSelectedMediaInputDevice. Code: ${err.code}, message: ${err.message}`);
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETDEFAULTOUTPUTDEVICE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETDEFAULTOUTPUTDEVICE_0100
     * @tc.desc   inputAudioDevice -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETDEFAULTOUTPUTDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
      try{
        let deviceType = audioSessionManager.getDefaultOutputDevice();
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
      }catch (err){
        console.log('getDefaultOutputDevice failed, err :' + err.message)
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0100
     * @tc.desc   getBluetoothAndNearlinkPreferredRecordCategory-PREFERRED_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
      const category = audio.BluetoothAndNearlinkPreferredRecordCategory.PREFERRED_NONE;
      audioSessionManager.setBluetoothAndNearlinkPreferredRecordCategory(category).then(() => {
        console.info('Succeeded in doing setBluetoothAndNearlinkPreferredRecordCategory.');
        try {
          let categoryValue: audio.BluetoothAndNearlinkPreferredRecordCategory = audioSessionManager.getBluetoothAndNearlinkPreferredRecordCategory();
          console.info('Succeeded in doing getBluetoothAndNearlinkPreferredRecordCategory.');
          if (categoryValue == audio.BluetoothAndNearlinkPreferredRecordCategory.PREFERRED_NONE) {
            console.info(`BluetoothAndNearlinkPreferredRecordCategory is :${categoryValue}`);
            expect(categoryValue).assertEqual(0);
          }
        } catch (err) {
          let error = err as BusinessError;
          console.error(`Failed to getBluetoothAndNearlinkPreferredRecordCategory. Code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.error(`Failed to setBluetoothAndNearlinkPreferredRecordCategory. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0200
     * @tc.desc   getBluetoothAndNearlinkPreferredRecordCategory-PREFERRED_DEFAULT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
      const category = audio.BluetoothAndNearlinkPreferredRecordCategory.PREFERRED_DEFAULT;
      audioSessionManager.setBluetoothAndNearlinkPreferredRecordCategory(category).then(() => {
        console.info('Succeeded in doing setBluetoothAndNearlinkPreferredRecordCategory.');
        try {
          let categoryValue: audio.BluetoothAndNearlinkPreferredRecordCategory = audioSessionManager.getBluetoothAndNearlinkPreferredRecordCategory();
          console.info('Succeeded in doing getBluetoothAndNearlinkPreferredRecordCategory.');
          if (categoryValue == audio.BluetoothAndNearlinkPreferredRecordCategory.PREFERRED_DEFAULT) {
            console.info(`BluetoothAndNearlinkPreferredRecordCategory is :${categoryValue}`);
            expect(categoryValue).assertEqual(1);
          }
        } catch (err) {
          let error = err as BusinessError;
          console.error(`Failed to getBluetoothAndNearlinkPreferredRecordCategory. Code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.error(`Failed to setBluetoothAndNearlinkPreferredRecordCategory. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0300
     * @tc.desc   getBluetoothAndNearlinkPreferredRecordCategory-PREFERRED_LOW_LATENCY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
      const category = audio.BluetoothAndNearlinkPreferredRecordCategory.PREFERRED_LOW_LATENCY;
      audioSessionManager.setBluetoothAndNearlinkPreferredRecordCategory(category).then(() => {
        console.info('Succeeded in doing setBluetoothAndNearlinkPreferredRecordCategory.');
        try {
          let categoryValue: audio.BluetoothAndNearlinkPreferredRecordCategory = audioSessionManager.getBluetoothAndNearlinkPreferredRecordCategory();
          console.info('Succeeded in doing getBluetoothAndNearlinkPreferredRecordCategory.');
          if (categoryValue == audio.BluetoothAndNearlinkPreferredRecordCategory.PREFERRED_LOW_LATENCY) {
            console.info(`BluetoothAndNearlinkPreferredRecordCategory is :${categoryValue}`);
            expect(categoryValue).assertEqual(2);
          }
        } catch (err) {
          let error = err as BusinessError;
          console.error(`Failed to getBluetoothAndNearlinkPreferredRecordCategory. Code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.error(`Failed to setBluetoothAndNearlinkPreferredRecordCategory. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0400
     * @tc.desc   getBluetoothAndNearlinkPreferredRecordCategory-PREFERRED_HIGH_QUALITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_GETBLUETOOTHANDNEARLINKPREFERREDRECORDCATEGORY_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
      const category = audio.BluetoothAndNearlinkPreferredRecordCategory.PREFERRED_HIGH_QUALITY;
      audioSessionManager.setBluetoothAndNearlinkPreferredRecordCategory(category).then(() => {
        console.info('Succeeded in doing setBluetoothAndNearlinkPreferredRecordCategory.');
        try {
          let categoryValue: audio.BluetoothAndNearlinkPreferredRecordCategory = audioSessionManager.getBluetoothAndNearlinkPreferredRecordCategory();
          console.info('Succeeded in doing getBluetoothAndNearlinkPreferredRecordCategory.');
          if (categoryValue == audio.BluetoothAndNearlinkPreferredRecordCategory.PREFERRED_HIGH_QUALITY) {
            console.info(`BluetoothAndNearlinkPreferredRecordCategory is :${categoryValue}`);
            expect(categoryValue).assertEqual(3);
          }
        } catch (err) {
          let error = err as BusinessError;
          console.error(`Failed to getBluetoothAndNearlinkPreferredRecordCategory. Code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.error(`Failed to setBluetoothAndNearlinkPreferredRecordCategory. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })
  })
}