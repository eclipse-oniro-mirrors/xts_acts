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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
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

    let driveFn = async () => {
      let dr = Driver.create();
      await sleep(1000);
      let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      await sleep(1000);
      await power?.click();
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0100
     * @tc.name      : getAvailableDevices-MEDIA_OUTPUT_DEVICES-speaker
     * @tc.desc      : getAvailableDevices-MEDIA_OUTPUT_DEVICES-speaker
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0100', 2, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES);
        console.log(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0200
     * @tc.name      : getAvailableDevices-MEDIA_INPUT_DEVICES-MIC
     * @tc.desc      : getAvailableDevices-MEDIA_INPUT_DEVICES-MIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0200', 2, (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0300
     * @tc.name      : getAvailableDevices - Audio
     * @tc.desc      : Gets the available by device usage type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0300', 2, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.ALL_MEDIA_DEVICES);
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(devices[0].deviceType > 0).assertTrue();
        expect(devices[0].displayName != "").assertTrue();
        expect(devices[1].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(devices[1].deviceType > 0).assertTrue();
        expect(devices[1].displayName != "").assertTrue();
        done();
      } catch (error) {
        console.info(`${Tag}:getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0400
     * @tc.name      : getAvailableDevices-CALL_OUTPUT_DEVICES-SPEAKER&EARPIECE
     * @tc.desc      : getAvailableDevices-CALL_OUTPUT_DEVICES-SPEAKER&EARPIECE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0400', 2, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.CALL_OUTPUT_DEVICES);
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices[0].deviceRole).assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
        expect(devices[0].deviceType > 0).assertTrue();
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0500
     * @tc.name      : getAvailableDevices-CALL_INPUT_DEVICES-MIC
     * @tc.desc      : Gets the available by device usage type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0600
     * @tc.name      : getAvailableDevices-ALL_CALL_DEVICES-SPEAKER & MIC & EARPIECE
     * @tc.desc      : getAvailableDevices-ALL_CALL_DEVICES-SPEAKER & MIC & EARPIECE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0600', 2, (done: Function) => {
      try {
        let devices: ESObject = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.ALL_CALL_DEVICES);
        console.info(`${Tag}:getAvailableDevices :SUCCESS ${JSON.stringify(devices)}`);
        expect(devices.length > 0).assertTrue();
        for (let i = 0; i < devices.length; i++) {
          expect(devices[i].deviceRole != "").assertTrue();
          expect(devices[i].deviceType > 0).assertTrue();
          expect(devices[i].displayName != "").assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${Tag}:getAvailableDevices error ${error.message}, code ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0700
     * @tc.name      : getAvailableDevices - errorParameter(-1) -6800101
     * @tc.desc      : getAvailableDevices - errorParameter(-1) -6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0800
     * @tc.name      : getAvailableDevices - errorParameter(9) -6800101
     * @tc.desc      : getAvailableDevices - errorParameter(9) -6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0900
     * @tc.name      : getAvailableDevices - errorParameter('12') -401
     * @tc.desc      : getAvailableDevices - errorParameter('12') -401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_1000
     * @tc.name      : getAvailableDevices - null parameter - 401
     * @tc.desc      : getAvailableDevices - null parameter - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_1000', 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0100
     * @tc.name      : on - availableDeviceChange - errorParameter(-1) - 6800101
     * @tc.desc      : on - availableDeviceChange - errorParameter(-1) - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0100', 2, (done: Function) => {
      try {
        audioRoutingManager.on('availableDeviceChange', -1, (data: ESObject) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0200
     * @tc.name      : on - availableDeviceChange - errorParameter(9) - 6800101
     * @tc.desc      : on - availableDeviceChange - errorParameter(9) - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0200', 2, (done: Function) => {
      try {
        audioRoutingManager.on('availableDeviceChange', 9, (data: ESObject) => {
          console.info(`${Tag}:on_availableDeviceChange 9: SUCCESS`);
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0300
     * @tc.name      : on - availableDeviceChange - errorParameter('123') - 401
     * @tc.desc      : on - availableDeviceChange - errorParameter('123') - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0300', 2, (done: Function) => {
      try {
        audioRoutingManager.on('availableDeviceChange', '123', (data: ESObject) => {
          console.info(`${Tag}: on_availableDeviceChange '123': SUCCESS`);
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0400
     * @tc.name      : on - off - availableDeviceChange
     * @tc.desc      : on - off - availableDeviceChange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0400', 2, (done: Function) => {
      try {
        audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.MEDIA_OUTPUT_DEVICES, (data: ESObject) => {
          console.info(`${Tag}: on_availableDeviceChange: SUCCESS`);
        });
        audioRoutingManager.off('availableDeviceChange', (data: ESObject) => {
          console.info(`${Tag}: off_availableDeviceChange 'availableDeviceChange': SUCCESS`);
        });
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.error(`${Tag}: on_availableDeviceChange ERROR: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    });
     /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0100
     * @tc.name      : on -off- micBlockStatusChanged
     * @tc.desc      : on -off- micBlockStatusChanged
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0100', 2, (done: Function) => {
      try {
        let blockMic: boolean = audioRoutingManager.isMicBlockDetectionSupported()
        if (blockMic == true) {
          audioRoutingManager.on('micBlockStatusChanged', async(deviceBlockStatusInfo: ESObject) =>{
            if (deviceBlockStatusInfo.DeviceBlockStatus == audioRoutingManager.blockStatus.BLOCKED ||
            deviceBlockStatusInfo.DeviceBlockStatus == audioRoutingManager.blockStatus.UNBLOCKED) {
              console.info(`${Tag}: on_micBlockStatusChanged: SUCCESS`);
              expect(true).assertTrue();
            } else {
              console.info(`${Tag}: on_micBlockStatusChanged: SUCCESS`);
              expect(false).assertTrue();
            }
          })
          audioRoutingManager.off('micBlockStatusChanged')
        }
        expect(true).assertTrue();
      } catch (error) {
        console.error(`${Tag}: on_micBlockStatusChanged ERROR: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
      }
      done();
    });
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0200
     * @tc.name      : on - micBlockStatusChanged - errorParameter(null) - 401
     * @tc.desc      : on - micBlockStatusChanged - errorParameter(null) - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0300
     * @tc.name      : on - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.desc      : on - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0400
     * @tc.name      : on - micBlockStatusChanged - errorParameter(null) - 401
     * @tc.desc      : on - micBlockStatusChanged - errorParameter(null) - 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0500
     * @tc.name      : on - off - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.desc      : on - off - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0600
     * @tc.name      : off - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.desc      : off - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_MICBLOCKSTATUSCHANGE_0700
     * @tc.name      : on - off - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.desc      : on - off - micBlockStatusChanged - errorParameter("123") - 6800101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
  })
}