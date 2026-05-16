/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import audio from '@ohos.multimedia.audio';

let sessionManager: audio.AudioSessionManager;
let audioSessionManager: audio.AudioSessionManager;
let audioManager: audio.AudioManager;
let TagFrmwk: string = "AudioSessionManagerTest";

// 创建音频会话管理器
async function getSessionManager() {
  audioManager = audio.getAudioManager();
  expect(audioManager).not().assertUndefined();
  expect(audioManager).not().assertNull();
  console.info('getAudioManager audioManager:' + audioManager);
  sessionManager = audioManager.getSessionManager();
  audioSessionManager = audioManager.getSessionManager();
  expect(sessionManager).not().assertUndefined();
  expect(sessionManager).not().assertNull();
  console.info('getSessionManager sessionManager:' + sessionManager);
}

export default function audioSessionManagerTest() {
  describe('audioSessionManagerTest', () => {
    const TAG = 'AudioSessionManagerSetMediaOutputDeviceTest';
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
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-set-true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          if (sessionManager.isAudioSessionActivated()) {
            await sessionManager.deactivateAudioSession();
            console.info(`deactivateAudioSession succeed`);
          }
          sessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
          console.info(`setAudioSessionScene succeed`);
          sessionManager.enableMuteSuggestionWhenMixWithOthers(true);
          console.info(`enableMuteSuggestionWhenMixWithOthers succeed`);
        } catch (err) {
          let error = err as BusinessError;
          console.error(`Failed to ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100. Code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0200
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-set-false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try {
          if (sessionManager.isAudioSessionActivated()) {
            await sessionManager.deactivateAudioSession();
            console.info(`deactivateAudioSession succeed`);
          }
          sessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
          console.info(`setAudioSessionScene succeed`);
          sessionManager.enableMuteSuggestionWhenMixWithOthers(false);
          console.info(`enableMuteSuggestionWhenMixWithOthers succeed`);
        } catch (err) {
          let error = err as BusinessError;
          console.error(`Failed to ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100. Code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0300
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-without setting scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let strategy: audio.AudioSessionStrategy = {
            concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
          }
          await sessionManager.activateAudioSession(strategy);
          await sessionManager.deactivateAudioSession();
          console.info(`deactivateAudioSession succeed`);
          sessionManager.enableMuteSuggestionWhenMixWithOthers(true);
          expect(false).assertTrue();
        } catch (err) {
          console.info(`enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
          expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0400
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-after active call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let strategy: audio.AudioSessionStrategy = {
            concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
          }
          await sessionManager.activateAudioSession(strategy);
          console.info(`activateAudioSession succeed`);
          sessionManager.enableMuteSuggestionWhenMixWithOthers(true);
          expect(false).assertTrue();
        } catch (err) {
          console.info(`enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
          expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
        }
        done();
      })
    
    /**
     * @tc.name   AUDIOSESSIONMANAGER_ISOTHERMEDIAPLAYING_001
     * @tc.number AUDIOSESSIONMANAGER_ISOTHERMEDIAPLAYING_001
     * @tc.desc   IsOtherMediaPlaying
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('AUDIOSESSIONMANAGER_ISOTHERMEDIAPLAYING_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let audioManager: audio.AudioManager = audio.getAudioManager();
      let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        let isExistence: boolean = audioSessionManager.isOtherMediaPlaying();
        console.info(`ISOTHERMEDIAPLAYING_001 isExistence is: ${isExistence}`);
        expect(isExistence).assertFalse();
      } catch (err) {
        console.info(`ISOTHERMEDIAPLAYING_001 err.code: ${err.code}, err.message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_1343
     * @tc.number AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_1343
     * @tc.desc   selectMediaInputDevice with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_1343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager: audio.AudioManager = audio.getAudioManager();
      let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        await audioSessionManager.selectMediaInputDevice(null);
        console.info(`AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_1343: FAIL`);
      } catch (err) {
        console.info(`AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_1343: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_1344
     * @tc.number AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_1344
     * @tc.desc   selectMediaInputDevice with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_1344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioManager: audio.AudioManager = audio.getAudioManager();
      let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
      try {
        await audioSessionManager.selectMediaInputDevice(undefined);
        console.info(`AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_1344: PASS`);
      } catch (err) {
        console.info(`AUDIOSESSIONMANAGER_SELECTMEDIAINPUTDEVICE_1344: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    });
    /**
    * @tc.name   AUDIO_SESSION_MANAGER_ACTIVATE_AUDIO_SESSION_CONCURRENCY_MIX_WITH_OTHERS_0100
    * @tc.number AUDIO_SESSION_MANAGER_ACTIVATE_AUDIO_SESSION_CONCURRENCY_MIX_WITH_OTHERS_0100
    * @tc.desc   activateAudioSession with CONCURRENCY_MIX_WITH_OTHERS test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_ACTIVATE_AUDIO_SESSION_CONCURRENCY_MIX_WITH_OTHERS_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
        };
        await audioSessionManager.activateAudioSession(strategy);
        console.info(`${TagFrmwk}: activateAudioSession with CONCURRENCY_MIX_WITH_OTHERS: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: activateAudioSession with CONCURRENCY_MIX_WITH_OTHERS: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_ACTIVATE_AUDIO_SESSION_CONCURRENCY_DUCK_OTHERS_0100
    * @tc.number AUDIO_SESSION_MANAGER_ACTIVATE_AUDIO_SESSION_CONCURRENCY_DUCK_OTHERS_0100
    * @tc.desc   activateAudioSession with CONCURRENCY_DUCK_OTHERS test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_ACTIVATE_AUDIO_SESSION_CONCURRENCY_DUCK_OTHERS_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DUCK_OTHERS
        };
        await audioSessionManager.activateAudioSession(strategy);
        console.info(`${TagFrmwk}: activateAudioSession with CONCURRENCY_DUCK_OTHERS: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: activateAudioSession with CONCURRENCY_DUCK_OTHERS: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_ACTIVATE_AUDIO_SESSION_CONCURRENCY_PAUSE_OTHERS_0100
    * @tc.number AUDIO_SESSION_MANAGER_ACTIVATE_AUDIO_SESSION_CONCURRENCY_PAUSE_OTHERS_0100
    * @tc.desc   activateAudioSession with CONCURRENCY_PAUSE_OTHERS test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_ACTIVATE_AUDIO_SESSION_CONCURRENCY_PAUSE_OTHERS_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_PAUSE_OTHERS
        };
        await audioSessionManager.activateAudioSession(strategy);
        console.info(`${TagFrmwk}: activateAudioSession with CONCURRENCY_PAUSE_OTHERS: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: activateAudioSession with CONCURRENCY_PAUSE_OTHERS: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_GAME_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_GAME_0100
    * @tc.desc   setAudioSessionScene with AUDIO_SESSION_SCENE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_GAME_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_GAME);
        console.info(`${TagFrmwk}: setAudioSessionScene with AUDIO_SESSION_SCENE_GAME: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: setAudioSessionScene with AUDIO_SESSION_SCENE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_VOICE_COMMUNICATION_0100
    * @tc.desc   setAudioSessionScene with AUDIO_SESSION_SCENE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_AUDIO_SESSION_SCENE_VOICE_COMMUNICATION_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioSessionManager.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION);
        console.info(`${TagFrmwk}: setAudioSessionScene with AUDIO_SESSION_SCENE_VOICE_COMMUNICATION: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: setAudioSessionScene with AUDIO_SESSION_SCENE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_EARPIECE_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_EARPIECE_0100
    * @tc.desc   setDefaultOutputDevice with EARPIECE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_EARPIECE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.EARPIECE);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with EARPIECE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with EARPIECE: FAIL :${(err as BusinessError).message}`);
        if (6800301 == Number(err.code)) {
          expect(Number(err.code)).assertEqual(6800301);
        } else {
          expect().assertFail();
        }
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_SPEAKER_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_SPEAKER_0100
    * @tc.desc   setDefaultOutputDevice with SPEAKER test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_SPEAKER_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.SPEAKER);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with SPEAKER: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with SPEAKER: FAIL :${(err as BusinessError).message}`)
        if (6800301 == Number(err.code)) {
          expect(Number(err.code)).assertEqual(6800301);
        } else {
          expect().assertFail();
        }
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_WIRED_HEADSET_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_WIRED_HEADSET_0100
    * @tc.desc   setDefaultOutputDevice with WIRED_HEADSET test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_WIRED_HEADSET_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.WIRED_HEADSET);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with WIRED_HEADSET: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with WIRED_HEADSET: FAIL : :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_WIRED_HEADPHONES_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_WIRED_HEADPHONES_0100
    * @tc.desc   setDefaultOutputDevice with WIRED_HEADPHONES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_WIRED_HEADPHONES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.WIRED_HEADPHONES);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with WIRED_HEADPHONES: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with WIRED_HEADPHONES: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_BLUETOOTH_SCO_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_BLUETOOTH_SCO_0100
    * @tc.desc   setDefaultOutputDevice with BLUETOOTH_SCO test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_BLUETOOTH_SCO_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.BLUETOOTH_SCO);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with BLUETOOTH_SCO: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with BLUETOOTH_SCO: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_BLUETOOTH_A2DP_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_BLUETOOTH_A2DP_0100
    * @tc.desc   setDefaultOutputDevice with BLUETOOTH_A2DP test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_BLUETOOTH_A2DP_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.BLUETOOTH_A2DP);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with BLUETOOTH_A2DP: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with BLUETOOTH_A2DP: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_MIC_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_MIC_0100
    * @tc.desc   setDefaultOutputDevice with MIC test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_MIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.MIC);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with MIC: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with MIC: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_USB_HEADSET_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_USB_HEADSET_0100
    * @tc.desc   setDefaultOutputDevice with USB_HEADSET test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_USB_HEADSET_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.USB_HEADSET);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with USB_HEADSET: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with USB_HEADSET: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_DISPLAY_PORT_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_DISPLAY_PORT_0100
    * @tc.desc   setDefaultOutputDevice with DISPLAY_PORT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_DISPLAY_PORT_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.DISPLAY_PORT);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with DISPLAY_PORT: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with DISPLAY_PORT: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_REMOTE_CAST_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_REMOTE_CAST_0100
    * @tc.desc   setDefaultOutputDevice with REMOTE_CAST test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_REMOTE_CAST_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.REMOTE_CAST);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with REMOTE_CAST: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with REMOTE_CAST: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_USB_DEVICE_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_USB_DEVICE_0100
    * @tc.desc   setDefaultOutputDevice with USB_DEVICE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_USB_DEVICE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.USB_DEVICE);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with USB_DEVICE: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with USB_DEVICE: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_HDMI_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_HDMI_0100
    * @tc.desc   setDefaultOutputDevice with HDMI test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_HDMI_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.HDMI);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with HDMI: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with HDMI: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_LINE_DIGITAL_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_LINE_DIGITAL_0100
    * @tc.desc   setDefaultOutputDevice with LINE_DIGITAL test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_LINE_DIGITAL_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.LINE_DIGITAL);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with LINE_DIGITAL: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with LINE_DIGITAL: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_REMOTE_DAUDIO_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_REMOTE_DAUDIO_0100
    * @tc.desc   setDefaultOutputDevice with REMOTE_DAUDIO test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_REMOTE_DAUDIO_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.REMOTE_DAUDIO);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with REMOTE_DAUDIO: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with REMOTE_DAUDIO: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_HEARING_AID_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_HEARING_AID_0100
    * @tc.desc   setDefaultOutputDevice with HEARING_AID test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_HEARING_AID_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.HEARING_AID);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with HEARING_AID: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with HEARING_AID: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_NEARLINK_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_NEARLINK_0100
    * @tc.desc   setDefaultOutputDevice with NEARLINK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_NEARLINK_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.NEARLINK);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with NEARLINK: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with NEARLINK: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_SET_DEFAULTaringOutput_DEVICE_SYSTEM_PRIVATE_0100
    * @tc.number AUDIO_SESSION_MANAGER_SET_DEFAULT_OUTPUT_DEVICE_SYSTEM_PRIVATE_0100
    * @tc.desc   setDefaultOutputDevice with SYSTEM_PRIVATE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_SET_DEFAULTaringOutput_DEVICE_SYSTEM_PRIVATE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioSessionManager.setDefaultOutputDevice(audio.DeviceType.SYSTEM_PRIVATE);
        console.info(`${TagFrmwk}: setDefaultOutputDevice with System_PRIVATE: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setDefaultOutputDevice with SYSTEM_PRIVATE: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_MEDIA_INPUT_DEVICES_0100
    * @tc.number AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_MEDIA_INPUT_DEVICES_0100
    * @tc.desc   getAvailableDevices with MEDIA_INPUT_DEVICES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_MEDIA_INPUT_DEVICES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let devices = audioSessionManager.getAvailableDevices(audio.DeviceUsage.MEDIA_INPUT_DEVICES);
        console.info(`${TagFrmwk}: getAvailableDevices with MEDIA_INPUT_DEVICES: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getAvailableDevices with MEDIA_INPUT_DEVICES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_ALL_MEDIA_DEVICES_0100
    * @tc.number AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_ALL_MEDIA_DEVICES_0100
    * @tc.desc   getAvailableDevices with ALL_MEDIA_DEVICES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_ALL_MEDIA_DEVICES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let devices = audioSessionManager.getAvailableDevices(audio.DeviceUsage.ALL_MEDIA_DEVICES);
        console.info(`${TagFrmwk}: getAvailableDevices with ALL_MEDIA_DEVICES: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getAvailableDevices with ALL_MEDIA_DEVICES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_CALL_OUTPUT_DEVICES_0100
    * @tc.number AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_CALL_OUTPUT_DEVICES_0100
    * @tc.desc   getAvailableDevices with CALL_OUTPUT_DEVICES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_CALL_OUTPUT_DEVICES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let devices = audioSessionManager.getAvailableDevices(audio.DeviceUsage.CALL_OUTPUT_DEVICES);
        console.info(`${TagFrmwk}: getAvailableDevices with CALL_OUTPUT_DEVICES: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getAvailableDevices with CALL_OUTPUT_DEVICES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_CALL_INPUT_DEVICES_0100
    * @tc.number AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_CALL_INPUT_DEVICES_0100
    * @tc.desc   getAvailableDevices with CALL_INPUT_DEVICES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_CALL_INPUT_DEVICES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let devices = audioSessionManager.getAvailableDevices(audio.DeviceUsage.CALL_INPUT_DEVICES);
        console.info(`${TagFrmwk}: getAvailableDevices with CALL_INPUT_DEVICES: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getAvailableDevices with CALL_INPUT_DEVICES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_ALL_CALL_DEVICES_0100
    * @tc.number AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_ALL_CALL_DEVICES_0100
    * @tc.desc   getAvailableDevices with ALL_CALL_DEVICES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_GET_AVAILABLE_DEVICES_ALL_CALL_DEVICES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let devices = audioSessionManager.getAvailableDevices(audio.DeviceUsage.ALL_CALL_DEVICES);
        console.info(`${TagFrmwk}: getAvailableDevices with ALL_CALL_DEVICES: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getAvailableDevices with ALL_CALL_DEVICES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_MEDIA_OUTPUT_DEVICES_0100
    * @tc.number AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_MEDIA_OUTPUT_DEVICES_0100
    * @tc.desc   on availableDeviceChange with MEDIA_OUTPUT_DEVICES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_MEDIA_OUTPUT_DEVICES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioSessionManager.on('availableDeviceChange', audio.DeviceUsage.MEDIA_OUTPUT_DEVICES, (deviceChangeAction) => {
          console.info(`${TagFrmwk}: on availableDeviceChange with MEDIA_OUTPUT_DEVICES: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on availableDeviceChange with MEDIA_OUTPUT_DEVICES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_ALL_MEDIA_DEVICES_0100
    * @tc.number AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_ALL_MEDIA_DEVICES_0100
    * @tc.desc   on availableDeviceChange with ALL_MEDIA_DEVICES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_ALL_MEDIA_DEVICES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioSessionManager.on('availableDeviceChange', audio.DeviceUsage.ALL_MEDIA_DEVICES, (deviceChangeAction) => {
          console.info(`${TagFrmwk}: on availableDeviceChange with ALL_MEDIA_DEVICES: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on availableDeviceChange with ALL_MEDIA_DEVICES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_CALL_OUTPUT_DEVICES_0100
    * @tc.number AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_CALL_OUTPUT_DEVICES_0100
    * @tc.desc   on availableDeviceChange with CALL_OUTPUT_DEVICES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_CALL_OUTPUT_DEVICES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioSessionManager.on('availableDeviceChange', audio.DeviceUsage.CALL_OUTPUT_DEVICES, (deviceChangeAction) => {
          console.info(`${TagFrmwk}: on availableDeviceChange with CALL_OUTPUT_DEVICES: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on availableDeviceChange with CALL_OUTPUT_DEVICES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_CALL_INPUT_DEVICES_0100
    * @tc.number AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_CALL_INPUT_DEVICES_0100
    * @tc.desc   on availableDeviceChange with CALL_INPUT_DEVICES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_CALL_INPUT_DEVICES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioSessionManager.on('availableDeviceChange', audio.DeviceUsage.CALL_INPUT_DEVICES, (deviceChangeAction) => {
          console.info(`${TagFrmwk}: on availableDeviceChange with CALL_INPUT_DEVICES: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on availableDeviceChange with CALL_INPUT_DEVICES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_ALL_CALL_DEVICES_0100
    * @tc.number AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_ALL_CALL_DEVICES_0100
    * @tc.desc   on availableDeviceChange with ALL_CALL_DEVICES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_SESSION_MANAGER_ON_AVAILABLE_DEVICE_CHANGE_ALL_CALL_DEVICES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioSessionManager.on('availableDeviceChange', audio.DeviceUsage.ALL_CALL_DEVICES, (deviceChangeAction) => {
          console.info(`${TagFrmwk}: on availableDeviceChange with ALL_CALL_DEVICES: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on availableDeviceChange with ALL_CALL_DEVICES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_ROLE_INPUT_DEVICE_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_ROLE_INPUT_DEVICE_0100
     * @tc.desc   selectMediaInputDevice with deviceRole INPUT_DEVICE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_ROLE_INPUT_DEVICE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceRole INPUT_DEVICE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceRole INPUT_DEVICE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_ROLE_OUTPUT_DEVICE_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_ROLE_OUTPUT_DEVICE_0100
     * @tc.desc   selectMediaInputDevice with deviceRole OUTPUT_DEVICE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_ROLE_OUTPUT_DEVICE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceRole OUTPUT_DEVICE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceRole OUTPUT_DEVICE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_INVALID_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_INVALID_0100
     * @tc.desc   selectMediaInputDevice with deviceType INVALID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_INVALID_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType INVALID: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType INVALID: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_EARPIECE_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_EARPIECE_0100
     * @tc.desc   selectMediaInputDevice with deviceType EARPIECE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_EARPIECE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType EARPIECE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType EARPIECE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_SPEAKER_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_SPEAKER_0100
     * @tc.desc   selectMediaInputDevice with deviceType SPEAKER test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_SPEAKER_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType SPEAKER: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType SPEAKER: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_WIRED_HEADSET_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_WIRED_HEADSET_0100
     * @tc.desc   selectMediaInputDevice with deviceType WIRED_HEADSET test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_WIRED_HEADSET_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType WIRED_HEADSET: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType WIRED_HEADSET: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_WIRED_HEADPHONES_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_WIRED_HEADPHONES_0100
     * @tc.desc   selectMediaInputDevice with deviceType WIRED_HEADPHONES test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_WIRED_HEADPHONES_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType WIRED_HEADPHONES: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType WIRED_HEADPHONES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_BLUETOOTH_SCO_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_BLUETOOTH_SCO_0100
     * @tc.desc   selectMediaInputDevice with deviceType BLUETOOTH_SCO test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_BLUETOOTH_SCO_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType BLUETOOTH_SCO: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType BLUETOOTH_SCO: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_BLUETOOTH_A2DP_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_BLUETOOTH_A2DP_0100
     * @tc.desc   selectMediaInputDevice with deviceType BLUETOOTH_A2DP test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_BLUETOOTH_A2DP_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType BLUETOOTH_A2DP: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType BLUETOOTH_A2DP: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_MIC_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_MIC_0100
     * @tc.desc   selectMediaInputDevice with deviceType MIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_MIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType MIC: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType MIC: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_USB_HEADSET_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_USB_HEADSET_0100
     * @tc.desc   selectMediaInputDevice with deviceType USB_HEADSET test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_USB_HEADSET_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType USB_HEADSET: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType USB_HEADSET: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_DISPLAY_PORT_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_DISPLAY_PORT_0100
     * @tc.desc   selectMediaInputDevice with deviceType DISPLAY_PORT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_DISPLAY_PORT_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType DISPLAY_PORT: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType DISPLAY_PORT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_REMOTE_CAST_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_REMOTE_CAST_0100
     * @tc.desc   selectMediaInputDevice with deviceType REMOTE_CAST test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_REMOTE_CAST_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType REMOTE_CAST: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType REMOTE_CAST: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_USB_DEVICE_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_USB_DEVICE_0100
     * @tc.desc   selectMediaInputDevice with deviceType USB_DEVICE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_USB_DEVICE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType USB_DEVICE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType USB_DEVICE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_HDMI_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_HDMI_0100
     * @tc.desc   selectMediaInputDevice with deviceType HDMI test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_HDMI_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType HDMI: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType HDMI: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_LINE_DIGITAL_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_LINE_DIGITAL_0100

     * @tc.desc   selectMediaInputDevice with deviceType LINE_DIGITAL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_LINE_DIGITAL_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType LINE_DIGITAL: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType LINE_DIGITAL: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_REMOTE_DAUDIO_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_REMOTE_DAUDIO_0100
     * @tc.desc   selectMediaInputDevice with deviceType REMOTE_DAUDIO test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_REMOTE_DAUDIO_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType REMOTE_DAUDIO: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType REMOTE_DAUDIO: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_HEARING_AID_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_HEARING_AID_0100
     * @tc.desc   selectMediaInputDevice with deviceType HEARING_AID test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_HEARING_AID_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType HEARING_AID: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType HEARING_AID: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_NEARLINK_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_NEARLINK_0100
     * @tc.desc   selectMediaInputDevice with deviceType NEARLINK test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_NEARLINK_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType NEARLINK: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType NEARLINK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_SYSTEM_PRIVATE_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_SYSTEM_PRIVATE_0100
     * @tc.desc   selectMediaInputDevice with deviceType SYSTEM_PRIVATE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_SYSTEM_PRIVATE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType SYSTEM_PRIVATE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType SYSTEM_PRIVATE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_DEFAULT_0100
     * @tc.number AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_DEFAULT_0100
     * @tc.desc   selectMediaInputDevice with deviceType DEFAULT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_SESSION_MANAGER_SELECT_MEDIA_INPUT_DEVICE_DEVICE_TYPE_DEFAULT_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let inputAudioDevice: ESObject = {
          deviceRole: audio.DeviceRole.INPUT_DEVICE,
          deviceType: audio.DeviceType.INVALID,
          id: 0,
          name: '1',
          address: '1',
          sampleRates: [1],
          channelCounts: [1],
          channelMasks: [1],
          displayName: '1',
          networkId: '1',
          interruptGroupId: 1,
          volumeGroupId: 1
        };
        await audioSessionManager.selectMediaInputDevice(inputAudioDevice);
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType DEFAULT: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: selectMediaInputDevice with deviceType DEFAULT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0100 
     * @tc.number AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0100  
     * @tc.desc   setAudioSessionBehavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.MUTE_WHEN_INTERRUPTED;
      try {
        await sessionManager.setAudioSessionBehavior(behavior);
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0100: setAudioSessionBehavior with MUTE_WHEN_INTERRUPTED: PASS`);
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0100: setAudioSessionBehavior with MUTE_WHEN_INTERRUPTED: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0200 
    * @tc.number AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0200  
    * @tc.desc   setAudioSessionBehavior
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR;
      try {
        await sessionManager.setAudioSessionBehavior(behavior);
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0200: setAudioSessionBehavior with DEFALUT: PASS`);
        done();
      } catch (err) {
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0200: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0300 
    * @tc.number AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0300  
    * @tc.desc   setAudioSessionBehavior
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let behavior: ESObject = -1;
      try {
        await sessionManager.setAudioSessionBehavior(behavior);
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0300 : FAIL`);
        done();
      } catch (err) {
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_0300: PASS :${err.message}:${err.code}`);
        expect(Number(err.code)).assertEqual(6800101);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIORVOICE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIORVOICE_0100
     * @tc.desc   setAudioSessionBehavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIORVOICE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.VOIP_PRIVACY_TYPE_PUBLIC;
      try {
        await sessionManager.setAudioSessionBehavior(behavior);
        console.info(`AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIORVOICE_0100: setAudioSessionBehavior with DEFALUT: PASS`);
        done();
      } catch (err) {
        console.info(`AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIORVOICE_0100: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SETAUDIOSESSIONBEHAVIORVOICEREPEATED_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SETAUDIOSESSIONBEHAVIORVOICEREPEATED_0100
     * @tc.desc   setAudioSessionBehavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_SETAUDIOSESSIONBEHAVIORVOICEREPEATED_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.VOIP_PRIVACY_TYPE_PUBLIC;
      try {
        for(let i=0;i < 100; i++){
          await sessionManager.setAudioSessionBehavior(behavior);
      }
        console.info(`SETAUDIOSESSIONBEHAVIORVOICEREPEATED_0100: setAudioSessionBehavior with DEFALUT: PASS`);
        done();
      } catch (err) {
        console.info(`SETAUDIOSESSIONBEHAVIORVOICEREPEATED_0100: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_SPEAKER_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_SPEAKER_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice SPEAKER test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_SPEAKER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_SPEAKER_0100 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.SPEAKER);
        console.info(`${TAG}: setMediaOutputDevice SPEAKER success`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: setMediaOutputDevice SPEAKER failed: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800301);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_DEFAULT_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_DEFAULT_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice DEFAULT test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_DEFAULT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_DEFAULT_0100 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.DEFAULT);
        console.info(`${TAG}: setMediaOutputDevice DEFAULT success`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: setMediaOutputDevice DEFAULT failed: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800301);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_INVALID_PARAM_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_INVALID_PARAM_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice invalid param test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_INVALID_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_INVALID_PARAM_0100 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.BLUETOOTH_SCO);
        console.error(`${TAG}: setMediaOutputDevice BLUETOOTH_SCO should throw error`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${TAG}: setMediaOutputDevice BLUETOOTH_SCO caught error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_UNDEFINED_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_UNDEFINED_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice undefined test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_UNDEFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_UNDEFINED_0100 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(undefined);
        console.error(`${TAG}: setMediaOutputDevice undefined should throw error`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${TAG}: setMediaOutputDevice undefined caught error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_NULL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_NULL_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice null test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_NULL_0100 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(null);
        console.error(`${TAG}: setMediaOutputDevice null should throw error`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${TAG}: setMediaOutputDevice null caught error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_RETURN_VOID_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_RETURN_VOID_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice return void test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_RETURN_VOID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_RETURN_VOID_0100 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        let result: void = await audioSessionManager.setMediaOutputDevice(audio.DeviceType.SPEAKER);
        console.info(`${TAG}: setMediaOutputDevice return void success`);
        expect(result).assertUndefined();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: setMediaOutputDevice failed: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800301);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_WIRED_HEADSET_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_WIRED_HEADSET_0200
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 WIRED_HEADSET test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_WIRED_HEADSET_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_WIRED_HEADSET_0200 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.WIRED_HEADSET);
        console.error(`${TAG}: setMediaOutputDevice WIRED_HEADSET should throw 6800101 error`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${TAG}: setMediaOutputDevice WIRED_HEADSET caught error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_0300
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_0300
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 BLUETOOTH_A2DP test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_0300 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.BLUETOOTH_A2DP);
        console.error(`${TAG}: setMediaOutputDevice BLUETOOTH_A2DP should throw 6800101 error`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${TAG}: setMediaOutputDevice BLUETOOTH_A2DP caught error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_USB_HEADSET_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_USB_HEADSET_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 USB_HEADSET test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_USB_HEADSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_USB_HEADSET_0100 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.USB_HEADSET);
        console.error(`${TAG}: setMediaOutputDevice USB_HEADSET should throw 6800101 error`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${TAG}: setMediaOutputDevice USB_HEADSET caught error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_EARPIECE_0400
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_EARPIECE_0400
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 EARPIECE test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_EARPIECE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_EARPIECE_0400 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.EARPIECE);
        console.error(`${TAG}: setMediaOutputDevice EARPIECE should throw 6800101 error`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${TAG}: setMediaOutputDevice EARPIECE caught error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_SCO_0500
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_SCO_0500
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 BLUETOOTH_SCO test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_SCO_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_SCO_0500 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.BLUETOOTH_SCO);
        console.error(`${TAG}: setMediaOutputDevice BLUETOOTH_SCO should throw 6800101 error`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${TAG}: setMediaOutputDevice BLUETOOTH_SCO caught error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_MIC_0600
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_MIC_0600
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 MIC test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_MIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_MIC_0600 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.MIC);
        console.error(`${TAG}: setMediaOutputDevice MIC should throw 6800101 error`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.info(`${TAG}: setMediaOutputDevice MIC caught error: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ASYNC_PROMISE_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ASYNC_PROMISE_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice async promise test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ASYNC_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ASYNC_PROMISE_0100 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      audioSessionManager.setMediaOutputDevice(audio.DeviceType.SPEAKER).then(() => {
        console.info(`${TAG}: setMediaOutputDevice SPEAKER async success`);
        done();
      }).catch((error: BusinessError) => {
        console.error(`${TAG}: setMediaOutputDevice SPEAKER async failed: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800301);
        done();
      })
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_MULTIPLE_CALL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_MULTIPLE_CALL_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice multiple call test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_MULTIPLE_CALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_MULTIPLE_CALL_0100 start`);
      if (audioSessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.SPEAKER);
        console.info(`${TAG}: first call SPEAKER success`);
        await audioSessionManager.setMediaOutputDevice(audio.DeviceType.DEFAULT);
        console.info(`${TAG}: second call DEFAULT success`);
        done();
      } catch (err) {
        let error = err as BusinessError;
        console.error(`${TAG}: multiple call failed: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800301);
        done();
      }
    })
  })
}