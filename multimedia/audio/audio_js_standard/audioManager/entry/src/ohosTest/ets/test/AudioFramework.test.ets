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
        } else if (data == maxVolPc) {
          console.info(`${TagFrmwk}: Media getVolume Promise: PASS :${data}`);
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
            } else if (value == maxVolPc) {
              console.info(`${TagFrmwk}: callback : Media getVolume: PASS :${value}`);
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
        } else if (data == maxVolPc) {
          console.info(`${TagFrmwk}: Ringtone getVolume Promise: PASS :${data}`);
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
            } else if (value == maxVolPc) {
              console.info(`${TagFrmwk}: callback : Ringtone getVolume: PASS :${value}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2900
     * @tc.desc   Setvol to 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, highVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback: ENAME :  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback : ENAME :  VOICE_CALL setVolume successful `);
          audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : VOICE_CALL: ENAME : Error ${err.message}`);
              expect(false).assertTrue();
            } else if (value == highVol) {
              console.info(`${TagFrmwk}: callback : VOICE_CALL getVolume: ENAME : PASS :${value}`);
            } else {
              console.info(`${TagFrmwk}: callback : VOICE_CALL getVolume: ENAME : FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_3000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_3000
     * @tc.desc   Setvol to 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager.setVolume(audio.AudioVolumeType.ALARM, highVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback: ENAME :  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback : ENAME :  ALARM setVolume successful `);
          audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : ALARM: ENAME : Error ${err.message}`);
              expect(false).assertTrue();
            } else if (value == highVol) {
              console.info(`${TagFrmwk}: callback : ALARM getVolume: ENAME : PASS :${value}`);
            } else {
              console.info(`${TagFrmwk}: callback : ALARM getVolume: ENAME : FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_3100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_3100
     * @tc.desc   Setvol to 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, highVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback: ENAME :  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback : ENAME :  ACCESSIBILITY setVolume successful `);
          audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : ACCESSIBILITY: ENAME : Error ${err.message}`);
              expect(false).assertTrue();
            } else if (value == highVol) {
              console.info(`${TagFrmwk}: callback : ACCESSIBILITY getVolume: ENAME : PASS :${value}`);
            } else {
              console.info(`${TagFrmwk}: callback : ACCESSIBILITY getVolume: ENAME : FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
          });
        }
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_3200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_3200
     * @tc.desc   Setvol to 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_SETVOLUME_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, highVol, (err) => {
        if (err) {
          console.error(`${TagFrmwk}: failed to set volume: Callback: ENAME :  ${err.message}`);
          expect(false).assertTrue();
          done();
        } else {
          console.info(`${TagFrmwk}: callback : ENAME :  VOICE_ASSISTANT setVolume successful `);
          audioManager.getVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
            if (err) {
              console.error(`${TagFrmwk}: callback : VOICE_ASSISTANT: ENAME : Error ${err.message}`);
              expect(false).assertTrue();
            } else if (value == highVol) {
              console.info(`${TagFrmwk}: callback : VOICE_ASSISTANT getVolume: ENAME : PASS :${value}`);
            } else {
              console.info(`${TagFrmwk}: callback : VOICE_ASSISTANT getVolume: ENAME : FAIL :${value}`);
              expect(false).assertTrue();
            }
            done();
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
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_GETMAXVOLUME_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      audioManager.getMaxVolume(audioMedia, (err, value) => {
        console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : value:${value}`);
        if (err) {
          console.error(`${TagFrmwk}: callback : Media : failed to getMaxVolume ${err.message}`);
          expect(false).assertTrue();
        } else if (MaxVloume.includes(value)) {
          console.info(`${TagFrmwk}: callback : Media:  getMaxVolume : PASS:${value}`);
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
          done();
        } else if (data == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerMode : PASS :${data}`);
          done();
        } else if (data == audio.AudioRingMode.RINGER_MODE_SILENT) {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerMode : PASS :${data}`);
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
              done();
            } else if (value == audio.AudioRingMode.RINGER_MODE_NORMAL) {
              console.info(`${TagFrmwk}: Callback: audioVolumeGroupManager.getRingerMode RINGER_MODE_NORMAL: PASS :${value}`);
              done();
            } else if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
              console.info(`${TagFrmwk}: Callback: audioVolumeGroupManager.getRingerMode RINGER_MODE_SILENT: PASS :${value}`);
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
          done();
        } else if (data == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerModeSync : PASS :${data}`);
          done();
        } else if (data == audio.AudioRingMode.RINGER_MODE_SILENT) {
          console.info(`${TagFrmwk}: Media audioVolumeGroupManager.getRingerModeSync : PASS :${data}`);
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
          console.info("AudioFrameworkTest: value is " + value);
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audioMedia)
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: FALSE: PASS:${data}`);
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
          console.info("AudioFrameworkTest: value is " + value);
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audioRingtone);
        console.info("AudioFrameworkTest: value is " + value);
        if (value == lowVol) {
          console.info("AudioFrameworkTest: value is " + value);
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
          console.info("AudioFrameworkTest: value is " + value);
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audio.AudioVolumeType.MEDIA);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: FALSE: PASS:${data}`);
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
          console.info("AudioFrameworkTest: value is " + value);
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audio.AudioVolumeType.RINGTONE)
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Ringtone: FALSE: PASS:${data}`);
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
          console.info("AudioFrameworkTest: value is " + value);
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_CALL);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_CALL: FALSE: PASS:${data}`);
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
          console.info("AudioFrameworkTest: value is " + value);
        } else {
          expect(false).assertTrue();
        }
        let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_ASSISTANT: FALSE: PASS:${data}`);
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
          console.info("AudioFrameworkTest: value is " + value);
        } else {
          expect(false).assertTrue();
        }
        await audioManager.setVolume(audioMedia, lowVol);
        let data = await audioManager.isMute(audioMedia);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Media: SetVolume: PASS:${data}`);
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
          console.info("AudioFrameworkTest: value is " + value);
        } else {
          expect(false).assertTrue();
        }
        await audioManager.setVolume(audioRingtone, highVol);
        let data = await audioManager.isMute(audioRingtone);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute Ringtone: SetVolume: PASS:${data}`);
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
          console.info("AudioFrameworkTest: value is " + value);
        } else {
          expect(false).assertTrue();
        }
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
        let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_CALL);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_CALL: SetVolume: PASS:${data}`);
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
          console.info("AudioFrameworkTest: value is " + value);
        } else {
          expect(false).assertTrue();
        }
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
        let data = await audioManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT);
        if (data == true) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_ASSISTANT: SetVolume: PASS:${data}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0005
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0005
     * @tc.desc   ismute - AudioVolumeType.VOICE_CALL - Promise - false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, lowVol);
        await audioManager.mute(audio.AudioVolumeType.VOICE_CALL,false);
        let data:boolean = await audioVolumeGroupManager.isMute(audio.AudioVolumeType.VOICE_CALL);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_CALL: false: PASS:${data}`);
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_CALL: false: FAILED:${data}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0006
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0006
     * @tc.desc   ismute - AudioVolumeType.ALARM - Promise - false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.ALARM, lowVol);
        await audioManager.mute(audio.AudioVolumeType.ALARM,false);
        let data:boolean = await audioVolumeGroupManager.isMute(audio.AudioVolumeType.ALARM);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: false: PASS:${data}`);
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ALARM: false: FAILED:${data}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0007
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0007
     * @tc.desc   ismute - AudioVolumeType.ACCESSIBILITY - Promise - false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, lowVol);
        await audioManager.mute(audio.AudioVolumeType.ACCESSIBILITY,false);
        let data:boolean = await audioVolumeGroupManager.isMute(audio.AudioVolumeType.ACCESSIBILITY);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: false: PASS:${data}`);
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute ACCESSIBILITY: false: FAILED:${data}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0008
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0008
     * @tc.desc   ismute - AudioVolumeType.VOICE_ASSISTANT - Promise - false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUMEGROUP_MANAGER_ISMUTE_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, lowVol);
        await audioManager.mute(audio.AudioVolumeType.VOICE_ASSISTANT,false);
        let data:boolean = await audioVolumeGroupManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT);
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_ASSISTANT: false: PASS:${data}`);
          done();
        } else {
          console.log(`${TagFrmwk}: Promise: Is Stream Mute VOICE_ASSISTANT: false: FAILED:${data}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_STATECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_STATECHANGE_0100
     * @tc.desc   on_off_stateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_STATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

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

      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
      let flag: boolean = false;

      try {
        audioCapturer.off('stateChange');

        let stateChangeCallback = (state: audio.AudioState) => {
          if (state == 1) {
            console.info('audio capturer state is: STATE_PREPARED');
          }
          if (state == 2) {
            console.info('audio capturer state is: STATE_RUNNING');
          }
        };

        audioCapturer.on('stateChange', stateChangeCallback);

        audioCapturer.off('stateChange', stateChangeCallback);
        await audioCapturer.release();
        flag = true;
      } catch(error){
        console.log(`SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_STATECHANGE_0100 error : ${error.message}, Code:${error.code}`);
        expect(false).assertTrue();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_STATECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_STATECHANGE_0200
     * @tc.desc   on_off_stateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_STATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

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

      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
      let flag: boolean = false;

      try {
        let stateChangeCallback = (state: audio.AudioState) => {
          if (state == 1) {
            console.info('audio capturer state is: STATE_PREPARED');
          }
          if (state == 2) {
            console.info('audio capturer state is: STATE_RUNNING');
          }
        };

        audioCapturer.on('stateChange', stateChangeCallback);

        audioCapturer.off('stateChange');
        await audioCapturer.release();
        flag = true;
      } catch(error){
        console.log(`SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_STATECHANGE_0200 error : ${error.message}, Code:${error.code}`);
        expect(false).assertTrue();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_INPUTDEVICECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_INPUTDEVICECHANGE_0100
     * @tc.desc   on_off_inputDeviceChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_INPUTDEVICECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

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

      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
      let flag: boolean = false;

      try {
        audioCapturer.off('inputDeviceChange');

        let inputDeviceChangeCallback = (deviceChangeInfo: audio.AudioDeviceDescriptors) => {
          console.info(`inputDevice id: ${deviceChangeInfo[0].id}`);
          console.info(`inputDevice deviceRole: ${deviceChangeInfo[0].deviceRole}`);
          console.info(`inputDevice deviceType: ${deviceChangeInfo[0].deviceType}`);
        };

        audioCapturer.on('inputDeviceChange', inputDeviceChangeCallback);

        audioCapturer.off('inputDeviceChange', inputDeviceChangeCallback);
        await audioCapturer.release();
        flag = true;
      } catch(error){
        console.log(`SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_INPUTDEVICECHANGE_0100 error : ${error.message}, Code:${error.code}`);
        expect(false).assertTrue();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_INPUTDEVICECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_INPUTDEVICECHANGE_0200
     * @tc.desc   on_off_inputDeviceChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_INPUTDEVICECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

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

      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
      let flag: boolean = false;

      try {
        let inputDeviceChangeCallback = (deviceChangeInfo: audio.AudioDeviceDescriptors) => {
          console.info(`inputDevice id: ${deviceChangeInfo[0].id}`);
          console.info(`inputDevice deviceRole: ${deviceChangeInfo[0].deviceRole}`);
          console.info(`inputDevice deviceType: ${deviceChangeInfo[0].deviceType}`);
        };

        audioCapturer.on('inputDeviceChange', inputDeviceChangeCallback);

        audioCapturer.off('inputDeviceChange');
        await audioCapturer.release();
        flag = true;
      } catch(error){
        console.log(`SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_INPUTDEVICECHANGE_0200 error : ${error.message}, Code:${error.code}`);
        expect(false).assertTrue();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_READDATA_0100
     * @tc.number SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_READDATA_0100
     * @tc.desc   on_off_readData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_READDATA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

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

      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
      let flag: boolean = false;

      try {
        audioCapturer.off('readData');

        let readDataCallback = (data: ArrayBuffer) => {
            console.info(`read data: ${data}`);
        };

        audioCapturer.on('readData', readDataCallback);

        audioCapturer.off('readData', readDataCallback);
        await audioCapturer.release();
        flag = true;
      } catch(error){
        console.log(`SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_READDATA_0100 error : ${error.message}, Code:${error.code}`);
        expect(false).assertTrue();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_READDATA_0200
     * @tc.number SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_READDATA_0200
     * @tc.desc   on_off_readData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_READDATA_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

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

      let audioCapturer: audio.AudioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
      let flag: boolean = false;

      try {
        let readDataCallback = (data: ArrayBuffer) => {
            console.info(`read data: ${data}`);
        };

        audioCapturer.on('readData', readDataCallback);

        audioCapturer.off('readData');
        await audioCapturer.release();
        flag = true;
      } catch(error){
        console.log(`SUB_MULTIMEDIA_AUDIOCAPTURER_ON_OFF_READDATA_0200 error : ${error.message}, Code:${error.code}`);
        expect(false).assertTrue();
      }
      expect(flag).assertTrue();
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
          done();
          return;
      }
      try {
        await audioManager.setMicrophoneMute(true);
        let data = await audioManager.isMicrophoneMute();
        if (data == true) {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: PASS:${data}`);
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
          done();
          return;
      }
      try {
        await audioManager.setMicrophoneMute(false);
        let data = await audioManager.isMicrophoneMute();
        if (data == false) {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: FALSE: PASS:${data}`);
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
          } else if (flag == false && value == true) {
            console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_SETDEVICEACTIVE_0100 isDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
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
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      try {
        await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true);
        let value = await audioManager.isDeviceActive(2);
        if (value == true) {
          console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : PASS :${value}`);
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
            } else if (value == true && flag == false) {
              console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS :${value} flag is ${flag}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_0300
     * @tc.desc   DeviceRole - ALL Device Role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      expect(audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_MUTE).assertEqual(8);
      console.info("audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_MUTE :" + audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_MUTE);
      expect(audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_UNMUTE).assertEqual(9);
      console.info("audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_UNMUTE :" + audio.AudioSessionStateChangeHint.AUDIO_SESSION_STATE_CHANGE_HINT_UNMUTE);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0200
     * @tc.desc   on_off_DeviceChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let flag: boolean = false;
      try {
        // 取消该事件的所有监听。
        audioManager.off('deviceChange');

        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let deviceChangeCallback = (deviceChanged: audio.DeviceChangeAction) => {
          console.info(`device change type : ${deviceChanged.type} `);
          console.info(`device descriptor size : ${deviceChanged.deviceDescriptors.length} `);
          console.info(`device change descriptor : ${deviceChanged.deviceDescriptors[0].deviceRole} `);
          console.info(`device change descriptor : ${deviceChanged.deviceDescriptors[0].deviceType} `);
        };

        audioManager.on('deviceChange', deviceChangeCallback);

        audioManager.off('deviceChange', deviceChangeCallback);
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0200 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0300
     * @tc.desc   on_off_DeviceChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let audioManager = audio.getAudioManager();
      let flag: boolean = false;
      try {
        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let deviceChangeCallback = (deviceChanged: audio.DeviceChangeAction) => {
          console.info(`device change type : ${deviceChanged.type} `);
          console.info(`device descriptor size : ${deviceChanged.deviceDescriptors.length} `);
          console.info(`device change descriptor : ${deviceChanged.deviceDescriptors[0].deviceRole} `);
          console.info(`device change descriptor : ${deviceChanged.deviceDescriptors[0].deviceType} `);
        };

        audioManager.on('deviceChange', deviceChangeCallback);

        audioManager.off('deviceChange');
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_MANAGER_ON_DEVICECHANGE_0300 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
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
        done();
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0600
     * @tc.desc   on/off AudioRoutingManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let audioRoutingManager = audioManager.getRoutingManager();
      let flag: boolean = false;
      try {
        // 取消该事件的所有监听。
        audioRoutingManager.off('deviceChange');

        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let deviceChangeCallback = (deviceChanged: audio.DeviceChangeAction) => {
          console.info('device change type : ' + deviceChanged.type);
          console.info('device descriptor size : ' + deviceChanged.deviceDescriptors.length);
          console.info('device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
          console.info('device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
        };

        audioRoutingManager.on('deviceChange', audio.DeviceFlag.OUTPUT_DEVICES_FLAG, deviceChangeCallback);

        audioRoutingManager.off('deviceChange', deviceChangeCallback);
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0600 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0700
     * @tc.desc   on/off AudioRoutingManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async (done: Function) => {
      let audioRoutingManager = audioManager.getRoutingManager();
      let flag: boolean = false;
      try {
        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let deviceChangeCallback = (deviceChanged: audio.DeviceChangeAction) => {
          console.info('device change type : ' + deviceChanged.type);
          console.info('device descriptor size : ' + deviceChanged.deviceDescriptors.length);
          console.info('device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceRole);
          console.info('device change descriptor : ' + deviceChanged.deviceDescriptors[0].deviceType);
        };

        audioRoutingManager.on('deviceChange', audio.DeviceFlag.OUTPUT_DEVICES_FLAG, deviceChangeCallback);

        audioRoutingManager.off('deviceChange');
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_ON_DEVICECHANGE_0700 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_OFF_VOLUMECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_OFF_VOLUMECHANGE_0100
     * @tc.desc   ON_OFF_VOLUMECHANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_OFF_VOLUMECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      let flag: boolean = false;
      try {
        // 取消该事件的所有监听。
        audioVolumeManager.off('volumeChange');

        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let volumeChangeCallback = (volumeEvent: audio.VolumeEvent) => {
          console.info(`VolumeType of stream: ${volumeEvent.volumeType} `);
          console.info(`Volume level: ${volumeEvent.volume} `);
          console.info(`Whether to updateUI: ${volumeEvent.updateUi} `);
        };

        audioVolumeManager.on('volumeChange', volumeChangeCallback);

        audioVolumeManager.off('volumeChange', volumeChangeCallback);
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_ON_OFF_VOLUMECHANGE_0100 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_OFF_VOLUMECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_OFF_VOLUMECHANGE_0200
     * @tc.desc   ON_OFF_VOLUMECHANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_OFF_VOLUMECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      let flag: boolean = false;
      try {
        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let volumeChangeCallback = (volumeEvent: audio.VolumeEvent) => {
          console.info(`VolumeType of stream: ${volumeEvent.volumeType} `);
          console.info(`Volume level: ${volumeEvent.volume} `);
          console.info(`Whether to updateUI: ${volumeEvent.updateUi} `);
        };

        audioVolumeManager.on('volumeChange', volumeChangeCallback);

        audioVolumeManager.off('volumeChange');
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_ON_OFF_VOLUMECHANGE_0200 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_OFF_STREAMVOLUMECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_OFF_STREAMVOLUMECHANGE_0100
     * @tc.desc   ON_OFF_STREAMVOLUMECHANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_OFF_STREAMVOLUMECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      let flag: boolean = false;
      try {
        // 取消该事件的所有监听。
        audioVolumeManager.off('streamVolumeChange');

        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let streamVolumeChangeCallback = (streamVolumeEvent: audio.StreamVolumeEvent) => {
          console.info(`StreamUsage of stream: ${streamVolumeEvent.streamUsage} `);
          console.info(`Volume level: ${streamVolumeEvent.volume} `);
          console.info(`Whether to updateUI: ${streamVolumeEvent.updateUi} `);
        };

        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_MUSIC, streamVolumeChangeCallback);

        audioVolumeManager.off('streamVolumeChange', streamVolumeChangeCallback);
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_ON_OFF_STREAMVOLUMECHANGE_0100 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_OFF_STREAMVOLUMECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_OFF_STREAMVOLUMECHANGE_0200
     * @tc.desc   ON_OFF_STREAMVOLUMECHANGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_OFF_STREAMVOLUMECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      let flag: boolean = false;
      try {
        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let streamVolumeChangeCallback = (streamVolumeEvent: audio.StreamVolumeEvent) => {
          console.info(`StreamUsage of stream: ${streamVolumeEvent.streamUsage} `);
          console.info(`Volume level: ${streamVolumeEvent.volume} `);
          console.info(`Whether to updateUI: ${streamVolumeEvent.updateUi} `);
        };

        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_MUSIC, streamVolumeChangeCallback);

        audioVolumeManager.off('streamVolumeChange');
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_ON_OFF_STREAMVOLUMECHANGE_0200 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0300
     * @tc.desc   on_off_spatializationEnabledChangeForCurrentDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let audioSpatializationManager: audio.AudioSpatializationManager = audio.getAudioManager().getSpatializationManager();
      let flag: boolean = false;
      try {
        // 取消该事件的所有监听。
        audioSpatializationManager.off('spatializationEnabledChangeForCurrentDevice');

        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let spatializationEnabledChangeForCurrentDeviceCallback = (isSpatializationEnabledForCurrentDevice: boolean) => {
          console.info(`isSpatializationEnabledForCurrentDevice: ${isSpatializationEnabledForCurrentDevice}`);
        };

        audioSpatializationManager.on('spatializationEnabledChangeForCurrentDevice', spatializationEnabledChangeForCurrentDeviceCallback);

        audioSpatializationManager.off('spatializationEnabledChangeForCurrentDevice', spatializationEnabledChangeForCurrentDeviceCallback);
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0300 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      expect(flag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0400
     * @tc.desc   on_off_spatializationEnabledChangeForCurrentDevice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (done: Function) => {
      let audioSpatializationManager: audio.AudioSpatializationManager = audio.getAudioManager().getSpatializationManager();
      let flag: boolean = false;
      try {
        // 同一监听事件中，on方法和off方法传入callback参数一致，off方法取消对应on方法订阅的监听。
        let spatializationEnabledChangeForCurrentDeviceCallback = (isSpatializationEnabledForCurrentDevice: boolean) => {
          console.info(`isSpatializationEnabledForCurrentDevice: ${isSpatializationEnabledForCurrentDevice}`);
        };

        audioSpatializationManager.on('spatializationEnabledChangeForCurrentDevice', spatializationEnabledChangeForCurrentDeviceCallback);

        audioSpatializationManager.off('spatializationEnabledChangeForCurrentDevice');
        flag = true;
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AUDIO_SPATIALIZATION_MANAGER_0400 Fail, error: ${error}, ErrorCode: ${error.code}`);
        expect(false).assertTrue();
        done();
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0500
     * @tc.desc   isAcousticEchoCancelerSupported -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_INVALID);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_INVALID}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
          expect(Number(err.code)).assertEqual(6800101);
          done;
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0600
     * @tc.desc   isAcousticEchoCancelerSupported -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_MIC);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_MIC}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0700
     * @tc.desc   isAcousticEchoCancelerSupported -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0800
     * @tc.desc   isAcousticEchoCancelerSupported -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0900
     * @tc.desc   isAcousticEchoCancelerSupported -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_1000
     * @tc.desc   isAcousticEchoCancelerSupported -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_1100
     * @tc.desc   isAcousticEchoCancelerSupported -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isAcousticEchoCancelerSupported(audio.SourceType.SOURCE_TYPE_CAMCORDER);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_CAMCORDER}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0002
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0002
     * @tc.desc   isStreamActive STREAM_USAGE_UNKNOWN test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_UNKNOWN);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0002 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0300
     * @tc.desc   isStreamActive STREAM_USAGE_MUSIC test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0300 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0400
     * @tc.desc   isStreamActive STREAM_USAGE_VOICE_COMMUNICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0400 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0500
     * @tc.desc   isStreamActive STREAM_USAGE_NOTIFICATION_RINGTONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0500 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0600
     * @tc.desc   isStreamActive STREAM_USAGE_RINGTONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_RINGTONE);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0600 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0700
     * @tc.desc   isStreamActive STREAM_USAGE_ALARM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_ALARM);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0700 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0800
     * @tc.desc   isStreamActive STREAM_USAGE_NOTIFICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0800 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0900
     * @tc.desc   isStreamActive STREAM_USAGE_VOICE_ASSISTANT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_0900 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1000
     * @tc.desc   isStreamActive STREAM_USAGE_ACCESSIBILITY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1000 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1100
     * @tc.desc   isStreamActive STREAM_USAGE_GAME test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_GAME);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1100 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1200
     * @tc.desc   isStreamActive STREAM_USAGE_VIDEO_COMMUNICATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1200 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1300
     * @tc.desc   isStreamActive STREAM_USAGE_VOICE_MESSAGE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1300 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1400
     * @tc.desc   isStreamActive STREAM_USAGE_NAVIGATION test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_NAVIGATION);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1400 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1500
     * @tc.desc   isStreamActive STREAM_USAGE_MOVIE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_MOVIE);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1500 Status: ${ret}`);
        expect(ret).assertEqual(false);
      } catch (err) {
        let error = err as BusinessError;
        console.error(`isStreamActive ERROR: ${error}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1600
     * @tc.desc   isStreamActive STREAM_USAGE_AUDIOBOOK test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK);
        console.info(`SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_1600 Status: ${ret}`);
        expect(ret).assertEqual(false);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0300
     * @tc.desc   isAcousticEchoCancelerSupported - SOURCE_TYPE_INVALID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        try {
          let isSupportAEC: boolean = audioStreamManager.isIntelligentNoiseReductionEnabledForCurrentDevice(audio.SourceType.SOURCE_TYPE_INVALID);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_INVALID}, Status: ${isSupportAEC}`);
          expect(false).assertTrue();
        } catch (err) {
          let error = err as BusinessError;
          expect(Number(err.code)).assertEqual(6800101);
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0400
     * @tc.desc   isAcousticEchoCancelerSupported - SOURCE_TYPE_MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isIntelligentNoiseReductionEnabledForCurrentDevice(audio.SourceType.SOURCE_TYPE_MIC);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_MIC}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0500
     * @tc.desc   isAcousticEchoCancelerSupported - SOURCE_TYPE_VOICE_RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isIntelligentNoiseReductionEnabledForCurrentDevice(audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0600
     * @tc.desc   isAcousticEchoCancelerSupported - SOURCE_TYPE_PLAYBACK_CAPTURE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isIntelligentNoiseReductionEnabledForCurrentDevice(audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0700
     * @tc.desc   isAcousticEchoCancelerSupported - SOURCE_TYPE_VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isIntelligentNoiseReductionEnabledForCurrentDevice(audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })



    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0800
     * @tc.desc   isAcousticEchoCancelerSupported - SOURCE_TYPE_VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isIntelligentNoiseReductionEnabledForCurrentDevice(audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0900
     * @tc.desc   isAcousticEchoCancelerSupported -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isIntelligentNoiseReductionEnabledForCurrentDevice(audio.SourceType.SOURCE_TYPE_CAMCORDER);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_CAMCORDER}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_1000
     * @tc.desc   isAcousticEchoCancelerSupported - SOURCE_TYPE_UNPROCESSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISINTELLIGENTNOISEREDUCTIONENABLEDFORCURRENTDEVICE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (done: Function) => {
        let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
        let flag: boolean = false;
        try {
          let isSupportAEC: boolean = audioStreamManager.isIntelligentNoiseReductionEnabledForCurrentDevice(audio.SourceType.SOURCE_TYPE_UNPROCESSED);
          console.info(`[AEC Support] SourceType: ${audio.SourceType.SOURCE_TYPE_UNPROCESSED}, Status: ${isSupportAEC}`);
          flag = true;
        } catch (err) {
          let error = err as BusinessError;
          console.error(`isAcousticEchoCancelerSupported ERROR: ${error}`);
        }
        expect(flag).assertTrue();
        done();
      })


    /**
     * @tc.name   AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1339
     * @tc.number AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1339
     * @tc.desc   isRecordingAvailable with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      try {
        audioStreamManager.isRecordingAvailable(null);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1340
     * @tc.number AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1340
     * @tc.desc   isRecordingAvailable with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      try {
        audioStreamManager.isRecordingAvailable(undefined);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

        /**
     * @tc.name   AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1341
     * @tc.number AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1341
     * @tc.desc   isRecordingAvailable with SOURCE_TYPE_VOICE_RECOGNITION parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      };
      try {
        audioStreamManager.isRecordingAvailable(capturerInfo);
        console.info(`${TagFrmwk}: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1342
     * @tc.number AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1342
     * @tc.desc   isRecordingAvailable with SOURCE_TYPE_PLAYBACK_CAPTURE parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_PLAYBACK_CAPTURE,
        capturerFlags: 0
      };
      try {
        audioStreamManager.isRecordingAvailable(capturerInfo);
        console.info(`${TagFrmwk}: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1343
     * @tc.number AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1343
     * @tc.desc   isRecordingAvailable with SOURCE_TYPE_VOICE_COMMUNICATION parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      };
      try {
        audioStreamManager.isRecordingAvailable(capturerInfo);
        console.info(`${TagFrmwk}: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    });


    /**
     * @tc.name   AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1344
     * @tc.number AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1344
     * @tc.desc   isRecordingAvailable with SOURCE_TYPE_VOICE_MESSAGE parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      };
      try {
        audioStreamManager.isRecordingAvailable(capturerInfo);
        console.info(`${TagFrmwk}: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1345
     * @tc.number AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1345
     * @tc.desc   isRecordingAvailable with SOURCE_TYPE_CAMCORDER parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      };
      try {
        audioStreamManager.isRecordingAvailable(capturerInfo);
        console.info(`${TagFrmwk}: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    });


    /**
     * @tc.name   AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1346
     * @tc.number AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1346
     * @tc.desc   isRecordingAvailable with SOURCE_TYPE_UNPROCESSED parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      };
      try {
        audioStreamManager.isRecordingAvailable(capturerInfo);
        console.info(`${TagFrmwk}: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    });


    /**
     * @tc.name   AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1347
     * @tc.number AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1347
     * @tc.desc   isRecordingAvailable with SOURCE_TYPE_LIVE parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOSTREAMMANAGER_ISRECORDINGAVAILABLE_1347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let capturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_LIVE,
        capturerFlags: 0
      };
      try {
        audioStreamManager.isRecordingAvailable(capturerInfo);
        console.info(`${TagFrmwk}: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    });


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
            } else if (value == false) {
              console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: PASS: ${value}`);
            }else{
              console.log(`${TagFrmwk}: Callback : Is Stream Mute Media: FALSE: FAIL: ${value}`);
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
        await audioManager.mute(audio.AudioVolumeType.MEDIA, true);
        console.log(`${TagFrmwk}: Promise returned to indicate that the stream is  muted`);
        await audioManager.isMute(audio.AudioVolumeType.MEDIA).then((data: boolean) => {
            console.log(`${TagFrmwk}: Promise: Is Stream Mute Ringtone: FALSE: PASS:${data}`);
            expect(data).assertEqual(true);
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
        } else if (data == true){
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: PASS: ${data}`);
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
        } else if (data == true){
          console.log(`${TagFrmwk}: Callback: isActive: Ringtone: ENAME: TRUE: PASS: ${data}`);
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
          done();
          return;
      }
      try {
        await audioManager.setMicrophoneMute(true);
        let data = await audioManager.isMicrophoneMute();
        if (data == true) {
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: PASS:${data}`);
        } else if (data == false){
          console.log(`${TagFrmwk}: Promise: isMicrophoneMute: TRUE: PASS: ${data}`);
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
        } else if (value == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_VIBRATE: PASS :${value}`);
        } else if (value == audio.AudioRingMode.RINGER_MODE_SILENT) {
          console.info(`${TagFrmwk}: Promise: getRingerMode RINGER_MODE_SILENT: PASS :${value}`);
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
         } else if (value == false) {
           console.info(`${TagFrmwk}: Device Test: Callback : isDeviceActive : SPEAKER: Deactivate : PASS :${value}`);
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
          done();
          return;
      }
      console.info(`${TagFrmwk}: this is a default device`)
      try {
        await audioManager.setDeviceActive(audio.ActiveDeviceType.SPEAKER, true);
        let value = await audioManager.isDeviceActive(2);
        if (value == true) {
          console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : PASS :${value}`);
        } else if (value == false) {
          console.info(`${TagFrmwk}: Device Test: Promise : isDeviceActive : SPEAKER: Activate : PASS :${value}`);
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

    /**
     * @tc.name   AUDIO_MANAGER_SETVOLUME_2900
     * @tc.number AUDIO_MANAGER_SETVOLUME_2900
     * @tc.desc   setVolume with null volume parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETVOLUME_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, null);
        console.info(`${TagFrmwk}: setVolume with null volume: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setVolume with null volume: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETVOLUME_3000
     * @tc.number AUDIO_MANAGER_SETVOLUME_3000
     * @tc.desc   setVolume with undefined volume parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETVOLUME_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setVolume(audio.AudioVolumeType.MEDIA, undefined);
        console.info(`${TagFrmwk}: setVolume with undefined volume: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setVolume with undefined volume: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETVOLUME_3100
     * @tc.number AUDIO_MANAGER_SETVOLUME_3100
     * @tc.desc   setVolume callback with null volume parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETVOLUME_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setVolume(audio.AudioVolumeType.MEDIA, null, (err) => {
        if (err) {
          console.info(`${TagFrmwk}: setVolume callback with null volume: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: setVolume callback with null volume: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETVOLUME_3200
     * @tc.number AUDIO_MANAGER_SETVOLUME_3200
     * @tc.desc   setVolume callback with undefined volume parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETVOLUME_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setVolume(audio.AudioVolumeType.MEDIA, undefined, (err) => {
        if (err) {
          console.info(`${TagFrmwk}: setVolume callback with undefined volume: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: setVolume callback with undefined volume: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_0100
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_0100
     * @tc.desc   setAudioParameter with empty key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('', 'testValue');
        console.info(`${TagFrmwk}: setAudioParameter with empty key: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setAudioParameter with empty key: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_0200
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_0200
     * @tc.desc   setAudioParameter with null key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter(null, 'testValue');
        console.info(`${TagFrmwk}: setAudioParameter with null key: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setAudioParameter with null key: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_0300
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_0300
     * @tc.desc   setAudioParameter with undefined key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter(undefined, 'testValue');
        console.info(`${TagFrmwk}: setAudioParameter with undefined key: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setAudioParameter with undefined key: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_0400
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_0400
     * @tc.desc   setAudioParameter with empty value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('testKey', '');
        console.info(`${TagFrmwk}: setAudioParameter with empty value: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setAudioParameter with empty value: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_0500
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_0500
     * @tc.desc   setAudioParameter with null value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('testKey', null);
        console.info(`${TagFrmwk}: setAudioParameter with null value: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setAudioParameter with null value: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_0600
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_0600
     * @tc.desc   setAudioParameter with undefined value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.setAudioParameter('testKey', undefined);
        console.info(`${TagFrmwk}: setAudioParameter with undefined value: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: setAudioParameter with undefined value: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_0700
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_0700
     * @tc.desc   setAudioParameter callback with empty key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setAudioParameter('', 'testValue', (err) => {
        if (err) {
          console.info(`${TagFrmwk}: setAudioParameter callback with empty key: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: setAudioParameter callback with empty key: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_0800
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_0800
     * @tc.desc   setAudioParameter callback with null key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setAudioParameter(null, 'testValue', (err) => {
        if (err) {
          console.info(`${TagFrmwk}: setAudioParameter callback with null key: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: setAudioParameter callback with null key: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_0900
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_0900
     * @tc.desc   setAudioParameter callback with undefined key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setAudioParameter(undefined, 'testValue', (err) => {
        if (err) {
          console.info(`${TagFrmwk}: setAudioParameter callback with undefined key: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: setAudioParameter callback with undefined key: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_1000
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_1000
     * @tc.desc   setAudioParameter callback with empty value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setAudioParameter('testKey', '', (err) => {
        if (err) {
          console.info(`${TagFrmwk}: setAudioParameter callback with empty value: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: setAudioParameter callback with empty value: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_1100
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_1100
     * @tc.desc   setAudioParameter callback with null value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setAudioParameter('testKey', null, (err) => {
        if (err) {
          console.info(`${TagFrmwk}: setAudioParameter callback with null value: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: setAudioParameter callback with null value: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_SETAUDIOPARAMETER_1200
     * @tc.number AUDIO_MANAGER_SETAUDIOPARAMETER_1200
     * @tc.desc   setAudioParameter callback with undefined value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_SETAUDIOPARAMETER_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.setAudioParameter('testKey', undefined, (err) => {
        if (err) {
          console.info(`${TagFrmwk}: setAudioParameter callback with undefined value: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: setAudioParameter callback with undefined value: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_GETAUDIOPARAMETER_0100
     * @tc.number AUDIO_MANAGER_GETAUDIOPARAMETER_0100
     * @tc.desc   getAudioParameter with empty key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_GETAUDIOPARAMETER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.getAudioParameter('');
        console.info(`${TagFrmwk}: getAudioParameter with empty key: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: getAudioParameter with empty key: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_GETAUDIOPARAMETER_0200
     * @tc.number AUDIO_MANAGER_GETAUDIOPARAMETER_0200
     * @tc.desc   getAudioParameter with null key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_GETAUDIOPARAMETER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.getAudioParameter(null);
        console.info(`${TagFrmwk}: getAudioParameter with null key: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: getAudioParameter with null key: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_GETAUDIOPARAMETER_0300
     * @tc.number AUDIO_MANAGER_GETAUDIOPARAMETER_0300
     * @tc.desc   getAudioParameter with undefined key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_GETAUDIOPARAMETER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioManager.getAudioParameter('');
        console.info(`${TagFrmwk}: getAudioParameter with undefined key: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: getAudioParameter with undefined key: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_GETAUDIOPARAMETER_0400
     * @tc.number AUDIO_MANAGER_GETAUDIOPARAMETER_0400
     * @tc.desc   getAudioParameter callback with empty key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_GETAUDIOPARAMETER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.getAudioParameter('', (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getAudioParameter callback with empty key: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: getAudioParameter callback with empty key: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_GETAUDIOPARAMETER_0500
     * @tc.number AUDIO_MANAGER_GETAUDIOPARAMETER_0500
     * @tc.desc   getAudioParameter callback with null key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_GETAUDIOPARAMETER_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.getAudioParameter(null, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getAudioParameter callback with null key: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: getAudioParameter callback with null key: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_GETAUDIOPARAMETER_0600
     * @tc.number AUDIO_MANAGER_GETAUDIOPARAMETER_0600
     * @tc.desc   getAudioParameter callback with undefined key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_GETAUDIOPARAMETER_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.getAudioParameter('', (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getAudioParameter callback with undefined key: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: getAudioParameter callback with undefined key: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_0100
     * @tc.number AUDIO_MANAGER_ON_INTERRUPT_0100
     * @tc.desc   on interrupt with null interrupt parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_ON_INTERRUPT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioInterrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: true
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', null, callback);
        console.info(`${TagFrmwk}: on interrupt with null interrupt: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with null interrupt: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_0200
     * @tc.number AUDIO_MANAGER_ON_INTERRUPT_0200
     * @tc.desc   on interrupt with undefined interrupt parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_ON_INTERRUPT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', undefined, callback);
        console.info(`${TagFrmwk}: on interrupt with undefined interrupt: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with undefined interrupt: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_0100
     * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_0100
     * @tc.desc   off interrupt with null interrupt parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_OFF_INTERRUPT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioInterrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: true
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', null, callback);
        console.info(`${TagFrmwk}: off interrupt with null interrupt: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with null interrupt: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_0200
     * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_0200
     * @tc.desc   off interrupt with undefined interrupt parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_MANAGER_OFF_INTERRUPT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', undefined, callback);
        console.info(`${TagFrmwk}: off interrupt with undefined interrupt: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with undefined interrupt: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });
    /**
     * @tc.name   AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGER_1345
     * @tc.number AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGER_1345
     * @tc.desc   getVolumeGroupManager with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGER_1345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      try {
        audioVolumeManager.getVolumeGroupManager(null, (err, manager) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message},${err.code}`);
            expect(Number((err as BusinessError).code)).assertEqual(6800101);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGER_1346
     * @tc.number AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGER_1346
     * @tc.desc   getVolumeGroupManager with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGER_1346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      audioVolumeManager.getVolumeGroupManager(undefined, (err, manager) => {
        if (err) {
          console.info(`${TagFrmwk}: PASS :${err.message}`);
          expect(Number((err as BusinessError).code)).assertEqual(6800101);
        } else {
          console.info(`${TagFrmwk}: FAIL`);
          expect(false).assertTrue();
        }
        done();
      });
    });

    /**
     * @tc.name   AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGERSYNC_1347
     * @tc.number AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGERSYNC_1347
     * @tc.desc   getVolumeGroupManagerSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGERSYNC_1347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      try {
        audioVolumeManager.getVolumeGroupManagerSync(null);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGERSYNC_1348
     * @tc.number AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGERSYNC_1348
     * @tc.desc   getVolumeGroupManagerSync with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEMANAGER_GETVOLUMEGROUPMANAGERSYNC_1348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      try {
        audioVolumeManager.getVolumeGroupManagerSync(undefined);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEMANAGER_SETAPPVOLUMEPERCENTAGE_1349
     * @tc.number AUDIOVOLUMEMANAGER_SETAPPVOLUMEPERCENTAGE_1349
     * @tc.desc   setAppVolumePercentage with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEMANAGER_SETAPPVOLUMEPERCENTAGE_1349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      try {
        await audioVolumeManager.setAppVolumePercentage(null);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEMANAGER_SETAPPVOLUMEPERCENTAGE_1350
     * @tc.number AUDIOVOLUMEMANAGER_SETAPPVOLUMEPERCENTAGE_1350
     * @tc.desc   setAppVolumePercentage with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEMANAGER_SETAPPVOLUMEPERCENTAGE_1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      try {
        await audioVolumeManager.setAppVolumePercentage(undefined);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEMANAGER_GETVOLUMEINUNITOFDBBYSTREAM_1351
     * @tc.number AUDIOVOLUMEMANAGER_GETVOLUMEINUNITOFDBBYSTREAM_1351
     * @tc.desc   getVolumeInUnitOfDbByStream with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEMANAGER_GETVOLUMEINUNITOFDBBYSTREAM_1351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      try {
        audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_MEDIA, null, audio.DeviceType.SPEAKER);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEMANAGER_GETVOLUMEINUNITOFDBBYSTREAM_1352
     * @tc.number AUDIOVOLUMEMANAGER_GETVOLUMEINUNITOFDBBYSTREAM_1352
     * @tc.desc   getVolumeInUnitOfDbByStream with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEMANAGER_GETVOLUMEINUNITOFDBBYSTREAM_1352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioVolumeManager = audio.getAudioManager().getVolumeManager();
      try {
        audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_MEDIA, undefined, audio.DeviceType.SPEAKER);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(6800101);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0001
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0001
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.BLUETOOTH_A2DP, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0002
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0002
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.MIC, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0003
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0003
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.USB_HEADSET, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });


        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0004
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0004
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.DISPLAY_PORT, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });


        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0005
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0005
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.REMOTE_CAST, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });


        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0006
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0006
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.USB_DEVICE, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0007
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0007
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.HDMI, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0008
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0008
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.LINE_DIGITAL, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0009
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0009
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.REMOTE_DAUDIO, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0010
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0010
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.HEARING_AID, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0011
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0011
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.NEARLINK, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0012
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0012
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.SYSTEM_PRIVATE, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0013
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0013
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.DEFAULT, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0014
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0014
     * @tc.desc   getSystemVolumeInDb with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.INVALID);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0015
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0015
     * @tc.desc   getSystemVolumeInDb with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.EARPIECE);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0016
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0016
     * @tc.desc   getSystemVolumeInDb with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.WIRED_HEADSET);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0017
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0017
     * @tc.desc   getSystemVolumeInDb with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.WIRED_HEADPHONES);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0018
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0018
     * @tc.desc   getSystemVolumeInDb with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.BLUETOOTH_SCO);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1355
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1355
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.SPEAKER, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1356
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1356
     * @tc.desc   getSystemVolumeInDb with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.SPEAKER, (err, db) => {
          if (err) {
            console.info(`${TagFrmwk}: PASS :${err.message}`);
            expect(Number((err as BusinessError).code)).assertEqual(401);
          } else {
            console.info(`${TagFrmwk}: FAIL`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1357
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1357
     * @tc.desc   getSystemVolumeInDb with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.SPEAKER);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1358
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1358
     * @tc.desc   getSystemVolumeInDb with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.SPEAKER);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

        /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1400
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1400
     * @tc.desc   getSystemVolumeInDb with BLUETOOTH_A2DP.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.BLUETOOTH_A2DP);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1401
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1401
     * @tc.desc   getSystemVolumeInDb with MIC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.MIC);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1402
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1402
     * @tc.desc   getSystemVolumeInDb with USB_HEADSET.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.USB_HEADSET);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1403
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1403
     * @tc.desc   getSystemVolumeInDb with DISPLAY_PORT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.DISPLAY_PORT);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1404
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1404
     * @tc.desc   getSystemVolumeInDb with REMOTE_CAST.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.REMOTE_CAST);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1405
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1405
     * @tc.desc   getSystemVolumeInDb with USB_DEVICE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.USB_DEVICE);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1406
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1406
     * @tc.desc   getSystemVolumeInDb with HDMI.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.HDMI);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1407
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1407
     * @tc.desc   getSystemVolumeInDb with LINE_DIGITAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.LINE_DIGITAL);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1408
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1408
     * @tc.desc   getSystemVolumeInDb with REMOTE_DAUDIO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.REMOTE_DAUDIO);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1409
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1409
     * @tc.desc   getSystemVolumeInDb with HEARING_AID.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.HEARING_AID);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1410
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1410
     * @tc.desc   getSystemVolumeInDb with NEARLINK.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.NEARLINK);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1411
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1411
     * @tc.desc   getSystemVolumeInDb with SYSTEM_PRIVATE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.SYSTEM_PRIVATE);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1412
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1412
     * @tc.desc   getSystemVolumeInDb with DEFAULT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.DEFAULT);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });


    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1413
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1413
     * @tc.desc   getSystemVolumeInDb with VOICE_CALL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.VOICE_CALL, undefined, audio.DeviceType.DEFAULT);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1414
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1414
     * @tc.desc   getSystemVolumeInDb with RINGTONE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.RINGTONE, undefined, audio.DeviceType.DEFAULT);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1415
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1415
     * @tc.desc   getSystemVolumeInDb with ALARM.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.ALARM, undefined, audio.DeviceType.DEFAULT);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1416
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1416
     * @tc.desc   getSystemVolumeInDb with ACCESSIBILITY.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.ACCESSIBILITY, undefined, audio.DeviceType.DEFAULT);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1417
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1417
     * @tc.desc   getSystemVolumeInDb with VOICE_ASSISTANT.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDB_1417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.VOICE_ASSISTANT, undefined, audio.DeviceType.DEFAULT);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1418
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1418
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.REMOTE_CAST);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1419
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1419
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.BLUETOOTH_A2DP);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1361
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1361
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.USB_HEADSET);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1362
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1362
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.MIC);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1363
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1363
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.DISPLAY_PORT);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1364
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1364
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.USB_DEVICE);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1365
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1365
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.HDMI);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1366
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1366
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.LINE_DIGITAL);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1367
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1367
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.REMOTE_DAUDIO);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1368
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1368
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.HEARING_AID);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1369
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1369
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.NEARLINK);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1370
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1370
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.SYSTEM_PRIVATE);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1371
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1371
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.DEFAULT);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1359
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1359
     * @tc.desc   getSystemVolumeInDbSync with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, null, audio.DeviceType.SPEAKER);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1360
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1360
     * @tc.desc   getSystemVolumeInDbSync with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETSYSTEMVOLUMEINDBSYNC_1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.MEDIA, undefined, audio.DeviceType.SPEAKER);
        console.info(`${TagFrmwk}: FAIL`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFORINPUTDEVICE_1361
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFORINPUTDEVICE_1361
     * @tc.desc   getMaxAmplitudeForInputDevice with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFORINPUTDEVICE_1361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioVolumeGroupManager.getMaxAmplitudeForInputDevice(null);
      } catch (err) {
        console.info(`${TagFrmwk}: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFORINPUTDEVICE_1362
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFORINPUTDEVICE_1362
     * @tc.desc   getMaxAmplitudeForInputDevice with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFORINPUTDEVICE_1362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioVolumeGroupManager.getMaxAmplitudeForInputDevice(undefined);
        console.info(`${TagFrmwk}: PASS`);
      } catch (err) {
        console.info(`${TagFrmwk}: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFOROUTPUTDEVICE_1363
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFOROUTPUTDEVICE_1363
     * @tc.desc   getMaxAmplitudeForOutputDevice with null parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFOROUTPUTDEVICE_1363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioVolumeGroupManager.getMaxAmplitudeForOutputDevice(null);
        console.info(`${TagFrmwk}: FAIL`);
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
     * @tc.name   AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFOROUTPUTDEVICE_1364
     * @tc.number AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFOROUTPUTDEVICE_1364
     * @tc.desc   getMaxAmplitudeForOutputDevice with undefined parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIOVOLUMEGROUPMANAGER_GETMAXAMPLITUDEFOROUTPUTDEVICE_1364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        await audioVolumeGroupManager.getMaxAmplitudeForOutputDevice(undefined);
        console.info(`${TagFrmwk}: FAIL`);
      } catch (err) {
        console.info(`${TagFrmwk}: PASS :${(err as BusinessError).message}`);
        expect(Number((err as BusinessError).code)).assertEqual(401);
      }
      done();
    });

    /**
    * @tc.name   AUDIO_MANAGER_SETVOLUME_VOICECALL_0100
    * @tc.number AUDIO_MANAGER_SETVOLUME_VOICECALL_0100
    * @tc.desc   setVolume with VOICE_CALL volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_SETVOLUME_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          await audioManager.setVolume(audio.AudioVolumeType.VOICE_CALL, 10);
          console.info(`${TagFrmwk}: setVolume with VOICE_CALL: PASS`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: setVolume with VOICE_CALL: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
    * @tc.name   AUDIO_MANAGER_SETVOLUME_ALARM_0100
    * @tc.number AUDIO_MANAGER_SETVOLUME_ALARM_0100
    * @tc.desc   setVolume with ALARM volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_SETVOLUME_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          await audioManager.setVolume(audio.AudioVolumeType.ALARM, 10);
          console.info(`${TagFrmwk}: setVolume with ALARM: PASS`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: setVolume with ALARM: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
    * @tc.name   AUDIO_MANAGER_SETVOLUME_ACCESSIBILITY_0100
    * @tc.number AUDIO_MANAGER_SETVOLUME_ACCESSIBILITY_0100
    * @tc.desc   setVolume with ACCESSIBILITY volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_SETVOLUME_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          await audioManager.setVolume(audio.AudioVolumeType.ACCESSIBILITY, 10);
          console.info(`${TagFrmwk}: setVolume with ACCESSIBILITY: PASS`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: setVolume with ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
    * @tc.name   AUDIO_MANAGER_SETVOLUME_VOICEASSISTANT_0100
    * @tc.number AUDIO_MANAGER_SETVOLUME_VOICEASSISTANT_0100
    * @tc.desc   setVolume with VOICE_ASSISTANT volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_SETVOLUME_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          await audioManager.setVolume(audio.AudioVolumeType.VOICE_ASSISTANT, 10);
          console.info(`${TagFrmwk}: setVolume with VOICE_ASSISTANT: PASS`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: setVolume with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETVOLUME_ALARM_0100
    * @tc.number AUDIO_MANAGER_GETVOLUME_ALARM_0100
    * @tc.desc   getVolume with ALARM volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETVOLUME_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.getVolume(audio.AudioVolumeType.ALARM, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: getVolume with ALARM: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: getVolume with ALARM: PASS, volume: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETVOLUME_ACCESSIBILITY_0100
    * @tc.number AUDIO_MANAGER_GETVOLUME_ACCESSIBILITY_0100
    * @tc.desc   getVolume with ACCESSIBILITY volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETVOLUME_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: getVolume with ACCESSIBILITY: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: getVolume with ACCESSIBILITY: PASS, volume: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMINVOLUME_VOICECALL_0100
    * @tc.number AUDIO_MANAGER_GETMINVOLUME_VOICECALL_0100
    * @tc.desc   getMinVolume with VOICE_CALL volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMINVOLUME_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.getMinVolume(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: getMinVolume with VOICE_CALL: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: getMinVolume with VOICE_CALL: PASS, minVolume: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMINVOLUME_ALARM_0100
    * @tc.number AUDIO_MANAGER_GETMINVOLUME_ALARM_0100
    * @tc.desc   getMinVolume with ALARM volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMINVOLUME_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.getMinVolume(audio.AudioVolumeType.ALARM, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: getMinVolume with ALARM: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: getMinVolume with ALARM: PASS, minVolume: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMINVOLUME_ACCESSIBILITY_0100
    * @tc.number AUDIO_MANAGER_GETMINVOLUME_ACCESSIBILITY_0100
    * @tc.desc   getMinVolume with ACCESSIBILITY volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMINVOLUME_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.getMinVolume(audio.AudioVolumeType.ACCESSIBILITY, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: getMinVolume with ACCESSIBILITY: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: getMinVolume with ACCESSIBILITY: PASS, minVolume: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMINVOLUME_VOICEASSISTANT_0100
    * @tc.number AUDIO_MANAGER_GETMINVOLUME_VOICEASSISTANT_0100
    * @tc.desc   getMinVolume with VOICE_ASSISTANT volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMINVOLUME_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.getMinVolume(audio.AudioVolumeType.VOICE_ASSISTANT, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: getMinVolume with VOICE_ASSISTANT: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: getMinVolume with VOICE_ASSISTANT: PASS, minVolume: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMINVOLUME_PROMISE_VOICECALL_0100
    * @tc.number AUDIO_MANAGER_GETMINVOLUME_PROMISE_VOICECALL_0100
    * @tc.desc   getMinVolume promise with VOICE_CALL volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST

    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMINVOLUME_PROMISE_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let value = await audioManager.getMinVolume(audio.AudioVolumeType.VOICE_CALL);
          console.info(`${TagFrmwk}: getMinVolume promise with VOICE_CALL: PASS, minVolume: ${value}`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: getMinVolume promise with VOICE_CALL: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMINVOLUME_PROMISE_VOICEASSISTANT_0100
    * @tc.number AUDIO_MANAGER_GETMINVOLUME_PROMISE_VOICEASSISTANT_0100
    * @tc.desc   getMinVolume promise with VOICE_ASSISTANT volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMINVOLUME_PROMISE_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let value = await audioManager.getMinVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
          console.info(`${TagFrmwk}: getMinVolume promise with VOICE_ASSISTANT: PASS, minVolume: ${value}`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: getMinVolume promise with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMAXVOLUME_VOICECALL_0100
    * @tc.number AUDIO_MANAGER_GETMAXVOLUME_VOICECALL_0100
    * @tc.desc   getMaxVolume with VOICE_CALL volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMAXVOLUME_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.getMaxVolume(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: getMaxVolume with VOICE_CALL: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: getMaxVolume with VOICE_CALL: PASS, maxVolume: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMAXVOLUME_ALARM_0100
    * @tc.number AUDIO_MANAGER_GETMAXVOLUME_ALARM_0100
    * @tc.desc   getMaxVolume with ALARM volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMAXVOLUME_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.getMaxVolume(audio.AudioVolumeType.ALARM, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: getMaxVolume with ALARM: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: getMaxVolume with ALARM: PASS, maxVolume: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMAXVOLUME_ACCESSIBILITY_0100
    * @tc.number AUDIO_MANAGER_GETMAXVOLUME_ACCESSIBILITY_0100
    * @tc.desc   getMaxVolume with ACCESSIBILITY volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMAXVOLUME_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: getMaxVolume with ACCESSIBILITY: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: getMaxVolume with ACCESSIBILITY: PASS, maxVolume: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMAXVOLUME_VOICEASSISTANT_0100
    * @tc.number AUDIO_MANAGER_GETMAXVOLUME_VOICEASSISTANT_0100
    * @tc.desc   getMaxVolume with VOICE_ASSISTANT volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMAXVOLUME_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.getMaxVolume(audio.AudioVolumeType.VOICE_ASSISTANT, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: getMaxVolume with VOICE_ASSISTANT: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: getMaxVolume with VOICE_ASSISTANT: PASS, maxVolume: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMAXVOLUME_PROMISE_VOICECALL_0100
    * @tc.number AUDIO_MANAGER_GETMAXVOLUME_PROMISE_VOICECALL_0100
    * @tc.desc   getMaxVolume promise with VOICE_CALL volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMAXVOLUME_PROMISE_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let value = await audioManager.getMaxVolume(audio.AudioVolumeType.VOICE_CALL);
          console.info(`${TagFrmwk}: getMaxVolume promise with VOICE_CALL: PASS, maxVolume: ${value}`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: getMaxVolume promise with VOICE_CALL: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMAXVOLUME_PROMISE_VOICEASSISTANT_0100
    * @tc.number AUDIO_MANAGER_GETMAXVOLUME_PROMISE_VOICEASSISTANT_0100
    * @tc.desc   getMaxVolume promise with VOICE_ASSISTANT volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMAXVOLUME_PROMISE_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let value = await audioManager.getMaxVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
          console.info(`${TagFrmwk}: getMaxVolume promise with VOICE_ASSISTANT: PASS, maxVolume: ${value}`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: getMaxVolume promise with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })

    /**
    * @tc.name   AUDIO_MANAGER_GETMAXVOLUME_PROMISE_ALARM_0100
    * @tc.number AUDIO_MANAGER_GETMAXVOLUME_PROMISE_ALARM_0100
    * @tc.desc   getMaxVolume promise with ALARM volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMAXVOLUME_PROMISE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let value = await audioManager.getMaxVolume(audio.AudioVolumeType.ALARM);
          console.info(`${TagFrmwk}: getMaxVolume promise with ALARM: PASS, maxVolume: ${value}`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: getMaxVolume promise with ALARM: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })

          /**
    * @tc.name   AUDIO_MANAGER_GETMAXVOLUME_PROMISE_ACCESSIBILITY_0100
    * @tc.number AUDIO_MANAGER_GETMAXVOLUME_PROMISE_ACCESSIBILITY_0100
    * @tc.desc   getMaxVolume promise with ACCESSIBILITY volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMAXVOLUME_PROMISE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let value = await audioManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY);
          console.info(`${TagFrmwk}: getMaxVolume promise with ACCESSIBILITY: PASS, maxVolume: ${value}`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: getMaxVolume promise with ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })

          /**
    * @tc.name   AUDIO_MANAGER_GETMAXVOLUME_PROMISE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_MANAGER_GETMAXVOLUME_PROMISE_VOICE_ASSISTANT_0100
    * @tc.desc   getMaxVolume promise with VOICE_ASSISTANT volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_GETMAXVOLUME_PROMISE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let value = await audioManager.getMaxVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
          console.info(`${TagFrmwk}: getMaxVolume promise with VOICE_ASSISTANT: PASS, maxVolume: ${value}`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: getMaxVolume promise with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
          expect(false).assertTrue();
        }
        done();
      })


    /**
    * @tc.name   AUDIO_MANAGER_MUTE_ALARM_0100
    * @tc.number AUDIO_MANAGER_MUTE_ALARM_0100
    * @tc.desc   mute with ALARM volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_MUTE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioManager.mute(audio.AudioVolumeType.ALARM, true, (err) => {
        if (err) {
          console.info(`${TagFrmwk}: mute with ALARM: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: mute with ALARM: PASS`);
          done();
        }
        done();
      })
    })

    /**
    * @tc.name   AUDIO_MANAGER_MUTE_ACCESSIBILITY_0100
    * @tc.number AUDIO_MANAGER_MUTE_ACCESSIBILITY_0100
    * @tc.desc   mute with ACCESSIBILITY volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_MUTE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.mute(audio.AudioVolumeType.ACCESSIBILITY, true, (err) => {
          if (err) {
            console.info(`${TagFrmwk}: mute with ACCESSIBILITY: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: mute with ACCESSIBILITY: PASS`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_ISMUTE_ALARM_0100
    * @tc.number AUDIO_MANAGER_ISMUTE_ALARM_0100
    * @tc.desc   isMute with ALARM volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ISMUTE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.isMute(audio.AudioVolumeType.ALARM, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: isMute with ALARM: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: isMute with ALARM: PASS, isMute: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_ISMUTE_ACCESSIBILITY_0100
    * @tc.number AUDIO_MANAGER_ISMUTE_ACCESSIBILITY_0100
    * @tc.desc   isMute with ACCESSIBILITY volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ISMUTE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.isMute(audio.AudioVolumeType.ACCESSIBILITY, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: isMute with ACCESSIBILITY: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: isMute with ACCESSIBILITY: PASS, isMute: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_ISACTIVE_VOICECALL_0100
    * @tc.number AUDIO_MANAGER_ISACTIVE_VOICECALL_0100
    * @tc.desc   isActive with VOICE_CALL volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ISACTIVE_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.isActive(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: isActive with VOICE_CALL: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: isActive with VOICE_CALL: PASS, isActive: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_ISACTIVE_ALARM_0100
    * @tc.number AUDIO_MANAGER_ISACTIVE_ALARM_0100
    * @tc.desc   isActive with ALARM volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ISACTIVE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.isActive(audio.AudioVolumeType.ALARM, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: isActive with ALARM: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: isActive with ALARM: PASS, isActive: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_ISACTIVE_ACCESSIBILITY_0100
    * @tc.number AUDIO_MANAGER_ISACTIVE_ACCESSIBILITY_0100
    * @tc.desc   isActive with ACCESSIBILITY volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ISACTIVE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.isActive(audio.AudioVolumeType.ACCESSIBILITY, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: isActive with ACCESSIBILITY: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: isActive with ACCESSIBILITY: PASS, isActive: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_ISACTIVE_VOICEASSISTANT_0100
    * @tc.number AUDIO_MANAGER_ISACTIVE_VOICEASSISTANT_0100
    * @tc.desc   isActive with VOICE_ASSISTANT volume type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ISACTIVE_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.isActive(audio.AudioVolumeType.VOICE_ASSISTANT, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: isActive with VOICE_ASSISTANT: FAIL :${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: isActive with VOICE_ASSISTANT: PASS, isActive: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_SETDEVICEACTIVE_BLUETOOTH_SCO_0100
    * @tc.number AUDIO_MANAGER_SETDEVICEACTIVE_BLUETOOTH_SCO_0100
    * @tc.desc   setDeviceActive with BLUETOOTH_SCO device type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_SETDEVICEACTIVE_BLUETOOTH_SCO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.setDeviceActive(audio.ActiveDeviceType.BLUETOOTH_SCO, true, (err) => {
          if (err) {
            console.info(`${TagFrmwk}: setDeviceActive with BLUETOOTH_SCO: FAIL :${err.message}`);
            expect(Number(err.code)).assertEqual(6800301);
            done();
          } else {
            console.info(`${TagFrmwk}: setDeviceActive with BLUETOOTH_SCO: PASS`);
            expect(false).assertTrue();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_SETDEVICEACTIVE_PROMISE_BLUETOOTH_SCO_0100
    * @tc.number AUDIO_MANAGER_SETDEVICEACTIVE_PROMISE_BLUETOOTH_SCO_0100
    * @tc.desc   setDeviceActive promise with BLUETOOTH_SCO device type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_SETDEVICEACTIVE_PROMISE_BLUETOOTH_SCO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          await audioManager.setDeviceActive(audio.ActiveDeviceType.BLUETOOTH_SCO, true);
          console.info(`${TagFrmwk}: setDeviceActive promise with BLUETOOTH_SCO: PASS`);
          expect(false).assertTrue();
        } catch (err) {
          console.info(`${TagFrmwk}: setDeviceActive promise with BLUETOOTH_SCO: FAIL :${(err as BusinessError).message}`);
          expect(Number(err.code)).assertEqual(6800301);
          done();
        }
        done();
      })

    /**
    * @tc.name   AUDIO_MANAGER_ISDEVICEACTIVE_BLUETOOTH_SCO_0100
    * @tc.number AUDIO_MANAGER_ISDEVICEACTIVE_BLUETOOTH_SCO_0100
    * @tc.desc   isDeviceActive with BLUETOOTH_SCO device type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ISDEVICEACTIVE_BLUETOOTH_SCO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        audioManager.isDeviceActive(audio.ActiveDeviceType.BLUETOOTH_SCO, (err, value) => {
          if (err) {
            console.info(`${TagFrmwk}: isDeviceActive with BLUETOOTH_SCO: FAIL :${err.code}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TagFrmwk}: isDeviceActive with BLUETOOTH_SCO: PASS, isDeviceActive: ${value}`);
            done();
          }
          done();
        })
      })

    /**
    * @tc.name   AUDIO_MANAGER_ISDEVICEACTIVE_PROMISE_BLUETOOTH_SCO_0100
    * @tc.number AUDIO_MANAGER_ISDEVICEACTIVE_PROMISE_BLUETOOTH_SCO_0100
    * @tc.desc   isDeviceActive promise with BLUETOOTH_SCO device type test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ISDEVICEACTIVE_PROMISE_BLUETOOTH_SCO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        try {
          let value = await audioManager.isDeviceActive(audio.ActiveDeviceType.BLUETOOTH_SCO);
          console.info(`${TagFrmwk}: isDeviceActive promise with BLUETOOTH_SCO: PASS, isDeviceActive: ${value}`);
          done();
        } catch (err) {
          console.info(`${TagFrmwk}: isDeviceActive promise with BLUETOOTH_SCO: FAIL :${err.code}`);
          expect(false).assertTrue();
        }
        done();
      })
    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   on interrupt with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_UNKNOWN: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   on interrupt with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_VOICE_ASSISTANT: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_ALARM_0100
    * @tc.desc   on interrupt with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_ALARM,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_ALARM: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   on interrupt with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_VOICE_MESSAGE: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   on interrupt with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   on interrupt with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_RINGTONE: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   on interrupt with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_NOTIFICATION: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_NOTIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   on interrupt with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_ACCESSIBILITY: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_MOVIE_0100
    * @tc.desc   on interrupt with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MOVIE,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_MOVIE: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_GAME_0100
    * @tc.desc   on interrupt with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_GAME,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_GAME: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   on interrupt with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_AUDIOBOOK: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   on interrupt with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_NAVIGATION: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   on interrupt with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_VIDEO_COMMUNICATION: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_SPEECH_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_SPEECH_0100
    * @tc.desc   on interrupt with CONTENT_TYPE_SPEECH test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_SPEECH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_SPEECH,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with CONTENT_TYPE_SPEECH: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with CONTENT_TYPE_SPEECH: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_MOVIE_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_MOVIE_0100
    * @tc.desc   on interrupt with CONTENT_TYPE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_MOVIE,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with CONTENT_TYPE_MOVIE: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with CONTENT_TYPE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_SONIFICATION_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_SONIFICATION_0100
    * @tc.desc   on interrupt with CONTENT_TYPE_SONIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_SONIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_SONIFICATION,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with CONTENT_TYPE_SONIFICATION: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with CONTENT_TYPE_SONIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_RINGTONE_0100
    * @tc.number AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_RINGTONE_0100
    * @tc.desc   on interrupt with CONTENT_TYPE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_ON_INTERRUPT_CONTENT_TYPE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_RINGTONE,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.on('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: on interrupt with CONTENT_TYPE_RINGTONE: PASS`);
        done();
        audioManager.off('interrupt', interrupt, callback);
      } catch (err) {
        console.info(`${TagFrmwk}: on interrupt with CONTENT_TYPE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   off interrupt with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_UNKNOWN: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_MEDIA_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_MEDIA_0100
    * @tc.desc   off interrupt with STREAM_USAGE_MEDIA test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_MEDIA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_MEDIA: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_MEDIA: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   off interrupt with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_VOICE_ASSISTANT: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_ALARM_0100
    * @tc.desc   off interrupt with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_ALARM,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_ALARM: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   off interrupt with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_VOICE_MESSAGE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   off interrupt with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   off interrupt with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_RINGTONE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   off interrupt with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_NOTIFICATION: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_NOTIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   off interrupt with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_ACCESSIBILITY: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_MOVIE_0100
    * @tc.desc   off interrupt with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MOVIE,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_MOVIE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_GAME_0100
    * @tc.desc   off interrupt with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_GAME,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_GAME: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   off interrupt with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_AUDIOBOOK: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   off interrupt with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_NAVIGATION: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   off interrupt with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_VIDEO_COMMUNICATION: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_SPEECH_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_SPEECH_0100
    * @tc.desc   off interrupt with CONTENT_TYPE_SPEECH test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_SPEECH_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_SPEECH,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with CONTENT_TYPE_SPEECH: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with CONTENT_TYPE_SPEECH: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_MUSIC_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_MUSIC_0100
    * @tc.desc   off interrupt with CONTENT_TYPE_MUSIC test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_MUSIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_MUSIC,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with CONTENT_TYPE_MUSIC: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with CONTENT_TYPE_MUSIC: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_MOVIE_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_MOVIE_0100
    * @tc.desc   off interrupt with CONTENT_TYPE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_MOVIE,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with CONTENT_TYPE_MOVIE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with CONTENT_TYPE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_SONIFICATION_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_SONIFICATION_0100
    * @tc.desc   off interrupt with CONTENT_TYPE_SONIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_SONIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_SONIFICATION,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with CONTENT_TYPE_SONIFICATION: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with CONTENT_TYPE_SONIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_RINGTONE_0100
    * @tc.number AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_RINGTONE_0100
    * @tc.desc   off interrupt with CONTENT_TYPE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_MANAGER_OFF_INTERRUPT_CONTENT_TYPE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let interrupt: audio.AudioInterrupt = {
          streamUsage: audio.StreamUsage.STREAM_USAGE_MEDIA,
          contentType: audio.ContentType.CONTENT_TYPE_RINGTONE,
          pauseWhenDucked: false
        };
        let callback = (interruptAction: audio.InterruptAction) => {
          console.info(`${TagFrmwk}: interrupt callback called`);
        };
        audioManager.off('interrupt', interrupt, callback);
        console.info(`${TagFrmwk}: off interrupt with CONTENT_TYPE_RINGTONE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: off interrupt with CONTENT_TYPE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_VOICECALL_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_VOICECALL_0100
    * @tc.desc   getVolume with VOICECALL test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getVolume(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getVolume with VOICE_CALL: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          expect(value).assertLargerOrEqual(0);
          console.info(`${TagFrmwk}: getVolume with VOICE_CALL: PASS`);
          done();
        }
        done();
      })
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_RINGTONE_0100
    * @tc.desc   getVolume with RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getVolume(audio.AudioVolumeType.RINGTONE, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getVolume with RINGTONE: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getVolume with RINGTONE: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ALARM_0001
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ALARM_0001
    * @tc.desc   getVolume with ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ALARM_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getVolume(audio.AudioVolumeType.ALARM, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getVolume with ALARM: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getVolume with ALARM: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ACCESSIBILITY_0001
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ACCESSIBILITY_0001
    * @tc.desc   getVolume with ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ACCESSIBILITY_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getVolume with ACCESSIBILITY: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getVolume with ACCESSIBILITY: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_VOICEASSISTANT_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_VOICEASSISTANT_0100
    * @tc.desc   getVolume with VOICEASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getVolume with VOICE_ASSISTANT: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getVolume with VOICE_ASSISTANT: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_SYNC_VOICECALL_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_SYNC_VOICECALL_0100
    * @tc.desc   getVolumeSync with VOICECALL test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_SYNC_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getVolumeSync(audio.AudioVolumeType.VOICE_CALL);
        console.info(`${TagFrmwk}: getVolumeSync with VOICE_CALL: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeSync with VOICE_CALL: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_SYNC_ALARM_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_SYNC_ALARM_0100
    * @tc.desc   getVolumeSync with ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_SYNC_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getVolumeSync(audio.AudioVolumeType.ALARM);
        console.info(`${TagFrmwk}: getVolumeSync with ALARM: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeSync with ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
      try {
        let value = audioVolumeGroupManager.getVolumeSync(audio.AudioVolumeType.ACCESSIBILITY);
        console.info(`${TagFrmwk}: getVolumeSync with ACCESSIBILITY: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeSync with ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_SYNC_VOICEASSISTANT_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_SYNC_VOICEASSISTANT_0100
    * @tc.desc   getVolumeSync with VOICEASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_SYNC_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getVolumeSync(audio.AudioVolumeType.VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getVolumeSync with VOICE_ASSISTANT: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeSync with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_VOICECALL_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_VOICECALL_0100
    * @tc.desc   getMinVolume with VOICECALL test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getMinVolume with VOICE_CALL: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getMinVolume with VOICE_CALL: PASS`);
          done();
        }
        done();
    })
    })

    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_RINGTONE_0001
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_RINGTONE_0001
     * @tc.desc   getVolume with RINGTONE test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_RINGTONE_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getVolume(audio.AudioVolumeType.RINGTONE);
        console.info(`${TagFrmwk}: getVolume with RINGTONE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolume with RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ALARM_0100
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ALARM_0100
     * @tc.desc   getVolume with ALARM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getVolume(audio.AudioVolumeType.ALARM);
        console.info(`${TagFrmwk}: getVolume with ALARM: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolume with ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ACCESSIBILITY_0100
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ACCESSIBILITY_0100
     * @tc.desc   getVolume with ACCESSIBILITY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getVolume(audio.AudioVolumeType.ACCESSIBILITY);
        console.info(`${TagFrmwk}: getVolume with ACCESSIBILITY: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolume with ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_VOICE_ASSISTANT_0100
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_VOICE_ASSISTANT_0100
     * @tc.desc   getVolume with VOICE_ASSISTANT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_VOLUME_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getVolume with VOICE_ASSISTANT: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolume with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MINVOLUME_ALARM_0100
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MINVOLUME_ALARM_0100
     * @tc.desc   getMinVolume with ALARM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MINVOLUME_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.ALARM);
        console.info(`${TagFrmwk}: getMinVolume with ALARM: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolume with ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MINVOLUME_ACCESSIBILITY_0100
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MINVOLUME_ACCESSIBILITY_0100
     * @tc.desc   getMinVolume with ACCESSIBILITY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MINVOLUME_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.ACCESSIBILITY);
        console.info(`${TagFrmwk}: getMinVolume with ACCESSIBILITY: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolume with ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MINVOLUME_VOICE_ASSISTANT_0100
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MINVOLUME_VOICE_ASSISTANT_0100
     * @tc.desc   getMinVolume with VOICE_ASSISTANT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MINVOLUME_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getMinVolume with VOICE_ASSISTANT: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolume with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_ALARM_0100
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_ALARM_0100
     * @tc.desc   getMaxVolume with ALARM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.ALARM);
        console.info(`${TagFrmwk}: getMaxVolume with ALARM: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolume with ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_ACCESSIBILITY_0100
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_ACCESSIBILITY_0100
     * @tc.desc   getMaxVolume with ACCESSIBILITY test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.ACCESSIBILITY);
        console.info(`${TagFrmwk}: getMaxVolume with ACCESSIBILITY: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolume with ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_VOICE_ASSISTANT_0100
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_VOICE_ASSISTANT_0100
     * @tc.desc   getMaxVolume with VOICE_ASSISTANT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getMaxVolume with VOICE_ASSISTANT: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolume with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_VOICE_CALL_0100
     * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_VOICE_CALL_0100
     * @tc.desc   getMaxVolume with VOICE_CALL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAXVOLUME_VOICE_CALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.VOICE_CALL);
        console.info(`${TagFrmwk}: getMaxVolume with VOICE_CALL: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolume with VOICE_CALL: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_MEDIA_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_MEDIA_0100
    * @tc.desc   getMinVolume with MEDIA test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_MEDIA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getMinVolume with MEDIA: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getMinVolume with MEDIA: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_ALARM_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_ALARM_0100
    * @tc.desc   getMinVolume with ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.ALARM, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getMinVolume with ALARM: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getMinVolume with ALARM: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_ACCESSIBILITY_0100
    * @tc.desc   getMinVolume with ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.ACCESSIBILITY, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getMinVolume with ACCESSIBILITY: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getMinVolume with ACCESSIBILITY: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_VOICEASSISTANT_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_VOICEASSISTANT_0100
    * @tc.desc   getMinVolume with VOICEASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getMinVolume(audio.AudioVolumeType.VOICE_ASSISTANT, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getMinVolume with VOICE_ASSISTANT: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getMinVolume with VOICE_ASSISTANT: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_VOICECALL_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_VOICECALL_0100
    * @tc.desc   getMinVolumeSync with VOICECALL test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMinVolumeSync(audio.AudioVolumeType.VOICE_CALL);
        console.info(`${TagFrmwk}: getMinVolumeSync with VOICE_CALL: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeSync with VOICE_CALL: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_ALARM_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_ALARM_0100
    * @tc.desc   getMinVolumeSync with ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMinVolumeSync(audio.AudioVolumeType.ALARM);
        console.info(`${TagFrmwk}: getMinVolumeSync with ALARM: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeSync with ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_ACCESSIBILITY_0100
    * @tc.desc   getMinVolumeSync with ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMinVolumeSync(audio.AudioVolumeType.ACCESSIBILITY);
        console.info(`${TagFrmwk}: getMinVolumeSync with ACCESSIBILITY: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeSync with ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_VOICEASSISTANT_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_VOICEASSISTANT_0100
    * @tc.desc   getMinVolumeSync with VOICEASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MIN_VOLUME_SYNC_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMinVolumeSync(audio.AudioVolumeType.VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getMinVolumeSync with VOICE_ASSISTANT: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeSync with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_VOICECALL_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_VOICECALL_0100
    * @tc.desc   getMaxVolume with VOICECALL test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getMaxVolume with VOICE_CALL: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getMaxVolume with VOICE_CALL: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_MEDIA_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_MEDIA_0100
    * @tc.desc   getMaxVolume with MEDIA test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_MEDIA_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.MEDIA, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getMaxVolume with MEDIA: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getMaxVolume with MEDIA: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_ALARM_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_ALARM_0100
    * @tc.desc   getMaxVolume with ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.ALARM, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getMaxVolume with ALARM: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getMaxVolume with ALARM: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_ACCESSIBILITY_0100
    * @tc.desc   getMaxVolume with ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.ACCESSIBILITY, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getMaxVolume with ACCESSIBILITY: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getMaxVolume with ACCESSIBILITY: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_VOICEASSISTANT_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_VOICEASSISTANT_0100
    * @tc.desc   getMaxVolume with VOICEASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getMaxVolume(audio.AudioVolumeType.VOICE_ASSISTANT, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getMaxVolume with VOICE_ASSISTANT: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getMaxVolume with VOICE_ASSISTANT: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_VOICECALL_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_VOICECALL_0100
    * @tc.desc   getMaxVolumeSync with VOICECALL test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMaxVolumeSync(audio.AudioVolumeType.VOICE_CALL);
        console.info(`${TagFrmwk}: getMaxVolumeSync with VOICE_CALL: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeSync with VOICE_CALL: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_RINGTONE_0100
    * @tc.desc   getMaxVolumeSync with RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMaxVolumeSync(audio.AudioVolumeType.RINGTONE);
        console.info(`${TagFrmwk}: getMaxVolumeSync with RINGTONE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeSync with RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_ACCESSIBILITY_0100
    * @tc.desc   getMaxVolumeSync with ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMaxVolumeSync(audio.AudioVolumeType.ACCESSIBILITY);
        console.info(`${TagFrmwk}: getMaxVolumeSync with ACCESSIBILITY: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeSync with ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_VOICEASSASSISTANT_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_VOICEASSASSISTANT_0100
    * @tc.desc   getMaxVolumeSync with VOICEASSASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_MAX_VOLUME_SYNC_VOICEASSASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getMaxVolumeSync(audio.AudioVolumeType.VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getMaxVolumeSync with VOICE_ASSISTANT: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeSync with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_VOICECALL_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_VOICECALL_0100
    * @tc.desc   isMute with VOICECALL test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.isMute(audio.AudioVolumeType.VOICE_CALL, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: isMute with VOICE_CALL: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: isMute with VOICE_CALL: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_ALARM_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_ALARM_0100
    * @tc.desc   isMute with ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.isMute(audio.AudioVolumeType.ALARM, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: isMute with ALARM: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: isMute with ALARM: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_ACCESSIBILITY_0100
    * @tc.desc   isMute with ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.isMute(audio.AudioVolumeType.ACCESSIBILITY, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: isMute with ACCESSIBILITY: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: isMute with ACCESSIBILITY: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_VOICEASSISTANT_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_VOICEASSISTANT_0100
    * @tc.desc   isMute with VOICEASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.isMute(audio.AudioVolumeType.VOICE_ASSISTANT, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: isMute with VOICE_ASSISTANT: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: isMute with VOICE_ASSISTANT: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_VOICECALL_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_VOICECALL_0100
    * @tc.desc   isMuteSync with VOICECALL test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_VOICECALL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.isMuteSync(audio.AudioVolumeType.VOICE_CALL);
        console.info(`${TagFrmwk}: isMuteSync with VOICE_CALL: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isMuteSync with VOICE_CALL: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_RINGTONE_0100
    * @tc.desc   isMuteSync with RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.isMuteSync(audio.AudioVolumeType.RINGTONE);
        console.info(`${TagFrmwk}: isMuteSync with RINGTONE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isMuteSync with RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_ALARM_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_ALARM_0100
    * @tc.desc   isMuteSync with ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.isMuteSync(audio.AudioVolumeType.ALARM);
        console.info(`${TagFrmwk}: isMuteSync with ALARM: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isMuteSync with ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_VOICEASSISTANT_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_VOICEASSISTANT_0100
    * @tc.desc   isMuteSync with VOICEASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_IS_MUTE_SYNC_VOICEASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.isMuteSync(audio.AudioVolumeType.VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: isMuteSync with VOICE_ASSISTANT: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isMuteSync with VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_VOICECALL_INVALID_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_VOICECALL_INVALID_0100
    * @tc.desc   getSystemVolumeInDb with VOICECALL and INVALID test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_VOICECALL_INVALID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.VOICE_CALL, 3, audio.DeviceType.INVALID, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getSystemVolumeInDb with VOICE_CALL and INVALID: FAIL :${err.message}`);
          expect(Number(err.code)).assertEqual(6800101);
          done();
        } else {
          console.info(`${TagFrmwk}: getSystemVolumeInDb with VOICE_CALL and INVALID: PASS`);
          expect(false).assertTrue();
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_RINGTONE_EARPIECE_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_RINGTONE_EARPIECE_0100
    * @tc.desc   getSystemVolumeInDb with RINGTONE and EARPIECE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_RINGTONE_EARPIECE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.RINGTONE, 10, audio.DeviceType.EARPIECE, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getSystemVolumeInDb with RINGTONE and EARPIECE: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getSystemVolumeInDb with RINGTONE and EARPIECE: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_ALARM_WIRED_HEADSET_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_ALARM_WIRED_HEADSET_0100
    * @tc.desc   getSystemVolumeInDb with ALARM and WIRED and HEADSET test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_ALARM_WIRED_HEADSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.ALARM, 10, audio.DeviceType.WIRED_HEADSET, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getSystemVolumeInDb with ALARM and WIRED_HEADSET: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getSystemVolumeInDb with ALARM and WIRED_HEADSET: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_ACCESSIBILITY_WIRED_HEADPHONES_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_ACCESSIBILITY_WIRED_HEADPHONES_0100
    * @tc.desc   getSystemVolumeInDb with ACCESSIBILITY and WIRED and HEADPHONES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_ACCESSIBILITY_WIRED_HEADPHONES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.ACCESSIBILITY, 10, audio.DeviceType.WIRED_HEADPHONES, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getSystemVolumeInDb with ACCESSIBILITY and WIRED_HEADPHONES: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getSystemVolumeInDb with ACCESSIBILITY and WIRED_HEADPHONES: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_VOICEASSISTANT_BLUETOOTH_SCO_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_VOICEASSISTANT_BLUETOOTH_SCO_0100
    * @tc.desc   getSystemVolumeInDb with VOICEASSISTANT and BLUETOOTH and SCO test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_VOICEASSISTANT_BLUETOOTH_SCO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      audioVolumeGroupManager.getSystemVolumeInDb(audio.AudioVolumeType.VOICE_ASSISTANT, 10, audio.DeviceType.BLUETOOTH_SCO, (err, value) => {
        if (err) {
          console.info(`${TagFrmwk}: getSystemVolumeInDb with VOICE_ASSISTANT and BLUETOOTH_SCO: FAIL :${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`${TagFrmwk}: getSystemVolumeInDb with VOICE_ASSISTANT and BLUETOOTH_SCO: PASS`);
          done();
        }
        done();
    })
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_ALARM_INVALID_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_ALARM_INVALID_0100
    * @tc.desc   getSystemVolumeInDbSync with ALARM and INVALID test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_ALARM_INVALID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.ALARM, 10, audio.DeviceType.INVALID);
        console.info(`${TagFrmwk}: getSystemVolumeInDbSync with ALARM and INVALID: PASS`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: getSystemVolumeInDbSync with ALARM and INVALID: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_ACCESSIBILITY_EARPIECE_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_ACCESSIBILITY_EARPIECE_0100
    * @tc.desc   getSystemVolumeInDbSync with ACCESSIBILITY and EARPIECE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_ACCESSIBILITY_EARPIECE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.ACCESSIBILITY, 10, audio.DeviceType.EARPIECE);
        console.info(`${TagFrmwk}: getSystemVolumeInDbSync with ACCESSIBILITY and EARPIECE: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getSystemVolumeInDbSync with ACCESSIBILITY and EARPIECE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_voiceASSISTANT_WIRED_HEADSET_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_voiceASSISTANT_WIRED_HEADSET_0100
    * @tc.desc   getSystemVolumeInDbSync with voiceASSISTANT and WIRED and HEADSET test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_voiceASSISTANT_WIRED_HEADSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.VOICE_ASSISTANT, 10, audio.DeviceType.WIRED_HEADSET);
        console.info(`${TagFrmwk}: getSystemVolumeInDbSync with VOICE_ASSISTANT and WIRED_HEADSET: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getSystemVolumeInDbSync with VOICE_ASSISTANT and WIRED_HEADSET: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_VOICECALL_WIRED_HEADPHONES_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_VOICECALL_WIRED_HEADPHONES_0100
    * @tc.desc   getSystemVolumeInDbSync with VOICECALL and WIRED and HEADPHONES test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_VOICECALL_WIRED_HEADPHONES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.VOICE_CALL, 10, audio.DeviceType.WIRED_HEADPHONES);
        console.info(`${TagFrmwk}: getSystemVolumeInDbSync with VOICE_CALL and WIRED_HEADPHONES: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getSystemVolumeInDbSync with VOICE_CALL and WIRED_HEADPHONES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_RINGTONE_BLUETOOTH_SCO_0100
    * @tc.number AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_RINGTONE_BLUETOOTH_SCO_0100
    * @tc.desc   getSystemVolumeInDbSync with RINGTONE and BLUETOOTH and SCO test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_GROUP_MANAGER_GET_SYSTEM_VOLUME_IN_DB_SYNC_RINGTONE_BLUETOOTH_SCO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let value = audioVolumeGroupManager.getSystemVolumeInDbSync(audio.AudioVolumeType.RINGTONE, 10, audio.DeviceType.BLUETOOTH_SCO);
        console.info(`${TagFrmwk}: {getSystemVolumeInDbSync with RINGTONE and BLUETOOTH_SCO: PASS`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getSystemVolumeInDbSync with RINGTONE and BLUETOOTH_SCO: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_UNKNOWN: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_ALARM);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_ALARM: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_ALARM: FAIL : :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_RINGTONE);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_RINGTONE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NOTIFICATION: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NOTIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_ACCESSIBILITY: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_MOVIE);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_MOVIE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_GAME);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_GAME: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_AUDIOBOOK: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_NAVIGATION);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NAVIGATION: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   getVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeByStream(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION);
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_UNKNOWN: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_MUSIC test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_MUSIC: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_MUSIC: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_ALARM);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_ALARM: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_RINGTONE);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_RINGTONE: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NOTIFICATION: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NOTIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_ACCESSIBILITY: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MOVIE);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_MOVIE: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_GAME);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_GAME: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_AUDIOBOOK: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_NAVIGATION);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NAVIGATION: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   getMinVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MIN_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION);
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: PASS, minVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMinVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_UNKNOWN: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_MUSIC test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MUSIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_MUSIC: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_MUSIC: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_ALARM);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_ALARM: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_RINGTONE);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_RINGTONE: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NOTIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_ACCESSIBILITY: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MOVIE);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_MOVIE: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_GAME);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_GAME: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_AUDIOBOOK: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_NAVIGATION);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NAVIGATION: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   getMaxVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_MAX_VOLUME_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION);
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: PASS, maxVolume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getMaxVolumeByStream with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_UNKNOWN: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_COMMUNICATION: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_ASSISTANT: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ALARM_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_ALARM);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_ALARM: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_MESSAGE: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_RINGTONE);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_RINGTONE: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NOTIFICATION: PASS, is: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NOTIFICATION: FAIL: ${err.message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_ACCESSIBILITY: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_MOVIE_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_MOVIE);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_MOVIE: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_GAME_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_GAME);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_GAME: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_AUDIOBOOK: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_NAVIGATION);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NAVIGATION: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   isSystemMutedForStream with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_IS_SYSTEM_MUTED_FOR_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let isMuted:boolean = audioVolumeManager.isSystemMutedForStream(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION);
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VIDEO_COMMUNICATION: PASS, isMuted: ${isMuted}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: isSystemMutedForStream with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_INVALID_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_INVALID_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and INVALID device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_INVALID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 10, audio.DeviceType.INVALID);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and INVALID: PASS, volume: ${volume}`);
        expect(false).assertTrue();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and INVALID: FAIL :${(err as BusinessError).message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_EARPIECE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_EARPIECE_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and EARPIECE device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_EARPIECE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_MEDIA, 10, audio.DeviceType.EARPIECE);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and EARPIECE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and EARPIECE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_WIRED_HEADSET_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_WIRED_HEADSET_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and WIRED_HEADSET device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_WIRED_HEADSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 10, audio.DeviceType.WIRED_HEADSET);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and WIRED_HEADSET: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`{TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and WIRED_HEADSET: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_WIRED_HEADPHONES_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_WIRED_HEADPHONES_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_ASSISTANT and WIRED_HEADPHONES device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_ASSISTANT_WIRED_HEADPHONES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, 10, audio.DeviceType.WIRED_HEADPHONES);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_ASSISTANT and WIRED_HEADPHONES: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_ASSISTANT and WIRED_HEADPHONES: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ALARM_BLUETOOTH_SCO_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ALARM_BLUETOOTH_SCO_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_ALARM and BLUETOOTH_SCO device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ALARM_BLUETOOTH_SCO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_ALARM, 10, audio.DeviceType.BLUETOOTH_SCO);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_ALARM and BLUETOOTH_SCO: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_ALARM and BLUETOOTH_SCO: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_BLUETOOTH_A2DP_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_BLUETOOTH_A2DP_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_MESSAGE and BLUETOOTH_A2DP device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_MESSAGE_BLUETOOTH_A2DP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, 10, audio.DeviceType.BLUETOOTH_A2DP);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_MESSAGE and BLUETOOTH_A2DP: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.log(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_MESSAGE and BLUETOOTH_A2DP: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_MIC_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_MIC_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION_RINGTONE and MIC device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_RINGTONE_MIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE, 10, audio.DeviceType.MIC);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION_RINGTONE and MIC: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION_RINGTONE and MIC: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_RINGTONE_USB_HEADSET_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_RINGTONE_USB_HEADSET_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_RINGTONE and USB_HEADSET device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_RINGTONE_USB_HEADSET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_RINGTONE, 10, audio.DeviceType.USB_HEADSET);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_RINGTONE and USB_HEADSET: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_RINGTONE and USB_HEADSET: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_DISPLAY_PORT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_DISPLAY_PORT_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION and DISPLAY_PORT device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NOTIFICATION_DISPLAY_PORT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_NOTIFICATION, 10, audio.DeviceType.DISPLAY_PORT);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION and DISPLAY_PORT: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NOTIFICATION and DISPLAY_PORT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_REMOTE_CAST_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_REMOTE_CAST_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_ACCESSIBILITY and REMOTE_CAST device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_ACCESSIBILITY_REMOTE_CAST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, 10, audio.DeviceType.REMOTE_CAST);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_ACCESSIBILITY and REMOTE_CAST: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_ACCESSIBILITY and REMOTE_CAST: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MOVIE_USB_DEVICE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MOVIE_USB_DEVICE_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_MOVIE and USB_DEVICE device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MOVIE_USB_DEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_MOVIE, 10, audio.DeviceType.USB_DEVICE);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MOVIE and USB_DEVICE: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MOVIE and USB_DEVICE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_GAME_HDMI_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_GAME_HDMI_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_GAME and HDMI device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_GAME_HDMI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_GAME, 10, audio.DeviceType.HDMI);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_GAME and HDMI: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_GAME and HDMI: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_AUDIOBOOK_LINE_DIGITAL_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_AUDIOBOOK_LINE_DIGITAL_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_AUDIOBOOK and LINE_DIGITAL device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_AUDIOBOOK_LINE_DIGITAL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, 10, audio.DeviceType.LINE_DIGITAL);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_AUDIOBOOK and LINE_DIGITAL: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_AUDIOBOOK and LINE_DIGITAL: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NAVIGATION_REMOTE_DAUDIO_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NAVIGATION_REMOTE_DAUDIO_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_NAVIGATION and REMOTE_DAUDIO device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_NAVIGATION_REMOTE_DAUDIO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_NAVIGATION, 10, audio.DeviceType.REMOTE_DAUDIO);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NAVIGATION and REMOTE_DAUDIO: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_NAVIGATION and REMOTE_DAUDIO: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_HEARING_AID_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_HEARING_AID_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_VIDEO_COMMUNICATION and HEARING_AID device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VIDEO_COMMUNICATION_HEARING_AID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, 10, audio.DeviceType.HEARING_AID);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VIDEO_COMMUNICATION and HEARING_AID: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VIDEO_COMMUNICATION and HEARING_AID: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_NEARLINK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_NEARLINK_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and NEARLINK device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_UNKNOWN_NEARLINK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_UNKNOWN, 10, audio.DeviceType.NEARLINK);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and NEARLINK: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_UNKNOWN and NEARLINK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_SYSTEM_PRIVATE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_SYSTEM_PRIVATE_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and SYSTEM_PRIVATE device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_MEDIA_SYSTEM_PRIVATE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_MEDIA, 10, audio.DeviceType.SYSTEM_PRIVATE);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and SYSTEM_PRIVATE: PASS, {volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_MEDIA and SYSTEM_PRIVATE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_DEFAULT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_DEFAULT_0100
    * @tc.desc   getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and DEFAULT device test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_GET_VOLUME_IN_UNIT_OF_DB_BY_STREAM_STREAM_USAGE_VOICE_COMMUNICATION_DEFAULT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let volume:number = audioVolumeManager.getVolumeInUnitOfDbByStream(audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, 10, audio.DeviceType.DEFAULT);
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and DEFAULT: PASS, volume: ${volume}`);
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: getVolumeInUnitOfDbByStream with STREAM_USAGE_VOICE_COMMUNICATION and DEFAULT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_UNKNOWN_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_UNKNOWN_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_UNKNOWN test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_UNKNOWN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_UNKNOWN, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_UNKNOWN: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_UNKNOWN: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_COMMUNICATION_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_VOICE_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_COMMUNICATION: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_ASSISTANT_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_VOICE_ASSISTANT test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_ASSISTANT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_ASSISTANT: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_ASSISTANT: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ALARM_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ALARM_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_ALARM test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ALARM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_ALARM, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_ALARM: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_ALARM: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_MESSAGE_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_VOICE_MESSAGE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VOICE_MESSAGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_MESSAGE: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VOICE_MESSAGE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_RINGTONE_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_NOTIFICATION_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NOTIFICATION_RINGTONE: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NOTIFICATION_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_RINGTONE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_RINGTONE_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_RINGTONE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_RINGTONE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_RINGTONE, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_RINGTONE: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_RINGTONE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_NOTIFICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NOTIFICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_NOTIFICATION, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NOTIFICATION: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NOTIFICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ACCESSIBILITY_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_ACCESSIBILITY test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_ACCESSIBILITY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_ACCESSIBILITY: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_ACCESSIBILITY: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_MOVIE_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_MOVIE_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_MOVIE test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_MOVIE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_MOVIE, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_MOVIE: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_MOVIE: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_GAME_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_GAME_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_GAME test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_GAME_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_GAME, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_GAME: PASS`);
        });
        done();
      } catch (err) {
        console.info(`{TagFrmwk}: on streamVolumeChange with STREAM_USAGE_GAME: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_AUDIOBOOK_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_AUDIOBOOK test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_AUDIOBOOK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_AUDIOBOOK, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_AUDIOBOOK: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_AUDIOBOOK: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NAVIGATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NAVIGATION_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_NAVIGATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_NAVIGATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_NAVIGATION, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NAVIGATION: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_NAVIGATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.number AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VIDEO_COMMUNICATION_0100
    * @tc.desc   on streamVolumeChange with STREAM_USAGE_VIDEO_COMMUNICATION test.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_VOLUME_MANAGER_ON_STREAM_VOLUME_CHANGE_STREAM_USAGE_VIDEO_COMMUNICATION_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        audioVolumeManager.on('streamVolumeChange', audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION, (streamVolumeEvent) => {
          console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VIDEO_COMMUNICATION: PASS`);
        });
        done();
      } catch (err) {
        console.info(`${TagFrmwk}: on streamVolumeChange with STREAM_USAGE_VIDEO_COMMUNICATION: FAIL :${(err as BusinessError).message}`);
        expect(false).assertTrue();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0100 
    * @tc.number AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0100 
    * @tc.desc   setIndependentAudioSessionStrategy
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
      };
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.MUTE_WHEN_INTERRUPTED;
      try {
        await audioRenderer.setIndependentAudioSessionStrategy(strategy, behavior);
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0100 ' + strategy + 'and ' + behavior);
      } catch (Error) {
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0100 Error:' + Error + Error.code);
        expect(false).assertTrue();
      }
      await audioRenderer.release();
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0200 
    * @tc.number AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0200 
    * @tc.desc   setIndependentAudioSessionStrategy
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
      };
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.MUTE_WHEN_INTERRUPTED;
      try {
        await audioRenderer.setIndependentAudioSessionStrategy(strategy, behavior);
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0200 ' + strategy + 'and ' + behavior);
      } catch (Error) {
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0200 Error:' + Error + Error.code);
        expect(false).assertTrue();
      }
      await audioRenderer.release();
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0300 
    * @tc.number AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0300 
    * @tc.desc   setIndependentAudioSessionStrategy
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamInfo:audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let audioRendererInfo:audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let audioRendererOptions:audio.AudioRendererOptions = {
        streamInfo: audioStreamInfo,
        rendererInfo: audioRendererInfo
      }
      let audioRenderer:audio.AudioRenderer = await audio.createAudioRenderer(audioRendererOptions);

      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_PAUSE_OTHERS
      };
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.MUTE_WHEN_INTERRUPTED;
      try {
        await audioRenderer.setIndependentAudioSessionStrategy(strategy, behavior);
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0300 ' + strategy + 'and ' + behavior);
      } catch (Error) {
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0300 Error:' + Error + Error.code);
        expect(false).assertTrue();
      }
      await audioRenderer.release();
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0400 
    * @tc.number AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0400 
    * @tc.desc   setIndependentAudioSessionStrategy
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DUCK_OTHERS
      };
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.MUTE_WHEN_INTERRUPTED;
      try {
        await audioRenderer.setIndependentAudioSessionStrategy(strategy, behavior);
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0400 ' + strategy + 'and ' + behavior);
      } catch (Error) {
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0400 Error:' + Error + Error.code);
        expect(false).assertTrue();
      }
      await audioRenderer.release();
      done();
    })
    
    /**
    * @tc.name   AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0500 
    * @tc.number AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0500 
    * @tc.desc   setIndependentAudioSessionStrategy--CONCURRENCY_DUCK_OTHERS--DEFALUT
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DUCK_OTHERS
      };
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR;
      try {
        await audioRenderer.setIndependentAudioSessionStrategy(strategy, behavior);
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0500 ' + strategy + 'and ' + behavior);
      } catch (Error) {
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0500 Error:' + Error + Error.code);
        expect(false).assertTrue();
      }
      await audioRenderer.release();
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0600 
    * @tc.number AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0600 
    * @tc.desc   setIndependentAudioSessionStrategy
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_MIX_WITH_OTHERS
      };
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR;
      try {
        await audioRenderer.setIndependentAudioSessionStrategy(strategy, behavior);
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0600 ' + strategy + 'and ' + behavior);
      } catch (Error) {
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0600 Error:' + Error + Error.code);
        expect(false).assertTrue();
      }
      await audioRenderer.release();
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0700 
    * @tc.number AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0700 
    * @tc.desc   setIndependentAudioSessionStrategy
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_PAUSE_OTHERS
      };
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR;
      try {
        await audioRenderer.setIndependentAudioSessionStrategy(strategy, behavior);
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0700 ' + strategy + 'and ' + behavior);
      } catch (Error) {
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0700 Error:' + Error + Error.code);
        expect(false).assertTrue();
      }
      await audioRenderer.release();
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0800 
    * @tc.number AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0800 
    * @tc.desc   setIndependentAudioSessionStrategy
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT
      };
      let behavior: audio.AudioSessionBehaviorFlags = audio.AudioSessionBehaviorFlags.DEFAULT_BEHAVIOR;
      try {
        await audioRenderer.setIndependentAudioSessionStrategy(strategy, behavior);
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0800 ' + strategy + 'and ' + behavior);
      } catch (Error) {
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0800 Error:' + Error + Error.code);
        expect(false).assertTrue();
      }
      await audioRenderer.release();
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0900 
    * @tc.number AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0900 
    * @tc.desc   setIndependentAudioSessionStrategy
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIORENDERER_SETINDEPENDENTAUDIOSESSIONSTRATEGY_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
      let strategy: audio.AudioSessionStrategy = {
        concurrencyMode: audio.AudioConcurrencyMode.CONCURRENCY_DEFAULT,
      };
      let behavior: ESObject = -1;
      try {
        await audioRenderer.setIndependentAudioSessionStrategy(strategy, behavior);
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0900 Error:FAIL' );
        expect(false).assertTrue();
      } catch (err) {
        console.log('SETINDEPENDENTAUDIOSESSIONSTRATEGY_0900 ' + strategy + 'and ' + behavior);
        expect(Number(err.code)).assertEqual(6800101);
      }
      await audioRenderer.release();
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIOSTREAMMANAGER_ISFASTPLAYBACKSUPPORTED_0100 
    * @tc.number AUDIO_AUDIOSTREAMMANAGER_ISFASTPLAYBACKSUPPORTED_0100 
    * @tc.desc   isFastPlaybackSupported
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIOSTREAMMANAGER_ISFASTPLAYBACKSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
      };
      
      try {
        let value: boolean = audioStreamManager.isFastPlaybackSupported(audioStreamInfo, audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`Return to indicate that under the current audio device conditions, the support for FastPlayback is ${value}.`);
        if (value == true) {
          expect(value).assertEqual(true);
        } else if (value == false) {
          expect(value).assertEqual(false);
        } else {
          console.info("FastPlayback error");
          expect(true).assertFalse();
        }
        done();
      } catch (error) {
        console.info("AUDIO_AUDIOSTREAMMANAGER_ISFASTPLAYBACKSUPPORTED_0100 FAIL:" + error.message);
        expect(true).assertFalse();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIOSTREAMMANAGER_ISOFFLOADPLAYBACKSUPPORTED_0100 
    * @tc.number AUDIO_AUDIOSTREAMMANAGER_ISOFFLOADPLAYBACKSUPPORTED_0100 
    * @tc.desc   isOffloadPlaybackSupported
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIOSTREAMMANAGER_ISOFFLOADPLAYBACKSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
      };
      
      try {
        let value: boolean = audioStreamManager.isOffloadPlaybackSupported(audioStreamInfo, audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`Return to indicate that under the current audio device conditions, the support for OffloadPlayback is ${value}.`);
        if (value == true) {
          expect(value).assertEqual(true);
        } else if (value == false) {
          expect(value).assertEqual(false);
        } else {
          console.info("OffloadPlayback error");
          expect(true).assertFalse();
        }
        done();
      } catch (error) {
        console.info("AUDIO_AUDIOSTREAMMANAGER_ISOFFLOADPLAYBACKSUPPORTED_0100 FAIL:" + error.message);
        expect(true).assertFalse();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIOSTREAMMANAGER_ISDIRECTPLAYBACKSUPPORTED_0100 
    * @tc.number AUDIO_AUDIOSTREAMMANAGER_ISDIRECTPLAYBACKSUPPORTED_0100 
    * @tc.desc   isDirectPlaybackSupported
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIOSTREAMMANAGER_ISDIRECTPLAYBACKSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
      };
      
      try {
        let value: boolean = audioStreamManager.isDirectPlaybackSupported(audioStreamInfo, audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`Return to indicate that under the current audio device conditions, the support for DirectPlayback is ${value}.`);
        if (value == true) {
          expect(value).assertEqual(true);
        } else if (value == false) {
          expect(value).assertEqual(false);
        } else {
          console.info("DirectPlayback error");
          expect(true).assertFalse();
        }
        done();
      } catch (error) {
        console.info("AUDIO_AUDIOSTREAMMANAGER_ISDIRECTPLAYBACKSUPPORTED_0100 FAIL:" + error.message);
        expect(true).assertFalse();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIOSTREAMMANAGER_ISFASTRECORDINGSUPPORTED_0100 
    * @tc.number AUDIO_AUDIOSTREAMMANAGER_ISFASTRECORDINGSUPPORTED_0100 
    * @tc.desc   isFastRecordingSupported
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIOSTREAMMANAGER_ISFASTRECORDINGSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
      };
      
      try {
        let value: boolean = audioStreamManager.isFastRecordingSupported(audioStreamInfo, audio.SourceType.SOURCE_TYPE_MIC);
        console.info(`Return to indicate that under the current audio device conditions, the support for FastRecording is ${value}.`);
        if (value == true) {
          expect(value).assertEqual(true);
        } else if (value == false) {
          expect(value).assertEqual(false);
        } else {
          console.info("FastRecording error");
          expect(true).assertFalse();
        }
        done();
      } catch (error) {
        console.info("AUDIO_AUDIOSTREAMMANAGER_ISFASTRECORDINGSUPPORTED_0100 FAIL:" + error.message);
        expect(true).assertFalse();
      }
      done();
    })

    /**
    * @tc.name   AUDIO_AUDIOSTREAMMANAGER_ISMULTICHANNELPLAYBACKSUPPORTED_0100 
    * @tc.number AUDIO_AUDIOSTREAMMANAGER_ISMULTICHANNELPLAYBACKSUPPORTED_0100 
    * @tc.desc   isMultichannelPlaybackSupported
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL2
    */
    it('AUDIO_AUDIOSTREAMMANAGER_ISMULTICHANNELPLAYBACKSUPPORTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioStreamManager: audio.AudioStreamManager = audio.getAudioManager().getStreamManager();
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_3,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1
      };
      
      try {
        let value: boolean = audioStreamManager.isMultichannelPlaybackSupported(audioStreamInfo, audio.StreamUsage.STREAM_USAGE_MUSIC);
        console.info(`Return to indicate that under the current audio device conditions, the support for MultichannelPlayback is ${value}.`);
        if (value == true) {
          expect(value).assertEqual(true);
        } else if (value == false) {
          expect(value).assertEqual(false);
        } else {
          console.info("MultichannelPlayback error");
          expect(true).assertFalse();
        }
        done();
      } catch (error) {
        console.info("AUDIO_AUDIOSTREAMMANAGER_ISMULTICHANNELPLAYBACKSUPPORTED_0100 FAIL:" + error.message);
        expect(true).assertFalse();
      }
      done();
    })
  })
}