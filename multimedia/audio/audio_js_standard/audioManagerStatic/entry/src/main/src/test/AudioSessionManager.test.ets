/**
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
let TagFrmwk = "audioSessionManagerTest";
let audioManager: audio.AudioManager;
let sessionManager: audio.AudioSessionManager | undefined;
let TAG = 'AudioSessionManagerSetMediaOutputDeviceTest';

function getSessionManager() {
  audioManager = audio.getAudioManager();
  expect(audioManager).not().assertUndefined();
  expect(audioManager).not().assertNull();
  console.info(`${TagFrmwk}: getAudioManager audioManager: ${audioManager}`);
  sessionManager = audioManager.getSessionManager();
  expect(sessionManager).not().assertUndefined();
  expect(sessionManager).not().assertNull();
  console.info(`${TagFrmwk}: getSessionManager sessionManager: ${sessionManager}`);
}

export default function audioSessionManagerTest() {
  describe('audioSessionManagerTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      console.info(`${TagFrmwk}: beforeAll: END`);
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      getSessionManager();
    })

    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(100);
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0100
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-set-true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        if (sessionManager!.isAudioSessionActivated()) {
          await sessionManager!.deactivateAudioSession();
          console.info(`${TagFrmwk}: deactivateAudioSession succeed`);
        }
        sessionManager!.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        console.info(`${TagFrmwk}: setAudioSessionScene succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(true);
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers succeed`);
      } catch (err) {
        console.error(`Failed to ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0100. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0200
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-set-false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        if (sessionManager!.isAudioSessionActivated()) {
          await sessionManager!.deactivateAudioSession();
          console.info(`${TagFrmwk}: deactivateAudioSession succeed`);
        }
        sessionManager!.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
        console.info(`${TagFrmwk}: setAudioSessionScene succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(false);
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers succeed`);
      } catch (err) {
        console.error(`${TagFrmwk}: Failed to ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0200. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0300
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-without setting scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await sessionManager!.activateAudioSession(strategy);
        await sessionManager!.deactivateAudioSession();
        console.info(`${TagFrmwk}: deactivateAudioSession succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(true);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0400
     * @tc.desc   enableMuteSuggestionWhenMixWithOthers-without setting scene
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
        }
        await sessionManager!.activateAudioSession(strategy);
        console.info(`${TagFrmwk}: activateAudioSession succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(true);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
      }
      done();
    })
    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0500
    * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0500
    * @tc.desc   enableMuteSuggestionWhenMixWithOthers-without setting scene
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
        }
        await sessionManager!.activateAudioSession(strategy);
        console.info(`${TagFrmwk}: activateAudioSession succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(true);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0600
    * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0600
    * @tc.desc   enableMuteSuggestionWhenMixWithOthers-without setting scene
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DUCK_OTHERS
        }
        await sessionManager!.activateAudioSession(strategy);
        console.info(`${TagFrmwk}: activateAudioSession succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(true);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0700
    * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0700
    * @tc.desc   enableMuteSuggestionWhenMixWithOthers-without setting scene
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let strategy: audio.AudioSessionStrategy = {
          concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_PAUSE_OTHERS
        }
        await sessionManager!.activateAudioSession(strategy);
        console.info(`${TagFrmwk}: activateAudioSession succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(true);
        expect(false).assertTrue();
      } catch (err) {
        err = err as BusinessError;
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers：err.code: ${err.code}, err.message: ${err.message}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_ILLEGAL_STATE);
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0800
    * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0800
    * @tc.desc   enableMuteSuggestionWhenMixWithOthers-set-false
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        if (sessionManager!.isAudioSessionActivated()) {
          await sessionManager!.deactivateAudioSession();
          console.info(`${TagFrmwk}: deactivateAudioSession succeed`);
        }
        sessionManager!.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION);
        console.info(`${TagFrmwk}: setAudioSessionScene succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(false);
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers succeed`);
      } catch (err) {
        console.error(`${TagFrmwk}: Failed to ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0200. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0900
    * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0900
    * @tc.desc   enableMuteSuggestionWhenMixWithOthers-set-false
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGER_ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        if (sessionManager!.isAudioSessionActivated()) {
          await sessionManager!.deactivateAudioSession();
          console.info(`${TagFrmwk}: deactivateAudioSession succeed`);
        }
        sessionManager!.setAudioSessionScene(audio.AudioSessionScene.AUDIO_SESSION_SCENE_GAME);
        console.info(`${TagFrmwk}: setAudioSessionScene succeed`);
        sessionManager!.enableMuteSuggestionWhenMixWithOthers(false);
        console.info(`${TagFrmwk}: enableMuteSuggestionWhenMixWithOthers succeed`);
      } catch (err) {
        console.error(`${TagFrmwk}: Failed to ENABLEMUTESUGGESTIONWHENMIXWITHOTHERS_0200. Code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   AUDIOSESSIONMANAGER_ISOTHERMEDIAPLAYING_STATIC_001
     * @tc.number AUDIOSESSIONMANAGER_ISOTHERMEDIAPLAYING_STATIC_001
     * @tc.desc   IsOtherMediaPlaying
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSESSIONMANAGER_ISOTHERMEDIAPLAYING_STATIC_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
        try {
            let isExistence: boolean = audioSessionManager.isOtherMediaPlaying();
            console.info(`ISOTHERMEDIAPLAYING_001 isExistence is: ${isExistence}`);
            expect(isExistence).assertFalse();
        } catch (err) {
            console.info(`ISOTHERMEDIAPLAYING_STATIC_001 err.code: ${err.code}, err.message: ${err.message}`);
            expect(false).assertTrue();
        }
        done();
      })

    /**
     * @tc.name   AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0100 
     * @tc.number AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0100  
     * @tc.desc   setAudioSessionBehavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.MUTE_WHEN_INTERRUPTED;
      try {
        sessionManager!.setAudioSessionBehavior(behavior);
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0100: setAudioSessionBehavior with MUTE_WHEN_INTERRUPTED: PASS`);
        done();
      } catch (err) {
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0100: setAudioSessionBehavior with MUTE_WHEN_INTERRUPTED: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0200
    * @tc.number AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0200
    * @tc.desc   setAudioSessionBehavior
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR;
      try {
        sessionManager!.setAudioSessionBehavior(behavior);
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0200: setAudioSessionBehavior with DEFALUT: PASS`);
        done();
      } catch (err) {
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0200: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIOR_STATIC_0300
    * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIOR_STATIC_0300
    * @tc.desc   setAudioSessionBehavior
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIOR_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.VOIP_PRIVACY_TYPE_PUBLIC;
      try {
        sessionManager!.setAudioSessionBehavior(behavior);
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0300: setAudioSessionBehavior with DEFALUT: PASS`);
        done();
      } catch (err) {
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIOR_STATIC_0300: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIORREPEATED_STATIC_0100
    * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIORREPEATED_STATIC_0100
    * @tc.desc   setAudioSessionBehavior
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOSESSIONMANAGERSETAUDIOSESSIONBEHAVIORREPEATED_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.VOIP_PRIVACY_TYPE_PUBLIC;
      try {
        for(let i = 0;i < 100 ;i++){
          sessionManager!.setAudioSessionBehavior(behavior);
        }
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIORREPEATED_STATIC_0100: setAudioSessionBehavior with DEFALUT: PASS`);
        done();
      } catch (err) {
        console.info(`AUDIO_AUDIOSESSIONMANAGER_SETAUDIOSESSIONBEHAVIORREPEATED_STATIC_0100: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })
    
    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_SPEAKER_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_SPEAKER_STATIC_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice SPEAKER test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_SPEAKER_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_SPEAKER_STATIC_0100 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.SPEAKER);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_DEFAULT_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_DEFAULT_STATIC_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice DEFAULT test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_DEFAULT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_DEFAULT_STATIC_0100 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.DEFAULT);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_INVALID_PARAM_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_INVALID_PARAM_STATIC_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice invalid param test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_INVALID_PARAM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_INVALID_PARAM_STATIC_0100 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.BLUETOOTH_SCO);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_RETURN_VOID_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_RETURN_VOID_STATIC_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice return void test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_RETURN_VOID_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_RETURN_VOID_STATIC_0100 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        let result = await sessionManager!.setMediaOutputDevice(audio.DeviceType.SPEAKER);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_WIRED_HEADSET_STATIC_0200
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_WIRED_HEADSET_STATIC_0200
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 WIRED_HEADSET test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_WIRED_HEADSET_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_WIRED_HEADSET_STATIC_0200 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.WIRED_HEADSET);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_STATIC_0300
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_STATIC_0300
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 BLUETOOTH_A2DP test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_STATIC_0300 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.BLUETOOTH_A2DP);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_USB_HEADSET_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_USB_HEADSET_STATIC_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 USB_HEADSET test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_USB_HEADSET_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_USB_HEADSET_STATIC_0100 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.USB_HEADSET);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_EARPIECE_STATIC_0400
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_EARPIECE_STATIC_0400
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 EARPIECE test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_EARPIECE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_EARPIECE_STATIC_0400 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.EARPIECE);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_SCO_STATIC_0500
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_SCO_STATIC_0500
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 BLUETOOTH_SCO test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_SCO_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_BLUETOOTH_SCO_STATIC_0500 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.BLUETOOTH_SCO);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_MIC_STATIC_0600
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_MIC_STATIC_0600
     * @tc.desc    AudioSessionManager setMediaOutputDevice error 6800101 MIC test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_MIC_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ERROR_MIC_STATIC_0600 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.MIC);
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
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ASYNC_PROMISE_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ASYNC_PROMISE_STATIC_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice async promise test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ASYNC_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_ASYNC_PROMISE_STATIC_0100 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      sessionManager!.setMediaOutputDevice(audio.DeviceType.SPEAKER).then(() => {
        console.info(`${TAG}: setMediaOutputDevice SPEAKER async success`);
        done();
      }).catch((error: Error) => {
        console.error(`${TAG}: setMediaOutputDevice SPEAKER async failed: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800301);
        done();
      })
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_MULTIPLE_CALL_STATIC_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_MULTIPLE_CALL_STATIC_0100
     * @tc.desc    AudioSessionManager setMediaOutputDevice multiple call test.
     * @tc.type    Function
     * @tc.size    MediumTest
     * @tc.level   Level0
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_MULTIPLE_CALL_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_SESSION_MANAGER_SET_MEDIA_OUTPUT_DEVICE_MULTIPLE_CALL_STATIC_0100 start`);
      if (sessionManager === null) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect(false).assertTrue();
        done();
        return;
      }
      try {
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.SPEAKER);
        console.info(`${TAG}: first call SPEAKER success`);
        await sessionManager!.setMediaOutputDevice(audio.DeviceType.DEFAULT);
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
