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


export default function AudioRoutingManagerTest() {
  describe('AudioRoutingManagerTest', () => {
    let audioRoutingManager: audio.AudioRoutingManager = audio.getAudioManager().getRoutingManager();
    let Tag = "AudioRoutingManagerTest";
    beforeAll(async () => {
      console.info('TestLog: Start Testing audioManagerTest Interfaces');
    });
    beforeEach(async () => {
      console.info(`${Tag}: beforeEach: Prerequisites at the test case level`);
    });
    afterEach(async () => {
      console.info(`${Tag}: afterEach: Test case-level clearance conditions`);
    });
    afterAll(async () => {
      console.info(`${Tag}: afterAll: Test suite-level cleanup condition`);
    });

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0100
     * @tc.name      : getAvailableDevices-MEDIA_OUTPUT_DEVICES-speaker
     * @tc.desc      : getAvailableDevices-MEDIA_OUTPUT_DEVICES-speaker
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0100', 2, (done) => {
      try {
        let devices = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.MEDIA_OUTPUT_DEVICES);
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0200', 2, (done) => {
      try {
        let devices = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.MEDIA_INPUT_DEVICES);
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0300', 2, (done) => {
      try {
        let devices = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.ALL_MEDIA_DEVICES);
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0400', 2, (done) => {
      try {
        let devices = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.CALL_OUTPUT_DEVICES);
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0500', 2, (done) => {
      try {
        let devices = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.CALL_INPUT_DEVICES);
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0600', 2, (done) => {
      try {
        let devices = audioRoutingManager.getAvailableDevices(audio.DeviceUsage.ALL_CALL_DEVICES);
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0700', 2, (done) => {
      try {
        let devices = audioRoutingManager.getAvailableDevices(-1);
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0800', 2, (done) => {
      try {
        let devices = audioRoutingManager.getAvailableDevices(9);
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_0900', 2, (done) => {
      try {
        // @ts-ignore
        let devices = audioRoutingManager.getAvailableDevices('12');
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETAVAILABLEDEVICES_1000', 2, async (done) => {
      try {
        // @ts-ignore
        let devices = audioRoutingManager.getAvailableDevices();
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0100', 2, (done) => {
      try {
        audioRoutingManager.on('availableDeviceChange', -1, (data) => {
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0200', 2, (done) => {
      try {
        audioRoutingManager.on('availableDeviceChange', 9, (data) => {
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0300', 2, (done) => {
      try {
        // @ts-ignore
        audioRoutingManager.on('availableDeviceChange', '123', (data) => {
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
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_AVAILABLEDEVICECHANGE_0400', 2, (done) => {
      try {
        audioRoutingManager.on('availableDeviceChange', audio.DeviceUsage.MEDIA_OUTPUT_DEVICES, (data) => {
          console.info(`${Tag}: on_availableDeviceChange: SUCCESS`);
        });
        audioRoutingManager.off('availableDeviceChange', (data) => {
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
  })
}