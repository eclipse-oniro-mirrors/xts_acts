/**
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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll} from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import audio from '@ohos.multimedia.audio';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import deviceInfo from "@ohos.deviceInfo";
let TagFrmwk: string = "AudioFrameworkTest";
console.info(`${TagFrmwk}: Create AudioManger Object JS Framework`);
let deviceTypeInfo: string = deviceInfo.deviceType
const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let audioManager: audio.AudioManager;
let audioVolumeManager: audio.AudioVolumeManager;
let audioVolumeGroupManager: audio.AudioVolumeGroupManager;
let dRValue: audio.DeviceRole;
let dTValue: audio.DeviceType;
let devId: number = 0;
let devName: string = "";
let devAddr: string = "";
let sRate: int = 0;
let cCount: int = 0;
let cMask: int[] = [];
let volumeType = null;
let audioMedia  = audio.AudioVolumeType.MEDIA;
let audioRingtone = audio.AudioVolumeType.RINGTONE;
let minVol: number = 0;
let maxVol: number = 15;
let maxVolPc: number = 20;
let lowVol: number = 5;
let highVol: number = 14;
let outOfRangeVol: number = 28;
let longValue = '28374837458743875804735081439085918459801437584738967509184509813904850914375904790589104801843';

async function getAudioManager() {
  audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
  } else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

async function getVolumeGroupManager() {
  audioManager = audio.getAudioManager();
  if (audioManager != null) {
    console.info(`${TagFrmwk}: getAudioManger : PASS`);
    audioVolumeManager = audioManager.getVolumeManager();
    audioVolumeGroupManager = await audioVolumeManager.getVolumeGroupManager(audio.DEFAULT_VOLUME_GROUP_ID);
    if (audioVolumeGroupManager != null) {
      console.info(`${TagFrmwk}: getVolumeGroupManager : PASS`);
    } else {
      console.info(`${TagFrmwk}: getVolumeGroupManager : FAIL`);
    }
  } else {
    console.info(`${TagFrmwk}: getAudioManger : FAIL`);
  }
}

function displayDeviceProp(value: audio.AudioDeviceDescriptor, index: int, array: audio.AudioDeviceDescriptors) {
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
  }
  else if (value.deviceType == audio.DeviceType.HDMI) {
    devTypeName = 'HDMI';
  } else if (value.deviceType == audio.DeviceType.LINE_DIGITAL) {
    devTypeName = 'LINE_DIGITAL';
  }
  else if (value.deviceType == audio.DeviceType.REMOTE_DAUDIO) {
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
      Utils.msSleep(1000);
      await getAudioManager();
      await getVolumeGroupManager();
      console.log('TestLog: Start Testing AudioFrameworkTest Interfaces');
    })

    beforeEach(async () => {
      console.info(`${TagFrmwk}: beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(100);
    })

    afterEach(async () => {
      console.info(`${TagFrmwk}: afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(100);
    })

    afterAll(() => {
      console.info(`${TagFrmwk}: afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_STATIC_0400
     * @tc.desc   getVolumeSync - audio.AudioVolumeType.RINGTONE_Parameter - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETVOLUMESYNC_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let data = audioVolumeGroupManager.getVolumeSync(audio.AudioVolumeType.RINGTONE);
        console.info(`${TagFrmwk}: Media getVolumeSync : success :${data}`);
        expect(true).assertTrue();
        done();
      } catch (err: BusinessError) {
        console.info(`${TagFrmwk}: err : ${err.message},Code:${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_STATIC_0100
     * @tc.desc   getMinVolumeSync - Media - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      } catch (err: BusinessError) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_STATIC_0500
     * @tc.desc   getMinVolumeSync - Media - audio.AudioVolumeType.RINGTONE_Parameter - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMINVOLUMESYNC_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let data = audioVolumeGroupManager.getMinVolumeSync(audio.AudioVolumeType.RINGTONE);
        console.log('getMinVolumeSync success');
        expect(true).assertTrue();
        done();
      } catch (err: BusinessError) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_STATIC_0100
     * @tc.desc   getMaxVolumeSync - Media - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let data = audioVolumeGroupManager.getMaxVolumeSync(audio.AudioVolumeType.MEDIA);
        if (data == maxVol) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(true).assertTrue();
        } else if (data == maxVolPc) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err: BusinessError) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_STATIC_0400
     * @tc.desc   getMaxVolumeSync - Media - audio.AudioVolumeType.ALARM_Parameter - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETMAXVOLUMESYNC_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let data = audioVolumeGroupManager.getMaxVolumeSync(audio.AudioVolumeType.ALARM);
        console.log('getMaxVolumeSync success');
        expect(true).assertTrue();
        done();
      } catch (err: BusinessError) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_STATIC_0400
     * @tc.desc   isMuteSync - Media - audio.AudioVolumeType.ACCESSIBILITY_Parameter - success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_ISMUTESYNC_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let data = audioVolumeGroupManager.isMuteSync(audio.AudioVolumeType.ACCESSIBILITY);
        console.log('isMuteSync success');
        expect(true).assertTrue();
        done();
      } catch (err: BusinessError) {
        console.log('err :' + JSON.stringify(err.message) + 'Code:' + err.code);
        expect(Number(err.code)).assertEqual(401);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_STATIC_0500
     * @tc.desc   isMuteSync - Media - Sync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_VOLUME_GROUP_MANAGER_GETRINGMODESYNC_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let data: audio.AudioRingMode = audioVolumeGroupManager.getRingerModeSync();
        if (data == audio.AudioRingMode.RINGER_MODE_SILENT) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(data).assertEqual(audio.AudioRingMode.RINGER_MODE_SILENT);     
        } else if (data == audio.AudioRingMode.RINGER_MODE_VIBRATE) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(data).assertEqual(audio.AudioRingMode.RINGER_MODE_VIBRATE);
        } else if (data == audio.AudioRingMode.RINGER_MODE_NORMAL) {
          console.info(`${TagFrmwk}: Media getVolumeSync : PASS :${data}`);
          expect(data).assertEqual(audio.AudioRingMode.RINGER_MODE_NORMAL);
        } else {
          console.info(`${TagFrmwk}: Media getVolumeSync : FAIL :${data}`);
          expect(false).assertTrue();          
        }
        done();
      } catch (err: BusinessError) {
        console.log('err :' + JSON.stringify(err.message));
        expect(false).assertTrue();        
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIOCAPTURER_STATECHANGE_PERIODREACH_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIOCAPTURER_STATECHANGE_PERIODREACH_STATIC_0100
     * @tc.desc   on_off_statechange_periodreach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIOCAPTURER_STATECHANGE_PERIODREACH_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      };

      let audioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      };

      let audioCapturerOptions:audio.AudioCapturerOptions = {
        streamInfo: audioStreamInfo,
        capturerInfo: audioCapturerInfo
      };

      let audioCapturer: audio.AudioCapturer | null;

      audio.createAudioCapturer(audioCapturerOptions).then((data) => {
        audioCapturer = data;
        console.info('AudioCapturer Created : SUCCESS');
        data!.getCapturerInfo().then((audioParamsGet: audio.AudioCapturerInfo) => {
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
        }).catch((err: Error) => {
          console.error(`AudioFrameworkRecLog: CapturerInfo :ERROR: ${err}`);
        })
        let periodReachCallback = (position: long) => {
          if (position == 1000) {
            console.info('ON Triggered successfully');
          }
        };
        data!.onPeriodReach(1000, periodReachCallback);
        data!.offPeriodReach(periodReachCallback);
        let stateChangeCallback = (state: audio.AudioState) => {
          if (state == 1) {
            console.info('audio renderer state is: STATE_PREPARED');
          }
          if (state == 2) {
            console.info('audio renderer state is: STATE_RUNNING');
          }
        };
        data!.onStateChange(stateChangeCallback);
        data!.offStateChange(stateChangeCallback);
        let readDataCallback = (value: ArrayBuffer) => {
          console.info(`read valus: ${value}`);
        };
        data!.onReadData(readDataCallback);
        console.info('Capturer readData on success.');
        data!.offReadData(readDataCallback);
        console.info('Capturer readData of success.');
        data!.release().then(() => {
          console.info('AudioFrameworkRecLog: ---------RELEASE RECORD---------');
          console.info('AudioFrameworkRecLog: Capturer release : SUCCESS');
          console.info(`AudioFrameworkRecLog: AudioCapturer : STATE : ${audioCapturer!.state}`);
        }).catch((err: Error) => {
          console.error(`AudioFrameworkRecLog: Capturer stop: ERROR: ${err}`);
          expect(true).assertFalse();
        });
      }).catch((err: Error) => {
        console.error(`AudioCapturer Created : ERROR : ${err}`);
        expect(true).assertFalse();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIOCAPTURER_STATECHANGE_PERIODREACH_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIOCAPTURER_STATECHANGE_PERIODREACH_STATIC_0200
     * @tc.desc   on_off_statechange_periodreach
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIOCAPTURER_STATECHANGE_PERIODREACH_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {   
        let audioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        };
  
        let audioCapturerInfo: audio.AudioCapturerInfo = {
          source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
          capturerFlags: 0
        };
  
        let audioCapturerOptions:audio.AudioCapturerOptions = {
          streamInfo: audioStreamInfo,
          capturerInfo: audioCapturerInfo
        };
  
        let audioCapturer: audio.AudioCapturer | null;
  
        audioCapturer = await audio.createAudioCapturer(audioCapturerOptions);
          
        let periodReachCallback = (position: long) => {
          if (position == 1000) {
            console.info('ON Triggered successfully');
          }
        };
        audioCapturer?.onPeriodReach(1000, periodReachCallback);
        audioCapturer?.offPeriodReach();

        let stateChangeCallback = (state: audio.AudioState) => {
          if (state == 1) {
            console.info('audio renderer state is: STATE_PREPARED');
          }
          if (state == 2) {
            console.info('audio renderer state is: STATE_RUNNING');
          }
        };
        audioCapturer?.onStateChange(stateChangeCallback);
        audioCapturer?.offStateChange();

        let readDataCallback = (value: ArrayBuffer) => {
          console.info(`read valus: ${value}`);
        };
        audioCapturer?.onReadData(readDataCallback);
        console.info('Capturer readData on success.');
        audioCapturer?.offReadData();
        console.info('Capturer readData of success.');
        
        await audioCapturer!.release();
      } catch (err: BusinessError) {
        console.error(`AudioFrameworkRecLog: Capturer stop: ERROR: ${err}`);
        expect(true).assertFalse();
      }      
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0100
     * @tc.desc   InterruptType - INTERRUPT_TYPE_BEGIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptType.INTERRUPT_TYPE_BEGIN == 1).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0200
     * @tc.desc   InterruptType - INTERRUPT_TYPE_END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptType.INTERRUPT_TYPE_END == 2).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0300
     * @tc.desc   InterruptHint - INTERRUPT_HINT_NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptHint.INTERRUPT_HINT_NONE == 0).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0400
     * @tc.desc   InterruptHint - INTERRUPT_HINT_RESUME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptHint.INTERRUPT_HINT_RESUME == 1).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0500
     * @tc.desc   InterruptHint - INTERRUPT_HINT_PAUSE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptHint.INTERRUPT_HINT_PAUSE == 2).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0600
     * @tc.desc   InterruptHint - INTERRUPT_HINT_STOP
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptHint.INTERRUPT_HINT_STOP == 3).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0700
     * @tc.desc   InterruptHint - INTERRUPT_HINT_DUCK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptHint.INTERRUPT_HINT_DUCK == 4).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0800
     * @tc.desc   InterruptHint - INTERRUPT_HINT_UNDUCK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptHint.INTERRUPT_HINT_UNDUCK == 5).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0900
     * @tc.desc   InterruptForceType - INTERRUPT_FORCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptForceType.INTERRUPT_FORCE == 0).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_1000
     * @tc.desc   InterruptForceType - INTERRUPT_SHARE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptForceType.INTERRUPT_SHARE == 1).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_1300
     * @tc.desc   InterruptHint - INTERRUPT_HINT_UNDUCK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect(audio.InterruptHint.INTERRUPT_HINT_MUTE).assertEqual(6);
      await Utils.msSleep(50);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_1400
     * @tc.desc   InterruptHint - INTERRUPT_HINT_UNDUCK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      expect(audio.InterruptHint.INTERRUPT_HINT_UNMUTE).assertEqual(7);
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0013
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0013
     * @tc.desc   InterruptHint - INTERRUPT_HINT_MUTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptHint.INTERRUPT_HINT_MUTE).assertEqual(6);
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0014
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0014
     * @tc.desc   InterruptHint - INTERRUPT_HINT_UNMUTE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_INTERRUPT_STATIC_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.InterruptHint.INTERRUPT_HINT_UNMUTE).assertEqual(7);
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICETYPE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICETYPE_STATIC_0100
     * @tc.desc   DeviceType - ALL Device Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICETYPE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.DeviceType.INVALID == 0).assertTrue();
      console.info("audio.DeviceType.INVALID:" + audio.DeviceType.INVALID);
      expect(audio.DeviceType.EARPIECE == 1).assertTrue();
      console.info("audio.DeviceType.EARPIECE:" + audio.DeviceType.EARPIECE);
      expect(audio.DeviceType.SPEAKER == 2).assertTrue();
      console.info("audio.DeviceType.SPEAKER:" + audio.DeviceType.SPEAKER);
      expect(audio.DeviceType.WIRED_HEADSET == 3).assertTrue();
      console.info("audio.DeviceType.WIRED_HEADSET:" + audio.DeviceType.WIRED_HEADSET);
      expect(audio.DeviceType.WIRED_HEADPHONES == 4).assertTrue();
      console.info("audio.DeviceType.WIRED_HEADPHONES:" + audio.DeviceType.WIRED_HEADPHONES);
      expect(audio.DeviceType.BLUETOOTH_SCO == 7).assertTrue();
      console.info("audio.DeviceType.BLUETOOTH_SCO:" + audio.DeviceType.BLUETOOTH_SCO);
      expect(audio.DeviceType.BLUETOOTH_A2DP == 8).assertTrue();
      console.info("audio.DeviceType.BLUETOOTH_A2DP:" + audio.DeviceType.BLUETOOTH_A2DP);
      expect(audio.DeviceType.MIC == 15).assertTrue();
      console.info("audio.DeviceType.MIC:" + audio.DeviceType.MIC);
      expect(audio.DeviceType.USB_HEADSET == 22).assertTrue();
      console.info("audio.DeviceType.USB_HEADSET:" + audio.DeviceType.USB_HEADSET);
      expect(audio.DeviceType.DISPLAY_PORT == 23).assertTrue();
      console.info("audio.DeviceType.DISPLAY_PORT:" + audio.DeviceType.DISPLAY_PORT);
      expect(audio.DeviceType.USB_DEVICE == 25).assertTrue();
      console.info("audio.DeviceType.USB_DEVICE:" + audio.DeviceType.USB_DEVICE);
      expect(audio.DeviceType.HEARING_AID).assertEqual(30);
      console.info("audio.DeviceType.HEARING_AID:" + audio.DeviceType.HEARING_AID);
      expect(audio.DeviceType.NEARLINK).assertEqual(31);
      console.info("audio.DeviceType.NEARLINK:" + audio.DeviceType.NEARLINK);
      expect(audio.DeviceType.DEFAULT == 1000).assertTrue();
      console.info("audio.DeviceType.DEFAULT:" + audio.DeviceType.DEFAULT);
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_SCENE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_SCENE_STATIC_0100
     * @tc.desc   DeviceRole - ALL Device Role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_SCENE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA).assertEqual(0);
      console.info("audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA :" + audio.AudioSessionScene.AUDIO_SESSION_SCENE_MEDIA);
      expect(audio.AudioSessionScene.AUDIO_SESSION_SCENE_GAME).assertEqual(1);
      console.info("audio.AudioSessionScene.AUDIO_SESSION_SCENE_GAME :" + audio.AudioSessionScene.AUDIO_SESSION_SCENE_GAME);
      expect(audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION).assertEqual(2);
      console.info("audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION :" + audio.AudioSessionScene.AUDIO_SESSION_SCENE_VOICE_COMMUNICATION);
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_STATIC_0100
     * @tc.desc   DeviceRole - ALL Device Role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SESSION_STATE_CHANGE_HINT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_DEVICE_RECOMMENDEDACTION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICE_RECOMMENDEDACTION_STATIC_0100
     * @tc.desc   DeviceRole - ALL Device Role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICE_RECOMMENDEDACTION_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_CONTINUE).assertEqual(0);
      console.info("audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_CONTINUE :" + audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_CONTINUE);
      expect(audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_STOP).assertEqual(1);
      console.info("audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_STOP :" + audio.OutputDeviceChangeRecommendedAction.DEVICE_CHANGE_RECOMMEND_TO_STOP);
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICEROLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICEROLE_STATIC_0100
     * @tc.desc   DeviceRole - ALL Device Role
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_MANAGER_DEVICEROLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.DeviceRole.INPUT_DEVICE == 1).assertTrue();
      console.info("audio.DeviceRole.INPUT_DEVICE :" + audio.DeviceRole.INPUT_DEVICE);
      expect(audio.DeviceRole.OUTPUT_DEVICE == 2).assertTrue();
      console.info("audio.DeviceRole.OUTPUT_DEVICE :" + audio.DeviceRole.OUTPUT_DEVICE);
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0100
     * @tc.desc   getDevices - Output device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG,
        (err: BusinessError<void> | null, value: audio.AudioDeviceDescriptors | undefined) => {
        // Getting all Output devices Enumb 1 = OUTPUT_DEVICES_FLAG
        console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback: OUTPUT_DEVICES_FLAG: failed to get devices ${err?.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
          if (value !== undefined) {
            value.forEach(displayDeviceProp);
          }

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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0200
     * @tc.desc   getDevices - Input device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG,
        (err: BusinessError<void> | null, value: audio.AudioDeviceDescriptors | undefined) => {
        // Getting all Input Devices ENUM 2 = INPUT_DEVICES_FLAG
        console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback:INPUT_DEVICES_FLAG: failed to get devices ${err?.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
          if (value !== undefined) {
            value.forEach(displayDeviceProp);
          }
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0300
     * @tc.desc   getDevices - ALL device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG, (err: BusinessError<void> | null, value: audio.AudioDeviceDescriptors | undefined) => {
        // Getting all devies connected 3 = ALL_DEVICES_FLAG
        console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback:ALL_DEVICES_FLAG: failed to get devices ${err?.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
          if (value !== undefined) {
            value.forEach(displayDeviceProp);
          }

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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0400
     * @tc.desc   getDevices - Output device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG,
        (err: BusinessError<void> | null, value: audio.AudioDeviceDescriptors | undefined) => {
        console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback:OUTPUT_DEVICES_FLAG:failed to get devices ${err?.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices OUTPUT_DEVICES_FLAG`);
          if (value !== undefined) {
            value.forEach(displayDeviceProp);
          }
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0500
     * @tc.desc   getDevices - Input device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(audio.DeviceFlag.INPUT_DEVICES_FLAG,
        (err: BusinessError<void> | null, value: audio.AudioDeviceDescriptors | undefined) => {
        console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback:INPUT_DEVICES_FLAG: failed to get devices ${err?.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices INPUT_DEVICES_FLAG`);
          if (value !== undefined) {
            value.forEach(displayDeviceProp);
          }
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0600
     * @tc.desc   getDevices - ALL device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      AudioRoutingManager.getDevices(audio.DeviceFlag.ALL_DEVICES_FLAG,
        (err: BusinessError<void> | null, value: audio.AudioDeviceDescriptors | undefined) => {
        console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
        if (err) {
          console.error(`${TagFrmwk}: Callback: ALL_DEVICES_FLAG: failed to get devices ${err?.message}`);
          expect().assertFail();
        } else {
          console.info(`${TagFrmwk}: Callback: getDevices ALL_DEVICES_FLAG`);
          if (value !== undefined) {
            value.forEach(displayDeviceProp);
          }
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0700
     * @tc.desc   getDevices - OUTPUT device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0800
     * @tc.desc   getDevices - INPUT device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0900
     * @tc.desc   getDevices - ALL device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_DEVICEFALG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_DEVICEFALG_STATIC_0100
     * @tc.desc   NONE_DEVICES_FLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_DEVICEFALG_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.DeviceFlag.OUTPUT_DEVICES_FLAG == 1).assertTrue();
      expect(audio.DeviceFlag.INPUT_DEVICES_FLAG == 2).assertTrue();
      expect(audio.DeviceFlag.ALL_DEVICES_FLAG == 3).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_SAMPLE_FORMAT_F32LE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_SAMPLE_FORMAT_F32LE_STATIC_0100
     * @tc.desc   SAMPLE_FORMAT_F32LE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_SAMPLE_FORMAT_F32LE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      expect(audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE == 4).assertTrue();
      await Utils.msSleep(50);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_STATIC_0100
     * @tc.desc   getDevices - OUTPUT device - getDevicesSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_STATIC_0400
     * @tc.desc   getDevicesSync - ErrorCode - audio.DeviceFlag.INPUT_DEVICES_FLAG-Parameters - Success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ROUTING_MANAGER_GETDEVICES_SYNC_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioRoutingManager = audioManager.getRoutingManager();
      try {
        let value = AudioRoutingManager.getDevicesSync(audio.DeviceFlag.INPUT_DEVICES_FLAG);
        console.info(`${TagFrmwk}: getDevicesSync Success,value: ${value}`);
        done();
      } catch (error: BusinessError) {
        console.info(`${TagFrmwk}: getDevicesSync Fail,error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETSPATIALIZATIONMANAGER_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETSPATIALIZATIONMANAGER_STATIC_0100
     * @tc.desc   OFF_VOLUMECHANGE 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GETSPATIALIZATIONMANAGER_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let audioSpatializationManager: audio.AudioSpatializationManager = audio.getAudioManager().getSpatializationManager();
        let isSpatializationEnabledForCurrentDevice: boolean = audioSpatializationManager.isSpatializationEnabledForCurrentDevice();
        console.info(`AudioSpatializationManager isSpatializationEnabledForCurrentDevice: ${isSpatializationEnabledForCurrentDevice}`);
      } catch (error: BusinessError) {
        console.info(`Fail, error:${error},ErrorCode:${error.code},${typeof (error.code)}`);
        expect(false).assertTrue();
      }
      expect(true).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_STATIC_0100
     * @tc.desc   isAcousticEchoCancelerSupported -
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ISACOUSTICECHOCANCELERSUPPORTED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_STATIC_0100
     * @tc.desc   enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_ISSTREAMACTIVE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let ret: boolean = audio.getAudioManager().getStreamManager().isStreamActive(audio.StreamUsage.STREAM_USAGE_MUSIC);
        done();
      } catch (err: BusinessError) {
        console.error(`isStreamActive ERROR: ${err}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETVOLUMNBYSTREAM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETVOLUMNBYSTREAM_STATIC_0100
     * @tc.desc   enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GETVOLUMNBYSTREAM_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      try {
        let ret: int = audio.getAudioManager().getVolumeManager().getVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
      } catch (err: BusinessError) {
        console.error(`getVolumeByStream ERROR: ${err}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETMAXVOLUMNBYSTREAM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETMAXVOLUMNBYSTREAM_STATIC_0100
     * @tc.desc   enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GETMAXVOLUMNBYSTREAM_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      try {
        let ret: int = audio.getAudioManager().getVolumeManager().getMaxVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
      } catch (err: BusinessError) {
        console.error(`getMaxVolumeByStream ERROR: ${err}`);
        expect(false).assertTrue();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GETMINVOLUMNBYSTREAM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GETMINVOLUMNBYSTREAM_STATIC_0100
     * @tc.desc   enable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_GETMINVOLUMNBYSTREAM_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      try {
        let ret: int = audio.getAudioManager().getVolumeManager().getMinVolumeByStream(audio.StreamUsage.STREAM_USAGE_MUSIC);
      } catch (err: BusinessError) {
        console.error(`getMinVolumeByStream ERROR: ${err}`);
        expect(false).assertTrue();
      }
    })
  })
}
