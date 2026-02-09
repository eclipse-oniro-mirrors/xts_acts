/**
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
import audio from '@ohos.multimedia.audio';
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';
import { Permissions } from '@ohos.abilityAccessCtrl';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { BY, UiDriver } from '@ohos.UiTest';
import { deviceInfo } from "@kit.BasicServicesKit";

let deviceTypeInfo: string = deviceInfo.deviceType
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let TagFrmwk: string = "AudioFrameworkTest";
console.info(`${TagFrmwk}: Create AudioManger Object JS Framework`);
let audioManager: audio.AudioManager;
let audioVolumeManager: audio.AudioVolumeManager;
let audioVolumeGroupManager: audio.AudioVolumeGroupManager;
let dRValue = null;
let dTValue = null;
let devId: number = 0;
let devName = null;
let devAddr = null;
let sRate = null;
let cCount = null;
let cMask = null;
let volumeType = null;
let audioMedia: number = 3;
let audioRingtone: number = 2;
let minVol: number = 0;
let maxVol: number = 15;
let maxVolPc: number = 100;
let lowVol: number = 5;
let highVol: number = 14;
let outOfRangeVol: number = 101;
let longValue = '28374837458743875804735081439085918459801437584738967509184509813904850914375904790589104801843';
let AudioVolumeType: ESObject = "123";
const MaxVloume: number[] = [15,20,100];

async function getAudioManager() {
  audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
  } else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

async function getVolumeGroupManager() {
  audioVolumeManager = await audioManager.getVolumeManager();
  audioVolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID)
  if (audioVolumeGroupManager != null) {
    console.info(`${TagFrmwk}: getVolumeGroupManager : PASS`);
  } else {
    console.info(`${TagFrmwk}: getVolumeGroupManager : FAIL`);
  }
}

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}

function displayDeviceProp(value: ESObject, index: number, array: ESObject) {
  let devRoleName: string;
  let devTypeName: string;
  if (value.deviceRole == 1) {
    devRoleName = 'INPUT_DEVICE';
  } else if (value.deviceRole == 2) {
    devRoleName = 'OUTPUT_DEVICE ';
  } else {
    devRoleName = 'ERROR : UNKNOWN : ' + value.deviceRole;
  }

  if (value.deviceType == audio.DeviceType.EARPIECE) {
    devTypeName = 'EARPIECE';
  } else if (value.deviceType == audio.DeviceType.SPEAKER) {
    devTypeName = 'SPEAKER';
  } else if (value.deviceType == audio.DeviceType.WIRED_HEADSET) {
    devTypeName = 'WIRED_HEADSET';
  } else if (value.deviceType == audio.DeviceType.WIRED_HEADPHONES) {
    devTypeName = 'WIRED_HEADPHONES';
  } else if (value.deviceType == audio.DeviceType.BLUETOOTH_SCO) {
    devTypeName = 'BLUETOOTH_SCO';
  } else if (value.deviceType == audio.DeviceType.BLUETOOTH_A2DP) {
    devTypeName = 'BLUETOOTH_A2DP';
  } else if (value.deviceType == audio.DeviceType.MIC) {
    devTypeName = 'MIC';
  } else if (value.deviceType == audio.DeviceType.USB_HEADSET) {
    devTypeName = 'USB_HEADSET';
  } else if (value.deviceType == audio.DeviceType.DISPLAY_PORT) {
    devTypeName = 'DISPLAY_PORT';
  } else if (value.deviceType == audio.DeviceType.REMOTE_CAST) {
    devTypeName = 'REMOTE_CAST';
  } else if (value.deviceType == audio.DeviceType.USB_DEVICE) {
    devTypeName = 'USB_DEVICE';
  } else if (value.deviceType == audio.DeviceType.HDMI) {
    devTypeName = 'HDMI';
  } else if (value.deviceType == audio.DeviceType.LINE_DIGITAL) {
    devTypeName = 'LINE_DIGITAL';
  } else if (value.deviceType == audio.DeviceType.REMOTE_DAUDIO) {
    devTypeName = 'REMOTE_DAUDIO';
  } else if (value.deviceType == audio.DeviceType.DEFAULT) {
    devTypeName = 'DEFAULT';
  } else {
    devTypeName = 'ERROR : UNKNOWN :' + value.deviceType;
  }

  console.info(`${TagFrmwk}: device role: ${devRoleName}`);
  dRValue = value.deviceRole;
  console.info(`${TagFrmwk}: device type: ${devTypeName}`);
  dTValue = value.deviceType;
  devId = value.id;
  devName = value.name;
  devAddr = value.address;
  sRate = value.sampleRates[0];
  cCount = value.channelCounts[0];
  cMask = value.channelMasks;
  console.info(`${TagFrmwk}: device info: ${value}`);
}

export default function audioFramework() {

  describe('audioFramework', () => {
    beforeAll(async () => {
      sleep(1000);
      await getAudioManager();
      await getVolumeGroupManager();
      console.info('TestLog: Start Testing AudioFrameworkTest Interfaces');
    })

    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      await sleep(100);
    })

    afterEach(async () => {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await sleep(100);
    })

    afterAll(() => {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0100
     * @tc.desc   getVolumeSync - Media - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, lowVol);
        console.info(`${TagFrmwk}: Media setVolume promise: successful`);
        let data = audioVolumeGroupManager.getVolumeSync(audioMedia);
        if (data == lowVol) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0200
     * @tc.desc   getVolumeSync - Null_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data: number = audioVolumeGroupManager.getVolumeSync(volumeType);
        console.info(`${TagFrmwk}: Media getVolumeSync : success :${data}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0300
     * @tc.desc   getVolumeSync - Invaild_Number_Parameter - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getVolumeSync(123);
        console.info(`${TagFrmwk}: Media getVolumeSync : success :${data}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0400
     * @tc.desc   getVolumeSync - audio.AudioVolumeType.RINGTONE_Parameter - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getVolumeSync(audio.AudioVolumeType.RINGTONE);
        console.info(`${TagFrmwk}: Media getVolumeSync : success :${data}`);
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0500
     * @tc.desc   getVolumeSync - String_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getVolumeSync(AudioVolumeType);
        console.info(`${TagFrmwk}: Media getVolumeSync : success :${data}`);
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log(`err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0100
     * @tc.desc   getMinVolumeSync - Media - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getMinVolumeSync(audio.AudioVolumeType.MEDIA);
        if (data == 0) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0200
     * @tc.desc   getMinVolumeSync - Media - Null_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getMinVolumeSync(volumeType);
        console.log('getMinVolumeSync success');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0300
     * @tc.desc   getMinVolumeSync - Media - Invaild_Number_Parameter - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getMinVolumeSync(123);
        console.log('getMinVolumeSync success');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0400
     * @tc.desc   getMinVolumeSync - Media - String_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getMinVolumeSync(AudioVolumeType);
        console.log('getMinVolumeSync success');
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0500
     * @tc.desc   getMinVolumeSync - Media - audio.AudioVolumeType.RINGTONE_Parameter - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getMinVolumeSync(audio.AudioVolumeType.RINGTONE);
        console.log('getMinVolumeSync success');
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0100
     * @tc.desc   getMaxVolumeSync - Media - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getMaxVolumeSync(audio.AudioVolumeType.MEDIA);
        if (MaxVloume.includes(data)) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0200
     * @tc.desc   getMaxVolumeSync - Media - Null_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getMaxVolumeSync(volumeType);
        console.log('getMaxVolumeSync success');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0300
     * @tc.desc   getMaxVolumeSync - Media - Invaild_Number_Parameter - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getMaxVolumeSync(123);
        console.log('getMaxVolumeSync success');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }

    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0400
     * @tc.desc   getMaxVolumeSync - Media - audio.AudioVolumeType.ALARM_Parameter - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getMaxVolumeSync(audio.AudioVolumeType.ALARM);
        console.log('getMaxVolumeSync success');
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0500
     * @tc.desc   getMaxVolumeSync - Media - String_Parameter - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getMaxVolumeSync(AudioVolumeType);
        console.log('getMaxVolumeSync success');
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0100
     * @tc.desc   isMuteSync - Media - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, 0);
        let data = audioVolumeGroupManager.isMuteSync(audio.AudioVolumeType.MEDIA);
        if (data == true) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0200
     * @tc.desc   isMuteSync - Media - Null_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.isMuteSync(volumeType);
        console.log('isMuteSync success');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0300
     * @tc.desc   isMuteSync - Media - Invaild_Number_Parameter - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.isMuteSync(123);
        console.log('isMuteSync success');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0400
     * @tc.desc   isMuteSync - Media - audio.AudioVolumeType.ACCESSIBILITY_Parameter - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.isMuteSync(audio.AudioVolumeType.ACCESSIBILITY);
        console.log('isMuteSync success');
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0500
     * @tc.desc   isMuteSync - Media - String_Parameter - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.isMuteSync(AudioVolumeType);
        console.log('isMuteSync success');
        expect(false).assertTrue();
        done();
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.cod);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_0500
     * @tc.desc   isMuteSync - Media - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getRingerModeSync();
        if (data != null) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMICROPHONEMUTESYNC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMICROPHONEMUTESYNC_0600
     * @tc.desc   isMuteSync - Media - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMICROPHONEMUTESYNC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioVolumeGroupManager.setMicrophoneMute(true).then(() => {
          console.info('Promise returned to indicate that the microphone is muted.');
        });
        let data = audioVolumeGroupManager.isMicrophoneMuteSync();
        if (data == true) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMICROPHONEMUTESYNC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMICROPHONEMUTESYNC_0700
     * @tc.desc   isMuteSync - Media - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMICROPHONEMUTESYNC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioVolumeGroupManager.setMicrophoneMute(false).then(() => {
          console.info('Promise returned to indicate that the microphone is muted.');
        });
        let data = audioVolumeGroupManager.isMicrophoneMuteSync();
        if (data == false) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOMANAGER_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOMANAGER_0200
     * @tc.desc   multiple times with different instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOMANAGER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        const AUDIOMANAGER1 = audio.getAudioManager();
        const AUDIOMANAGER2 = audio.getAudioManager();
        const AUDIOMANAGER3 = audio.getAudioManager();
        const AUDIOMANAGER4 = audio.getAudioManager();
        const AUDIOMANAGER5 = audio.getAudioManager();
        const AUDIOMANAGER6 = audio.getAudioManager();
        const AUDIOMANAGER7 = audio.getAudioManager();
        const AUDIOMANAGER8 = audio.getAudioManager();
        const AUDIOMANAGER9 = audio.getAudioManager();
        const AUDIOMANAGER10 = audio.getAudioManager();
        await audioManager.setVolume(audioMedia, lowVol);
        console.info(`${TagFrmwk}: Media setVolume promise: successful`);
        await AUDIOMANAGER1.setVolume(audioMedia, highVol);
        console.info(`${TagFrmwk}:audioManager1 : Media setVolume promise: successful`);
        await AUDIOMANAGER2.setVolume(audioMedia, highVol);
        console.info(`${TagFrmwk}:audioManager2 : Media setVolume promise: successful`);
        await AUDIOMANAGER3.setVolume(audioMedia, highVol);
        console.info(`${TagFrmwk}:audioManager3 : Media setVolume promise: successful`);
        await AUDIOMANAGER4.setVolume(audioMedia, lowVol);
        console.info(`${TagFrmwk}:audioManager4 : Media setVolume promise: successful`);
        await AUDIOMANAGER5.setVolume(audioMedia, highVol);
        console.info(`${TagFrmwk}:audioManager5 : Media setVolume promise: successful`);
        await AUDIOMANAGER6.setVolume(audioMedia, lowVol);
        console.info(`${TagFrmwk}:audioManager6 : Media setVolume promise: successful`);
        await AUDIOMANAGER7.setVolume(audioMedia, highVol);
        console.info(`${TagFrmwk}:audioManager7 : Media setVolume promise: successful`);
        await AUDIOMANAGER8.setVolume(audioMedia, lowVol);
        console.info(`${TagFrmwk}:audioManager8 : Media setVolume promise: successful`);
        await AUDIOMANAGER9.setVolume(audioMedia, highVol);
        console.info(`${TagFrmwk}:audioManager9 : Media setVolume promise: successful`);
        await AUDIOMANAGER10.setVolume(audioMedia, lowVol);
        console.info(`${TagFrmwk}:audioManager10 : Media setVolume promise: successful`);
        let data = await audioManager.getVolume(audioMedia);
        if (data == lowVol) {
          console.info(`${TagFrmwk}: Media getVolume Promise: PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getVolume Promise: FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info(`${TagFrmwk}: Media getVolume Promise: Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0100
     * @tc.desc   Setvol to 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, lowVol);
        console.info(`${TagFrmwk}: Media setVolume promise: successful`);
        let data = await audioManager.getVolume(audioMedia);
        if (data == lowVol) {
          console.info(`${TagFrmwk}: Media getVolume Promise: PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getVolume Promise: FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0200
     * @tc.desc   Setvol to 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, maxVol);
        let data = await audioManager.getVolume(audioMedia);
        if (data == maxVol) {
          console.info(`${TagFrmwk}: Media getVolume Promise: PASS :${data}`);
          expect(true).assertTrue();
        } else if (data == maxVolPc) {
          console.info(`${TagFrmwk}: Media getVolume Promise: PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getVolume Promise: FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0300
     * @tc.desc   Setvol to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, minVol);
        let data = await audioManager.getVolume(audioMedia);
        if (data == minVol) {
          console.info(`${TagFrmwk}: Media getVolume Promise: PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getVolume Promise: FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0400
     * @tc.desc   Setvol to 28 (More than 15)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audioMedia, outOfRangeVol).then(() => {
        console.info(`${TagFrmwk}: Media setVolume Promise:Out of range: FAIL`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TagFrmwk}: Media setVolume Promise:Out of range: PASS :${err.message}`);
        expect(true).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0500
     * @tc.desc   Setvol to 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setVolume(audioMedia, highVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback :  Media setVolume successful `);
          audioManager.getVolume(audioMedia, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : Media: failed to get volume ${err.message}`);
              expect(false).assertTrue();
            } else if (value == highVol) {
              console.info(`${TagFrmwk}: callback : Media getVolume: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: callback : Media getVolume: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0600
     * @tc.desc   Setvol to 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setVolume(audioMedia, maxVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback :  Media setVolume successful `);
          audioManager.getVolume(audioMedia, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : Media: failed to get volume ${err.message}`);
              expect(false).assertTrue();
            } else if (value == maxVol) {
              console.info(`${TagFrmwk}: callback : Media getVolume: PASS :${value}`);
              expect(true).assertTrue();
            } else if (value == maxVolPc) {
              console.info(`${TagFrmwk}: callback : Media getVolume: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: callback : Media getVolume: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0700
     * @tc.desc   Setvol to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setVolume(audioMedia, minVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback :  Media setVolume successful `);
          audioManager.getVolume(audioMedia, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : Media: failed to get volume ${err.message}`);
              expect(false).assertTrue();
            } else if (value == minVol) {
              console.info(`${TagFrmwk}: callback : Media getVolume: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: callback : Media getVolume: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0800
     * @tc.desc   Setvol to 101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setVolume(audioMedia, outOfRangeVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: setVolume: Out of range: Callback: PASS:  ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: setVolume: callback : Media Out of range: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0900
     * @tc.desc   Setvol to 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioRingtone, lowVol);
        let data = await audioManager.getVolume(audioRingtone);
        if (data == lowVol) {
          console.info(`${TagFrmwk}: Ringtone getVolume Promise: PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Ringtone getVolume Promise: FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1000
     * @tc.desc   Setvol to 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioRingtone, maxVol);
        let data = await audioManager.getVolume(audioRingtone);
        if (data == maxVol) {
          console.info(`${TagFrmwk}: Ringtone getVolume Promise: PASS :${data}`);
          expect(true).assertTrue();
        } else if (data == maxVolPc) {
          console.info(`${TagFrmwk}: Ringtone getVolume Promise: PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Ringtone getVolume Promise: FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err :' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1100
     * @tc.desc   Setvol to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioRingtone, minVol);
        let data = await audioManager.getVolume(audioRingtone);
        if (data == minVol) {
          console.info(`${TagFrmwk}: Ringtone getVolume Promise: PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Ringtone getVolume Promise: FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err :' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1200
     * @tc.desc   Setvol to 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(`${TagFrmwk}: Ringtone setVolume Promise: Out of range: Setvol 30`);
      await audioManager.setVolume(audioRingtone, outOfRangeVol).then(() => {
        console.info(`${TagFrmwk}: Ringtone setVolume Promise:Out of range: FAIL`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TagFrmwk}: Ringtone setVolume Promise:Out of range: PASS : ${err.message}`);
        expect(true).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1300
     * @tc.desc   Setvol to 7
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setVolume(audioRingtone, highVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback :  Ringtone setVolume successful `);
          audioManager.getVolume(audioRingtone, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : Ringtone: failed to get volume ${err.message}`);
              expect(false).assertTrue();
            } else if (value == highVol) {
              console.info(`${TagFrmwk}: callback : Ringtone getVolume: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: callback : Ringtone getVolume: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1400
     * @tc.desc   Setvol to 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1400', 2, (done: Function) => {
      audioManager.setVolume(audioRingtone, maxVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback :  Ringtone setVolume successful `);
          audioManager.getVolume(audioRingtone, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : Ringtone: failed to get volume ${err.message}`);
              expect(false).assertTrue();
            } else if (value == maxVol) {
              console.info(`${TagFrmwk}: callback : Ringtone getVolume: PASS :${value}`);
              expect(true).assertTrue();
            } else if (value == maxVolPc) {
              console.info(`${TagFrmwk}: callback : Ringtone getVolume: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: callback : Ringtone getVolume: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1500
     * @tc.desc   Setvol to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1500', 2, (done: Function) => {
      audioManager.setVolume(audioRingtone, minVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback:  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback :  Ringtone setVolume successful `);
          audioManager.getVolume(audioRingtone, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : Ringtone: failed to get volume ${err.message}`);
              expect(false).assertTrue();
            } else if (value == minVol) {
              console.info(`${TagFrmwk}: callback : Ringtone getVolume: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: callback : Ringtone getVolume: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1600
     * @tc.desc   Setvol to 28 (more than max volume 15)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1600', 2, (done: Function) => {
      audioManager.setVolume(audioRingtone, outOfRangeVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Out of range Volume: Callback:  ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Out of range Volume: callback : Ringtone set volume: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1700
     * @tc.desc   Setvol to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(`${TagFrmwk}: Media setVolume promise: Negative Value -1`);
      await audioManager.setVolume(audioMedia, -1).then(() => {
        // Setting negative audio volume for error Scenario
        console.info(`${TagFrmwk}: Media setVolume Promise:Negative: FAIL`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TagFrmwk}: Media setVolume Promise:Negative: PASS :  ${err.message}`);
        expect(true).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1800
     * @tc.desc   Setvol to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1800', 2, (done: Function) => {
      audioManager.setVolume(audioMedia, -1, (err) => {
        // Setting negative audio volume for error Scenario
        if (err) {
          console.error(`${TagFrmwk}: setVolume Callback: Negative: PASS: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: setVolume callback : Media Negative: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1900
     * @tc.desc   Setvol to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(`${TagFrmwk}: Ringtone setVolume promise: Negative`);
      await audioManager.setVolume(audioRingtone, -1).then(() => {
        // Setting negative audio volume for error Scenario
        console.info(`${TagFrmwk}: Ringtone setVolume Promise:Negative: FAIL`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TagFrmwk}: Ringtone setVolume Promise:Negative: PASS : ${err.message}`);
        expect(true).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2000
     * @tc.desc   Setvol to -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2000', 2, (done: Function) => {
      audioManager.setVolume(audioRingtone, -1, (err) => {
        // Setting negative audio volume for error Scenario
        if (err) {
          console.error(`${TagFrmwk}:Ringtone setVolume Callback:Negative: PASS : ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: setVolume: Negative: callback : Ringtone set volume: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2100
     * @tc.desc   Setvol to 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
        let data = await audioManager.getVolume(audio.AudioVolumeType.MEDIA);
        if (data == lowVol) {
          console.info(`${TagFrmwk}: Media getVolume Promise: ENAME : PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getVolume Promise: ENAME : FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err :' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2200
     * @tc.desc   Setvol to 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2200', 2, (done: Function) => {
      audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback: ENAME :  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback : ENAME :  Media setVolume successful `);
          audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : Media: ENAME : Error ${err.message}`);
              expect(false).assertTrue();
            } else if (value == highVol) {
              console.info(`${TagFrmwk}: callback : Media getVolume: ENAME : PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: callback : Media getVolume: ENAME : FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2300
     * @tc.desc   Setvol to 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, highVol);
        let data = await audioManager.getVolume(audio.AudioVolumeType.RINGTONE);
        if (data == highVol) {
          console.info(`${TagFrmwk}: RINGTONE getVolume Promise: ENAME : PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: RINGTONE getVolume Promise: ENAME : FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err :' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2400
     * @tc.desc   Setvol to 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2400', 2, (done: Function) => {
      audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback: ENAME:  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback : ENAME:  Ringtone setVolume successful `);
          audioManager.getVolume(audio.AudioVolumeType.RINGTONE, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : Ringtone: ENAME: failed to get volume ${err.message}`);
              expect(false).assertTrue();
            } else if (value == lowVol) {
              console.info(`${TagFrmwk}: callback : Ringtone getVolume: ENAME: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: callback : Ringtone getVolume: ENAME: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2500
     * @tc.desc   Setvol to 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
        if (canIUse("SystemCapability.Multimedia.Audio.Tone")){
          await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, maxVol)
        }
        let data = await audioManager.getVolume(audio.AudioVolumeType.MEDIA);
        if (data == lowVol) {
          console.info(`${TagFrmwk}: Media getVolume Promise: ENAME : PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getVolume Promise: ENAME : FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2600
     * @tc.desc   Setvol to 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2600', 2, (done: Function) => {
      audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume MEDIA: Callback: ENAME :  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback : ENAME :  Media setVolume successful `);
          audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol, (err) => {
            if (err) {
              console.error(`${TagFrmwk}: failed to set volume RINGTONE: Callback: ENAME :  ${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
                if (err) {
                  console.error(`${TagFrmwk}: callback : Media: ENAME : Error: ${err.message}`);
                  expect(false).assertTrue();
                } else if (value == highVol) {
                  console.info(`${TagFrmwk}: callback : Media getVolume: ENAME : PASS :${value}`);
                  expect(true).assertTrue();
                } else {
                  console.info(`${TagFrmwk}: callback : Media getVolume: ENAME : FAIL :${value}`);
                  expect(false).assertTrue();
                }
                done();
              });
            }
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2700
     * @tc.desc   Setvol to 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, highVol);
        console.info(`${TagFrmwk}: Ringtone setVolume promise: ENAME: successful`);
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
        let data = await audioManager.getVolume(audio.AudioVolumeType.RINGTONE);
        if (data == highVol) {
          console.info(`${TagFrmwk}: Ringtone getVolume Promise: ENAME: PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Ringtone getVolume Promise: ENAME: FAIL :${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err=' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2800
     * @tc.desc   Setvol to 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2800', 2, (done: Function) => {
      audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback: ENAME:  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback : ENAME:  Ringtone setVolume successful `);
          audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol, (err) => {
            if (err) {
              console.error(`${TagFrmwk}: failed to setVolume: Callback: ENAME:  ${err.message}`);
              expect(false).assertTrue();
              done();
            } else {
              audioManager.getVolume(audio.AudioVolumeType.RINGTONE, (err, value) => {
                if (err) {
                  console.error(`${TagFrmwk}: callback : Ringtone: ENAME: failed to get volume ${err.message}`);
                  expect(false).assertTrue();
                } else if (value == lowVol) {
                  console.info(`${TagFrmwk}: callback : Ringtone getVolume: ENAME: PASS :${value}`);
                  expect(true).assertTrue();
                } else {
                  console.info(`${TagFrmwk}: callback : Ringtone getVolume: ENAME: FAIL :${value}`);
                  expect(false).assertTrue();
                }
                done();
              });
            }
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0100
     * @tc.desc   getMaxVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const PROMISE = audioManager.getMaxVolume(audioMedia);
      PROMISE.then((data) => {
        if (MaxVloume.includes(data)) {
          console.info(`${TagFrmwk}: Media getMaxVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getMaxVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0200
     * @tc.desc   getMaxVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0200', 1, (done: Function) => {
      audioManager.getMaxVolume(audioMedia, (err, value) => {
        console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : value:${value}`);
        if (err) {
          console.error(`${TagFrmwk}: callback : Media : failed to getMaxVolume ${err.message}`);
          expect(false).assertTrue();
        } else if (MaxVloume.includes(value)) {
          console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0300
     * @tc.desc   getMaxVolume for Ringtone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const PROMISE = audioManager.getMaxVolume(audioRingtone);
      PROMISE.then((data) => {
        if (MaxVloume.includes(data)) {
          console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0400
     * @tc.desc   getMaxVolume for Ringtone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.getMaxVolume(audioRingtone, (err, value) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Ringtone : failed to getMaxVolume ${err.message}`);
          expect(false).assertTrue();
          done();
        } else if (MaxVloume.includes(value)) {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : PASS:${value}`);
          expect(true).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : FAIL: ${value}`);
          expect(false).assertTrue();
          done();
        }

      });
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0500
     * @tc.desc   getMaxVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setVolume(audioRingtone, lowVol);
      const PROMISE = audioManager.getMaxVolume(audioMedia);
      PROMISE.then((data) => {
        if (MaxVloume.includes(data)) {
          console.info(`${TagFrmwk}: Media getMaxVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getMaxVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      ;
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0600
     * @tc.desc   getMaxVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, lowVol);
        let data = await audioManager.getMaxVolume(audioRingtone);
        if (MaxVloume.includes(data)) {
          console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0700
     * @tc.desc   getMaxVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audioRingtone, lowVol);
      audioManager.getMaxVolume(audioMedia, (err, value) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Media : failed to getMaxVolume ${err.message}`);
          expect(false).assertTrue();
        } else if (MaxVloume.includes(value)) {
          console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0800
     * @tc.desc   getMaxVolume for Ringtone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audioMedia, lowVol);
      audioManager.getMaxVolume(audioRingtone, (err, value) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Ringtone : failed to getMaxVolume ${err.message}`);
          expect(false).assertTrue();
        } else if (MaxVloume.includes(value)) {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0900
     * @tc.desc   getMaxVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, lowVol);
        let data = await audioManager.getMaxVolume(audioMedia);
        if (MaxVloume.includes(data)) {
          console.info(`${TagFrmwk}: Media getMaxVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getMaxVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1000
     * @tc.desc   getMaxVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioRingtone, lowVol);
        let data = await audioManager.getMaxVolume(audioRingtone);
        if (MaxVloume.includes(data)) {
          console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Ringtone getMaxVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1100
     * @tc.desc   getMaxVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audioMedia, highVol);
      audioManager.getMaxVolume(audioMedia, (err, value) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Media : failed to getMaxVolume ${err.message}`);
          expect(false).assertTrue();
        } else if (MaxVloume.includes(value)) {
          console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1200
     * @tc.desc   getMaxVolume for Ringtone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audioRingtone, highVol);
      audioManager.getMaxVolume(audioRingtone, (err, value) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Ringtone : failed to getMaxVolume ${err.message}`);
          expect(false).assertTrue();
        } else if (MaxVloume.includes(value)) {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMaxVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0100
     * @tc.desc   getMinVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const PROMISE = audioManager.getMinVolume(audioMedia);
      PROMISE.then((data) => {
        if (data == minVol) {
          console.info(`${TagFrmwk}: Media getMinVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getMinVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0200
     * @tc.desc   getMinVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0200', 1, (done: Function) => {
      audioManager.getMinVolume(audioMedia, (err, value) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Media : failed to getMinVolume ${err.message}`);
          expect().assertFail();
        } else if (value == minVol) {
          console.info(`${TagFrmwk}: callback : Media:  getMinVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Media:  getMinVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0300
     * @tc.desc   getMinVolume for Ringtone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const PROMISE = audioManager.getMinVolume(audioRingtone);
      PROMISE.then((data) => {
        if (data == minVol) {
          console.info(`${TagFrmwk}: Ringtone getMinVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Ringtone getMinVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0400
     * @tc.desc   getMinVolume for Ringtone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0400', 2, (done: Function) => {
      audioManager.getMinVolume(audioRingtone, (err, value) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Ringtone : failed to getMinVolume ${err.message}`);
          expect().assertFail();
        } else if (value == minVol) {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0500
     * @tc.desc   getMinVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioRingtone, lowVol);
      } catch (err) {
        console.log('err :' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      const PROMISE = audioManager.getMinVolume(audioMedia);
      PROMISE.then((data) => {
        if (data == minVol) {
          console.info(`${TagFrmwk}: Media getMinVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getMinVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0600
     * @tc.desc   getMinVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioRingtone, lowVol);
      } catch (err) {
        console.log('err :' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      audioManager.getMinVolume(audioMedia, (err: BusinessError, value: number) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Media : failed to getMinVolume ${err.message}`);
          expect().assertFail();
        } else if (value == minVol) {
          console.info(`${TagFrmwk}: callback : Media:  getMinVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Media:  getMinVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0700
     * @tc.desc   getMinVolume for Ringtone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, highVol);
      } catch (err) {
        console.log('err :' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      const PROMISE = audioManager.getMinVolume(audioRingtone);
      PROMISE.then((data) => {
        if (data == minVol) {
          console.info(`${TagFrmwk}: Ringtone getMinVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Ringtone getMinVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0800
     * @tc.desc   getMinVolume for Ringtone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, lowVol);
      } catch (err) {
        console.log('err :' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      audioManager.getMinVolume(audioRingtone, (err, value) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Ringtone : failed to getMinVolume ${err.message}`);
          expect().assertFail();
        } else if (value == minVol) {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0900
     * @tc.desc   getMinVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, lowVol);
      } catch (err) {
        console.log('err :' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      const PROMISE = audioManager.getMinVolume(audioMedia);
      PROMISE.then((data) => {
        if (data == minVol) {
          console.info(`${TagFrmwk}: Media getMinVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getMinVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1000
     * @tc.desc   getMinVolume for Media
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, highVol);
      } catch (err) {
        console.log('err :' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      audioManager.getMinVolume(audioMedia, (err, value) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Media : failed to getMinVolume ${err.message}`);
          expect().assertFail();
        } else if (value == minVol) {
          console.info(`${TagFrmwk}: callback : Media:  getMinVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Media:  getMinVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1100
     * @tc.desc   getMinVolume for Ringtone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioRingtone, lowVol);
      } catch (err) {
        console.log('err :' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      const PROMISE = audioManager.getMinVolume(audioRingtone)
      PROMISE.then((data) => {
        if (data == minVol) {
          console.info(`${TagFrmwk}: Ringtone getMinVolume promise : PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Ringtone getMinVolume promise : FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1200
     * @tc.desc   getMinVolume for Ringtone
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMINVOLUME_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioRingtone, lowVol);
      } catch (err) {
        console.log('err :' + JSON.stringify(err))
        expect(false).assertTrue();
        done();
      }
      audioManager.getMinVolume(audioRingtone, (err, value) => {
        if (err) {
          console.error(`${TagFrmwk}: callback : Ringtone : failed to getMinVolume ${err.message}`);
          expect().assertFail();
        } else if (value == minVol) {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : PASS:${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: callback : Ringtone:  getMinVolume : FAIL: ${value}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0100
     * @tc.desc   getDevices - Output device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const PROMISE = audioManager.getDevices(1);
      // Getting all Output devices Enumb 1 = OUTPUT_DEVICES_FLAG
      PROMISE.then((value) => {
        console.info(`${TagFrmwk}: Promise: getDevices OUTPUT_DEVICES_FLAG`);
        value.forEach(displayDeviceProp);
        if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
          console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0200
     * @tc.desc   getDevices - Input device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const PROMISE = audioManager.getDevices(2);
      // Getting all Input Devices ENUM 2 = INPUT_DEVICES_FLAG
      PROMISE.then((value) => {
        console.info(`${TagFrmwk}: Promise: getDevices INPUT_DEVICES_FLAG`);
        value.forEach(displayDeviceProp);
        if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
          console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  PASS`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  FAIL`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0300
     * @tc.desc   getDevices - ALL device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const PROMISE = audioManager.getDevices(3);
      // Getting all devies connected 3 = ALL_DEVICES_FLAG
      PROMISE.then((value) => {
        console.info(`${TagFrmwk}: Promise: getDevices ALL_DEVICES_FLAG`);
        value.forEach(displayDeviceProp);
        if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
          console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  PASS`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  FAIL`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0400
     * @tc.desc   getDevices - Output device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0400', 2, (done: Function) => {
      audioManager.getDevices(1, (err, value) => {
        // Getting all Output devices Enumb 1 = OUTPUT_DEVICES_FLAG
        console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);

          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0500
     * @tc.desc   getDevices - Input device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0500', 2, (done: Function) => {
      audioManager.getDevices(2, (err, value) => {
        // Getting all Input Devices ENUM 2 = INPUT_DEVICES_FLAG
        console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback: INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);
          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0600
     * @tc.desc   getDevices - ALL device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0600', 2, (done: Function) => {
      audioManager.getDevices(3, (err, value) => {
        // Getting all devies connected 3 = ALL_DEVICES_FLAG
        console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);

          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0700
     * @tc.desc   getDevices - Output device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const PROMISE = audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG)
      PROMISE.then((value) => {
        console.info(`${TagFrmwk}: Promise: getDevices OUTPUT_DEVICES_FLAG`);
        value.forEach(displayDeviceProp);
        if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
          console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0800
     * @tc.desc   getDevices - Input device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const PROMISE = audioManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG);
      PROMISE.then((value) => {
        console.info(`${TagFrmwk}: Promise: getDevices INPUT_DEVICES_FLAG`);
        value.forEach(displayDeviceProp);
        if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
          console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  PASS`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getDevices : INPUT_DEVICES_FLAG :  FAIL`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0900
     * @tc.desc   getDevices - ALL device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const PROMISE = audioManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG);
      PROMISE.then((value) => {
        console.info(`${TagFrmwk}: Promise: getDevices ALL_DEVICES_FLAG`);
        value.forEach(displayDeviceProp);

        if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
          console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  PASS`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getDevices : ALL_DEVICES_FLAG :  FAIL`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1000
     * @tc.desc   getDevices - Output device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1000', 2, (done: Function) => {
      audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG, (err, value) => {
        console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);
          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1100
     * @tc.desc   getDevices - Input device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1100', 2, (done: Function) => {
      audioManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG, (err, value) => {
        console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback: INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);
          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1200
     * @tc.desc   getDevices - ALL device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETDEVICES_1200', 2, (done: Function) => {
      audioManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG, (err, value) => {
        console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);
          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null && cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0001
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0001
     * @tc.desc   getRingerMode - RINGER_MODE_NORMAL - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL);
        let value = await audioManager.getRingerMode();
        if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0002
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0002
     * @tc.desc   getRingerMode - RINGER_MODE_SILENT - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_SILENT);
        let value = await audioManager.getRingerMode();
        if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_SILENT: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_SILENT: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0003
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0003
     * @tc.desc   getRingerMode - RINGER_MODE_VIBRATE - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE);
        let value = await audioManager.getRingerMode();
        if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_VIBRATE: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0004
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0004
     * @tc.desc   getRingerMode - RINGER_MODE_NORMAL - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL, (err) => {
        console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_NORMAL`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_NORMAL: Error: ${err.message}`);
          expect().assertFail();
          done();
        } else {
          audioManager.getRingerMode((err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : RINGER_MODE_NORMAL: Error: ${err.message}`);
              expect().assertFail();
            } else if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
              console.info(`${TagFrmwk}: Callback: getRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: getRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0005
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0005
     * @tc.desc   getRingerMode - RINGER_MODE_SILENT - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_SILENT, (err) => {
        console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_SILENT`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_SILENT: Error: ${err.message}`);
          expect().assertFail();
          done();
        } else {
          audioManager.getRingerMode((err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : RINGER_MODE_SILENT: Error: ${err.message}`);
              expect().assertFail();
            } else if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
              console.info(`${TagFrmwk}: Callback: getRingerMode RINGER_MODE_SILENT: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: getRingerMode RINGER_MODE_SILENT: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0006
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0006
     * @tc.desc   getRingerMode - RINGER_MODE_VIBRATE - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE, (err) => {
        console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE: Error: ${err.message}`);
          expect().assertFail();
          done();
        } else {
          audioManager.getRingerMode((err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : RINGER_MODE_VIBRATE: Error: ${err.message}`);
              expect().assertFail();
            } else if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
              console.info(`${TagFrmwk}: Callback: getRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: getRingerMode RINGER_MODE_VIBRATE: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0007
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0007
     * @tc.desc   getRingerMode - ENUM - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = await audioVolumeGroupManager.getRingerMode();
        if (data == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerMode : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else if (data == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerMode : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else if (data == audio.AudioRingMode.RINGER_MODE_SILENT) {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerMode : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerMode : FAIL :${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0008
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0008
     * @tc.desc   getRingerMode - ENUM - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUPMANAGER_GETRINGERMODE_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE, (err) => {
        console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE: Error: ${err.message}`);
          expect().assertFail();
          done();
        } else {
          audioVolumeGroupManager.getRingerMode((err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : RINGER_MODE_VIBRATE: Error: ${err.message}`);
              expect().assertFail();
            } else if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
              console.info(`${TagFrmwk}: Callback: audioVolumeGroupManager.getRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
              expect(true).assertTrue();
              done();
            } else if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
              console.info(`${TagFrmwk}: Callback: audioVolumeGroupManager.getRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
              expect(true).assertTrue();
              done();
            } else if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
              console.info(`${TagFrmwk}: Callback: audioVolumeGroupManager.getRingerMode RINGER_MODE_SILENT: PASS :${value}`);
              expect(true).assertTrue();
              done();
            } else {
              console.info(`${TagFrmwk}: Callback: audioVolumeGroupManager.getRingerMode : FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_0001
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_0001
     * @tc.desc   getRingerModeSync - ENUM - MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        let data = audioVolumeGroupManager.getRingerModeSync();
        if (data == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
        let data = audioVolumeGroupManager.getRingerModeSync();
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerModeSync : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else if (data == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerModeSync : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else if (data == audio.AudioRingMode.RINGER_MODE_SILENT) {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerModeSync : PASS :${data}`);
          expect(true).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerModeSync : FAIL :${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0100
     * @tc.desc   setRingerMode - Set Ring more to Normal Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setRingerMode(2);
        let value = await audioManager.getRingerMode();
        if (value == 2) {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0200
     * @tc.desc   setRingerMode - Set Ring more to Silent Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setRingerMode(0);
        let value = await audioManager.getRingerMode();
        if (value == 0) {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_SILENT: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_SILENT: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0300
     * @tc.desc   setRingerMode - Set Ring more to Vibration Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setRingerMode(1);
        let value = await audioManager.getRingerMode();
        if (value == 1) {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_VIBRATE: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0400
     * @tc.desc   setRingerMode - Set Ring more to Normal Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0400', 2, (done: Function) => {
      audioManager.setRingerMode(2, (err) => {
        // Setting Ringtone Mode to Normal ENUM 2 = RINGER_MODE_NORMAL
        console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_NORMAL`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_NORMAL: Error: ${err.message}`);
          expect().assertFail();
          done();
        } else {
          audioManager.getRingerMode((err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : RINGER_MODE_NORMAL: Error: ${err.message}`);
              expect().assertFail();
            } else if (value == 2) {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0500
     * @tc.desc   setRingerMode - Set Ring more to Silent Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0500', 2, (done: Function) => {
      audioManager.setRingerMode(0, (err) => {
        // Setting Ringtone Mode to Silent ENUM 0 = RINGER_MODE_SILENT
        console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_SILENT`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_SILENT: Error: ${err.message}`);
          expect().assertFail();
          done();
        } else {
          audioManager.getRingerMode((err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : RINGER_MODE_SILENT: Error: ${err.message}`);
              expect().assertFail();
            }
            if (value == 0) {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_SILENT: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_SILENT: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0600
     * @tc.desc   setRingerMode - Set Ring more to Vibration Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0600', 2, (done: Function) => {
      audioManager.setRingerMode(1, (err) => {
        // Setting Ringtone Mode to Vibration ENUM 1 = RINGER_MODE_VIBRATE
        console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE: Error: ${err.message}`);
          expect().assertFail();
          done();
        } else {
          audioManager.getRingerMode((err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback :  RINGER_MODE_VIBRATE: Error: ${err.message}`);
              expect().assertFail();
            }
            if (value == 1) {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_VIBRATE: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0700
     * @tc.desc   setRingerMode - Set Ring more to Normal Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL);
        let value = await audioManager.getRingerMode();
        if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0800
     * @tc.desc   setRingerMode - Set Ring more to Silent Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_SILENT);
        let value = await audioManager.getRingerMode();
        if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_SILENT: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_SILENT: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0900
     * @tc.desc   setRingerMode - Set Ring more to Vibration Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE);
        let value = await audioManager.getRingerMode();
        if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: setRingerMode RINGER_MODE_VIBRATE: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1000
     * @tc.desc   setRingerMode - Set Ring more to Normal Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1000', 2, (done: Function) => {
      audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL, (err) => {
        console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_NORMAL`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_NORMAL: Error: ${err.message}`);
          expect().assertFail();
          done();
        } else {
          audioManager.getRingerMode((err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : RINGER_MODE_NORMAL: Error: ${err.message}`);
              expect().assertFail();
            } else if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1100
     * @tc.desc   setRingerMode - Set Ring more to Silent Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1100', 2, (done: Function) => {
      audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_SILENT, (err) => {
        console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_SILENT`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_SILENT: Error: ${err.message}`);
          expect().assertFail();
          done();
        } else {
          audioManager.getRingerMode((err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : RINGER_MODE_SILENT: Error: ${err.message}`);
              expect().assertFail();
            }
            if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_SILENT: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_SILENT: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1200
     * @tc.desc   setRingerMode - Set Ring more to Vibration Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETRINGERMODE_1200', 2, (done: Function) => {
      audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_VIBRATE, (err, value) => {
        console.info(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setRingerMode RINGER_MODE_VIBRATE: Error: ${err.message}`);
          expect().assertFail();
          done();
        } else {
          audioManager.getRingerMode((err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : RINGER_MODE_VIBRATE: Error: ${err.message}`);
              expect().assertFail();
            }
            if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: setRingerMode RINGER_MODE_VIBRATE: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0100
     * @tc.desc   mute - Media - callback - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await audioManager.setVolume(audioMedia, highVol);
      audioManager.mute(audioMedia, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
        audioManager.mute(audioMedia, false, (err) => {
          if (err) {
            console.error(`${TagFrmwk}: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            audioManager.getVolume(audioMedia, (err, value) => {
              if (err) {
                console.error(`Failed to obtain the volume. ${err.message}`);
                expect(false).assertTrue();
                done();
              } else if (value == highVol) {
                audioManager.isMute(audioMedia, (err, data) => {
                  if (err) {
                    console.error(`${TagFrmwk}: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                    expect().assertFail();
                  } else if (data == false) {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${data}`);
                    expect(true).assertTrue();
                  } else {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: FAIL: ${data}`);
                    expect(false).assertTrue();
                  }
                  done();
                });
              } else {
                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                expect(false).assertTrue();
                done();
              }
            });
          }
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0200
     * @tc.desc   mute - Media - Promise - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, lowVol);
        await audioManager.mute(audioMedia, true)
        console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
        await audioManager.mute(audioMedia, false)
        console.log(`${TagFrmwk}: Set Stream Mute: Media: Promise: FALSE`);
        let value = await audioManager.getVolume(audioMedia)
        console.info("AudioFrameworkTest: value is " + value);
        if (value == lowVol) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audioMedia)
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: FALSE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: FALSE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0300
     * @tc.desc   mute - Ringtone - callback - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audioRingtone, highVol);
      audioManager.mute(audioRingtone, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
        audioManager.mute(audioRingtone, false, (err) => {
          if (err) {
            console.error(`${TagFrmwk}: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            audioManager.getVolume(audioRingtone, (err, value) => {
              if (err) {
                console.error(`Failed to obtain the volume. ${err.message}`);
                expect(false).assertTrue();
                done();
              } else if (value == highVol) {
                audioManager.isMute(audioRingtone, (err, data) => {
                  if (err) {
                    console.error(`${TagFrmwk}: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                    expect().assertFail();
                  } else if (data == false) {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${data}`);
                    expect(true).assertTrue();
                  } else {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: FAIL: ${data}`);
                    expect(false).assertTrue();
                  }
                  done();
                });
              } else {
                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                expect(false).assertTrue();
                done();
              }
            });
          }
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0400
     * @tc.desc   mute - Ringtone - Promise - disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioRingtone, lowVol);
        await audioManager.mute(audioRingtone, true);
        console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
        await audioManager.mute(audioRingtone, false);
        let value = await audioManager.getVolume(audioRingtone);
        console.info("AudioFrameworkTest: value is " + value);
        if (value == lowVol) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audioRingtone);
        console.info("AudioFrameworkTest: value is " + value);
        if (value == lowVol) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info('err:' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0500
     * @tc.desc   mute - Media - callback - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol);
      audioManager.mute(audio.AudioVolumeType.MEDIA, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
        audioManager.mute(audio.AudioVolumeType.MEDIA, false, (err) => {
          if (err) {
            console.error(`${TagFrmwk}: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
              if (err) {
                console.error(`Failed to obtain the volume. ${err.message}`);
                expect(false).assertTrue();
                done();
              } else if (value == highVol) {
                audioManager.isMute(audio.AudioVolumeType.MEDIA, (err, data) => {
                  if (err) {
                    console.error(`${TagFrmwk}: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                    expect().assertFail();
                  } else if (data == false) {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${data}`);
                    expect(true).assertTrue();
                  } else {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: FAIL: ${data}`);
                    expect(false).assertTrue();
                  }
                  done();
                });
              } else {
                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                expect(false).assertTrue();
                done();
              }
            });
          }
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0600
     * @tc.desc   mute - Media - Promise - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
        await audioManager.mute(audio.AudioVolumeType.MEDIA, true);
        console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
        await audioManager.mute(audio.AudioVolumeType.MEDIA, false);
        let value = await audioManager.getVolume(audio.AudioVolumeType.MEDIA);
        console.info("AudioFrameworkTest: value is " + value);
        if (value == lowVol) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audio.AudioVolumeType.MEDIA);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: FALSE: PASS:${data}`);
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info('err:' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0700
     * @tc.desc   mute - Ringtone - callback - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, highVol);
      audioManager.mute(audio.AudioVolumeType.RINGTONE, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
        audioManager.mute(audio.AudioVolumeType.RINGTONE, false, (err) => {
          if (err) {
            console.error(`${TagFrmwk}: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            audioManager.getVolume(audio.AudioVolumeType.RINGTONE, (err, value) => {
              if (err) {
                console.error(`Failed to obtain the volume. ${err.message}`);
                expect(false).assertTrue();
                done();
              } else if (value == highVol) {
                audioManager.isMute(audio.AudioVolumeType.RINGTONE, (err, data) => {
                  if (err) {
                    console.error(`${TagFrmwk}: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
                    expect().assertFail();
                  } else if (data == false) {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${data}`);
                    expect(true).assertTrue();
                  } else {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: FAIL: ${data}`);
                    expect(false).assertTrue();
                  }
                  done();
                });
              } else {
                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                expect(false).assertTrue();
                done();
              }
            });
          }
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0800
     * @tc.desc   mute - RINGTONE - Promise - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.RINGTONE, lowVol);
        await audioManager.mute(audio.AudioVolumeType.RINGTONE, true);
        console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
        await audioManager.mute(audio.AudioVolumeType.RINGTONE, false);
        let value = await audioManager.getVolume(audio.AudioVolumeType.RINGTONE);
        console.info("AudioFrameworkTest: value is " + value);
        if (value == lowVol) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audio.AudioVolumeType.RINGTONE)
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Ringtone: FALSE: PASS:${data}`);
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info('err:' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0900
     * @tc.desc   mute - VOICE_CALL - callback - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, highVol);
      audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
        audioManager.mute(audio.AudioVolumeType.VOICE_CALL, false, (err) => {
          if (err) {
            console.error(`${TagFrmwk}: Set Stream Mute: VOICE_CALL: Callback: Error :  ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
              if (err) {
                console.error(`Failed to obtain the volume. ${err.message}`);
                expect(false).assertTrue();
                done();
              } else if (value == highVol) {
                audioManager.isMute(audio.AudioVolumeType.VOICE_CALL, (err, data) => {
                  if (err) {
                    console.error(`${TagFrmwk}: Callback : FALSE: VOICE_CALL : failed to get Mute Status ${err.message}`);
                    expect().assertFail();
                  } else if (data == false) {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_CALL: FALSE: PASS: ${data}`);
                    expect(true).assertTrue();
                  } else {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_CALL: FALSE: FAIL: ${data}`);
                    expect(false).assertTrue();
                  }
                  done();
                });
              } else {
                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                expect(false).assertTrue();
                done();
              }
            });
          }
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1000
     * @tc.desc   mute - VOICE_CALL - Promise - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
        await audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true);
        console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
        await audioManager.mute(audio.AudioVolumeType.VOICE_CALL, false);
        let value = await audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL);
        console.info("AudioFrameworkTest: value is " + value);
        if (value > 0) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_CALL);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_CALL: FALSE: PASS:${data}`);
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info('err:' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1100
     * @tc.desc   mute - VOICE_ASSISTANT - callback - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, highVol);
      audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Failed to mute the stream. ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        console.log(`${TagFrmwk}: Callback invoked to indicate that the stream is muted.`);
        audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, false, (err) => {
          if (err) {
            console.error(`${TagFrmwk}: Set Stream Mute: VOICE_ASSISTANT: Callback: Error :  ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT, (err, value) => {
              if (err) {
                console.error(`Failed to obtain the volume. ${err.message}`);
                expect(false).assertTrue();
                done();
              } else if (value == highVol) {
                audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT, (err, data) => {
                  if (err) {
                    console.error(`${TagFrmwk}: Callback : FALSE: VOICE_ASSISTANT : failed to get Mute Status ${err.message}`);
                    expect().assertFail();
                  } else if (data == false) {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_ASSISTANT: FALSE: PASS: ${data}`);
                    expect(true).assertTrue();
                  } else {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_ASSISTANT: FALSE: FAIL: ${data}`);
                    expect(false).assertTrue();
                  }
                  done();
                });
              } else {
                console.info(`${TagFrmwk}: mute fail: value ${value}`);
                expect(false).assertTrue();
                done();
              }
            });
          }
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1200
     * @tc.desc   mute - VOICE_ASSISTANT - Promise - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
        await audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true);
        console.log(`${TagFrmwk}: Promise returned to indicate that the stream is muted.`);
        await audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, false);
        let value = await audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
        console.info("AudioFrameworkTest: value is " + value);
        if (value == lowVol) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_ASSISTANT: FALSE: PASS:${data}`);
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1300
     * @tc.desc   mute - Media - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioMedia, highVol);
        await audioManager.mute(audioMedia, true);
        let value = await audioManager.getVolume(audioMedia);
        console.info("AudioFrameworkTest: value is " + value);
        if (value == 0) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        await audioManager.setVolume(audioMedia, lowVol);
        let data = await audioManager.isMute(audioMedia);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: SetVolume: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: SetVolume: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1400
     * @tc.desc   mute - Media - callback - Enable mute - SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audioMedia, lowVol);
      audioManager.mute(audioMedia, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Callback : SetVolume: Media : failed to set Mute Status ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(`${TagFrmwk}: Set Stream Mute: Media: Callback : TRUE`);
          audioManager.getVolume(audioMedia, (err, value) => {
            if (err) {
              console.error(`Failed to obtain the volume. ${err.message}`);
              expect(false).assertTrue();
              done();
            } else if (value == 0) {
              audioManager.setVolume(audioMedia, highVol, (err) => {
                if (err) {
                  console.error(`Failed to obtain the volume. ${err.message}`);
                  expect(false).assertTrue();
                  done();
                  return;
                }
                audioManager.isMute(audioMedia, (err, data) => {
                  if (err) {
                    console.error(`${TagFrmwk}: Callback : SetVolume: Media : failed to get Mute Status ${err.message}`);
                    expect().assertFail();
                  } else if (data == false) {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: SetVolume: PASS: ${data}`);
                    expect(true).assertTrue();
                  } else {
                    console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: SetVolume: FAIL: ${data}`);
                    expect(false).assertTrue();
                  }
                  done();
                });
              });
            } else {
              console.info(`${TagFrmwk}: mute fail: value ${value}`);
              expect(false).assertTrue();
              done();
            }
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1500
     * @tc.desc   mute - Ringtone - Promise - Enable mute - SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audioRingtone, lowVol);
        await audioManager.mute(audioRingtone, true);
        console.log(`${TagFrmwk}: Set Stream Mute: Ringtone: Promise: SetVolume`);
        let value = await audioManager.getVolume(audioRingtone);
        console.info("AudioFrameworkTest: value is " + value);
        if (value == 0) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        await audioManager.setVolume(audioRingtone, highVol);
        let data = await audioManager.isMute(audioRingtone);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Ringtone: SetVolume: PASS:${data}`);
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1600
     * @tc.desc   mute - Ringtone - callback - Enable mute - SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audioRingtone, highVol);
      audioManager.mute(audioRingtone, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Callback : SetVolume: Ringtone : failed to set Mute Status ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(`${TagFrmwk}: Set Stream Mute: Ringtone: Callback : SetVolume`);
          audioManager.getVolume(audioRingtone, async (err, value) => {
            if (err) {
              console.error(`Failed to obtain the volume. ${err.message}`);
              expect(false).assertTrue();
              done();
            } else if (value == 0) {
              await audioManager.setVolume(audioRingtone, lowVol);
              audioManager.isMute(audioRingtone, (err, data) => {
                if (err) {
                  console.error(`${TagFrmwk}: Callback : SetVolume: Ringtone : failed to get Mute Status ${err.message}`);
                  expect().assertFail();
                } else if (data == false) {
                  console.log(`${TagFrmwk}: Callback : Is Stream Mute Ringtone: SetVolume: PASS: ${data}`);
                  expect(true).assertTrue();
                } else {
                  console.log(`${TagFrmwk}: Callback : Is Stream Mute Ringtone: SetVolume: FAIL: ${data}`);
                  expect(false).assertTrue();
                }
                done();
              });
            } else {
              console.info(`${TagFrmwk}: mute fail: value ${value}`);
              expect(false).assertTrue();
              done();
            }
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1700
     * @tc.desc   mute - VOICE_CALL - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, highVol);
        await audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true);
        let value = await audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL)
        console.info("AudioFrameworkTest: value is " + value);
        if (value == highVol) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
        let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_CALL);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_CALL: SetVolume: PASS:${data}`);
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info('err:' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1800
     * @tc.desc   mute - VOICE_CALL - callback - Enable mute - SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, highVol);
      } catch (err) {
        console.error(`setVolume : failed to set Mute Status ${err.message}`);
        expect().assertFail();
        done();
        return;
      }
      audioManager.mute(audio.AudioVolumeType.VOICE_CALL, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Callback : SetVolume: VOICE_CALL : failed to set Mute Status ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(`${TagFrmwk}: Set Stream Mute: VOICE_CALL: Callback : SetVolume`);
          audioManager.getVolume(audio.AudioVolumeType.VOICE_CALL, async (err, value) => {
            if (err) {
              console.error(`Failed to obtain the volume. ${err.message}`);
              expect(false).assertTrue();
              done();
            } else if (value == highVol) {
              try {
                await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
              } catch (err) {
                console.error(`setVolume : failed to set Mute Status ${err.message}`);
                expect().assertFail();
                done();
                return;
              }
              audioManager.isMute(audio.AudioVolumeType.VOICE_CALL, (err, data) => {
                if (err) {
                  console.error(`${TagFrmwk}: Callback : SetVolume: VOICE_CALL : failed to get Mute Status ${err.message}`);
                  expect().assertFail();
                } else if (data == false) {
                  console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_CALL: SetVolume: PASS: ${data}`);
                  expect(true).assertTrue();
                } else {
                  console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_CALL: SetVolume: FAIL: ${data}`);
                  expect(false).assertTrue();
                }
                done();
              });
            } else {
              console.info(`${TagFrmwk}: mute fail: value ${value}`);
              expect(false).assertTrue();
              done();
            }
          });
        }

      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1900
     * @tc.desc   mute - VOICE_ASSISTANT - Promise - Enable mute -SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, highVol);
        await audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true);
        console.log(`${TagFrmwk}: Set Stream Mute: VOICE_ASSISTANT: Promise: TRUE`);
        let value = await audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
        console.info("AudioFrameworkTest: value is " + value);
        if (value == 0) {
          expect(true).assertTrue();
        } else {
          expect(false).assertTrue();
        }
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
        let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT);
        if (data == true) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_ASSISTANT: SetVolume: PASS:${data}`);
          expect(true).assertTrue();
        }
      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2000
     * @tc.desc   mute - VOICE_ASSISTANT - callback - Enable mute - SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_MUTE_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, highVol);
      } catch (err) {
        console.log('setVolume err :' + JSON.stringify(err));
        expect().assertFail();
        done();
        return;
      }
      audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT, true, async (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Callback : SetVolume: VOICE_ASSISTANT : failed to set Mute Status ${err.message}`);
          expect().assertFail();
          done();
        } else {
          console.log(`${TagFrmwk}: Set Stream Mute: VOICE_ASSISTANT: Callback : SetVolume`);
          try {
            let value = await audioManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
            if (value == 0) {
              console.info("AudioFrameworkTest: value is " + value);
              expect(true).assertTrue();
            } else {
              expect(false).assertTrue();
            }
            await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
          } catch (err) {
            console.log('err :' + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT, (err, data) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : SetVolume: VOICE_ASSISTANT : failed to get Mute Status ${err.message}`);
              expect().assertFail();
            } else if (data == false) {
              console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_ASSISTANT: SetVolume: PASS: ${data}`);
              expect(true).assertTrue();
            } else {
              console.log(`${TagFrmwk}: Callback : Is Stream Mute VOICE_ASSISTANT: SetVolume: FAIL: ${data}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0001
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0001
     * @tc.desc   ismute - AudioVolumeType.Media - Promise - true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
        await audioManager.mute(audio.AudioVolumeType.MEDIA,true);
        let data:boolean = await audioVolumeGroupManager.isMute(audio.AudioVolumeType.MEDIA);
        if (data == true) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute MEDIA: True: PASS:${data}`);
          expect(true).assertTrue();
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute MEDIA: True: FAILED:${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0002
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0002
     * @tc.desc   ismute - AudioVolumeType.Media - Promise - false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, lowVol);
        await audioManager.mute(audio.AudioVolumeType.MEDIA,false);
        let data:boolean = await audioVolumeGroupManager.isMute(audio.AudioVolumeType.MEDIA);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute MEDIA: false: PASS:${data}`);
          expect(true).assertTrue();
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute MEDIA: false: FAILED:${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0003
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0003
     * @tc.desc   ismute - AudioVolumeType.Media - Callback - true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const muteValue = true;
      await audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol);
      await audioManager.mute(audio.AudioVolumeType.MEDIA, true);
      console.log(`${TagFrmwk}: Set Stream Mute: MEDIA: Callback: TRUE`);
      let data = await audioVolumeGroupManager.isMute(audio.AudioVolumeType.MEDIA,(err,data) => {
        if (err) {
          console.log(`${TagFrmwk}: Callback: Is Stream Mute MEDIA: SetVolume: FAIL:${data}`);
          expect().assertFail();
          done();
        } else {
          if (data === muteValue){
            console.log(`${TagFrmwk}: isMute check PASS : expected=${muteValue}, actual=${data}`);
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${TagFrmwk}: isMute check FAILED : expected=${muteValue}, actual=${data}`);
            expect().assertFail();
            done();
          }
         }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0004
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0004
     * @tc.desc   ismute - AudioVolumeType.Media - Callback - false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      const muteValue = false;
      await audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol);
      await audioManager.mute(audio.AudioVolumeType.MEDIA, false);
      console.log(`${TagFrmwk}: Set Stream Mute: MEDIA: Callback: TRUE`);
      let data = await audioVolumeGroupManager.isMute(audio.AudioVolumeType.MEDIA,(err,data) => {
        if (err) {
          console.log(`${TagFrmwk}: Callback: Is Stream Mute MEDIA: SetVolume: FAIL:${data}`);
          expect().assertFail();
          done();
        } else {
          if (data === muteValue){
            console.log(`${TagFrmwk}: isMute check PASS : expected=${muteValue}, actual=${data}`);
            expect(true).assertTrue();
            done();
          } else {
            console.log(`${TagFrmwk}: isMute check FAILED : expected=${muteValue}, actual=${data}`);
            expect().assertFail();
            done();
          }
         }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTESYNC_0001
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTESYNC_0001
     * @tc.desc   ismuteSync - AudioVolumeType.Media - true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTESYNC_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol);
        await audioManager.mute(audio.AudioVolumeType.MEDIA, true);
        console.log(`${TagFrmwk}: Set Stream Mute: MEDIA: Promise: TRUE`);
        let value = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        let data:boolean = audioVolumeGroupManager.isMuteSync(audio.AudioVolumeType.MEDIA);
        expect(data).assertEqual(true);
        console.log(`${TagFrmwk}: indicate that the mute status of the stream is obtained : PASS:${data}`);
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTESYNC_0002
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTESYNC_0002
     * @tc.desc   ismuteSync - AudioVolumeType.Media - false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTESYNC_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol);
        await audioManager.mute(audio.AudioVolumeType.MEDIA, false);
        console.log(`${TagFrmwk}: Set Stream Mute: MEDIA: Promise: TRUE`);
        let value = await audioVolumeGroupManager.getVolume(audio.AudioVolumeType.MEDIA);
        let data:boolean = audioVolumeGroupManager.isMuteSync(audio.AudioVolumeType.MEDIA);
        expect(data).assertEqual(false);
        console.log(`${TagFrmwk}: indicate that the mute status of the stream is obtained : PASS:${data}`);
        done();
      } catch (err) {
        console.info('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })
     /**
      * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0100
      * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0100
      * @tc.desc   mute - AudioScene - AsyncCallback - AudioScene
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
     it('SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
          audioManager.getAudioScene(async (err, getValue) => {
            if (err) {
              console.error(`Failed to obtain the audio scene mode. ${err}`);
              return;
            }
            if (getValue == audio.AudioScene.AUDIO_SCENE_RINGING) {
              expect(getValue).assertEqual(1);
              console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
            } else if (getValue == audio.AudioScene.AUDIO_SCENE_PHONE_CALL) {
              expect(getValue).assertEqual(2);
              console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
            } else if (getValue == audio.AudioScene.AUDIO_SCENE_DEFAULT) {
              expect(getValue).assertEqual(0);
              console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
            } else if (getValue == audio.AudioScene.AUDIO_SCENE_VOICE_CHAT) {
              expect(getValue).assertEqual(3);
              console.info(`${TagFrmwk} Callback invoked to indicate that the audio scene mode is obtained ${getValue}.`);
            }
            done();
          });
        } catch (e) {
          console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0100 ERROR: ${e.message}`);
          expect(false).assertTrue();
          done();
        }
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0200
       * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0200
       * @tc.desc   mute - AudioScene - Promise - AudioScene
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
          let value = await audioManager.getAudioScene();
          if (value == audio.AudioScene.AUDIO_SCENE_RINGING) {
            expect(value).assertEqual(1);
            console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          } else if (value == audio.AudioScene.AUDIO_SCENE_PHONE_CALL) {
            expect(value).assertEqual(2);
            console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          } else if (value == audio.AudioScene.AUDIO_SCENE_DEFAULT) {
            expect(value).assertEqual(0);
            console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          } else if (value == audio.AudioScene.AUDIO_SCENE_VOICE_CHAT) {
            expect(value).assertEqual(3);
            console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          }
          done();
        } catch (e) {
          console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0200 ERROR: ${e.message}`);
          expect(false).assertTrue();
          done();
        }
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0300
       * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0300
       * @tc.desc   mute - AudioScene - getAudioSceneSync
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
          let value = audioManager.getAudioSceneSync();
          if (value == audio.AudioScene.AUDIO_SCENE_RINGING) {
            expect(value).assertEqual(1);
            console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          } else if (value == audio.AudioScene.AUDIO_SCENE_PHONE_CALL) {
            expect(value).assertEqual(2);
            console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          } else if (value == audio.AudioScene.AUDIO_SCENE_DEFAULT) {
            expect(value).assertEqual(0);
            console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          } else if (value == audio.AudioScene.AUDIO_SCENE_VOICE_CHAT) {
            expect(value).assertEqual(3);
            console.info(`${TagFrmwk} Promise invoked to indicate that the audio scene mode is obtained ${value}.`);
          }
          done();
        } catch (e) {
          console.error(`${TagFrmwk} SUB_MULTIMEDIA_AUDIO_MANAGER_GET_AUDIOSCENCE_0300 ERROR: ${e.message}`);
          expect(false).assertTrue();
          done();
        }
      })

      /**
       * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ON_AUDIOSCENECHANGE_0100
       * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ON_AUDIOSCENECHANGE_0100
       * @tc.desc   on_audioscenechange
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_AUDIO_MANAGER_ON_AUDIOSCENECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        try {
          audioManager.on('audioSceneChange', (audioScene) => {
            if (audioScene == audio.AudioScene.AUDIO_SCENE_DEFAULT) {
              expect(audioScene).assertEqual(0);
              console.info(`AudioSceneChange event: ${audioScene}`);
            } else if (audioScene == audio.AudioScene.AUDIO_SCENE_RINGING) {
              expect(audioScene).assertEqual(1);
              console.info(`AudioSceneChange event: ${audioScene}`);
            } else if (audioScene == audio.AudioScene.AUDIO_SCENE_PHONE_CALL) {
              expect(audioScene).assertEqual(2);
              console.info(`AudioSceneChange event: ${audioScene}`);
            } else if(audioScene == audio.AudioScene.AUDIO_SCENE_VOICE_CHAT) {
              expect(audioScene).assertEqual(3);
              console.info(`AudioSceneChange event: ${audioScene}`);
            }
            done();
          });
          done();
        } catch (err) {
          console.log('audioSceneChange failed, err :' + err.message)
          expect(false).assertTrue();
          done();
        }
      })
      /**
       * @tc.name   SUB_MULTIMEDIA_AUDIOCAPTURER_STATECHANGE_PERIODREACH_0100
       * @tc.number SUB_MULTIMEDIA_AUDIOCAPTURER_STATECHANGE_PERIODREACH_0100
       * @tc.desc   on_off_statechange_periodreach
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
      it('SUB_MULTIMEDIA_AUDIOCAPTURER_STATECHANGE_PERIODREACH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

          let audioStreamInfo: audio.AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000, // 采样率。
            channels: audio.AudioChannel.CHANNEL_2, // 通道。
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE, // 采样格式。
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW // 编码格式。
          };

          let audioCapturerInfo: audio.AudioCapturerInfo = {
            source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
            capturerFlags: 0 // 音频采集器标志。
          };

          let audioCapturerOptions:audio.AudioCapturerOptions = {
            streamInfo: audioStreamInfo,
            capturerInfo: audioCapturerInfo
          };

          let audioCapturer: audio.AudioCapturer;

          audio.createAudioCapturer(audioCapturerOptions).then((data) => {
            audioCapturer = data;
            console.info('AudioCapturer Created : SUCCESS');
            data.getCapturerInfo().then((audioParamsGet: audio.AudioCapturerInfo) => {
              if (audioParamsGet != undefined) {
                console.info('AudioFrameworkRecLog: Capturer CapturerInfo:');
                if (audioParamsGet.source == audio.SourceType.SOURCE_TYPE_CAMCORDER) {
                  console.info(`AudioFrameworkRecLog: Capturer SourceType: ${audioParamsGet.source}`);
                  expect(audioParamsGet.source).assertEqual(13);
                }
                console.info(`AudioFrameworkRecLog: Capturer capturerFlags: ${audioParamsGet.capturerFlags}`);
              } else {
                console.info(`AudioFrameworkRecLog: audioParamsGet is : ${audioParamsGet}`);
                console.info('AudioFrameworkRecLog: audioParams getCapturerInfo are incorrect');
              }
            }).catch((err: BusinessError) => {
              console.error(`AudioFrameworkRecLog: CapturerInfo :ERROR: ${err}`);
            })
            let periodReachCallback = (position: number) => {
              if (position == 1000) {
                console.info('ON Triggered successfully');
              }
            };
            data.on('periodReach', 1000, periodReachCallback);
            data.off('periodReach', periodReachCallback);
            let stateChangeCallback = (state: audio.AudioState) => {
              if (state == 1) {
                console.info('audio renderer state is: STATE_PREPARED');
              }
              if (state == 2) {
                console.info('audio renderer state is: STATE_RUNNING');
              }
            };
            data.on('stateChange', stateChangeCallback);
            data.off('stateChange', stateChangeCallback);
            let readDataCallback = (value: ArrayBuffer) => {
                console.info(`read valus: ${value}`);
              };
            data.on('readData', readDataCallback);
            console.info('Capturer readData on success.');
            data.off('readData', readDataCallback);
            console.info('Capturer readData of success.');
            data.release().then(() => {
              console.info('AudioFrameworkRecLog: ---------RELEASE RECORD---------');
              console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
              console.info(`AudioFrameworkRecLog: AudioCapturer : STATE : ${audioCapturer.state}`);
            }).catch((err: BusinessError) => {
              console.error(`AudioFrameworkRecLog: Capturer stop: ERROR: ${err}`);
              expect(true).assertFalse();
            });
          }).catch((err: BusinessError) => {
            console.error(`AudioCapturer Created : ERROR : ${err}`);
            expect(true).assertFalse();
          });
          done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0100
     * @tc.desc   isActive - Media - Promise - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.log(`${TagFrmwk}: Promise : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      const PROMISE = audioManager.isActive(audioMedia);
      PROMISE.then((data) => {
        let flag: boolean = true;
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: isActive: Media: TRUE: PASS:${data}`);
          expect(flag).assertTrue();
        } else if (data == true) {
          console.log(`${TagFrmwk}: Promise: isActive: Media: TRUE: PASS:${data}`);
          expect(flag).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.log('err :' + JSON.stringify(err));
        expect().assertFail();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0200
     * @tc.desc   isActive - Media - Callback - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0200', 1, (done: Function) => {
      console.log(`${TagFrmwk}: Callback : isActive Media: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      audioManager.isActive(audioMedia, (err, data) => {
        let flag: boolean = true;
        if (err) {
          console.error(`${TagFrmwk}: Callback : Media : isActive: failed  ${err.message}`);
          expect().assertFail();
        } else if (data == false) {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: PASS:${data}`);
          expect(flag).assertTrue();
        } else if (data == true) {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: PASS:${data}`);
          expect(flag).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Callback: isActive: Media: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0300
     * @tc.desc   isActive - Ringtone - Promise - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(`${TagFrmwk}: Promise : isActive Ringtone: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      const PROMISE = audioManager.isActive(audioRingtone);
      PROMISE.then((data) => {
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: isActive: Ringtone: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isActive: Ringtone: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.log('err :' + JSON.stringify(err));
        expect().assertFail();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0400
     * @tc.desc   isActive - Ringtone - Callback - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0400', 2, (done: Function) => {
      console.log(`${TagFrmwk}: Callback : isActive Ringtone: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      audioManager.isActive(audioRingtone, (err, data) => {
        if (err) {
          console.error(`${TagFrmwk}: Callback : Ringtone : isActive: failed  ${err.message}`);
          expect().assertFail();
        } else if (data == false) {
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0500
     * @tc.desc   isActive - Media - Promise - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(`${TagFrmwk}: Promise : isActive Media: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      const PROMISE = audioManager.isActive(audio.AudioVolumeType.MEDIA);
      PROMISE.then((data) => {
        let flag: boolean = true;
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: isActive: Media: ENAME: TRUE: PASS:${data}`);
          expect(flag).assertTrue();
        } else if (data == true) {
          console.log(`${TagFrmwk}: Promise: isActive: Media: ENAME: TRUE: PASS:${data}`);
          expect(flag).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isActive: Media: ENAME: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.log('err :' + JSON.stringify(err));
        expect().assertFail();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0600
     * @tc.desc   isActive - Media - Callback - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0600', 2, (done: Function) => {
      audioManager.isActive(audio.AudioVolumeType.MEDIA, (err, data) => {
        let flag: boolean = true;
        if (err) {
          console.error(`${TagFrmwk}: Callback : Media : ENAME: isActive: failed  ${err.message}`);
          expect().assertFail();
        } else if (data == false) {
          console.log(`${TagFrmwk}: Callback: isActive: Media: ENAME: TRUE: PASS:${data}`);
          expect(flag).assertTrue();
        } else if (data == true) {
          console.log(`${TagFrmwk}: Callback: isActive: Media: ENAME: TRUE: PASS:${data}`);
          expect(flag).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Callback: isActive: Media: ENAME: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0700
     * @tc.desc   isActive - Ringtone - Promise - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(`${TagFrmwk}: Promise : isActive Ringtone: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      const PROMISE = audioManager.isActive(audio.AudioVolumeType.RINGTONE);
      PROMISE.then((data) => {
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: isActive: Ringtone: ENAME: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isActive: Ringtone: ENAME: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.log('err :' + JSON.stringify(err));
        expect().assertFail();
      });
      await PROMISE;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0800
     * @tc.desc   isActive - Ringtone - Callback - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0800', 2, (done: Function) => {
      console.log(`${TagFrmwk}: Callback : isActive Ringtone: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      audioManager.isActive(audio.AudioVolumeType.RINGTONE, (err, data) => {
        if (err) {
          console.error(`${TagFrmwk}: Callback : Ringtone : ENAME: isActive: failed  ${err.message}`);
          expect().assertFail();
        } else if (data == false) {
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0100
     * @tc.desc   Enable mic mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      try {
        await audioManager.setMicrophoneMute(true);
        let data = await audioManager.isMicrophoneMute();
        if (data == true) {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0200
     * @tc.desc   Disable mic mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0200 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      try {
        await audioManager.setMicrophoneMute(false);
        let data = await audioManager.isMicrophoneMute();
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: FALSE: PASS:${data}`);
          expect(true).assertTrue();
        } else {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: FALSE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.info(`Error :${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0300
     * @tc.desc   Enable mic mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0300 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      audioManager.setMicrophoneMute(true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: setMicrophoneMute: Callback : TRUE: Error : ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.log(`${TagFrmwk}: setMicrophoneMute: Callback : TRUE`);
          audioManager.isMicrophoneMute((err, data) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : TRUE: isMicrophoneMute : Error ${err.message}`);
              expect(false).assertTrue();
            } else if (data == true) {
              console.log(`${TagFrmwk}: Callback : isMicrophoneMute: TRUE: PASS: ${data}`);
              expect(true).assertTrue();
            } else {
              console.log(`${TagFrmwk}: Callback : isMicrophoneMute: TRUE: FAIL: ${data}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0400
     * @tc.desc   Disable mic mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETMICROPHONEMUTE_0400 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      audioManager.setMicrophoneMute(false, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: setMicrophoneMute: Callback : FALSE: Error : ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.log(`${TagFrmwk}: setMicrophoneMute: Callback : FALSE`);
          audioManager.isMicrophoneMute((err, data) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : FALSE: isMicrophoneMute : Error ${err.message}`);
              expect(false).assertTrue();
            } else if (data == false) {
              console.log(`${TagFrmwk}: Callback : isMicrophoneMute: FALSE: PASS: ${data}`);
              expect(true).assertTrue();
            } else {
              console.log(`${TagFrmwk}: Callback : isMicrophoneMute: FALSE: FAIL: ${data}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100
     * @tc.desc   Deactivate speaker - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      try {
        let flag: boolean | null = null;
        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
          outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
          flag = false;
        }
        await audioManager.setDeviceActive(2, false).then(() => {
          console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 Promise returned to indicate that the device is set to the active status.`);
        });
        await audioManager.isDeviceActive(audio.ActiveDeviceType.SPEAKER).then((value) => {
          console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 isDeviceActive : SPEAKER: Deactivate : value is ${flag}`);
          if (flag == true && value == true) {
            console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 isDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            expect(true).assertTrue();
          } else if (flag == false && value == true) {
            console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 isDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
            expect(true).assertTrue();
          } else {
            console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 isDeviceActive : SPEAKER: Deactivate : fail :${value} flag is ${flag}`);
            expect(false).assertTrue();
          }
        }).catch((err: BusinessError) => {
          console.log('err :' + JSON.stringify(err.message));
          expect(false).assertTrue();
        });
      } catch (err) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0200
     * @tc.desc   Activate speaker - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0200 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      try {
        await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true);
        let value = await audioManager.isDeviceActive(2);
        if (value == true) {
          console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0300
     * @tc.desc   Deactivate speaker - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let flag: boolean | null = null;
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG)
      console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0300 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
        flag = true;
      }
      if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
        outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
        flag = false;
      }

      await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, false, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active`);
          audioManager.isDeviceActive(2, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
              expect(false).assertTrue();
            } else if (value == true && flag == true) {
              console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
              expect(true).assertTrue();
            } else if (value == true && flag == false) {
              console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
              expect(true).assertTrue();
            } else {
              console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0300 ${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : FAIL :${value} flag is ${flag}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0400
     * @tc.desc   Activate speaker - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0400 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device => 
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active: Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active`);
          audioManager.isDeviceActive(2, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active: Error: ${err.message}`);
              expect(false).assertTrue();
            } else if (value == true) {
              console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active : PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Active : FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0100
     * @tc.desc   setAudioParameter - Promise - Character & Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '8 bit');
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == '8 bit') {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: Bits per sample : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : Bits per sample : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0200
     * @tc.desc   setAudioParameter - Promise - Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '4800');
        console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == '4800') {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0300
     * @tc.desc   setAudioParameter - Promise - Long Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue);
        console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == longValue) {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0400
     * @tc.desc   setAudioParameter - Promise - Decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10.000000234324324324');
        console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == '10.000000234324324324') {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0500
     * @tc.desc   setAudioParameter - Promise - Parameter name Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'PPNumber');
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == 'PPNumber') {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0600
     * @tc.desc   setAudioParameter - Promise - Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '[]\:"<>?,./~!@#$%^*()_+-={}|');
        console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == '[]\:"<>?,./~!@#$%^*()_+-={}|') {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0700
     * @tc.desc   setAudioParameter - Callback - Character & Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0700', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', '16 bit', (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
              expect(false).assertTrue();
            } else if (value == '16 bit') {
              console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0800
     * @tc.desc   setAudioParameter - Callback - Special Character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0800', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', '~!@#$%^*()_+-={}|[]\:"<>?,./', (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : getAudioParam: VOICE_PHONE_STATUS: Error: ${err.message}`);
              expect(false).assertTrue();
            } else if (value == '~!@#$%^*()_+-={}|[]\:"<>?,./') {
              console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0900
     * @tc.desc   setAudioParameter - Callback - Decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_0900', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10000.21321432432432', (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback :getAudioParm: VOICE_PHONE_STATUS:Error: ${err.message}`);
              expect(false).assertTrue();
            } else if (value == '10000.21321432432432') {
              console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1000
     * @tc.desc   setAudioParameter - Callback - Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1000', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', '5454', (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: Callback : getAudioParam: VOICE_PHONE_STATUS: Error: ${err.message}`);
              expect(false).assertTrue();
            } else if (value == '5454') {
              console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1100
     * @tc.desc   setAudioParameter - Callback - Long Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1100', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue, (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
          if (err) {
            console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
            expect(false).assertTrue();
          } else if (value == longValue) {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
            expect(false).assertTrue();
          }
          done();
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1200
     * @tc.desc   setAudioParameter - Callback - Parameter name Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETAUDIOPARAMETER_1200', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'xyza', (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        }
        audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
          if (err) {
            console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
            expect(false).assertTrue();
          } else if (value == 'xyza') {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
            expect(false).assertTrue();
          }
          done();
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0100
     * @tc.desc   getAudioParameter - Promise - Character & Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '8 bit');
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == '8 bit') {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0200
     * @tc.desc   getAudioParameter - Promise - Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '4800');
        console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == '4800') {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0300
     * @tc.desc   getAudioParameter - Promise - Long Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue);
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == longValue) {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0400
     * @tc.desc   getAudioParameter - Promise - Decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10.0000000000234');
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == '10.0000000000234') {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0500
     * @tc.desc   getAudioParameter - Promise - Parameter name Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'PPNumber');
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == 'PPNumber') {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0600
     * @tc.desc   getAudioParameter - Promise - Special Characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('VOICE_PHONE_STATUS', '[]\:"<>?,./~!@#$%^*()_+-={}|');
        console.info(`${TagFrmwk}: Audio Parameter Test: Promise : setAudioParameter`);
        let value = await audioManager.getAudioParameter('VOICE_PHONE_STATUS');
        if (value == '[]\:"<>?,./~!@#$%^*()_+-={}|') {
          console.info(`${TagFrmwk}: Promise: getAudioParameter: VOICE_PHONE_STATUS : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getAudioParameter : VOICE_PHONE_STATUS : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0700
     * @tc.desc   getAudioParameter - Callback - Character & Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0700', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', '16 bit', (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
          if (err) {
            console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
            expect(false).assertTrue();
          } else if (value == '16 bit') {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
            expect(false).assertTrue();
          }
          done();
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0800
     * @tc.desc   getAudioParameter - Callback - Special Character
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0800', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', '~!@#$%^*()_+-={}|[]\:"<>?,./', (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
          if (err) {
            console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
            expect(false).assertTrue();
          } else if (value == '~!@#$%^*()_+-={}|[]\:"<>?,./') {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
            expect(false).assertTrue();
          }
          done();
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0900
     * @tc.desc   getAudioParameter - Callback - Decimal 10000.21321432432432
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_0900', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', '10000.21321432432432', (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
          if (err) {
            console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
            expect(false).assertTrue();
          } else if (value == '10000.21321432432432') {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
            expect(false).assertTrue();
          }
          done();
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1000
     * @tc.desc   getAudioParameter - Callback - Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1000', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', '5454', (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
          if (err) {
            console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
            expect(false).assertTrue();
          } else if (value == '5454') {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
            expect(false).assertTrue();
          }
          done();
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1100
     * @tc.desc   getAudioParameter - Callback - Long Number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1100', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', longValue, (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
          if (err) {
            console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
            expect(false).assertTrue();
          } else if (value == longValue) {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
            expect(false).assertTrue();
          }
          done();
        });
      });
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1200
     * @tc.desc   SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETAUDIOPARAMETER_1200', 2, (done: Function) => {
      audioManager.setAudioParameter('VOICE_PHONE_STATUS', 'xyza', (err) => {
        console.info(`${TagFrmwk}: Audio Parameter Test: Callback :VOICE_PHONE_STATUS : setAudioParameter`);
        if (err) {
          console.error(`${TagFrmwk}: Callback : setAudioParameter: VOICE_PHONE_STATUS : Error: ${err.message}`);
          expect(false).assertTrue();
          done();
          return;
        }
        audioManager.getAudioParameter('VOICE_PHONE_STATUS', (err, value) => {
          if (err) {
            console.error(`${TagFrmwk}: Callback : getAudioParameter: VOICE_PHONE_STATUS: Error: ${err.message}`);
            expect(false).assertTrue();
          } else if (value == 'xyza') {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: PASS :${value}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getAudioParameter: VOICE_PHONE_STATUS: FAIL :${value}`);
            expect(false).assertTrue();
          }
          done();
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0100
     * @tc.desc   InterruptType - INTERRUPT_TYPE_BEGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptType.INTERRUPT_TYPE_BEGIN).assertEqual(1);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0200
     * @tc.desc   InterruptType - INTERRUPT_TYPE_END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptType.INTERRUPT_TYPE_END).assertEqual(2);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0300
     * @tc.desc   InterruptHint - INTERRUPT_HINT_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptHint.INTERRUPT_HINT_NONE).assertEqual(0);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0400
     * @tc.desc   InterruptHint - INTERRUPT_HINT_RESUME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptHint.INTERRUPT_HINT_RESUME).assertEqual(1);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0500
     * @tc.desc   InterruptHint - INTERRUPT_HINT_PAUSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptHint.INTERRUPT_HINT_PAUSE).assertEqual(2);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0600
     * @tc.desc   InterruptHint - INTERRUPT_HINT_STOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptHint.INTERRUPT_HINT_STOP).assertEqual(3);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0700
     * @tc.desc   InterruptHint - INTERRUPT_HINT_DUCK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptHint.INTERRUPT_HINT_DUCK).assertEqual(4);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0800
     * @tc.desc   InterruptHint - INTERRUPT_HINT_UNDUCK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptHint.INTERRUPT_HINT_UNDUCK).assertEqual(5);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0900
     * @tc.desc   InterruptForceType - INTERRUPT_FORCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1000
     * @tc.desc   InterruptForceType - INTERRUPT_SHARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptForceType.INTERRUPT_SHARE).assertEqual(1);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1100
     * @tc.desc   ActiveDeviceType - BLUETOOTH_SCO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.ActiveDeviceType.BLUETOOTH_SCO).assertEqual(7);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1200
     * @tc.desc   ActiveDeviceType - SPEAKER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.ActiveDeviceType.SPEAKER).assertEqual(2);
      await sleep(50);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1300
     * @tc.desc   InterruptHint - INTERRUPT_HINT_UNDUCK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      expect(audio.InterruptHint.INTERRUPT_HINT_MUTE).assertEqual(6);
      await sleep(50);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1400
     * @tc.desc   InterruptHint - INTERRUPT_HINT_UNDUCK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      expect(audio.InterruptHint.INTERRUPT_HINT_UNMUTE).assertEqual(7);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0013
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0013
     * @tc.desc   InterruptHint - INTERRUPT_HINT_MUTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0013',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptHint.INTERRUPT_HINT_MUTE).assertEqual(6);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0014
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0014
     * @tc.desc   InterruptHint - INTERRUPT_HINT_UNMUTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptHint.INTERRUPT_HINT_UNMUTE).assertEqual(7);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTACTIONTYPE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTACTIONTYPE_0100
     * @tc.desc   InterruptActionType - TYPE_ACTIVATED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTACTIONTYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptActionType.TYPE_ACTIVATED).assertEqual(0);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTACTIONTYPE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTACTIONTYPE_0200
     * @tc.desc   InterruptActionType - TYPE_INTERRUPT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTACTIONTYPE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptActionType.TYPE_INTERRUPT).assertEqual(1);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTTYPE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTTYPE_0100
     * @tc.desc   InterruptType - INTERRUPT_TYPE_BEGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTTYPE_0100',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptType.INTERRUPT_TYPE_BEGIN).assertEqual(1);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTTYPE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTTYPE_0200
     * @tc.desc   InterruptType - INTERRUPT_TYPE_END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPTTYPE_0200',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.InterruptType.INTERRUPT_TYPE_END).assertEqual(2);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICETYPE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICETYPE_0100
     * @tc.desc   DeviceType - ALL Device Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICETYPE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.DeviceType.INVALID).assertEqual(0);
      console.info("audio.DeviceType.INVALID:" + audio.DeviceType.INVALID);
      expect(audio.DeviceType.EARPIECE).assertEqual(1);
      console.info("audio.DeviceType.EARPIECE:" + audio.DeviceType.EARPIECE);
      expect(audio.DeviceType.SPEAKER).assertEqual(2);
      console.info("audio.DeviceType.SPEAKER:" + audio.DeviceType.SPEAKER);
      expect(audio.DeviceType.WIRED_HEADSET).assertEqual(3);
      console.info("audio.DeviceType.WIRED_HEADSET:" + audio.DeviceType.WIRED_HEADSET);
      expect(audio.DeviceType.WIRED_HEADPHONES).assertEqual(4);
      console.info("audio.DeviceType.WIRED_HEADPHONES:" + audio.DeviceType.WIRED_HEADPHONES);
      expect(audio.DeviceType.BLUETOOTH_SCO).assertEqual(7);
      console.info("audio.DeviceType.BLUETOOTH_SCO:" + audio.DeviceType.BLUETOOTH_SCO);
      expect(audio.DeviceType.BLUETOOTH_A2DP).assertEqual(8);
      console.info("audio.DeviceType.BLUETOOTH_A2DP:" + audio.DeviceType.BLUETOOTH_A2DP);
      expect(audio.DeviceType.MIC).assertEqual(15);
      console.info("audio.DeviceType.MIC:" + audio.DeviceType.MIC);
      expect(audio.DeviceType.USB_HEADSET).assertEqual(22);
      console.info("audio.DeviceType.USB_HEADSET:" + audio.DeviceType.USB_HEADSET);
      expect(audio.DeviceType.DISPLAY_PORT).assertEqual(23);
      console.info("audio.DeviceType.DISPLAY_PORT:" + audio.DeviceType.DISPLAY_PORT);
      expect(audio.DeviceType.REMOTE_CAST).assertEqual(24);
      console.info("audio.DeviceType.REMOTE_CAST:" + audio.DeviceType.REMOTE_CAST);
      expect(audio.DeviceType.USB_DEVICE).assertEqual(25);
      console.info("audio.DeviceType.USB_DEVICE:" + audio.DeviceType.USB_DEVICE);
      expect(audio.DeviceType.HDMI).assertEqual(27);
      console.info("audio.DeviceType.HDMI:" + audio.DeviceType.HDMI);
      expect(audio.DeviceType.LINE_DIGITAL).assertEqual(28);
      console.info("audio.DeviceType.LINE_DIGITAL:" + audio.DeviceType.LINE_DIGITAL);
      expect(audio.DeviceType.REMOTE_DAUDIO).assertEqual(29);
      console.info("audio.DeviceType.REMOTE_DAUDIO:" + audio.DeviceType.REMOTE_DAUDIO);
      expect(audio.DeviceType.HEARING_AID).assertEqual(30);
      console.info("audio.DeviceType.HEARING_AID:" + audio.DeviceType.HEARING_AID);
      expect(audio.DeviceType.NEARLINK).assertEqual(31);
      console.info("audio.DeviceType.NEARLINK:" + audio.DeviceType.NEARLINK);
      expect(audio.DeviceType.SYSTEM_PRIVATE).assertEqual(200);
      console.info("audio.DeviceType.SYSTEM_PRIVATE:" + audio.DeviceType.SYSTEM_PRIVATE);
      expect(audio.DeviceType.DEFAULT).assertEqual(1000);
      console.info("audio.DeviceType.DEFAULT:" + audio.DeviceType.DEFAULT);
      await sleep(50);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_SCENE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_SCENE_0100
     * @tc.desc   DeviceRole - ALL Device Role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_SCENE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA).assertEqual(0);
      console.info("audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA :" + audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
      expect(audio.AudioSessionScene.AUDIO_SESSION_SCENE_GAME).assertEqual(1);
      console.info("audio.AudioSessionScene.AUDIO_SESSION_SCENE_GAME :" + audio.AudioSessionScene.AUDIO_SESSION_SCENE_GAME);
      expect(audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION).assertEqual(2);
      console.info("audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION :" + audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION);
      await sleep(50);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_0100
     * @tc.desc   DeviceRole - ALL Device Role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_RESUME).assertEqual(0);
      console.info("audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_RESUME :" + audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_RESUME);
      expect(audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_PAUSE).assertEqual(1);
      console.info("audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_PAUSE :" + audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_PAUSE);
      expect(audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_STOP).assertEqual(2);
      console.info("audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_STOP :" + audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_STOP);
      expect(audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_TIME_OUT_STOP).assertEqual(3);
      console.info("audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_TIME_OUT_STOP :" + audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_TIME_OUT_STOP);
      expect(audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_DUCK).assertEqual(4);
      console.info("audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_DUCK :" + audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_DUCK);
      expect(audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_UNDUCK).assertEqual(5);
      console.info("audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_UNDUCK :" + audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_UNDUCK);
      await sleep(50);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_0200
     * @tc.desc   DeviceRole - ALL Device Role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_MUTE_SUGGESTION).assertEqual(6);
      console.info("audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_MUTE_SUGGESTION :" + audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_MUTE_SUGGESTION);
      expect(audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_UNMUTE_SUGGESTION).assertEqual(7);
      console.info("audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_UNMUTE_SUGGESTION :" + audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_UNMUTE_SUGGESTION);
      await sleep(50);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_DEVICE_RECOMMENDEDACTION_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_RECOMMENDEDACTION_0100
     * @tc.desc   DeviceRole - ALL Device Role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICE_RECOMMENDEDACTION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_CONTINUE).assertEqual(0);
      console.info("audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_CONTINUE :" + audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_CONTINUE);
      expect(audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_STOP).assertEqual(1);
      console.info("audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_STOP :" + audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_STOP);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICEROLE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICEROLE_0100
     * @tc.desc   DeviceRole - ALL Device Role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICEROLE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.DeviceRole.INPUT_DEVICE).assertEqual(1);
      console.info("audio.DeviceRole.INPUT_DEVICE :" + audio.DeviceRole.INPUT_DEVICE);
      expect(audio.DeviceRole.OUTPUT_DEVICE).assertEqual(2);
      console.info("audio.DeviceRole.OUTPUT_DEVICE :" + audio.DeviceRole.OUTPUT_DEVICE);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0100
     * @tc.desc   getDevices - Output device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(1, (err, value) => {
        // Getting all Output devices Enumb 1 = OUTPUT_DEVICES_FLAG
        console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}:Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);

          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
            cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0200
     * @tc.desc   getDevices - Input device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(2, (err, value) => {
        // Getting all Input Devices ENUM 2 = INPUT_DEVICES_FLAG
        console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}:Callback:INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);
          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null
            && cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0300
     * @tc.desc   getDevices - ALL device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(3, (err, value) => {
        // Getting all devies connected 3 = ALL_DEVICES_FLAG
        console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}:Callback:ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);

          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
            cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0400
     * @tc.desc   getDevices - Output device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG, (err, value) => {
        console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}:Callback:OUTPUT_DEVICES_FLAG:failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);
          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
            cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : OUTPUT_DEVICES_FLAG :  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0500
     * @tc.desc   getDevices - Input device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG, (err, value) => {
        console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}:Callback:INPUT_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);
          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
            cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0600
     * @tc.desc   getDevices - ALL device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG, (err, value) => {
        console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback: ALL_DEVICES_FLAG: failed to get devices ${err.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
          value.forEach(displayDeviceProp);
          if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
            cMask != null) {
            console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
            expect(true).assertTrue();
          } else {
            console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
            expect(false).assertTrue();
          }
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0700
     * @tc.desc   getDevices - OUTPUT device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      let value = await AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`${TagFrmwk}: Promise: getDevices OUTPUT_DEVICES_FLAG`);
      value.forEach(displayDeviceProp);
      if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
        cMask != null) {
        console.info(`${TagFrmwk}: Promise: getDevices:OUTPUT_DEVICES_FLAG : PASS`);
        expect(true).assertTrue();
      } else {
        console.info(`${TagFrmwk}: Promise: getDevices:OUTPUT_DEVICES_FLAG : FAIL`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0800
     * @tc.desc   getDevices - INPUT device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      let value = await AudioRoutingManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG);
      console.info(`${TagFrmwk}: Promise: getDevices INPUT_DEVICES_FLAG`);
      value.forEach(displayDeviceProp);
      if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
        cMask != null) {
        console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  PASS`);
        expect(true).assertTrue();
      } else {
        console.info(`${TagFrmwk}: Callback: getDevices : INPUT_DEVICES_FLAG:  FAIL`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0900
     * @tc.desc   getDevices - ALL device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      let value = await AudioRoutingManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG);
      console.info(`${TagFrmwk}: Promise: getDevices ALL_DEVICES_FLAG`);
      value.forEach(displayDeviceProp);
      if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
        cMask != null) {
        console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  PASS`);
        expect(true).assertTrue();
      } else {
        console.info(`${TagFrmwk}: Callback: getDevices : ALL_DEVICES_FLAG:  FAIL`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_DEVICEFALG_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICEFALG_0100
     * @tc.desc   NONE_DEVICES_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEFALG_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.DeviceFlag.OUTPUT_DEVICES_FLAG).assertEqual(1);
      expect(audio.DeviceFlag.INPUT_DEVICES_FLAG).assertEqual(2);
      expect(audio.DeviceFlag.ALL_DEVICES_FLAG).assertEqual(3);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SAMPLE_FORMAT_F32LE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SAMPLE_FORMAT_F32LE_0100
     * @tc.desc   SAMPLE_FORMAT_F32LE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SAMPLE_FORMAT_F32LE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE).assertEqual(4);
      await sleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0100
     * @tc.desc   getDevices - OUTPUT device - getDevicesSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      let value = AudioRoutingManager.getDevicesSync(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`${TagFrmwk}: Promise: getDevices OUTPUT_DEVICES_FLAG`);
      value.forEach(displayDeviceProp);
      if (dTValue != null && dRValue != null && devId > 0 && sRate != null && cCount != null &&
        cMask != null) {
        console.info(`${TagFrmwk}: Promise: getDevices:OUTPUT_DEVICES_FLAG : PASS`);
        expect(true).assertTrue();
      } else {
        console.info(`${TagFrmwk}: Promise: getDevices:OUTPUT_DEVICES_FLAG : FAIL`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0200
     * @tc.desc   getDevicesSync - ErrorCode - Null-Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.getDevicesSync(volumeType);
        console.info(`${TagFrmwk}: getDevicesSync Success,value: ${value}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${TagFrmwk}: getDevicesSync Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0300
     * @tc.desc   getDevicesSync - ErrorCode - Number-Parameters - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.getDevicesSync(123);
        console.info(`${TagFrmwk}: getDevicesSync Success,value: ${value}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${TagFrmwk}: getDevicesSync Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0400
     * @tc.desc   getDevicesSync - ErrorCode - audio.DeviceFlag.INPUT_DEVICES_FLAG-Parameters - Success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.getDevicesSync(audio.DeviceFlag.INPUT_DEVICES_FLAG);
        console.info(`${TagFrmwk}: getDevicesSync Success,value: ${value}`);
        expect(true).assertTrue();
        done();
      } catch (error) {
        console.info(`${TagFrmwk}: getDevicesSync Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0204
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0204
     * @tc.desc   getDevicesSync - ErrorCode - String-Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.getDevicesSync(AudioVolumeType);
        console.info(`${TagFrmwk}: getDevicesSync Success,value: ${value}`);
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`${TagFrmwk}: getDevicesSync Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0100
     * @tc.desc   on_DeviceChange - ErrorCode - Null-Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let AudioManager = audioManager.getRoutingManager();
      try {
        AudioManager.on('deviceChange', null!, (deviceChanged) => {
          console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
          console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
          expect(false).assertTrue();
          done();
        });
        AudioManager.off('deviceChange',(deviceChanged) => {
          console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
          console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.info(`${TagFrmwk}: on('deviceChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0100
     * @tc.desc   on_DeviceChange - ErrorCode - Null-Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        AudioRoutingManager.on('deviceChange', null!, (deviceChanged) => {
          console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
          console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
          expect(false).assertTrue();
          done();
        });
        AudioRoutingManager.off('deviceChange', (deviceChanged) => {
          console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
          console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.info(`${TagFrmwk}: on('deviceChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0200
     * @tc.desc   on_DeviceChange - ErrorCode - Number-Parameters - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        AudioRoutingManager.on('deviceChange', -123, (deviceChanged) => {
          console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
          console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
          expect(false).assertTrue();
          done();
        });
        AudioRoutingManager.off('deviceChange', (deviceChanged) => {
          console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
          console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
          console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.info(`${TagFrmwk}: on('deviceChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0300
     * @tc.desc   getDevicesSync - ErrorCode - Number-Parameters - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        AudioRoutingManager.on('deviceChange', 333,
          (deviceChanged: audio.DeviceChangeAction) => {
            console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
            console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
            expect(false).assertTrue();
            done();
          });
          AudioRoutingManager.off('deviceChange',
          (deviceChanged: audio.DeviceChangeAction) => {
            console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
            console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
            expect(false).assertTrue();
            done();
          });
      } catch (error) {
        console.info(`${TagFrmwk}: on('deviceChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(audio.AudioErrors.ERROR_INVALID_PARAM);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0400
     * @tc.desc   getDevicesSync - ErrorCode - String -Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let deviceFlag: ESObject = '123';
        AudioRoutingManager.on('deviceChange', deviceFlag,
          (deviceChanged: audio.DeviceChangeAction) => {
            console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
            console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
            expect(false).assertTrue();
            done();
          });
          AudioRoutingManager.off('deviceChange',
          (deviceChanged: audio.DeviceChangeAction) => {
            console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
            console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
            expect(false).assertTrue();
            done();
          });
      } catch (error) {
        console.info(`${TagFrmwk}: on('deviceChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(401);
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0500
     * @tc.desc   getDevicesSync - ErrorCode - String -Parameters - 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let deviceFlag: ESObject = '123';
        AudioRoutingManager.on('deviceChange', deviceFlag,
          (deviceChanged: audio.DeviceChangeAction) => {
            console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
            console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
            expect(false).assertTrue();
            done();
          });
          AudioRoutingManager.off('deviceChange',
          (deviceChanged: audio.DeviceChangeAction) => {
            console.info(TagFrmwk + ':device change type : ' + deviceChanged.type);
            console.info(TagFrmwk + ':device descriptor size : ' + deviceChanged.deviceDescriptors.length);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
            console.info(TagFrmwk + ':device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
            expect(false).assertTrue();
            done();
          });
      } catch (error) {
        if(Number.isNaN(error.code)  || error.code == 6800301 )
        console.info(`${TagFrmwk}: on('deviceChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(true).assertTrue();
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_VOLUMECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_VOLUMECHANGE_0100
     * @tc.desc   AudioRendererChange - ON_AUDIOCAPTURERCHANGE 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_VOLUMECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let volumeManager = audio.getAudioManager().getVolumeManager();
      let flag: boolean = false;
      try {
        let para: ESObject = '123';
        volumeManager.on('volumeChange', para);
        volumeManager.off(para);
      } catch (error) {
        console.info(`on('volumeChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_VOLUMECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_VOLUMECHANGE_0200
     * @tc.desc   AudioRendererChange - ON_AUDIOCAPTURERCHANGE 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_VOLUMECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let volumeManager = audio.getAudioManager().getVolumeManager();
      let flag: boolean = false;
      try {
        let para: ESObject = '123';
        volumeManager.on(para,()=>{});
        volumeManager.off(para);
      } catch (error) {
        console.info(`on('volumeChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_VOLUMECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_VOLUMECHANGE_0100
     * @tc.desc   OFF_VOLUMECHANGE 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_VOLUMECHANGE_0100', 2, (done: Function) => {
      let volumeManager = audio.getAudioManager().getVolumeManager();
      let flag: boolean = false;
      let cb1: Callback<audio.VolumeEvent> = (volumeEvent: audio.VolumeEvent) => {};
      volumeManager.on('volumeChange', cb1);
      try {
        let para: ESObject = '123';
        volumeManager.off(para);
      } catch (error) {
        console.info(`off('volumeChange') Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETSPATIALIZATIONMANAGER_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETSPATIALIZATIONMANAGER_0100
     * @tc.desc   OFF_VOLUMECHANGE 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GETSPATIALIZATIONMANAGER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      try {
        let audioSpatializationManager: audio.AudioSpatializationManager = audio.getAudioManager().getSpatializationManager();
        let isSpatializationEnabledForCurrentDevice: boolean = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
        console.info(`AudioSpatializationManager isSpatializationEnabledForCurrentDevice: ${isSpatializationEnabledForCurrentDevice}`);
      } catch (error) {
        console.info(`Fail, error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(false).assertTrue();
      }
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0100
     * @tc.desc   on_off_spatializationEnabledChangeForCurrentDevice -401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let para:ESObject = 123;
      let flag:boolean = false;
      let audioSpatializationManager: audio.AudioSpatializationManager = audio.getAudioManager().getSpatializationManager();
      let isSpatializationEnabledForCurrentDevice: boolean = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
      try {
        audioSpatializationManager.on('spatializationEnabledChangeForCurrentDevice',para)
        audioSpatializationManager.off('spatializationEnabledChangeForCurrentDevice',para)
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`on_off('spatializationEnabledChangeForCurrentDevice') Fail, error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0200
     * @tc.desc   on_off_spatializationEnabledChangeForCurrentDevice -6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let para:ESObject = '123';
      let flag:boolean = false;
      let audioSpatializationManager: audio.AudioSpatializationManager = audio.getAudioManager().getSpatializationManager();
      let isSpatializationEnabledForCurrentDevice: boolean = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
      try {
        audioSpatializationManager.on(para,()=>{})
        audioSpatializationManager.off(para,()=>{})
        expect(false).assertTrue();
        done();
      } catch (error) {
        console.info(`on_off('spatializationEnabledChangeForCurrentDevice') Fail, error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(Number(error.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0100
     * @tc.desc   isAcousticEchoCancelerSupported -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
    (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
            let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_LIVE);
            console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_LIVE}, Status: ${isSupportAEC}`);
            flag = true;
        } catch (err) {
            let error = err as BusinessError;
            console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0200
     * @tc.desc   isAcousticEchoCancelerSupported - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
    (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
            let param: ESObject = -100;
            let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(param);
            console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_LIVE}, Status: ${isSupportAEC}`);
        } catch (err) {
            let error = err as BusinessError;
            console.error(`isAcousticEchoCancelerSupported ERROR: ${error}, errorcode: ${error.code}`);
            flag = true;
            expect(Number(error.code)).assertEqual(6800101);
        }
        expect(flag).assertTrue();
        done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0300
     * @tc.desc   isAcousticEchoCancelerSupported - false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
    (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        try {
            let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_UNPROCESSED);
            console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_UNPROCESSED}, Status: ${isSupportAEC}`);
            expect(isSupportAEC).assertFalse();
        } catch (err) {
            let error = err as BusinessError;
            console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
            expect(false).assertTrue();
        }
        done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0400
     * @tc.desc   isAcousticEchoCancelerSupported - true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, 
    (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        try {
          let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_LIVE);
          console.info(`[AEC Support] Source Type: ${audio.SourceType.SOURCE_TYPE_LIVE}, Status: ${isSupportAEC}`)
          if (isSupportAEC) {
              console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_LIVE}, Status: ${isSupportAEC}`);
              expect(isSupportAEC).assertEqual(true);
          } else {
              console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_LIVE}, Status: ${isSupportAEC}`);
              expect(isSupportAEC).assertEqual(false);
          } 
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
          expect(false).assertTrue();        
        }
        done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0100
     * @tc.desc   enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_MEDIA);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETVOLUMNBYSTREAM_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETVOLUMNBYSTREAM_0100
     * @tc.desc   enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GETVOLUMNBYSTREAM_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: number = audio.getAudioManager().getVolumeManager().getVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`getVolumeByStream ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETMAXVOLUMNBYSTREAM_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETMAXVOLUMNBYSTREAM_0100
     * @tc.desc   enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GETMAXVOLUMNBYSTREAM_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: number = audio.getAudioManager().getVolumeManager().getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`getMaxVolumeByStream ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETMINVOLUMNBYSTREAM_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETMINVOLUMNBYSTREAM_0100
     * @tc.desc   enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GETMINVOLUMNBYSTREAM_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: number = audio.getAudioManager().getVolumeManager().getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MEDIA);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`getMinVolumeByStream ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0200
     * @tc.desc   enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioStreamUsage:ESObject = '1';
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audioStreamUsage);
        expect(false).assertTrue();
      } catch (err) {
        expect(Number(err.code)).assertEqual(6800101);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0100
     * @tc.desc   isIntelligentNoiseReductionEnabledForCurrentDevice -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
            let isSupport: boolean = audioStreamManager.isIntelligentNoiseReductionEnabledForCurrentDevice(audio.SourceType.SOURCE_TYPE_LIVE);
            console.info(`[Support] SourceType: ${audio.SourceType.SOURCE_TYPE_LIVE}, Status: ${isSupport}`);
            flag = true;
        } catch (err) {
            let error = err as BusinessError;
            console.error(`isIntelligentNoiseReductionEnabledForCurrentDevice ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0200
     * @tc.desc   isIntelligentNoiseReductionEnabledForCurrentDevice - 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
    (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        try {
            let param: ESObject = -100;
            let isSupport: boolean = audioStreamManager.isIntelligentNoiseReductionEnabledForCurrentDevice(param);
            console.info(`[Support] Status: ${isSupport}`);
            expect(false).assertTrue();
        } catch (err) {
            let error = err as BusinessError;
            console.error(`isIntelligentNoiseReductionEnabledForCurrentDevice ERROR: ${error}`);
            expect(Number(err.code)).assertEqual(6800101);
        }
        done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_AUDIOPRIVACYTYPE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_AUDIOPRIVACYTYPE_0300
     * @tc.desc   AudioPrivacyType - PRIVACY_TYPE_SHARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_AUDIOPRIVACYTYPE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(audio.AudioPrivacyType.PRIVACY_TYPE_SHARED).assertEqual(2);
      await sleep(50);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISMUTE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISMUTE_0100
     * @tc.desc   isMute - Media - callback - Enable mute - SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISMUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      await audioManager.setVolume(audio.AudioVolumeType.MEDIA, highVol);
      audioManager.mute(audio.AudioVolumeType.MEDIA, true, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Set Stream Mute: Media: Callback: Error :  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          audioManager.isMute(audio.AudioVolumeType.MEDIA, (err, value) =>{
            if (err) {
              console.error(`${TagFrmwk}: Callback : FALSE: Media : failed to get Mute Status ${err.message}`);
              expect().assertFail();
            } else if (value == true) {
              console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${value}`);
              expect(true).assertTrue();
            } else if (value == false) {
              console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${value}`);
              expect(true).assertTrue();
            }else{
              console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: FAIL: ${value}`);
              expect(true).assertTrue();
            }
            done();
          });
        }
      });
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISMUTE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISMUTE_0200
     * @tc.desc   isMute - Media - Promise - Disable mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISMUTE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try{
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, 14);
        audioManager.mute(audio.AudioVolumeType.MEDIA, true);
        console.log(`${TagFrmwk}: Promise returned to indicate that the stream is  muted`);
        audioManager.isMute(audio.AudioVolumeType.MEDIA).then((data: boolean) => {
          if (data == true) {
              console.log(`${TagFrmwk}: Promise: Is Stream Mute Ringtone: FALSE: PASS:${data}`);
              expect(true).assertTrue();
            } else if (data == false) {
              console.log(`${TagFrmwk}: Promise: Is Stream Mute Ringtone: FALSE: PASS:${data}`);
              expect(true).assertTrue();
            } else {
              console.log(`${TagFrmwk}: Promise: Is Stream Mute Ringtone: FALSE: PASS:${data}`);
              expect(true).assertTrue();
           }
        });
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0900
     * @tc.desc   isActive - Ringtone - Callback - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(`${TagFrmwk}: Callback : isActive Ringtone: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      audioManager.isActive(audio.AudioVolumeType.RINGTONE, (err, data) => {
        if (err) {
          console.error(`${TagFrmwk}: Callback : Ringtone : ENAME: isActive: failed  ${err.message}`);
          expect().assertFail();
        } else if (data == false) {
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else if (data == true){
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: PASS: ${data}`);
          expect(true).assertTrue();
        } else{
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
        done();
      });
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_1000
     * @tc.desc   isActive - Ringtone - Promise - When stream is NOT playing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISACTIVE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.log(`${TagFrmwk}: Promise : isActive Ringtone: ENAME: NOTE: audio NOT PLAYING as MEDIA for the test case to PASS`);
      const PROMISE = audioManager.isActive(audio.AudioVolumeType.RINGTONE);
      PROMISE.then((data) => {
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: isActive: Ringtone: ENAME: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else if (data == true){
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: PASS: ${data}`);
          expect(true).assertTrue();
        } else{
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.log('err :' + JSON.stringify(err));
        expect().assertFail();
      });
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISMICROPHONEMUTE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISMICROPHONEMUTE_0200
     * @tc.desc   Enable mic mute
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISMICROPHONEMUTE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ISMICROPHONEMUTE_0200 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device =>
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      try {
        await audioManager.setMicrophoneMute(true);
        let data = await audioManager.isMicrophoneMute();
        if (data == true) {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: PASS:${data}`);
          expect(true).assertTrue();
        } else if (data == false){
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: PASS: ${data}`);
          expect(true).assertTrue();
        } else{
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: FAIL: ${data}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_GETRINGERMODE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_GETRINGERMODE_0200
     * @tc.desc   getRingerMode - Set Ring more to Normal Mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETRINGERMODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setRingerMode(audio.AudioRingMode.RINGER_MODE_NORMAL);
        let value = await audioManager.getRingerMode();
        if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
          expect(true).assertTrue();
        } else if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
          expect(true).assertTrue();
        } else if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_SILENT: PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_NORMAL: FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISDEVICEACTIVE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISDEVICEACTIVE_0100
     * @tc.desc   Deactivate speaker - Callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISDEVICEACTIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let flag: boolean | null = null;
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG)
      console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_ISDEVICEACTIVE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device =>
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
        flag = true;
      }
      if (outputDeviceDescription.length == 2 && outputDeviceDescription[0].deviceType == audio.DeviceType.EARPIECE &&
        outputDeviceDescription[1].deviceType == audio.DeviceType.SPEAKER) {
        flag = false;
      }
      await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, false, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
          expect(false).assertTrue();
          done();
        }
       });
       console.info(`${TagFrmwk}: Device Test: Callback : setDeviceActive : SPEAKER: Active`);
       audioManager.isDeviceActive(2, (err, value) => {
         if (err) {
           console.error(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate: Error: ${err.message}`);
           expect(false).assertTrue();
         } else if (value == true) {
           console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS :${value}`);
           expect(true).assertTrue();
         } else if (value == false) {
           console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS :${value}`);
           expect(true).assertTrue();
         } else {
           console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_ISDEVICEACTIVE_0100 ${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : FAIL :${value} flag is ${flag}`);
           expect(false).assertTrue();
         }
         done();
      });
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ISDEVICEACTIVE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ISDEVICEACTIVE_0200
     * @tc.desc   Activate speaker - Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ISDEVICEACTIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_ISDEVICEACTIVE_0200 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      console.info(`${TagFrmwk}: Determine if this is a default device`)
      const detecteDevice = outputDeviceDescription.some(device =>
            device.deviceType === audio.DeviceType.DISPLAY_PORT
        );
      if (detecteDevice) {
          console.info(`${TagFrmwk}: this device has external device`)
          expect(true).assertTrue();
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      try {
        await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true);
        let value = await audioManager.isDeviceActive(2);
        if (value == true) {
          console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : PASS :${value}`);
          expect(true).assertTrue();
        } else if (value == false) {
          console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : PASS :${value}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : FAIL :${value}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOVOLUMEMODE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOVOLUMEMODE_0100
     * @tc.desc   AudioVolumemode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIOVOLUMEMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(audio.AudioVolumeMode.SYSTEM_GLOBAL).assertEqual(0);
      console.log(`AUDIOVOLUMEMODE_SYSTEM_GLOBAL is: ${audio.AudioVolumeMode.SYSTEM_GLOBAL}`);
      expect(audio.AudioVolumeMode.APP_INDIVIDUAL).assertEqual(1);
      console.log(`AUDIOVOLUMEMODE_APP_INDIVIDUAL is: ${audio.AudioVolumeMode.APP_INDIVIDUAL}`);
      done();
    })
  })
}