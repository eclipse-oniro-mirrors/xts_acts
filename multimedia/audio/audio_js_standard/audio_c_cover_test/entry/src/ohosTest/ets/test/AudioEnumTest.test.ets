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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import AudioKitTest from 'libentry.so'
import { abilityAccessCtrl, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { Driver, ON } from '@kit.TestKit';

const ABILITY_ERR_OK = 0;

export default function AudioEnumTest() {
  describe('AudioEnumTest', () => {

    beforeAll((done: Function) => {
      let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      // requestPermissionsFromUser会判断权限的授权状态来决定是否唤起弹窗
      setTimeout(async () => {
        let driver: Driver = await Driver.create();
        let text = await driver.findComponent(ON.text('允许'));
        if (text) {
          await text.click()
        }
      }, 2000)
      atManager.requestPermissionsFromUser(getContext(), permissions).then((data: PermissionRequestResult) => {
        let grantStatus: Array<number> = data.authResults;
        let length: number = grantStatus.length;
        for (let i = 0; i < length; i++) {
          if (grantStatus[i] != 0) { // 用户拒绝授权，提示用户必须授权才能访问当前页面的功能，并引导用户到系统设置中打开相应的权限
            return;
          }
        }
        done();
      })
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_ENCODINGTYPEAUDIOVIVID_0100
     * @tc.name testMultimediaAudioStreamEncodingTypeAudioVivid0100
     * @tc.desc Test AUDIOSTREAM_ENCODING_TYPE_AUDIOVIVID.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamEncodingTypeAudioVivid0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_ENCODINGTYPEAUDIOVIVID_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamEncodingTypeAudioVividCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_ENCODINGTYPEEAC3_0100
     * @tc.name testMultimediaAudioStreamEncodingTypeEAc30100
     * @tc.desc Testing AUDIOSTREAM_ENCODING_TYPE_E_AC3.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamEncodingTypeEAc30100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_ENCODINGTYPEEAC3_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamEncodingTypeEAc3Code();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_DIRECT_PLAYBACK_BITSTREAM_SUPPORTED_0100
     * @tc.name testMultimediaAudioStreamDirectPlaybackBitstreamSupport0100
     * @tc.desc Test AUDIOSTREAM_DIRECT_PLAYBACK_BITSTREAM_SUPPORTED.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamDirectPlaybackBitstreamSupport0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_DIRECT_PLAYBACK_BITSTREAM_SUPPORTED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamDirectPlayBackBitStreamSupportedCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_DIRECT_PLAYBACK_PCM_SUPPORTED_0100
     * @tc.name testMultimediaAudioStreamDirectPlaybackPcmSupport0100
     * @tc.desc Test AUDIOSTREAM_DIRECT_PLAYBACK_PCM_SUPPORTED.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamDirectPlaybackPcmSupport0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_DIRECT_PLAYBACK_PCM_SUPPORTED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamDirectPlayBackPcmSupportedCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_STATE_INVALID_0100
     * @tc.name testMultimediaAudioStreamStateInvalid0100
     * @tc.desc Test AUDIOSTREAM_STATE_INVALID.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamStateInvalid0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_STATE_INVALID_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamStateInvalidCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_STATE_NEW_0100
     * @tc.name testMultimediaAudioStreamStateNew0100
     * @tc.desc Test AUDIOSTREAM_STATE_NEW.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamStateNew0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_STATE_NEW_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamStateNewCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_STATE_PREPARED_0100
     * @tc.name testMultimediaAudioStreamStatePrepared0100
     * @tc.desc Test AUDIOSTREAM_STATE_PREPARED.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamStatePrepared0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_STATE_PREPARED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamStatePreparedCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_STATE_RUNNING_0100
     * @tc.name testMultimediaAudioStreamStateRunning0100
     * @tc.desc Test AUDIOSTREAM_STATE_RUNNING.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamStateRunning0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_STATE_RUNNING_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamStateRunningCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_STATE_STOPPED_0100
     * @tc.name testMultimediaAudioStreamStateStopped0100
     * @tc.desc Test AUDIOSTREAM_STATE_STOPPED.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamStateStopped0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_STATE_STOPPED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamStateStoppedCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_STATE_RELEASED_0100
     * @tc.name testMultimediaAudioStreamStateRelease0100
     * @tc.desc Test AUDIOSTREAM_STATE_RELEASED.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamStateRelease0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_STATE_RELEASED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamStateReleasedCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_STATE_PAUSED_0100
     * @tc.name testMultimediaAudioStreamStatePaused0100
     * @tc.desc Test AUDIOSTREAM_STATE_PAUSED.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamStatePaused0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_STATE_PAUSED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamStatePausedCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SOURCE_TYPE_UNPROCESSED_0100
     * @tc.name testMultimediaAudioStreamSourceTypeUnprocessed0100
     * @tc.desc Test AUDIOSTREAM_SOURCE_TYPE_UNPROCESSED.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSourceTypeUnprocessed0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SOURCE_TYPE_UNPROCESSED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSourceTypeUnprocessedCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SOURCE_TYPE_LIVE_0100
     * @tc.name testMultimediaAudioStreamSourceTypeLive0100
     * @tc.desc Test AUDIOSTREAM_SOURCE_TYPE_LIVE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSourceTypeLive0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SOURCE_TYPE_LIVE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamSourceTypeLiveCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_EFFECT_DEFAULT_0100
     * @tc.name testMultimediaAudioStreamEffectDefault0100
     * @tc.desc Test EFFECT_DEFAULT.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamEffectDefault0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_EFFECT_DEFAULT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamEffectDefaultCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_FAST_STATUS_NORMAL_0100
     * @tc.name testMultimediaAudioStreamFastStatusNormal0100
     * @tc.desc Test AUDIOSTREAM_FASTSTATUS_NORMAL.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamFastStatusNormal0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_FAST_STATUS_NORMAL_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamFastStatusNormalCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_FAST_STATUS_Fast_0100
     * @tc.name testMultimediaAudioStreamFastStatusFast0100
     * @tc.desc Test AUDIOSTREAM_FASTSTATUS_FAST.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamFastStatusFast0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_FAST_STATUS_Fast_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamFastStatusFastCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SCENE_RINGING_0100
     * @tc.name testMultimediaAudioStreamSceneRinging0100
     * @tc.desc Test AUDIO_SCENE_RINGING.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSceneRinging0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SCENE_RINGING_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSceneRingingCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SCENE_PHONE_CALL_0100
     * @tc.name testMultimediaAudioStreamScenePhoneCall0100
     * @tc.desc Test AUDIO_SCENE_PHONE_CALL.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamScenePhoneCall0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SCENE_PHONE_CALL_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioScenePhoneCallCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SCENE_VOICE_CHAT_0100
     * @tc.name testMultimediaAudioStreamSceneVoiceChat0100
     * @tc.desc Test AUDIO_SCENE_VOICE_CHAT.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamSceneVoiceChat0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SCENE_VOICE_CHAT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSceneVoiceChatCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RINGER_MODE_SILENT_0100
     * @tc.name testMultimediaAudioRingerModeSilent0100
     * @tc.desc Test AUDIO_RINGER_MODE_SILENT.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRingerModeSilent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RINGER_MODE_SILENT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRingerModeSilentCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_RINGER_MODE_VIBRATE_0100
     * @tc.name testMultimediaAudioRingerModeVibrate0100
     * @tc.desc Test AUDIO_RINGER_MODE_VIBRATE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRingerModeVibrate0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_RINGER_MODE_VIBRATE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRingerModeVibrateCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_ROLE_INPUT_0100
     * @tc.name testMultimediaAudioDeviceRoleInput0100
     * @tc.desc Test AUDIO_DEVICE_ROLE_INPUT.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceRoleInput0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_ROLE_INPUT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceRoleInputCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_WIRED_HEADPHONES_0100
     * @tc.name testMultimediaAudioDeviceTypeWiredHeadphones0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_WIRED_HEADPHONES.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeWiredHeadphones0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_WIRED_HEADPHONES_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeWiredHeadphonesCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_BLUETOOTH_SCO_0100
     * @tc.name testMultimediaAudioDeviceTypeBluetoothSco0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_BLUETOOTH_SCO.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeBluetoothSco0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_BLUETOOTH_SCO_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeBluetoothScoCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_BLUETOOTH_A2DP_0100
     * @tc.name testMultimediaAudioDeviceTypeBluetoothA2dp0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_BLUETOOTH_A2DP.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeBluetoothA2dp0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_BLUETOOTH_A2DP_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeBluetoothA2dpCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_MIC_0100
     * @tc.name testMultimediaAudioDeviceTypeMic0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_MIC.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeMic0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_MIC_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeMicCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_USB_HEADSET_0100
     * @tc.name testMultimediaAudioDeviceTypeUsbHeadset0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_USB_HEADSET.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeUsbHeadset0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_USB_HEADSET_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeUsbHeadsetCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_DISPLAY_PORT_0100
     * @tc.name testMultimediaAudioDeviceTypeDisplayPort0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_DISPLAY_PORT.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeDisplayPort0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_DISPLAY_PORT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeDisplayPortCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_REMOTE_CAST_0100
     * @tc.name testMultimediaAudioDeviceTypeRemoteCast0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_REMOTE_CAST.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeRemoteCast0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_REMOTE_CAST_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeRemoteCastCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_USB_DEVICE_0100
     * @tc.name testMultimediaAudioDeviceTypeUsbDevice0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_USB_DEVICE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeUsbDevice0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_USB_DEVICE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeUsbDeviceCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_ACCESSORY_0100
     * @tc.name testMultimediaAudioDeviceTypeAccessory0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_ACCESSORY.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeAccessory0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_ACCESSORY_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeAccessoryCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_HDMI_0100
     * @tc.name testMultimediaAudioDeviceTypeHdmi0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_HDMI.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeHdmi0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_HDMI_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeHdmiCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_LINE_DIGITAL_0100
     * @tc.name testMultimediaAudioDeviceTypeLineDigital0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_LINE_DIGITAL.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeLineDigital0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_LINE_DIGITAL_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeLineDigitalCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_HEARING_AID_0100
     * @tc.name testMultimediaAudioDeviceTypeHearingAid0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_HEARING_AID.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeHearingAid0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_HEARING_AID_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeHearingAidCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_NEARLINK_0100
     * @tc.name testMultimediaAudioDeviceTypeNearlink0100
     * @tc.desc Test AUDIO_DEVICE_TYPE_NEARLINK.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceTypeNearlink0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_TYPE_NEARLINK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceTypeNearlinkCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_USAGE_MEDIA_INPUT_0100
     * @tc.name testMultimediaAudioDeviceUsageMediaInput0100
     * @tc.desc Test AUDIO_DEVICE_USAGE_MEDIA_INPUT.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceUsageMediaInput0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_USAGE_MEDIA_INPUT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceUsageMediaInputCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_USAGE_MEDIA_ALL_0100
     * @tc.name testMultimediaAudioDeviceUsageMediaAll0100
     * @tc.desc Test AUDIO_DEVICE_USAGE_MEDIA_ALL.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceUsageMediaAll0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_USAGE_MEDIA_ALL_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceUsageMediaAllCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_USAGE_CALL_OUTPUT_0100
     * @tc.name testMultimediaAudioDeviceUsageCallOutput0100
     * @tc.desc Test AUDIO_DEVICE_USAGE_CALL_OUTPUT.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceUsageCallOutput0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_USAGE_CALL_OUTPUT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceUsageCallOutputCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_USAGE_CALL_INPUT_0100
     * @tc.name testMultimediaAudioDeviceUsageCallInput0100
     * @tc.desc Test AUDIO_DEVICE_USAGE_CALL_INPUT.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceUsageCallInput0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_USAGE_CALL_INPUT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceUsageCallInputCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_USAGE_CALL_ALL_0100
     * @tc.name testMultimediaAudioDeviceUsageCallAll0100
     * @tc.desc Test AUDIO_DEVICE_USAGE_CALL_ALL.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceUsageCallAll0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_USAGE_CALL_ALL_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceUsageCallAllCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_EVENT_ROUTING_CHANGE_0100
     * @tc.name testMultimediaAudioStreamEventRoutingChanged0100
     * @tc.desc Test AUDIOSTREAM_EVENT_ROUTING_CHANGED.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamEventRoutingChanged0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_EVENT_ROUTING_CHANGE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamEventRoutingChangedCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_FORCE_0100
     * @tc.name testMultimediaAudioStreamInterruptForce0100
     * @tc.desc Test AUDIOSTREAM_INTERRUPT_FORCE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamInterruptForce0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_FORCE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamInterruptForceCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_SHARE_0100
     * @tc.name testMultimediaAudioStreamInterruptShare0100
     * @tc.desc Test AUDIOSTREAM_INTERRUPT_SHARE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamInterruptShare0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_SHARE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamInterruptShareCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_NONE_0100
     * @tc.name testMultimediaAudioStreamInterruptHintNone0100
     * @tc.desc Test AUDIOSTREAM_INTERRUPT_HINT_NONE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamInterruptHintNone0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_NONE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamInterruptHintNoneCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_RESUME_0100
     * @tc.name testMultimediaAudioStreamInterruptHintResume0100
     * @tc.desc Test AUDIOSTREAM_INTERRUPT_HINT_RESUME.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamInterruptHintResume0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_RESUME_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamInterruptHintResumeCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_PAUSE_0100
     * @tc.name testMultimediaAudioStreamInterruptHintPause0100
     * @tc.desc Test AUDIOSTREAM_INTERRUPT_HINT_PAUSE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamInterruptHintPause0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_PAUSE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamInterruptHintPauseCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_STOP_0100
     * @tc.name testMultimediaAudioStreamInterruptHintStop0100
     * @tc.desc Test AUDIOSTREAM_INTERRUPT_HINT_STOP.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamInterruptHintStop0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_STOP_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamInterruptHintStopCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_DUCK_0100
     * @tc.name testMultimediaAudioStreamInterruptHintDuck0100
     * @tc.desc Test AUDIOSTREAM_INTERRUPT_HINT_DUCK.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamInterruptHintDuck0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_DUCK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamInterruptHintDuckCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_UNDUCK_0100
     * @tc.name testMultimediaAudioStreamInterruptHintUnduck0100
     * @tc.desc Test AUDIOSTREAM_INTERRUPT_HINT_UNDUCK.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamInterruptHintUnduck0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_UNDUCK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamInterruptHintUnduckCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_MUTE_0100
     * @tc.name testMultimediaAudioStreamInterruptHintMute0100
     * @tc.desc Test AUDIOSTREAM_INTERRUPT_HINT_MUTE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamInterruptHintMute0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_MUTE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamInterruptHintMuteCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_UNMUTE_0100
     * @tc.name testMultimediaAudioStreamInterruptHintUnmute0100
     * @tc.desc Test AUDIOSTREAM_INTERRUPT_HINT_UNMUTE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamInterruptHintUnmute0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_INTERRUPT_HINT_UNMUTE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamInterruptHintUnmuteCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_EVENT_REASON_UNKNOWN_0100
     * @tc.name testMultimediaAudioStreamReasonUnknown0100
     * @tc.desc Test REASON_UNKNOWN.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamReasonUnknown0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_EVENT_REASON_UNKNOWN_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamReasonUnknownCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_EVENT_REASON_NEW_DEVICE_AVAILABLE_0100
     * @tc.name testMultimediaAudioStreamReasonOldDeviceAvailable0100
     * @tc.desc Test REASON_NEW_DEVICE_AVAILABLE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamReasonOldDeviceAvailable0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_EVENT_REASON_NEW_DEVICE_AVAILABLE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamReasonOldDeviceAvailableCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_EVENT_REASON_OLD_DEVICE_UNAVAILABLE_0100
     * @tc.name testMultimediaAudioStreamReasonOldDeviceUnavailable0100
     * @tc.desc Test REASON_OLD_DEVICE_UNAVAILABLE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamReasonOldDeviceUnavailable0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_EVENT_REASON_OLD_DEVICE_UNAVAILABLE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamReasonOldDeviceUnavailableCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_EVENT_REASON_OVERRODE_0100
     * @tc.name testMultimediaAudioStreamReasonOverrode0100
     * @tc.desc Test REASON_OVERRODE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamReasonOverrode0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_EVENT_REASON_OVERRODE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamReasonOverrodeCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_REASON_SESSION_ACTIVATED_0100
     * @tc.name testMultimediaAudioStreamReasonSessionActivated0100
     * @tc.desc Test REASON_SESSION_ACTIVATED.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamReasonSessionActivated0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_REASON_SESSION_ACTIVATED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamReasonSessionActivatedCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_REASON_STREAM_PRIORITY_CHANGED_0100
     * @tc.name testMultimediaAudioStreamReasonStreamPriorityChanged0100
     * @tc.desc Test REASON_STREAM_PRIORITY_CHANGED.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamReasonStreamPriorityChanged0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_REASON_STREAM_PRIORITY_CHANGED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioStreamReasonStreamPriorityChangedCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_CHANGE_TYPE_DISCONNECT_0100
     * @tc.name testMultimediaAudioDeviceChangeTypeDisconnect0100
     * @tc.desc Test AUDIO_DEVICE_CHANGE_TYPE_DISCONNECT.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioDeviceChangeTypeDisconnect0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_DEVICE_CHANGE_TYPE_DISCONNECT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioDeviceChangeTypeDisconnectCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_SESSION_STATE_CHANGE_HINT_RESUME_0100
     * @tc.name testMultimediaAudioSessionStateChangeHintResume0100
     * @tc.desc Test AUDIO_SESSION_STATE_CHANGE_HINT_RESUME.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionStateChangeHintResume0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_SESSION_STATE_CHANGE_HINT_RESUME_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionStateChangeHintResumeCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_PAUSE_0100
     * @tc.name testMultimediaAudioSessionStateChangeHintPause0100
     * @tc.desc Test AUDIO_SESSION_STATE_CHANGE_HINT_PAUSE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionStateChangeHintPause0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_PAUSE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionStateChangeHintPauseCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_STOP_0100
     * @tc.name testMultimediaAudioSessionStateChangeHintStop0100
     * @tc.desc Test AUDIO_SESSION_STATE_CHANGE_HINT_STOP.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionStateChangeHintStop0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_STOP_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionStateChangeHintStopCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_TIME_OUT_STOP_0100
     * @tc.name testMultimediaAudioSessionStateChangeHintTimeOutStop0100
     * @tc.desc Test AUDIO_SESSION_STATE_CHANGE_HINT_TIME_OUT_STOP.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionStateChangeHintTimeOutStop0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_TIME_OUT_STOP_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionStateChangeHintTimeOutStopCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_DUCK_0100
     * @tc.name testMultimediaAudioSessionStateChangeHintDuck0100
     * @tc.desc Test AUDIO_SESSION_STATE_CHANGE_HINT_DUCK.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionStateChangeHintDuck0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_DUCK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionStateChangeHintDuckCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_UNDUCK_0100
     * @tc.name testMultimediaAudioSessionStateChangeHintUnduck0100
     * @tc.desc Test AUDIO_SESSION_STATE_CHANGE_HINT_UNDUCK.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionStateChangeHintUnduck0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_UNDUCK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionStateChangeHintUnduckCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_DEVICE_CHANGE_RECOMMEND_TO_CONTINUE_0100
     * @tc.name testMultimediaDeviceChangeRecommendToContinue0100
     * @tc.desc Test DEVICE_CHANGE_RECOMMEND_TO_CONTINUE.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaDeviceChangeRecommendToContinue0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_DEVICE_CHANGE_RECOMMEND_TO_CONTINUE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.DeviceChangeRecommendToContinueCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_DEVICE_CHANGE_RECOMMEND_TO_STOP_0100
     * @tc.name testMultimediaDeviceChangeRecommendToStop0100
     * @tc.desc Test DEVICE_CHANGE_RECOMMEND_TO_STOP.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaDeviceChangeRecommendToStop0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_DEVICE_CHANGE_RECOMMEND_TO_STOP_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.DeviceChangeRecommendToStopCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_EVENT_0100
     * @tc.name testMultimediaAudioSessionStateChangedEvent0100
     * @tc.desc Test OH_AudioSession_StateChangedEvent.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionStateChangedEvent0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_EVENT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionStateChangedEventCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_EVENT_STATE_CHANGE_HINT_0100
     * @tc.name testMultimediaAudioSessionStateChangedEventStateChangeHint0100
     * @tc.desc Test stateChangeHint.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionStateChangedEventStateChangeHint0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_EVENT_STATE_CHANGE_HINT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionStateChangedEventStateChangeHintCode();
          expect(0).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })
  })
}
