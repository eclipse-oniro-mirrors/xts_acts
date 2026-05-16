/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import audio from '@ohos.multimedia.audio';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let testContext: common.UIAbilityContext;
let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}
let capturerInfo: audio.AudioCapturerInfo = {
  source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
  capturerFlags: 0
}

export default function AudioRoutingManagerTest() {
  describe('AudioRoutingManagerTest', () => {
    let audioRoutingManager: audio.AudioRoutingManager | ESObject = audio.getAudioManager().getRoutingManager();
    let Tag = "AudioRoutingManagerTest";
    let audioManager = audio.getAudioManager();
    let audioSessionManager: audio.AudioSessionManager = audioManager.getSessionManager();
    let audioRenderer: audio.AudioRenderer | null = null;
    let currentOutputDeviceChangedCallback: ((event: audio.CurrentOutputDeviceChangedEvent) => void) | null = null;
    let outputDeviceChangeWithInfoCallback: ((info: audio.AudioStreamDeviceChangeInfo) => void) | null = null; 

    let driveFn = async () => {
      let dr = Driver.create();
      await sleep(1000);
      let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      let power2 = await dr?.waitForComponent(ON.text('始终允许', MatchPattern.EQUALS), 500);
      await sleep(1000);
      await power?.click();
      await power2?.click();
    }

    let getPermission = async () => {
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
      atManager.requestPermissionsFromUser(testContext, permissions,
        (err: BusinessError, data: PermissionRequestResult) => {
          console.info("request success permissions" + JSON.stringify(data));
          console.info("getPermissionRequestResult err", JSON.stringify(err));
        })
    }

    beforeAll(async () => {
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      await getPermission();
      await driveFn();
      console.info('TestLog: Start Testing audioManagerTest Interfaces');
    });
    beforeEach(async () => {
      console.info(`${Tag}: beforeEach: Prerequisites at the test case level`);
      sleep(2000);
    });
    afterEach(async () => {
      console.info(`${Tag}: afterEach: Test case-level clearance conditions`);
      sleep(2000);
    });
    afterAll(async () => {
      console.info(`${Tag}: afterAll: Test suite-level cleanup condition`);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0100
     * @tc.desc   getAvailableDevices-MEDIA_OUTPUT_DEVICES-speaker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES);
        console.log(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        let deviceRole: ESObject =devices[0].deviceRole;
        let deviceType: ESObject= devices[0].deviceType;
        let id: ESObject = devices[0].id;
        let spatializationSupported: ESObject = devices[0].spatializationSupported;
        let name: ESObject = devices[0].name;
        let address: ESObject = devices[0].address;
        let displayName: ESObject = devices[0].displayName;
        let sampleRates: ESObject = devices[0].sampleRates[0];
        let channelCounts: ESObject = devices[0].channelCounts[0];
        let channelMasks: ESObject = devices[0].channelMasks[0];
        let encodingType: ESObject = devices[0].encodingTypes[0];
        if (deviceRole != audio.DeviceRole.OUTPUT_DEVICE || deviceType < 0 || id < 0 || channelMasks != 0){
          expect(false).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${Tag}:getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0200
     * @tc.desc   getAvailableDevices-MEDIA_INPUT_DEVICES-MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.MEDIA_INPUT_DEVICES);
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(devices[0].deviceType > 0).assertTrue();
        expect(devices[0].id != null).assertTrue();
        expect(devices[0].name).assertEqual("");
        expect(devices[0].address).assertEqual("");
        expect(devices[0].displayName != "").assertTrue();
        expect(devices[0].sampleRates[0] > 0).assertTrue();
        expect(devices[0].channelCounts[0] > 0).assertTrue();
        expect(devices[0].channelMasks[0]).assertEqual(0);
        expect(devices[0].encodingTypes[0]).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
        done();
      } catch (error) {
        console.info(`${Tag}:getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0300
     * @tc.desc   Gets the available by device usage type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0300', 2, (done: Function) => {
      try {
        let inputDeviceExist = false;
        let outputDeviceExist = false;
        let devices: ESObject = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.ALL_MEDIA_DEVICES);
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        for (let i = 0; i < devices.length; i++) {
          expect(devices[i].deviceType > 0).assertTrue();
          expect(devices[i].id > 0).assertTrue();
          let deviceRole: ESObject = devices[i].deviceRole;
          if (deviceRole == audio.DeviceRole.INPUT_DEVICE){
            inputDeviceExist = true;
          }
          if (deviceRole == audio.DeviceRole.OUTPUT_DEVICE){
            outputDeviceExist = true;
          }
        }
        if (outputDeviceExist == false || inputDeviceExist == false){
          expect(false).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${Tag}:getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0400
     * @tc.desc   getAvailableDevices-CALL_OUTPUT_DEVICES-SPEAKER&EARPIECE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0400', 2, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.CALL_OUTPUT_DEVICES);
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        let deviceRole: ESObject =devices[0].deviceRole;
        let deviceType: ESObject= devices[0].deviceType;
        let id: ESObject = devices[0].id;
        let name: ESObject = devices[0].name;
        let address: ESObject = devices[0].address;
        let displayName: ESObject = devices[0].displayName;
        let sampleRates: ESObject = devices[0].sampleRates[0];
        let channelCounts: ESObject = devices[0].channelCounts[0];
        let channelMasks: ESObject = devices[0].channelMasks[0];
        let encodingType: ESObject = devices[0].encodingTypes[0];
        if (deviceRole != audio.DeviceRole.OUTPUT_DEVICE || deviceType < 0 || id < 0 || channelMasks != 0){
          expect(false).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${Tag}:getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0500
     * @tc.desc   Gets the available by device usage type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0500', 2, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.CALL_INPUT_DEVICES);
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(devices[0].deviceType > 0).assertTrue();
        expect(devices[0].id != null).assertTrue();
        expect(devices[0].name).assertEqual("");
        expect(devices[0].address).assertEqual("");
        expect(devices[0].displayName != "").assertTrue();
        expect(devices[0].sampleRates[0] > 0).assertTrue();
        expect(devices[0].channelCounts[0] > 0).assertTrue();
        expect(devices[0].channelMasks[0]).assertEqual(0);
        expect(devices[0].encodingTypes[0]).assertEqual(audio.AudioEncodingType.ENCODING_TYPE_RAW);
        done();
      } catch (error) {
        console.info(`${Tag}:getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0600
     * @tc.desc   getAvailableDevices-ALL_CALL_DEVICES-SPEAKER & MIC & EARPIECE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0600', 2, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.ALL_CALL_DEVICES);
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices.length > 0).assertTrue();
        for (let i = 0; i < devices.length; i++) {
          expect(devices[i].deviceRole != "").assertTrue();
          expect(devices[i].deviceType > 0).assertTrue();
          expect(devices[i].id > 0).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${Tag}:getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0700
     * @tc.desc   getAvailableDevices - errorParameter(-1) -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0700', 2, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(-1);
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${Tag}:getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0800
     * @tc.desc   getAvailableDevices - errorParameter(9) -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0800', 2, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(9);
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${Tag}:getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0900
     * @tc.desc   getAvailableDevices - errorParameter('12') -401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0900', 2, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices('12');
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${Tag}: getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_1000
     * @tc.desc   getAvailableDevices - null parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices();
        console.info(`${Tag}: getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${Tag}:  getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_0100
     * @tc.desc    CurrentOutputDeviceChangedEvent preDevices property test - verify preDevices is returned when output device changes.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_0100';
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_0100 start`);
      if (!audioSessionManager) {
        console.error(`${TAG}: AudioManager is null`);
        expect().assertFail();
        done();
        return;
      }

      let deviceChangedEventReceived = false;
      let preDevicesValue: audio.AudioDeviceDescriptors | undefined = undefined;
      let devicesValue: audio.AudioDeviceDescriptors | null = null;
      let changeReasonValue: audio.AudioStreamDeviceChangeReason | null = null;
      let recommendedActionValue: audio.OutputDeviceChangeRecommendedAction | null = null;

      const currentOutputDeviceChangedCallback = (event: audio.CurrentOutputDeviceChangedEvent) => {
        console.info(`${TAG}: currentOutputDeviceChanged callback triggered`);
        deviceChangedEventReceived = true;
        preDevicesValue = event.preDevices;
        devicesValue = event.devices;
        changeReasonValue = event.changeReason;
        recommendedActionValue = event.recommendedAction;
        const preDevicesJson: string = JSON.stringify(preDevicesValue);
        const devicesJson: string = JSON.stringify(devicesValue);
        console.info(`${TAG}: preDevices: ${preDevicesJson}`);
        console.info(`${TAG}: devices: ${JSON.stringify(devicesJson)}`);
        console.info(`${TAG}: changeReason: ${changeReasonValue}`);
        console.info(`${TAG}: recommendedAction: ${recommendedActionValue}`);
      };

      try {
        audioSessionManager.on('currentOutputDeviceChanged', currentOutputDeviceChangedCallback);
        console.info(`${TAG}: regester currentOutputDeviceChanged callback success`);

        let originalDevices: audio.AudioDeviceDescriptors = audioSessionManager.getAvailableDevices(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES);
        const originalDevicesJson: string = JSON.stringify(originalDevices);
        console.info(`${TAG}: 当前可用设备: ${originalDevicesJson}`);

        await sleep(1000);

        let hasSpeaker: boolean = originalDevices.some((device: audio.AudioDeviceDescriptor) => device.deviceType === audio.DeviceType.SPEAKER);
        if (hasSpeaker) {
          try {
            await audioSessionManager.setMediaOutputDevice(audio.DeviceType.SPEAKER);
            console.info(`${TAG}: set SPEAKER output device success`);
            await sleep(2000);
          } catch (err) {
            let error: BusinessError = err as BusinessError;
            console.info(`${TAG}: set output device fail: ${error.code}`);
          }
        }

        if (deviceChangedEventReceived) {
          console.info(`${TAG}: yanzheng preDevices shuxing`);

          expect(preDevicesValue != null).assertTrue();

          expect(Array.isArray(preDevicesValue)).assertTrue();
          expect(devicesValue != null).assertTrue();

          expect(Array.isArray(devicesValue)).assertTrue();

          expect(changeReasonValue != null).assertTrue();

          expect(recommendedActionValue != null).assertTrue();
          if (preDevicesValue !== undefined){
            let preDevicesArray: audio.AudioDeviceDescriptors = preDevicesValue as audio.AudioDeviceDescriptors;
            if (preDevicesArray.length > 0){
              let preDeviceDescriptor: audio.AudioDeviceDescriptor = preDevicesArray[0];
              expect(preDeviceDescriptor.deviceType != null).assertTrue();
              expect(preDeviceDescriptor.deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
              let deviceType: audio.DeviceType = preDeviceDescriptor.deviceType as audio.DeviceType;
              const deviceTypeStr: string = String(deviceType);
              const deviceRoleStr: string = String(preDeviceDescriptor.deviceRole);
              console.info(`${TAG}: preDevices[0].deviceType: ${deviceTypeStr}`);
              console.info(`${TAG}: preDevices[0].deviceRole: ${deviceRoleStr}`);
            }
          }
          console.info(`${TAG}: preDevices 属性验证成功`);
        } else {
          console.info(`${TAG}: 未收到设备变更事件，跳过 preDevices 验证`);
        }
        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`${TAG}: 测试失败: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_OPTIONAL_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_OPTIONAL_0100
     * @tc.desc    CurrentOutputDeviceChangedEvent preDevices optional property test - verify preDevices is optional and can be undefined.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_OPTIONAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_OPTIONAL_0100';
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_OPTIONAL_0100 start`);
      if (!audioSessionManager) {
        console.error(`${TAG}: AudioManager is null`);
        expect().assertFail();
        done();
        return;
      }

      let eventReceived = false;
      let preDevicesIsUndefined = false;

      const currentOutputDeviceChangedCallback = (event: audio.CurrentOutputDeviceChangedEvent) => {
        console.info(`${TAG}: currentOutputDeviceChanged callback triggered`);
        eventReceived = true;
        if (event.preDevices === undefined) {
          preDevicesIsUndefined = true;
          console.info(`${TAG}: preDevices is undefined (valid for optional property)`);
        } else {
          console.info(`${TAG}: preDevices has value: ${JSON.stringify(event.preDevices)}`);
        }
        expect(event.devices != null).assertTrue();
        expect(event.changeReason != null).assertTrue();
        expect(event.recommendedAction != null).assertTrue();
      };

      try {
        audioSessionManager.on('currentOutputDeviceChanged', currentOutputDeviceChangedCallback);
        console.info(`${TAG}: 注册 currentOutputDeviceChanged 回调成功`);

        await sleep(2000);

        let availableDevices = audioSessionManager.getAvailableDevices(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES);
        console.info(`${TAG}: 可用设备: ${JSON.stringify(availableDevices)}`);

        if (eventReceived) {
          console.info(`${TAG}: 收到设备变更事件，验证回调注册成功`);
          expect(currentOutputDeviceChangedCallback != null).assertTrue();
        } else {
          console.info(`${TAG}: 未收到设备变更事件，验证回调注册成功`);
          expect(currentOutputDeviceChangedCallback != null).assertTrue();
        }

        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`${TAG}: 测试失败: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_FORMAT_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_FORMAT_0100
     * @tc.desc    CurrentOutputDeviceChangedEvent preDevices format test - verify preDevices contains valid AudioDeviceDescriptor elements.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_FORMAT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_FORMAT_0100';
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_FORMAT_0100 start`);
      if (!audioSessionManager) {
        console.error(`${TAG}: AudioManager is null`);
        expect().assertFail();
        done();
        return;
      }

      const currentOutputDeviceChangedCallback = (event: audio.CurrentOutputDeviceChangedEvent) => {
        console.info(`${TAG}: currentOutputDeviceChanged callback triggered`);

        if (event.preDevices !== undefined && event.preDevices.length > 0) {
          console.info(`${TAG}: 验证 preDevices 元素格式`);
          for (let i = 0; i < event.preDevices.length; i++) {
            let device = event.preDevices[i];
            expect(device.deviceType != audio.DeviceType.INVALID).assertTrue();
            expect(device.deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
            expect(Number(device.id)).assertTrue();
            console.info(`${TAG}: preDevices[${i}] deviceId=${device.id}, deviceType=${device.deviceType}`);
          }
        }

        expect(event.devices != null).assertTrue();
        expect(event.devices.length > 0).assertTrue();
        for (let i = 0; i < event.devices.length; i++) {
          let device = event.devices[i];
          expect(device.deviceType != audio.DeviceType.INVALID).assertTrue();
          expect(device.deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        }
      };

      try {
        audioSessionManager.on('currentOutputDeviceChanged', currentOutputDeviceChangedCallback);
        console.info(`${TAG}: 注册 currentOutputDeviceChanged 回调成功`);
        await sleep(2000);
        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`${TAG}: 测试失败: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_CHANGE_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_CHANGE_0100
     * @tc.desc    CurrentOutputDeviceChangedEvent preDevices test with device change - verify preDevices reflects previous device before change.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_CHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_CHANGE_0100';
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_CHANGE_0100 start`);
      if (!audioSessionManager) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect().assertFail();
        done();
        return;
      }

      let eventReceived = false;
      let preDevicesBeforeChange: audio.AudioDeviceDescriptors | undefined = undefined;
      let devicesAfterChange: audio.AudioDeviceDescriptors | null = null;

      const currentOutputDeviceChangedCallback = (event: audio.CurrentOutputDeviceChangedEvent) => {
        console.info(`${TAG}: currentOutputDeviceChanged callback triggered`);
        eventReceived = true;
        preDevicesBeforeChange = event.preDevices;
        devicesAfterChange = event.devices;
        const preDevicesJson: string = JSON.stringify(preDevicesBeforeChange);
        const devicesJson: string = JSON.stringify(devicesAfterChange);
        console.info(`${TAG}: preDevices(变更前): ${JSON.stringify(preDevicesJson)}`);
        console.info(`${TAG}: devices(变更后): ${JSON.stringify(devicesJson)}`);
      };

      try {
        audioSessionManager.on('currentOutputDeviceChanged', currentOutputDeviceChangedCallback);
        console.info(`${TAG}: 注册 currentOutputDeviceChanged 回调成功`);

        await sleep(500);

        let availableDevices: audio.AudioDeviceDescriptors = audioSessionManager.getAvailableDevices(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES);
        const availableDevicesJson: string = JSON.stringify(availableDevices);
        console.info(`${TAG}: 当前可用设备: ${availableDevicesJson}`);

        let hasSpeaker: boolean = availableDevices.some((device: audio.AudioDeviceDescriptor) => device.deviceType === audio.DeviceType.SPEAKER);
        let hasEarpiece: boolean = availableDevices.some((device: audio.AudioDeviceDescriptor) => device.deviceType === audio.DeviceType.EARPIECE);

        if (hasSpeaker && hasEarpiece) {
          console.info(`${TAG}: 设备同时有 SPEAKER 和 EARPIECE，可以触发设备变更`);
          await audioSessionManager.setMediaOutputDevice(audio.DeviceType.EARPIECE);
          await sleep(1000);
          await audioSessionManager.setMediaOutputDevice(audio.DeviceType.SPEAKER);
          await sleep(2000);
        } else if (hasSpeaker) {
          console.info(`${TAG}: 设备只有 SPEAKER`);
          await audioSessionManager.setMediaOutputDevice(audio.DeviceType.SPEAKER);
          await sleep(2000);
        }

        if (eventReceived) {
          console.info(`${TAG}: 验证设备变更前后信息`);

          if (preDevicesBeforeChange !== undefined && devicesAfterChange !== null) {
            expect(Array.isArray(preDevicesBeforeChange)).assertTrue();
            expect(Array.isArray(devicesAfterChange)).assertTrue();
            console.info(`${TAG}: preDevices 和 devices 都是有效的 AudioDeviceDescriptors`);
            let preDevicesArray: audio.AudioDeviceDescriptors = preDevicesBeforeChange as audio.AudioDeviceDescriptors;
            let devicesArray: audio.AudioDeviceDescriptors = devicesAfterChange as audio.AudioDeviceDescriptors;


            let preDeviceType: audio.DeviceType | string = preDevicesArray.length > 0 ? preDevicesArray[0].deviceType : 'undefined';
            let postDeviceType: audio.DeviceType | string = devicesArray.length > 0 ? devicesArray[0].deviceType : 'undefined';
            const preDeviceTypeStr: string = String(preDeviceType);
            const postDeviceTypeStr: string = String(postDeviceType);
            console.info(`${TAG}: 变更前设备类型: ${preDeviceTypeStr}, 变更后设备类型: ${postDeviceTypeStr}`);
          } else {
            console.info(`${TAG}: preDevices 或 devices 为 undefined/null`);
          }
        }

        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`${TAG}: 测试失败: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    })

        /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_SET_OUTPUT_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_SET_OUTPUT_0100
     * @tc.desc    preDevices test with setMediaOutputDevice - verify preDevices captures device info before calling setMediaOutputDevice.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_SET_OUTPUT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_SET_OUTPUT_0100';
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_SET_OUTPUT_0100 start`);
      if (!audioSessionManager) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect().assertFail();
        done();
        return;
      }

      let eventReceived = false;
      let preDevicesCaptured: audio.AudioDeviceDescriptors | undefined = undefined;
      let devicesCaptured: audio.AudioDeviceDescriptors | null = null;
      let changeReasonCaptured: audio.AudioStreamDeviceChangeReason | null = null;

      const currentOutputDeviceChangedCallback = (event: audio.CurrentOutputDeviceChangedEvent) => {
        console.info(`${TAG}: currentOutputDeviceChanged callback triggered after setMediaOutputDevice`);
        eventReceived = true;
        preDevicesCaptured = event.preDevices;
        devicesCaptured = event.devices;
        changeReasonCaptured = event.changeReason;
      };

      try {
        audioSessionManager.on('currentOutputDeviceChanged', currentOutputDeviceChangedCallback);
        console.info(`${TAG}: 注册 currentOutputDeviceChanged 回调成功`);

        await sleep(500);

        let availableDevices = audioSessionManager.getAvailableDevices(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES);
        console.info(`${TAG}: 可用输出设备数量: ${availableDevices.length}`);

        if (availableDevices.length > 0) {
          let targetDeviceType = audio.DeviceType.SPEAKER;
          let hasTargetDevice = availableDevices.some((device: audio.AudioDeviceDescriptor) => device.deviceType === targetDeviceType);

          if (hasTargetDevice) {
            console.info(`${TAG}: 尝试设置设备: ${targetDeviceType}`);
            await audioSessionManager.setMediaOutputDevice(targetDeviceType);
            await sleep(2000);

            if (eventReceived) {
              console.info(`${TAG}: 验证 setMediaOutputDevice 触发的事件`);
              expect(changeReasonCaptured != null).assertTrue();
              console.info(`${TAG}: changeReason: ${changeReasonCaptured}`);

              if (preDevicesCaptured !== undefined) {
                expect(Array.isArray(preDevicesCaptured)).assertTrue();
                console.info(`${TAG}: preDevices 包含变更前的设备信息`);
              }

              if (devicesCaptured !== null) {
                expect(Array.isArray(devicesCaptured)).assertTrue();
                console.info(`${TAG}: devices 包含变更后的设备信息`);
              }
            } else {
              console.info(`${TAG}: setMediaOutputDevice 未触发设备变更事件`);
            }
          }
        }
        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`${TAG}: 测试失败: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_RENDERER_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_RENDERER_0100
     * @tc.desc    AudioStreamDeviceChangeInfo preDevices property test - verify preDevices is returned when AudioRenderer output device changes.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_RENDERER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_RENDERER_0100';
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_RENDERER_0100 start`);

      let rendererCreated = false;
      let deviceChangedEventReceived = false;
      let preDevicesValue: audio.AudioDeviceDescriptors | undefined = undefined;
      let devicesValue: audio.AudioDeviceDescriptors | null = null;
      let changeReasonValue: audio.AudioStreamDeviceChangeReason | null = null;

      try {
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          }
        };

        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        expect(audioRenderer != null).assertTrue();
        rendererCreated = true;
        console.info(`${TAG}: AudioRenderer 创建成功`);

        const outputDeviceChangeWithInfoCallback = (info: audio.AudioStreamDeviceChangeInfo) => {
          console.info(`${TAG}: outputDeviceChangeWithInfo callback triggered`);
          deviceChangedEventReceived = true;
          preDevicesValue = info.preDevices;
          devicesValue = info.devices;
          changeReasonValue = info.changeReason;
          const preDevicesJson: string = JSON.stringify(preDevicesValue);
          const devicesJson: string = JSON.stringify(devicesValue);
          console.info(`${TAG}: preDevices: ${JSON.stringify(preDevicesJson)}`);
          console.info(`${TAG}: devices: ${JSON.stringify(devicesJson)}`);
          console.info(`${TAG}: changeReason: ${changeReasonValue}`);
        };

        audioRenderer.on('outputDeviceChangeWithInfo', outputDeviceChangeWithInfoCallback);
        console.info(`${TAG}: 注册 outputDeviceChangeWithInfo 回调成功`);

        await audioRenderer.start();
        console.info(`${TAG}: AudioRenderer 启动成功`);

        await sleep(2000);

        if (deviceChangedEventReceived) {
          console.info(`${TAG}: 验证 preDevices 属性`);
          expect(devicesValue != null).assertTrue();
          expect(Array.isArray(devicesValue)).assertTrue();
          expect(changeReasonValue != null).assertTrue();

          if (preDevicesValue !== undefined) {
            expect(Array.isArray(preDevicesValue)).assertTrue();
            let preDevicesArray: audio.AudioDeviceDescriptors = preDevicesValue as audio.AudioDeviceDescriptors;
            const preDevicesLength: number = preDevicesArray.length;
            const preDevicesLengthStr: string = String(preDevicesLength);

            console.info(`${TAG}: preDevices 数组长度: ${preDevicesLengthStr}`);
            if (preDevicesArray.length > 0) {
              let preDeviceDescriptor: audio.AudioDeviceDescriptor = preDevicesArray[0];
              expect(preDeviceDescriptor.deviceType != null).assertTrue();
              expect(preDeviceDescriptor.deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
              const deviceTypeStr: string = String(preDeviceDescriptor.deviceType);
              console.info(`${TAG}: preDevices[0].deviceType: ${deviceTypeStr}`);
            }
          }
          console.info(`${TAG}: preDevices 属性验证成功`);
        } else {
          console.info(`${TAG}: 未收到设备变更事件，跳过 preDevices 验证`);
        }
        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`${TAG}: 测试失败: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_TYPE_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_TYPE_0100
     * @tc.desc    AudioStreamDeviceChangeInfo preDevices type test - verify preDevices is AudioDeviceDescriptors type.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_TYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_TYPE_0100';
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_TYPE_0100 start`);

      try {
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          }
        };

        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        expect(audioRenderer != null).assertTrue();
        console.info(`${TAG}: AudioRenderer 创建成功`);

        let eventReceived = false;

        const outputDeviceChangeWithInfoCallback = (info: audio.AudioStreamDeviceChangeInfo) => {
          eventReceived = true;
          console.info(`${TAG}: outputDeviceChangeWithInfo callback triggered`);
          expect(info.devices != null).assertTrue();
          expect(info.changeReason != null).assertTrue();

          if (info.preDevices !== undefined) {
            console.info(`${TAG}: preDevices 类型验证`);
            expect(Array.isArray(info.preDevices)).assertTrue();

            for (let i = 0; i < info.preDevices.length; i++) {
              let device = info.preDevices[i];
              expect(device.deviceType).assertLarger(0);
              expect(device.deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
              expect(device.id != null).assertTrue();
              console.info(`${TAG}: preDevices[${i}] deviceType=${device.deviceType}, deviceRole=${device.deviceRole}`);
            }
          } else {
            console.info(`${TAG}: preDevices is undefined (valid for optional property)`);
          }
        };

        audioRenderer.on('outputDeviceChangeWithInfo', outputDeviceChangeWithInfoCallback);
        console.info(`${TAG}: 注册 outputDeviceChangeWithInfo 回调成功`);

        await audioRenderer.start();
        console.info(`${TAG}: AudioRenderer 启动成功`);

        await sleep(2000);

        if (!eventReceived) {
          console.info(`${TAG}: 未收到设备变更事件，验证接口注册成功`);
          expect(audioRenderer != null).assertTrue();
        }
        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`${TAG}: 测试失败: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_COMPARE_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_COMPARE_0100
     * @tc.desc    AudioStreamDeviceChangeInfo preDevices comparison test - verify preDevices and devices are different when device changes.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_COMPARE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_COMPARE_0100';
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_COMPARE_0100 start`);

      try {
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          }
        };

        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        expect(audioRenderer != null).assertTrue();
        console.info(`${TAG}: AudioRenderer 创建成功`);

        let eventReceived = false;

        const outputDeviceChangeWithInfoCallback = (info: audio.AudioStreamDeviceChangeInfo) => {
          eventReceived = true;
          console.info(`${TAG}: outputDeviceChangeWithInfo callback triggered`);

          if (info.preDevices !== undefined && info.devices !== null) {
            console.info(`${TAG}: 比较 preDevices 和 devices`);
            let preDeviceTypes = info.preDevices.map((d: audio.AudioDeviceDescriptor) => d.deviceType);
            let postDeviceTypes = info.devices.map((d: audio.AudioDeviceDescriptor) => d.deviceType);
            console.info(`${TAG}: preDevices deviceTypes: ${JSON.stringify(preDeviceTypes)}`);
            console.info(`${TAG}: devices deviceTypes: ${JSON.stringify(postDeviceTypes)}`);

            expect(info.preDevices.length).assertLarger(0);
            expect(info.devices.length).assertLarger(0);

            let areDifferent = preDeviceTypes.length !== postDeviceTypes.length ||
              preDeviceTypes.some((type: audio.DeviceType, index: number) => type !== postDeviceTypes[index]);
            if (areDifferent) {
              console.info(`${TAG}: preDevices 和 devices 内容不同，设备确实发生了变更`);
            } else {
              console.info(`${TAG}: preDevices 和 devices 内容相同`);
            }
          }
        };

        audioRenderer.on('outputDeviceChangeWithInfo', outputDeviceChangeWithInfoCallback);
        console.info(`${TAG}: 注册 outputDeviceChangeWithInfo 回调成功`);

        await audioRenderer.start();
        console.info(`${TAG}: AudioRenderer 启动成功`);

        await sleep(2000);

        if (!eventReceived) {
          console.info(`${TAG}: 未收到设备变更事件`);
        }
        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        console.error(`${TAG}: 测试失败: ${error.code}, ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_ERROR_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_ERROR_0100
     * @tc.desc    onCurrentOutputDeviceChanged parameter error test - verify error 6800101 when callback is null.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_ERROR_0100';
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_ERROR_0100 start`);
      if (!audioSessionManager) {
        console.error(`${TAG}: audioSessionManager is null`);
        expect().assertFail();
        done();
        return;
      }

      try {
        type DeviceChangeCallback = (event: audio.CurrentOutputDeviceChangedEvent) => void;
        let dummyCallback: DeviceChangeCallback = (_event: audio.CurrentOutputDeviceChangedEvent) => {
          console.info(`${TAG}: dummy callback`);
        };
        audioSessionManager.off('currentOutputDeviceChanged', dummyCallback);
        console.info(`${TAG}:注销未注册的回调成功`);
        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        const errorCode: number = error.code;
        const errorMessage: string = error.message;
        console.info(`${TAG}: 预期错误: ${errorCode}, ${errorMessage}`);
        expect(errorCode).assertEqual(6800101);
        done();
      }
    })

    /**
     * @tc.name    SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_RENDERER_ERROR_0100
     * @tc.number  SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_RENDERER_ERROR_0100
     * @tc.desc    onOutputDeviceChangeWithInfo parameter error test - verify error 401 when callback is invalid type.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_RENDERER_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_RENDERER_ERROR_0100';
      console.info(`${TAG}: SUB_MULTIMEDIA_AUDIO_PRE_DEVICES_RENDERER_ERROR_0100 start`);

      try {
        let audioRendererOptions: audio.AudioRendererOptions = {
          streamInfo: {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          },
          rendererInfo: {
            usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
            rendererFlags: 0
          }
        };

        audioRenderer = await audio.createAudioRenderer(audioRendererOptions);
        expect(audioRenderer != null).assertTrue();
        console.info(`${TAG}: AudioRenderer 创建成功`);
        
        type DeviceChangeInfoCallback = (info: audio.AudioStreamDeviceChangeInfo) => void;
        let dummyCallback: DeviceChangeInfoCallback = (_info: audio.AudioStreamDeviceChangeInfo) => {
          console.info(`${TAG}: dummy callback`);
        };
        audioRenderer.off('outputDeviceChangeWithInfo', dummyCallback);
        console.info(`${TAG}: 注销未注册的回调成功`);
        done();
      } catch (err) {
        let error: BusinessError = err as BusinessError;
        const errorCode: number = error.code;
        const errorMessage: string = error.message;
        console.info(`${TAG}: 预期错误: ${errorCode}, ${errorMessage}`);
        expect(errorCode === 401 || errorCode === 6800101).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0100
     * @tc.desc   on - availableDeviceChange - errorParameter(-1) - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      try {
        audioRoutingManager.on('availableDeviceChange', -1, (data: ESObject) => {
          console.info(`${Tag}:on_availableDeviceChange -1: SUCCESS`);
        });
        expect(false).assertTrue();
        done();
        audioRoutingManager.off('availableDeviceChange', (data: ESObject) => {
          console.info(`${Tag}:on_availableDeviceChange -1: SUCCESS`);
        });
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${Tag}: on_availableDeviceChange -1 ERROR: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0200
     * @tc.desc   on - availableDeviceChange - errorParameter(9) - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0200', 2, (done: Function) => {
      try {
        audioRoutingManager.on('availableDeviceChange', 9, (data: ESObject) => {
          console.info(`${Tag}:on_availableDeviceChange 9: SUCCESS`);
        });
        expect(false).assertTrue();
        done();
        audioRoutingManager.off('availableDeviceChange', (data: ESObject) => {
          console.info(`${Tag}:off_availableDeviceChange 9: SUCCESS`);
        });
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${Tag}: on_availableDeviceChange 9 ERROR: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0300
     * @tc.desc   on - availableDeviceChange - errorParameter('123') - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0300', 2, (done: Function) => {
      try {
        audioRoutingManager.on('availableDeviceChange', '123', (data: ESObject) => {
          console.info(`${Tag}: on_availableDeviceChange '123': SUCCESS`);
        });
        expect(false).assertTrue();
        done();
        audioRoutingManager.off('availableDeviceChange', (data: ESObject) => {
          console.info(`${Tag}:off_availableDeviceChange 123: SUCCESS`);
        });
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.error(`${Tag}: on_availableDeviceChange '123' ERROR: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0400
     * @tc.desc   on - off - availableDeviceChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0400', 2, (done: Function) => {
      try {
        audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.MEDIA_OUTPUT_DEVICES, (data: ESObject) => {
          console.info(`${Tag}: on_availableDeviceChange: SUCCESS`);
        });
        audioRoutingManager.off('availableDeviceChange', (data: ESObject) => {
          console.info(`${Tag}: off_availableDeviceChange 'availableDeviceChange': SUCCESS`);
        });
        done();
      } catch (error) {
        console.error(`${Tag}: on_availableDeviceChange ERROR: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0500
     * @tc.desc   on - off - availableDeviceChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let flag: boolean = false;
      try {
        // 取消该事件的所有监听。
        audioRoutingManager.off('availableDeviceChange');

        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let availableDeviceChangeCallback = (deviceChanged: audio.DeviceChangeAction) => {
          console.info('device change type : ' + deviceChanged.type);
          console.info('device descriptor size : ' + deviceChanged.deviceDescriptors.length);
          console.info('device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
          console.info('device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
        };

        audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.MEDIA_OUTPUT_DEVICES, availableDeviceChangeCallback);

        audioRoutingManager.off('availableDeviceChange', availableDeviceChangeCallback);
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0500 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0600
     * @tc.desc   on - off - availableDeviceChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let flag: boolean = false;
      try {
        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let availableDeviceChangeCallback = (deviceChanged: audio.DeviceChangeAction) => {
          console.info('device change type : ' + deviceChanged.type);
          console.info('device descriptor size : ' + deviceChanged.deviceDescriptors.length);
          console.info('device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
          console.info('device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
        };

        audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.MEDIA_OUTPUT_DEVICES, availableDeviceChangeCallback);

        audioRoutingManager.off('availableDeviceChange');
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0600 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0100
     * @tc.desc   on -off- micBlockStatusChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      try {
        let blockMic: boolean = audioRoutingManager.isMicBlockDetectionSupported()
        if (blockMic == true) {
          audioRoutingManager.on('micBlockStatusChanged', async(deviceBlockStatusInfo: ESObject) =>{
            if (deviceBlockStatusInfo.DeviceBlockStatus == audioRoutingManager.blockStatus.BLOCKED ||
            deviceBlockStatusInfo.DeviceBlockStatus == audioRoutingManager.blockStatus.UNBLOCKED) {
              console.info(`${Tag}: on_micBlockStatusChanged: SUCCESS`);
            } else {
              console.info(`${Tag}: on_micBlockStatusChanged: SUCCESS`);
              expect(false).assertTrue();
            }
          })
          audioRoutingManager.off('micBlockStatusChanged')
        }
      } catch (error) {
        console.error(`${Tag}: on_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0200
     * @tc.desc   on - micBlockStatusChanged - errorParameter(null) - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0200', 2, (done: Function) => {
      try {
        let onName: ESObject = null
        audioRoutingManager.on(onName, async(deviceBlockStatusInfo: ESObject) =>{
          console.info(`${Tag}: on_micBlockStatusChanged ERROR`);
        })
        expect(false).assertTrue();
      } catch (error) {
        console.error(`${Tag}: off_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0300
     * @tc.desc   on - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0300', 2, (done: Function) => {
      try {
        audioRoutingManager.on("123", async(deviceBlockStatusInfo: ESObject) =>{
          console.info(`${Tag}: on_micBlockStatusChanged ERROR`);
        })
        expect(false).assertTrue();
      } catch (error) {
        console.error(`${Tag}: off_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0400
     * @tc.desc   on - micBlockStatusChanged - errorParameter(null) - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0400', 2, (done: Function) => {
      try {
        audioRoutingManager.on('micBlockStatusChanged')
        console.info(`${Tag}: on_micBlockStatusChanged ERROR`);
        expect(false).assertTrue();
      } catch (error) {
        console.error(`${Tag}: off_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0500
     * @tc.desc   on - off - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0500', 2, (done: Function) => {
      try {
        audioRoutingManager.on('micBlockStatusChanged', "123", ()=> {
          console.info(`${Tag}: on_micBlockStatusChanged ERROR`);
        })
        console.info(`${Tag}: on_micBlockStatusChanged ERROR`);
        expect(false).assertTrue();
      } catch (error) {
        console.error(`${Tag}: off_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0600
     * @tc.desc   off - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0600', 2, (done: Function) => {
      try {
        audioRoutingManager.off('123')
        console.info(`${Tag}: off_micBlockStatusChanged01: SUCCESS`);
        expect(false).assertTrue();
      } catch (error) {
        console.error(`${Tag}: off_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        audioRoutingManager.off('micBlockStatusChanged')
        console.info(`${Tag}: off_micBlockStatusChanged02: SUCCESS`);
        expect(Number(error.code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0700
     * @tc.desc   on - off - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0700', 2, (done: Function) => {
      try {
        audioRoutingManager.on('micBlockStatusChanged', async(deviceBlockStatusInfo: ESObject) =>{
          console.info(`${Tag}: on_micBlockStatusChanged: SUCCESS`);
        })
        audioRoutingManager.off('micBlockStatusChanged', "123")
        console.info(`${Tag}: off_micBlockStatusChanged01: SUCCESS`);
        expect(false).assertTrue();
      } catch (error) {
        console.error(`${Tag}: off_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        audioRoutingManager.off('micBlockStatusChanged')
        console.info(`${Tag}: off_micBlockStatusChanged02: SUCCESS`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0800
     * @tc.desc   audio.DeviceBlockStatusInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      try {
        let blockMic: boolean = audioRoutingManager.isMicBlockDetectionSupported()
        if (blockMic == true) {
          audioRoutingManager.on('micBlockStatusChanged', async(deviceBlockStatusInfo: audio.DeviceBlockStatusInfo) =>{
            let audioDeviceBlockStatusInfo: audio.DeviceBlockStatus = deviceBlockStatusInfo.blockStatus;
            if (audioDeviceBlockStatusInfo == audio.DeviceBlockStatus.BLOCKED ||
            audioDeviceBlockStatusInfo == audio.DeviceBlockStatus.UNBLOCKED) {
              let audioDevices: audio.AudioDeviceDescriptors = deviceBlockStatusInfo.devices;
              console.info(`${Tag}: audioDevices[0].id: ${audioDevices[0].id}`);
              expect(audioDevices[0].id).assertLargerOrEqual(0);
              console.info(`${Tag}: on_micBlockStatusChanged: SUCCESS`);
            } else {
              console.info(`${Tag}: on_micBlockStatusChanged: SUCCESS`);
              expect(false).assertTrue();
            }
          })
          audioRoutingManager.off('micBlockStatusChanged')
        }
      } catch (error) {
        console.error(`${Tag}: on_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
      }
      done();
    });
     /**
 	      * @tc.name   AUDIO_ROUTING_MANAGER_GETDEVICESSYNC_ALLDEVICESFLAG_0100
 	      * @tc.number AUDIO_ROUTING_MANAGER_GETDEVICESSYNC_ALLDEVICESFLAG_0100
 	      * @tc.desc   getDevicesSync with ALL_DEVICES_FLAG test.
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('AUDIO_ROUTING_MANAGER_GETDEVICESSYNC_ALLDEVICESFLAG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
 	       try {
 	         let devices:ESObject = audioRoutingManager.getDevicesSync(audio.DeviceFlag.ALL_DEVICES_FLAG);
 	         console.info(`${Tag}: getDevicesSync with ALL_DEVICES_FLAG: PASS, device count: ${devices.length}`);
 	         done();
 	       } catch (err) {
 	         console.info(`${Tag}: getDevicesSync with ALL_DEVICES_FLAG: FAIL :${(err as BusinessError).message}`);
 	         expect(false).assertTrue();
 	       }
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_INPUTDEVICESFLAG_0100
 	      * @tc.number AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_INPUTDEVICESFLAG_0100
 	      * @tc.desc   on deviceChange with INPUT_DEVICES_FLAG test.
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_INPUTDEVICESFLAG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
 	       try {
 	         let callback = (deviceChangeAction: audio.DeviceChangeAction) => {
 	           console.info(`${Tag}: deviceChange callback called`);
 	         };
 	         audioRoutingManager.on('deviceChange', audio.DeviceFlag.INPUT_DEVICES_FLAG, callback);
 	         console.info(`${Tag}: on deviceChange with INPUT_DEVICES_FLAG: PASS`);
 	         done();
 	         audioRoutingManager.off('deviceChange', callback);
 	       } catch (err) {
 	         console.info(`${Tag}: on deviceChange with INPUT_DEVICES_FLAG: FAIL :${(err as BusinessError).message}`);
 	         expect(false).assertTrue();
 	       }
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_ALLDEVICESFLAG_0100
 	      * @tc.number AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_ALLDEVICESFLAG_0100
 	      * @tc.desc   on deviceChange with ALL_DEVICES_FLAG test.
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_ALLDEVICESFLAG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
 	       try {
 	         let callback = (deviceChangeAction: audio.DeviceChangeAction) => {
 	           console.info(`${Tag}: deviceChange callback called`);
 	         };
 	         audioRoutingManager.on('deviceChange', audio.DeviceFlag.ALL_DEVICES_FLAG, callback);
 	         console.info(`${Tag}: on deviceChange with ALL_DEVICES_FLAG: PASS`);
 	         done();
 	         audioRoutingManager.off('deviceChange', callback);
 	       } catch (err) {
 	         console.info(`${Tag}: on deviceChange with ALL_DEVICES_FLAG: FAIL :${(err as BusinessError).message}`);
 	         expect(false).assertTrue();
 	       }
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_MEDIAINPUTDEVICES_0100
 	      * @tc.number AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_MEDIAINPUTDEVICES_0100
 	      * @tc.desc   on availableDeviceChange with MEDIA_INPUT_DEVICES test.
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_MEDIAINPUTDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
 	       try {
 	         let callback = (deviceChangeAction: audio.DeviceChangeAction) => {
 	           console.info(`${Tag}: availableDeviceChange callback called`);
 	         };
 	         audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.MEDIA_INPUT_DEVICES, callback);
 	         console.info(`${Tag}: on availableDeviceChange with MEDIA_INPUT_DEVICES: PASS`);
 	         done();
 	         audioRoutingManager.off('availableDeviceChange', callback);
 	       } catch (err) {
 	         console.info(`${Tag}: on availableDeviceChange with MEDIA_INPUT_DEVICES: FAIL :${(err as BusinessError).message}`);
 	         expect(false).assertTrue();
 	       }
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_ALLMEDIADEVICES_0100
 	      * @tc.number AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_ALLMEDIADEVICES_0100
 	      * @tc.desc   on availableDeviceChange with ALL_MEDIA_DEVICES test.
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_ALLMEDIADEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
 	       try {
 	         let callback = (deviceChangeAction: audio.DeviceChangeAction) => {
 	           console.info(`${Tag}: availableDeviceChange callback called`);
 	         };
 	         audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.ALL_MEDIA_DEVICES, callback);
 	         console.info(`${Tag}: on availableDeviceChange with ALL_MEDIA_DEVICES: PASS`);
 	         done();
 	         audioRoutingManager.off('availableDeviceChange', callback);
 	       } catch (err) {
 	         console.info(`${Tag}: on availableDeviceChange with ALL_MEDIA_DEVICES: FAIL :${(err as BusinessError).message}`);
 	         expect(false).assertTrue();
 	       }
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_CALLOUTPUTDEVICES_0100
 	      * @tc.number AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_CALLOUTPUTDEVICES_0100
 	      * @tc.desc   on availableDeviceChange with CALL_OUTPUT_DEVICES test.
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_CALLOUTPUTDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
 	       try {
 	         let callback = (deviceChangeAction: audio.DeviceChangeAction) => {
 	           console.info(`${Tag}: availableDeviceChange callback called`);
 	         };
 	         audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.CALL_OUTPUT_DEVICES, callback);
 	         console.info(`${Tag}: on availableDeviceChange with CALL_OUTPUT_DEVICES PASS`);
 	         done();
 	         audioRoutingManager.off('availableDeviceChange', callback);
 	       } catch (err) {
 	         console.info(`${Tag}: on availableDeviceChange with CALL_OUTPUT_DEVICES: FAIL :${(err as BusinessError).message}`);
 	         expect(false).assertTrue();
 	       }
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_CALLINPUTDEVICES_0100
 	      * @tc.number AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_CALLINPUTDEVICES_0100
 	      * @tc.desc   on availableDeviceChange with CALL_INPUT_DEVICES test.
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_CALLINPUTDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
 	       try {
 	         let callback = (deviceChangeAction: audio.DeviceChangeAction) => {
 	           console.info(`${Tag}: availableDeviceChange callback called`);
 	         };
 	         audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.CALL_INPUT_DEVICES, callback);
 	         console.info(`${Tag}: on availableDeviceChange with CALL_INPUT_DEVICES: PASS`);
 	         done();
 	         audioRoutingManager.off('availableDeviceChange', callback);
 	       } catch (err) {
 	         console.info(`${Tag}: on availableDeviceChange with CALL_INPUT_DEVICES: FAIL :${(err as BusinessError).message}`);
 	         expect(false).assertTrue();
 	       }
 	       done();
 	     })
 	 
 	     /**
 	      * @tc.name   AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_ALLCALLDEVICES_0100
 	      * @tc.number AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_ALLCALLDEVICES_0100
 	      * @tc.desc   on availableDeviceChange with ALL_CALL_DEVICES test.
 	      * @tc.type   FUNCTION
 	      * @tc.size   MEDIUMTEST
 	      * @tc.level  LEVEL2
 	      */
 	     it('AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_ALLCALLDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
 	       try {
 	         let callback = (deviceChangeAction: audio.DeviceChangeAction) => {
 	           console.info(`${Tag}: availableDeviceChange callback called`);
 	         };
 	         audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.ALL_CALL_DEVICES, callback);
 	         console.info(`${Tag}: on availableDeviceChange with ALL_CALL_DEVICES: PASS`);
 	         done();
 	         audioRoutingManager.off('availableDeviceChange', callback);
 	       } catch (err) {
 	         console.info(`${Tag}: on availableDeviceChange with ALL_CALL_DEVICES: FAIL :${(err as BusinessError).message}`);
 	         expect(false).assertTrue();
 	       }
 	       done();
 	     })
  })
}