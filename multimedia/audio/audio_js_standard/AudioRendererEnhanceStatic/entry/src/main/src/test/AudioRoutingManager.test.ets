/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
import common from '@ohos.app.ability.common';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions } from 'permissions';
import abilityContext from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement'

let g_context: common.UIAbilityContext;

export default function AudioRoutingManagerTest() {

  describe('AudioRoutingManagerTest', () => {
    let audioRoutingManager: audio.AudioRoutingManager = audio.getAudioManager().getRoutingManager();
    let Tag = "AudioRoutingManagerTest";

    beforeAll(async (): Promise<void> => {
      try {
        console.info(' beforeAll start');
        g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.MICROPHONE')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            console.info(' requestPermissionsFromUser end');
            console.info("request success permissions" + JSON.stringify(data));
            console.info("getPermissionRequestResult err" + JSON.stringify(err));
          });
        let driver = Driver.create();
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000)
        if (permissionButton != null) {
          await permissionButton.click();
        }
      } catch (err) {
        console.error(' beforeAll failed, err: ' + err);
      }
    })

    beforeEach(async () => {
      console.info(`${Tag}: beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(2000);
    });
    afterEach(async () => {
      console.info(`${Tag}: afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(2000);
    });
    afterAll(async () => {
      console.info(`${Tag}: afterAll: Test suite-level cleanup condition`);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0100
     * @tc.desc   getAvailableDevices-MEDIA_OUTPUT_DEVICES-speaker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let devices: audio.AudioDeviceDescriptors = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES);
        // console.info(`${Tag}: getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(devices[0].deviceType > 0).assertTrue();
        expect(devices[0].id != null).assertTrue();
        expect(devices[0].name).assertEqual("");
        expect(devices[0].address).assertEqual("");
        expect(devices[0].displayName != "").assertTrue();
        expect(devices[0].sampleRates[0] > 0).assertTrue();
        expect(devices[0].channelCounts[0] > 0).assertTrue();
        expect(devices[0].channelMasks[0]).assertEqual(0);
        expect(devices?.[0]?.encodingTypes?.[0]).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}: getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0200
     * @tc.desc   getAvailableDevices-MEDIA_INPUT_DEVICES-MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let devices: audio.AudioDeviceDescriptors = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.MEDIA_INPUT_DEVICES);
        // console.info(`${Tag}: getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(devices[0].deviceType > 0).assertTrue();
        expect(devices[0].id != null).assertTrue();
        expect(devices[0].name).assertEqual("");
        expect(devices[0].address).assertEqual("");
        expect(devices[0].displayName != "").assertTrue();
        expect(devices[0].sampleRates[0] > 0).assertTrue();
        expect(devices[0].channelCounts[0] > 0).assertTrue();
        expect(devices[0].channelMasks[0]).assertEqual(0);
        expect(devices?.[0]?.encodingTypes?.[0]).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}: getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0300
     * @tc.desc   Gets the available by device usage type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let devices: audio.AudioDeviceDescriptors = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.ALL_MEDIA_DEVICES);
        // console.info(`${Tag}: getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(devices[0].deviceType > 0).assertTrue();
        expect(devices[0].displayName != "").assertTrue();
        expect(devices[1].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(devices[1].deviceType > 0).assertTrue();
        expect(devices[1].displayName != "").assertTrue();
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}: getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0400
     * @tc.desc   getAvailableDevices-CALL_OUTPUT_DEVICES-SPEAKER&EARPIECE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let devices: audio.AudioDeviceDescriptors = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.CALL_OUTPUT_DEVICES);
        // console.info(`${Tag}: getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(devices[0].deviceType > 0).assertTrue();
        expect(devices[0].displayName != "").assertTrue();
        expect(devices[0].sampleRates[0] > 0).assertTrue();
        expect(devices[0].channelCounts[0] > 0).assertTrue();
        expect(devices[0].channelMasks[0]).assertEqual(0);
        expect(devices?.[0]?.encodingTypes?.[0]).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}: getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0500
     * @tc.desc   Gets the available by device usage type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let devices: audio.AudioDeviceDescriptors = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.CALL_INPUT_DEVICES);
        // console.info(`${Tag}: getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(devices[0].deviceType > 0).assertTrue();
        expect(devices[0].id != null).assertTrue();
        expect(devices[0].name).assertEqual("");
        expect(devices[0].address).assertEqual("");
        expect(devices[0].displayName != "").assertTrue();
        expect(devices[0].sampleRates[0] > 0).assertTrue();
        expect(devices[0].channelCounts[0] > 0).assertTrue();
        expect(devices[0].channelMasks[0]).assertEqual(0);
        expect(devices?.[0]?.encodingTypes?.[0]).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}: getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0600
     * @tc.desc   getAvailableDevices-ALL_CALL_DEVICES-SPEAKER & MIC & EARPIECE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let devices: audio.AudioDeviceDescriptors = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.ALL_CALL_DEVICES);
        // console.info(`${Tag}: getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices.length > 0).assertTrue();
        for (let i = 0; i < devices.length; i++) {
          expect(devices[i].deviceRole != null).assertTrue();
          expect(devices[i].deviceType > 0).assertTrue();
          expect(devices[i].displayName != "").assertTrue();
        }
        done();
      } catch (error: BusinessError) {
        console.info(`${Tag}: getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_STATIC_0400
     * @tc.desc   on - off - availableDeviceChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        audioRoutingManager.onAvailableDeviceChange(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES, (data: audio.DeviceChangeAction) => {
          console.info(`${Tag}:  on_availableDeviceChange: SUCCESS`);
        });
        audioRoutingManager.offAvailableDeviceChange((data: audio.DeviceChangeAction) => {
          console.info(`${Tag}:  off_availableDeviceChange 'availableDeviceChange': SUCCESS`);
        });
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        console.error(`${Tag}:  on_availableDeviceChange ERROR: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_STATIC_0500
     * @tc.desc   on - off - availableDeviceChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        audioRoutingManager.onAvailableDeviceChange(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES, (data: audio.DeviceChangeAction) => {
          console.info(`${Tag}:  on_availableDeviceChange: SUCCESS`);
        });
        audioRoutingManager.offAvailableDeviceChange();
        expect(true).assertTrue();
        done();
      } catch (error: BusinessError) {
        console.error(`${Tag}:  on_availableDeviceChange ERROR: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_STATIC_0100
     * @tc.desc   on -off- micBlockStatusChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: () => void): void => {
      try {
        let blockMic: boolean = await audioRoutingManager.isMicBlockDetectionSupported()
        let micBlockStatusCallback = (micBlockStatusChanged: audio.DeviceBlockStatusInfo) => {
          console.info(`block status : ${micBlockStatusChanged.blockStatus} `);
        };
        if (blockMic == true) {
          audioRoutingManager.onMicBlockStatusChanged((deviceBlockStatusInfo: audio.DeviceBlockStatusInfo) =>{
            if (deviceBlockStatusInfo.blockStatus == audio.DeviceBlockStatus.BLOCKED ||
              deviceBlockStatusInfo.blockStatus == audio.DeviceBlockStatus.UNBLOCKED) {
              console.info(`${Tag}:  on_micBlockStatusChanged: SUCCESS`);
              expect(true).assertTrue();
            } else {
              console.info(`${Tag}:  on_micBlockStatusChanged: SUCCESS`);
              expect(false).assertTrue();
            }
          })
          audioRoutingManager.offMicBlockStatusChanged(micBlockStatusCallback)
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${Tag}:  on_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_STATIC_0800
     * @tc.desc   audio.DeviceBlockStatusInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      try {
        let blockMic: boolean = await audioRoutingManager.isMicBlockDetectionSupported()
        if (blockMic == true) {
          audioRoutingManager.onMicBlockStatusChanged((deviceBlockStatusInfo: audio.DeviceBlockStatusInfo) =>{
            let audioDeviceBlockStatusInfo: audio.DeviceBlockStatus = deviceBlockStatusInfo.blockStatus;
            if (audioDeviceBlockStatusInfo == audio.DeviceBlockStatus.BLOCKED ||
              audioDeviceBlockStatusInfo == audio.DeviceBlockStatus.UNBLOCKED) {
              let audioDevices: audio.AudioDeviceDescriptors = deviceBlockStatusInfo.devices;
              console.info(`${Tag}: audioDevices[0].id: ${audioDevices[0].id}`);
              expect(audioDevices[0].id).assertLargerOrEqual(0);
              console.info(`${Tag}: on_micBlockStatusChanged: SUCCESS`);
              expect(true).assertTrue();
            } else {
              console.info(`${Tag}: on_micBlockStatusChanged: SUCCESS`);
              expect(false).assertTrue();
            }
          })
          audioRoutingManager.offMicBlockStatusChanged()
        }
        expect(true).assertTrue();
      } catch (error: BusinessError) {
        console.error(`${Tag}: on_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
      }
      done();
    });

  })
}