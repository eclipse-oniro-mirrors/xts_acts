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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_ERROR_0100
     * @tc.name      : SETAUDIOLATENCYMODE_ERROR
     * @tc.desc      : SETAUDIOLATENCYMODE_ERROR
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_ERROR_0100
     * @tc.name      : SETSTREAMUSAGE_ERROR
     * @tc.desc      : SETSTREAMUSAGE_ERROR
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_ERROR_0100
     * @tc.name      : CREATEPLAYER_ERROR
     * @tc.desc      : CREATEPLAYER_ERROR
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
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
  })
}