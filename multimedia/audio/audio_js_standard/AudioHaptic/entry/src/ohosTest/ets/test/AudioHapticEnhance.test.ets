/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import audioHaptic from '@ohos.multimedia.audioHaptic';
import common from '@ohos.app.ability.common';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import fs from '@ohos.file.fs';
import { systemSoundManager } from '@kit.AudioKit';

let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

interface AudioHapticPlayerOptions {
  muteAudio: boolean,
  muteHaptics: boolean
}

enum AudioHapticErrorCode {
  OPEEATION_NOT_ALLOWED = 5400102,
  IO_ERROR = 5400103
}

enum SystemSoundManagerErrorCode {
  PARAMETER_INCORRECT = 5400108,
  CRASH_OR_BLOCKING_ERR = 5400105
}

enum SystemSoundTypeTest {
  PHOTO_SHUTTER_TEST = 0,
  VIDEO_RECORDING_BEGIN_TEST = 1,
  VIDEO_RECORDING_END_TEST = 2
}

async function RegisterSource() {
    let tag = 'AudioHapticEnhanceTest';
    let AudioHapticManager: audioHaptic.AudioHapticManager | ESObject = audioHaptic.getAudioHapticManager();
    let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;

    let Notification_Audio_Uri: string = 'data/audioTest.wav';
    let Notificatio_Haptic_Uri: string = 'data/hapticTest.json';
    let Ringtone_Audio_Uri: string = 'data/ringtone.wav';
    let Ringtone_Haptic_Uri: string = 'data/ringtone.json';

    let AudioHapticPlayer: audioHaptic.AudioHapticPlayer;
    let sourceId_Notification = 0;
    let sourceId_Ringtone = 0;

    let resourceFile = async (resourcePath: string) => {
      // 1.读取文件
      let uint8Array: Uint8Array = testContext.resourceManager.getRawFileContentSync(resourcePath);
      let fileName = resourcePath.substring(resourcePath.lastIndexOf('/') + 1);
      console.log(`${tag} fileName:${fileName}`);
      // 2.创建沙箱文件
      let filePath = testContext.filesDir + '/' + fileName;
      if (fs.accessSync(filePath)) {
        fs.unlinkSync(filePath);
      }
      let file: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      // 3.resource下文件写入沙箱文件
      fs.writeSync(file.fd, uint8Array.buffer);
      // 4.关闭文件
      fs.closeSync(file);
      console.log(`${tag} filePath:${filePath}`);
      return filePath;
    }

    try {
    Notification_Audio_Uri = await resourceFile('notification.ogg');
    Notificatio_Haptic_Uri = await resourceFile('notification.json');
    Ringtone_Audio_Uri = await resourceFile('ringtone.ogg');
    Ringtone_Haptic_Uri = await resourceFile('ringtone.json');
    console.log(`${tag} Notification_Audio_Uri:  ${Ringtone_Audio_Uri}`);
    console.log(`${tag} Ringtone_Haptic_Uri : ${Ringtone_Haptic_Uri}`);
    console.log(`${tag} Notification_Audio_Uri : ${Notification_Audio_Uri}`);
    console.log(`${tag} Notificatio_Haptic_Uri${Notificatio_Haptic_Uri}`);

    } catch (error) {
    console.log(`${tag} registerSource fail: Ringtone_Audio_Uri: ${error}`);
    }
    sourceId_Notification = await AudioHapticManager.registerSource(Notification_Audio_Uri, Notificatio_Haptic_Uri);
}

export default function AudioHapticTest() {
  describe('AudioHapticEnhanceTest', () => {
    let tag = 'AudioHapticEnhanceTest';
    let testContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;

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
      await getPermission();
      await driveFn();
      await sleep(1000);
      console.log(`beforeall come in`);
    })
    beforeEach(() => {
      console.log(`beforeEach come in`);
    })
    afterEach(async () => {
      console.log(`afterEach come in`);
    })
    afterAll(() => {
      console.log(`afterAll come in`);
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_ERROR_0100
     * @tc.desc   SETAUDIOLATENCYMODE_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_ERROR_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioHapticManagerInstance: audioHaptic.AudioHapticManager = audioHaptic.getAudioHapticManager();
        let latencyMode: audioHaptic.AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
        let id: number = 0;
        audioHapticManagerInstance.setAudioLatencyMode(id, latencyMode);
        expect(false).assertTrue();
      } catch(error) {
        console.log(`${tag}, setAudioLatencyMode ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(AudioHapticErrorCode.OPEEATION_NOT_ALLOWED);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_ERROR_0100
     * @tc.desc   SETSTREAMUSAGE_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_ERROR_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioHapticManagerInstance: audioHaptic.AudioHapticManager = audioHaptic.getAudioHapticManager();
        let usage: audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_NOTIFICATION;
        let id: number = 0;
        audioHapticManagerInstance.setStreamUsage(id, usage);
        expect(false).assertTrue();
      } catch(error) {
        console.log(`${tag}, setStreamUsage ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(AudioHapticErrorCode.OPEEATION_NOT_ALLOWED);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_ERROR_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_ERROR_0100
     * @tc.desc   CREATEPLAYER_ERROR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_ERROR_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioHapticManagerInstance: audioHaptic.AudioHapticManager = audioHaptic.getAudioHapticManager();
      let options: audioHaptic.AudioHapticPlayerOptions = {muteAudio: false, muteHaptics: false};
      let audioHapticPlayerInstance: audioHaptic.AudioHapticPlayer | undefined = undefined;
      let id: number = 0;
      audioHapticManagerInstance.createPlayer(id, options).then((value: audioHaptic.AudioHapticPlayer) => {
        audioHapticPlayerInstance = value;
        console.info(`Create the audio haptic player successfully.`);
        expect(false).assertTrue();
      }).catch ((error: BusinessError) => {
        console.log(`${tag}, createPlayer ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(AudioHapticErrorCode.OPEEATION_NOT_ALLOWED);
        done();
      });
    })


    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_TYPE_0001
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_TYPE_0001
     * @tc.desc   SystemSoundType Enum
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_TYPE_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      expect(systemSoundManager.SystemSoundType.PHOTO_SHUTTER).assertEqual(SystemSoundTypeTest.PHOTO_SHUTTER_TEST);
      console.info(`AUDIO_RINGTONE_PUBLIC_PLAY_TYPE_0001 PHOTO_SHUTTER is:${systemSoundManager.SystemSoundType.PHOTO_SHUTTER}`);

      expect(systemSoundManager.SystemSoundType.VIDEO_RECORDING_BEGIN).assertEqual(SystemSoundTypeTest.VIDEO_RECORDING_BEGIN_TEST);
      console.info(`AUDIO_RINGTONE_PUBLIC_PLAY_TYPE_0001 VIDEO_RECORDING_BEGIN is:${systemSoundManager.SystemSoundType.VIDEO_RECORDING_BEGIN}`);

      expect(systemSoundManager.SystemSoundType.VIDEO_RECORDING_END).assertEqual(SystemSoundTypeTest.VIDEO_RECORDING_END_TEST);
      console.info(`AUDIO_RINGTONE_PUBLIC_PLAY_TYPE_0001 VIDEO_RECORDING_END is:${systemSoundManager.SystemSoundType.VIDEO_RECORDING_END}`);

      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0001
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0001
     * @tc.desc   SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }

        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.PHOTO_SHUTTER;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0001 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0001 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0001 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0001 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0001 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0001 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0001 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0001 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0001 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0002
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0002
     * @tc.desc   Parameter Check Load Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.PHOTO_SHUTTER;
        let errorType: ESObject = 3;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(errorType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0002 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0002 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0002 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0002 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0002 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0002 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0002 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0002 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0002 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0003
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0003
     * @tc.desc   Parameter Check Play Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.PHOTO_SHUTTER;
        let errorType: ESObject = 3;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0003 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0003 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(errorType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0003 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0003 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0003 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0003 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0003 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0003 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0003 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0004
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0004
     * @tc.desc   Parameter Check Unload Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.PHOTO_SHUTTER;
        let errorType: ESObject = 3;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0004 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0004 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0004 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0004 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(errorType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0004 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0004 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0004 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0004 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0004 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0005
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0005
     * @tc.desc   SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_BEGIN;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0005 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0005 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0005 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0005 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0005 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0005 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0005 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0005 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0005 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0006
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0006
     * @tc.desc   Parameter Check Load Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_BEGIN;
        let errorType: ESObject = 3;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(errorType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0006 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0006 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0006 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0006 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0006 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0006 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0006 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0006 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0006 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0007
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0007
     * @tc.desc   Parameter Check Play Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_BEGIN;
        let errorType: ESObject = 3;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0007 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0007 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(errorType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0007 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0007 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0007 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0007 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0007 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0007 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0007 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0008
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0008
     * @tc.desc   Parameter Check Unload Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_BEGIN;
        let errorType: ESObject = 3;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0008 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0008 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0008 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0008 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(errorType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0008 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0008 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0008 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0008 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0008 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0009
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0009
     * @tc.desc   SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_END;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0009 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0009 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0009 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0009 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0009 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0009 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0009 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0009 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0009 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0010
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0010
     * @tc.desc   Parameter Check Load Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_END;
        let errorType: ESObject = 3;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(errorType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0010 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0010 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0010 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0010 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0010 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0010 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0010 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0010 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0010 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0011
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0011
     * @tc.desc   Parameter Check Play Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_END;
        let errorType: ESObject = 3;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0011 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0011 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(errorType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0011 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0011 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0011 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0011 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0011 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0011 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0011 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0012
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0012
     * @tc.desc   Parameter Check Unload Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_END;
        let errorType: ESObject = 3;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0012 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0012 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0012 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0012 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(errorType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0012 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0012 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0012 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0012 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0012 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.PARAMETER_INCORRECT);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0013
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0013
     * @tc.desc   Service Died
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.PHOTO_SHUTTER;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0013 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0013 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0013 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0013 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0013 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0014
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0014
     * @tc.desc   Service Died
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_BEGIN;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0014 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0014 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0014 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0014 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0014 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0015
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0015
     * @tc.desc   Service Died
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_END;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0015 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0015 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0015 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0015 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        });
       
      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0015 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0016
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0016
     * @tc.desc   Service Died
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.PHOTO_SHUTTER;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0016 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0016 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0016 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0016 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0016 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0016 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        });

      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0016 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0017
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0017
     * @tc.desc   Service Died
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_BEGIN;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0017 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0017 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0017 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0017 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0017 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0017 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        });

      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0017 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0018
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0018
     * @tc.desc   Service Died
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_END;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0018 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0018 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0018 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0018 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0018 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0018 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        });

      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0018 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0019
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0019
     * @tc.desc   Service Died
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.PHOTO_SHUTTER;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0019 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0019 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0019 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0019 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0019 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0019 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0019 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0019 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        });

      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0019 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0020
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0020
     * @tc.desc   Service Died
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_BEGIN;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0020 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0020 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0020 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0020 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0020 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0020 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0020 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0020 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        });

      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0020 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        done();
      }
      done();
    })

    /**
     * @tc.name   AUDIO_RINGTONE_PUBLIC_PLAY_0021
     * @tc.number AUDIO_RINGTONE_PUBLIC_PLAY_0021
     * @tc.desc   Service Died
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("AUDIO_RINGTONE_PUBLIC_PLAY_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let audioManager: audio.AudioManager = audio.getAudioManager();
        let audioRoutingManager: audio.AudioRoutingManager = audioManager.getRoutingManager();
        let outputDeviceDescription = await audioRoutingManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
        let flag: boolean = false;

        if (outputDeviceDescription.length == 1 && outputDeviceDescription[0].deviceType == audio.DeviceType.SPEAKER) {
          flag = true;
        }
        if (flag){
          done();
          return;
        }
        let systemSoundPlayer: systemSoundManager.SystemSoundPlayer | null = null;
        let systemSoundType: systemSoundManager.SystemSoundType = systemSoundManager.SystemSoundType.VIDEO_RECORDING_END;
        let data = await systemSoundManager.createSystemSoundPlayer();
        systemSoundPlayer = data;

        await systemSoundPlayer?.load(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0021 Succeeded in calling the load method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0021 Failed to call the load method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.play(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0021 Succeeded in calling the play method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0021 Failed to call the play method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.release().then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0021 Succeeded in calling the release method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0021 Failed to call the release method. Code: ${err.code}, message: ${err.message}`);
           expect(false).assertTrue();
        });

        await systemSoundPlayer?.unload(systemSoundType).then(() => {
        console.info('AUDIO_RINGTONE_PUBLIC_PLAY_0021 Succeeded in calling the unload method.');
        }).catch((err: BusinessError) => {
           console.error(`AUDIO_RINGTONE_PUBLIC_PLAY_0021 Failed to call the unload method. Code: ${err.code}, message: ${err.message}`);
           expect(Number(err.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        });

      } catch(error) {
        console.log(`${tag}, AUDIO_RINGTONE_PUBLIC_PLAY_0021 ERROR, code: ${error.code}, message: ${error.message}`);
        expect(Number(error.code)).assertEqual(SystemSoundManagerErrorCode.CRASH_OR_BLOCKING_ERR);
        done();
      }
      done();
    })
  })
}