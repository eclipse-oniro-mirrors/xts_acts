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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import AudioKitTest from 'libentry.so'

const ABILITY_ERR_OK = 0;

export default function AudioTest1() {
  describe('AudioTest1', () => {

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_GETAUDIOROUTINGMANGER_0100
     * @tc.name testMultimediaAudioRoutingGetAudioRoutingManager0100
     * @tc.desc Testing OH_AudioStreamBuilder_SetCapturerErrorCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingGetAudioRoutingManager0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_GETAUDIOROUTINGMANGER_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingGetAudioRoutingManagerSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_GETDEVICES_0100
     * @tc.name testMultimediaAudioRoutingGetDevices0100
     * @tc.desc Testing OH_AudioRoutingManager_GetDevices returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingGetDevices0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_GETDEVICES_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingGetDevicesInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_GETDEVICES_0200
     * @tc.name testMultimediaAudioRoutingGetDevices0200
     * @tc.desc Testing OH_AudioRoutingManager_GetDevices returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingGetDevices0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_GETDEVICES_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingGetDevicesSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_GETAVAILABLEDEVICES_0100
     * @tc.name testMultimediaAudioRoutingGetAvailableDevices0100
     * @tc.desc Testing OH_AudioRoutingManager_GetAvailableDevices returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingGetAvailableDevices0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_GETAVAILABLEDEVICES_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingGetAvailableDevicesInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_GETAVAILABLEDEVICES_0200
     * @tc.name testMultimediaAudioRoutingGetAvailableDevices0200
     * @tc.desc Testing OH_AudioRoutingManager_GetAvailableDevices returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingGetAvailableDevices0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_GETAVAILABLEDEVICES_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingGetAvailableDevicesSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_GETPREFERREDOUTPUTDEVICE_0100
     * @tc.name testMultimediaAudioRoutingGetPreferredOutputDevice0100
     * @tc.desc Testing OH_AudioRoutingManager_GetPreferredOutputDevice returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingGetPreferredOutputDevice0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_GETPREFERREDOUTPUTDEVICE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingGetPreferredOutputDeviceInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_GETPREFERREDOUTPUTDEVICE_0200
     * @tc.name testMultimediaAudioRoutingGetPreferredOutputDevice0200
     * @tc.desc Testing OH_AudioRoutingManager_GetPreferredOutputDevice returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingGetPreferredOutputDevice0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_GETPREFERREDOUTPUTDEVICE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingGetPreferredOutputDeviceSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_GETPREFERREDINPUTDEVICE_0100
     * @tc.name testMultimediaAudioRoutingGetPreferredInputDevice0100
     * @tc.desc Testing OH_AudioRoutingManager_GetPreferredInputDevice returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingGetPreferredInputDevice0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_GETPREFERREDINPUTDEVICE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingGetPreferredInputDeviceInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_GETPREFERREDINPUTDEVICE_0200
     * @tc.name testMultimediaAudioRoutingGetPreferredInputDevice0200
     * @tc.desc Testing OH_AudioRoutingManager_GetPreferredInputDevice returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingGetPreferredInputDevice0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_GETPREFERREDINPUTDEVICE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingGetPreferredInputDeviceSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_REGISTERDEVICECHANGECALLBACK_0100
     * @tc.name testMultimediaAudioRoutingRegisterDeviceChangeCallback0100
     * @tc.desc Testing OH_AudioRoutingManager_RegisterDeviceChangeCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingRegisterDeviceChangeCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_REGISTERDEVICECHANGECALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingRegisterDeviceChangeCbInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_REGISTERDEVICECHANGECALLBACK_0200
     * @tc.name testMultimediaAudioRoutingRegisterDeviceChangeCallback0200
     * @tc.desc Testing OH_AudioRoutingManager_RegisterDeviceChangeCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingRegisterDeviceChangeCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_REGISTERDEVICECHANGECALLBACK_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingRegisterDeviceChangeCbSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_UNREGISTERDEVICECHANGECALLBACK_0100
     * @tc.name testMultimediaAudioRoutingUnregisterDeviceChangeCallback0100
     * @tc.desc Testing OH_AudioRoutingManager_UnregisterDeviceChangeCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingUnregisterDeviceChangeCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_UNREGISTERDEVICECHANGECALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingUnregisterDeviceChangeCbInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_UNREGISTERDEVICECHANGECALLBACK_0200
     * @tc.name testMultimediaAudioRoutingUnregisterDeviceChangeCallback0200
     * @tc.desc Testing OH_AudioRoutingManager_UnregisterDeviceChangeCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingUnregisterDeviceChangeCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_UNREGISTERDEVICECHANGECALLBACK_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingUnregisterDeviceChangeCbSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_RELEASEDEVICES_0100
     * @tc.name testMultimediaAudioRoutingReleaseDevices0100
     * @tc.desc Testing OH_AudioRoutingManager_ReleaseDevices returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingReleaseDevices0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_RELEASEDEVICES_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingReleaseDevicesInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_RELEASEDEVICES_0200
     * @tc.name testMultimediaAudioRoutingReleaseDevices0200
     * @tc.desc Testing OH_AudioRoutingManager_ReleaseDevices returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingReleaseDevices0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_RELEASEDEVICES_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingReleaseDevicesSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_ISMICBLOCKDETECTIONSUPPORTED_0100
     * @tc.name testMultimediaAudioRoutingIsMicBlockDetectionSupported0100
     * @tc.desc Testing OH_AudioRoutingManager_IsMicBlockDetectionSupported returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingIsMicBlockDetectionSupported0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_ISMICBLOCKDETECTIONSUPPORTED_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingIsMicBlockDetectionSupInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_SETMICBLOCKSTATUSCALLBACK_0100
     * @tc.name testMultimediaAudioRoutingSetMicBlockStatusCallback0100
     * @tc.desc Testing OH_AudioRoutingManager_SetMicBlockStatusCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioRoutingSetMicBlockStatusCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_ROUTING_SETMICBLOCKSTATUSCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioRoutingSetMicBlockStatusCallbackInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_GETAUDIOSESSIONMANAGER_0100
     * @tc.name testMultimediaAudioSessionGetAudioSessionManager0100
     * @tc.desc Testing OH_AudioManager_GetAudioSessionManager returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionGetAudioSessionManager0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_GETAUDIOSESSIONMANAGER_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionGetAudioSessionManagerSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_ACTIVATEAUDIOSESSION_0100
     * @tc.name testMultimediaAudioSessionActivateAudioSession0100
     * @tc.desc Testing OH_AudioSessionManager_ActivateAudioSession returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionActivateAudioSession0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_ACTIVATEAUDIOSESSION_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionActivateAudioSessionInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_ACTIVATEAUDIOSESSION_0200
     * @tc.name testMultimediaAudioSessionActivateAudioSession0200
     * @tc.desc Testing OH_AudioSessionManager_ActivateAudioSession returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionActivateAudioSession0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_ACTIVATEAUDIOSESSION_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionActivateAudioSessionSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_ACTIVATEAUDIOSESSION_0300
     * @tc.name testMultimediaAudioSessionActivateAudioSession0300
     * @tc.desc Testing OH_AudioSessionManager_ActivateAudioSession returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionActivateAudioSession0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_ACTIVATEAUDIOSESSION_0300`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionActivateAudioSessionIllegalState();
          expect(6800103).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_DEACTIVATEAUDIOSESSION_0100
     * @tc.name testMultimediaAudioSessionDeactivateAudioSession0100
     * @tc.desc Testing OH_AudioSessionManager_DeactivateAudioSession returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionDeactivateAudioSession0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_DEACTIVATEAUDIOSESSION_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionDeactivateAudioSessionInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_DEACTIVATEAUDIOSESSION_0200
     * @tc.name testMultimediaAudioSessionDeactivateAudioSession0200
     * @tc.desc Testing OH_AudioSessionManager_DeactivateAudioSession returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionDeactivateAudioSession0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_DEACTIVATEAUDIOSESSION_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionDeactivateAudioSessionSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_DEACTIVATEAUDIOSESSION_0300
     * @tc.name testMultimediaAudioSessionDeactivateAudioSession0300
     * @tc.desc Testing OH_AudioSessionManager_DeactivateAudioSession returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionDeactivateAudioSession0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_DEACTIVATEAUDIOSESSION_0300`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionDeactivateAudioSessionIllegalState();
          expect(6800103).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERSESSIONDEACTIVATEDCALLBACK_0100
     * @tc.name testMultimediaAudioSessionRegisterSessionDeactivatedCallback0100
     * @tc.desc Testing OH_AudioSessionManager_RegisterSessionDeactivatedCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionRegisterSessionDeactivatedCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERSESSIONDEACTIVATEDCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionRegisterSessionDeactivatedCbInvPar();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERSESSIONDEACTIVATEDCALLBACK_0200
     * @tc.name testMultimediaAudioSessionRegisterSessionDeactivatedCallback0200
     * @tc.desc Testing OH_AudioSessionManager_RegisterSessionDeactivatedCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionRegisterSessionDeactivatedCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERSESSIONDEACTIVATEDCALLBACK_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionRegisterSessionDeactivatedCbSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERSESSIONDEACTIVATEDCALLBACK_0100
     * @tc.name testMultimediaAudioSessionUnregisterSessionDeactivatedCallback0100
     * @tc.desc Testing OH_AudioSessionManager_UnregisterSessionDeactivatedCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionUnregisterSessionDeactivatedCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERSESSIONDEACTIVATEDCALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionUnregisterSessionDeactivatedCbInvPar();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERSESSIONDEACTIVATEDCALLBACK_0200
     * @tc.name testMultimediaAudioSessionUnregisterSessionDeactivatedCallback0200
     * @tc.desc Testing OH_AudioSessionManager_UnregisterSessionDeactivatedCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionUnregisterSessionDeactivatedCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERSESSIONDEACTIVATEDCALLBACK_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionUnregisterSessionDeactivatedCbSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_SETSCENE_0100
     * @tc.name testMultimediaAudioSessionSetScene0100
     * @tc.desc Testing OH_AudioSessionManager_SetScene returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionSetScene0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_SETSCENE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionSetSceneInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_SETSCENE_0200
     * @tc.name testMultimediaAudioSessionSetScene0200
     * @tc.desc Testing OH_AudioSessionManager_SetScene returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionSetScene0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_SETSCENE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionSetSceneSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERSTATECHANGECALLBACK_0100
     * @tc.name testMultimediaAudioSessionRegisterStateChangeCallback0100
     * @tc.desc Testing OH_AudioSessionManager_RegisterStateChangeCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionRegisterStateChangeCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERSTATECHANGECALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionRegisterStateChangeCbInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERSTATECHANGECALLBACK_0200
     * @tc.name testMultimediaAudioSessionRegisterStateChangeCallback0200
     * @tc.desc Testing OH_AudioSessionManager_RegisterStateChangeCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionRegisterStateChangeCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERSTATECHANGECALLBACK_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionRegisterStateChangeCbSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERSTATECHANGECALLBACK_0100
     * @tc.name testMultimediaAudioSessionUnregisterStateChangeCallback0100
     * @tc.desc Testing OH_AudioSessionManager_UnregisterStateChangeCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionUnregisterStateChangeCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERSTATECHANGECALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionUnregisterStateChangeCbInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERSTATECHANGECALLBACK_0200
     * @tc.name testMultimediaAudioSessionUnregisterStateChangeCallback0200
     * @tc.desc Testing OH_AudioSessionManager_UnregisterStateChangeCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionUnregisterStateChangeCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERSTATECHANGECALLBACK_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionUnregisterStateChangeCbSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_SETDEFAULTOUTPUTDEVICE_0100
     * @tc.name testMultimediaAudioSessionSetDefaultOutputDevice0100
     * @tc.desc Testing OH_AudioSessionManager_SetDefaultOutputDevice returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionSetDefaultOutputDevice0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_SETDEFAULTOUTPUTDEVICE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionSetDefaultOutputDeviceInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_SETDEFAULTOUTPUTDEVICE_0200
     * @tc.name testMultimediaAudioSessionSetDefaultOutputDevice0200
     * @tc.desc Testing OH_AudioSessionManager_SetDefaultOutputDevice returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionSetDefaultOutputDevice0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_SETDEFAULTOUTPUTDEVICE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionSetDefaultOutputDeviceSuccess();
          if (result == 6800301) {
            console.info(`====>${LOG_NAME} result: ` + result);
            done();
            return;
          }
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_GETDEFAULTOUTPUTDEVICE_0100
     * @tc.name testMultimediaAudioSessionGetDefaultOutputDevice0100
     * @tc.desc Testing OH_AudioSessionManager_GetDefaultOutputDevice returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionGetDefaultOutputDevice0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_GETDEFAULTOUTPUTDEVICE_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionGetDefaultOutputDeviceInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_GETDEFAULTOUTPUTDEVICE_0200
     * @tc.name testMultimediaAudioSessionGetDefaultOutputDevice0200
     * @tc.desc Testing OH_AudioSessionManager_GetDefaultOutputDevice returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionGetDefaultOutputDevice0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_GETDEFAULTOUTPUTDEVICE_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionGetDefaultOutputDeviceSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_RELEASEDEVICES_0100
     * @tc.name testMultimediaAudioSessionReleaseDevices0100
     * @tc.desc Testing OH_AudioSessionManager_ReleaseDevices returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionReleaseDevices0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_RELEASEDEVICES_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionReleaseDevicesInvalidParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_RELEASEDEVICES_0200
     * @tc.name testMultimediaAudioSessionReleaseDevices0200
     * @tc.desc Testing OH_AudioSessionManager_ReleaseDevices returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionReleaseDevices0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_RELEASEDEVICES_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionReleaseDevicesSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERCURRENTOUTPUTDEVICECHANGECALLBACK_0100
     * @tc.name testMultimediaAudioSessionRegisterCurrentOutputDeviceChangeCallback0100
     * @tc.desc Testing OH_AudioSessionManager_RegisterCurrentOutputDeviceChangeCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionRegisterCurrentOutputDeviceChangeCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERCURRENTOUTPUTDEVICECHANGECALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionRegisterCurOutDevChgCbInvParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERCURRENTOUTPUTDEVICECHANGECALLBACK_0200
     * @tc.name testMultimediaAudioSessionRegisterCurrentOutputDeviceChangeCallback0200
     * @tc.desc Testing OH_AudioSessionManager_RegisterCurrentOutputDeviceChangeCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionRegisterCurrentOutputDeviceChangeCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_REGISTERCURRENTOUTPUTDEVICECHANGECALLBACK_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionRegisterCurOutDevChgCbSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERCURRENTOUTPUTDEVICECHANGECALLBACK_0100
     * @tc.name testMultimediaAudioSessionUnregisterCurrentOutputDeviceChangeCallback0100
     * @tc.desc Testing OH_AudioSessionManager_UnregisterCurrentOutputDeviceChangeCallback returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionUnregisterCurrentOutputDeviceChangeCallback0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERCURRENTOUTPUTDEVICECHANGECALLBACK_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionUnregisterCurOutDevChgCbInvParam();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERCURRENTOUTPUTDEVICECHANGECALLBACK_0200
     * @tc.name testMultimediaAudioSessionUnregisterCurrentOutputDeviceChangeCallback0200
     * @tc.desc Testing OH_AudioSessionManager_UnregisterCurrentOutputDeviceChangeCallback returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioSessionUnregisterCurrentOutputDeviceChangeCallback0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_SESSION_UNREGISTERCURRENTOUTPUTDEVICECHANGECALLBACK_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionUnregisterCurOutDevChgCbSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_GETDIRECTPLAYBACKSUPPORT_0100
     * @tc.name testMultimediaAudioStreamGetDirectPlaybackSupport0100
     * @tc.desc Testing OH_AudioStreamManager_GetDirectPlaybackSupport returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamGetDirectPlaybackSupport0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_GETDIRECTPLAYBACKSUPPORT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionGetDirectPlaybackSupportSuccess();
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
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_ISACOUSTICECHOCANCELERSUPPORT_0100
     * @tc.name testMultimediaAudioStreamIsAcousticEchoCancelerSupported0100
     * @tc.desc Testing OH_AudioStreamManager_IsAcousticEchoCancelerSupported returns an invalid param error code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamIsAcousticEchoCancelerSupported0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_ISACOUSTICECHOCANCELERSUPPORT_0100`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionIsAcousticEchoCancelerSupportedInvPar();
          expect(6800101).assertEqual(result);
          console.info(`====>${LOG_NAME} result: ` + result);
          done();
        } catch (err) {
          console.error(`====>${LOG_NAME} catch err: ` + err);
          expect(false).assertEqual(ABILITY_ERR_OK);
          done();
        }
      })

    /**
     * @tc.number SUB_MULTIMEDIA_AUDIO_STREAM_ISACOUSTICECHOCANCELERSUPPORT_0200
     * @tc.name testMultimediaAudioStreamIsAcousticEchoCancelerSupported0200
     * @tc.desc Testing OH_AudioStreamManager_IsAcousticEchoCancelerSupported returns a successful code.
     * @tc.level Level1
     * @tc.size MediumTest
     * @tc.type Function
     */
    it('testMultimediaAudioStreamIsAcousticEchoCancelerSupported0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        const LOG_NAME = `SUB_MULTIMEDIA_AUDIO_STREAM_ISACOUSTICECHOCANCELERSUPPORT_0200`;
        try {
          console.info(`====>${LOG_NAME} start====`);
          let result: number = AudioKitTest.AudioSessionIsAcousticEchoCancelerSupportedSuc();
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
