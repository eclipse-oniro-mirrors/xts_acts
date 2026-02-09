/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from '../../../hypium/index';
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
import Utils from './Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement'

let sleep = (ms: int): Promise<string> => {
  return new Promise<string>((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

interface AudioHapticPlayerOptions {
  muteAudio: boolean,
  muteHaptics: boolean
}

export default function AudioHapticTest() {
  describe('AudioHapticTest', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string;
    let tag = 'AudioHapticTest:';
    let AudioHapticManager: audioHaptic.AudioHapticManager = audioHaptic.getAudioHapticManager();
    let testContext: common.UIAbilityContext | undefined;

    let resourceFile = async (resourcePath: string): Promise<string> => {
      // 1.读取文件
      let uint8Array: Uint8Array = testContext!.resourceManager.getRawFileContentSync(resourcePath);
      let fileName = resourcePath.substring(resourcePath.lastIndexOf('/') + 1);
      console.log(`${tag} fileName:${fileName}`);
      // 2.创建沙箱文件
      filePath = filesDir + '/' + fileName;
      if (fs.accessSync(filePath)) {
        fs.unlinkSync(filePath);
      }
      let file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      // 3.resource下文件写入沙箱文件
      fs.writeSync(file.fd, uint8Array.buffer);
      // 4.关闭文件
      fs.closeSync(file);
      console.log(`${tag} filePath:${filePath}`);
      return filePath;
    }
    let Notification_Audio_Uri: string = 'data/audioTest.wav';
    let Notificatio_Haptic_Uri: string = 'data/hapticTest.json';
    let Ringtone_Audio_Uri: string = 'data/ringtone.wav';
    let Ringtone_Haptic_Uri: string = 'data/ringtone.json';

    let AudioHapticPlayer: audioHaptic.AudioHapticPlayer;
    let sourceId_Notification = 0;
    let sourceId_Ringtone = 0;

    let driveFn = async () => {
      let dr = Driver.create();
      await sleep(1000);
      let power = await dr.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      await sleep(1000);
      if (power != null) {
        await power.click();
      }
    }

    let getPermission = () => {
      let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
      let permissions: Array<Permissions> = ['ohos.permission.MICROPHONE'];
      atManager.requestPermissionsFromUser(testContext!, permissions,
        (err: BusinessError | null, data: PermissionRequestResult | undefined) => {
          console.info("request success permissions" + JSON.stringify(data));
          console.info("getPermissionRequestResult err", JSON.stringify(err));
        })
    }

    beforeAll(async () => {
      console.log(`beforeall come in`);
      testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      filesDir = testContext!.filesDir as string | undefined | null;

      getPermission();
      driveFn();
      await sleep(1000);

      try {
        console.log(`${tag} Notification_Audio_Uri:  ${Notification_Audio_Uri}`)
        Notification_Audio_Uri = await resourceFile('notification.ogg');
        console.log(`${tag} Notification_Audio_Uri:  ${Notification_Audio_Uri}`)
        Notificatio_Haptic_Uri = await resourceFile('notification.json');
        console.log(`${tag} Notification_Audio_Uri:  ${Ringtone_Audio_Uri}`)
        Ringtone_Audio_Uri = await resourceFile('ringtone.ogg');
        console.log(`${tag} Notification_Audio_Uri:  ${Ringtone_Audio_Uri}`)
        Ringtone_Haptic_Uri = await resourceFile('ringtone.json');
        console.log(`${tag} Notification_Audio_Uri:  ${Ringtone_Audio_Uri}`);
        console.log(`${tag} Ringtone_Haptic_Uri : ${Ringtone_Haptic_Uri}`);
        console.log(`${tag} Notification_Audio_Uri : ${Notification_Audio_Uri}`);
        console.log(`${tag} Notificatio_Haptic_Uri${Notificatio_Haptic_Uri}`);

      } catch (error) {
        console.log(`${tag} registerSource fail: Ringtone_Audio_Uri: ${error}`);
      }
      sourceId_Notification = await (AudioHapticManager as audioHaptic.AudioHapticManager).registerSource(Notification_Audio_Uri, Notificatio_Haptic_Uri);
      console.log(`beforeall sourceId_Notification : ${sourceId_Notification}`);
      sourceId_Ringtone = await (AudioHapticManager as audioHaptic.AudioHapticManager).registerSource(Ringtone_Audio_Uri, Ringtone_Haptic_Uri);
      console.log(`beforeall sourceId_Notification : ${sourceId_Ringtone}`);
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
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_STATIC_0100
     * @tc.desc   registerSource_Ringtone_URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        let data = await AudioHapticManager.registerSource(Ringtone_Audio_Uri, Ringtone_Haptic_Uri);
        try {
          console.log(`${tag} registerSource success: Ringtone_Audio_Uri: ${JSON.stringify(Ringtone_Audio_Uri)}, Ringtone_Haptic_Uri:${Ringtone_Haptic_Uri}`);
          console.log(`${tag} registerSource success: sourceId: ${JSON.stringify(data)}`);
          expect(true).assertTrue();
          done()
        } catch(err) {
          console.log(`${tag} registerSource fail: Ringtone_Audio_Uri: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (error) {
        console.log(`${tag} registerSource error: ${JSON.stringify(error)}, ${(error as BusinessError).code}`);
        expect(false).assertTrue();
        done()
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_STATIC_0200
     * @tc.desc   registerSource_notification_URI
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        const data = await AudioHapticManager.registerSource(Notification_Audio_Uri, Notificatio_Haptic_Uri);
        try {
          console.log(`${tag} registerSource success: Notification_Audio_Uri: ${JSON.stringify(Notification_Audio_Uri)}, Notificatio_Haptic_Uri:${Notificatio_Haptic_Uri}`);
          console.log(`${tag} registerSource success: sourceId: ${JSON.stringify(data)}`);
          expect(true).assertTrue();
          done()
        } catch(err) {
          console.log(`${tag} registerSource fail: Notification_Audio_Uri: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (error) {
        console.log(`${tag} registerSource error: ${JSON.stringify(error)}, ${(error as BusinessError).code}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_STATIC_0100
     * @tc.desc   unregisterSource_Notification_Uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const data = await AudioHapticManager.registerSource(Notification_Audio_Uri, Notificatio_Haptic_Uri);
        try {
          console.log(`${tag} registerSource success: Notification_Audio_Uri: ${JSON.stringify(Notification_Audio_Uri)}, Notificatio_Haptic_Uri:${Notificatio_Haptic_Uri}`);
          let sourceId = data;
          console.log(`${tag} registerSource success: sourceId: ${JSON.stringify(sourceId)}`);
          await AudioHapticManager.unregisterSource(sourceId);
          try {
            console.log(`${tag} unregisterSource success: sourceId: ${JSON.stringify(sourceId)}`);
            expect(true).assertTrue();
            done()
          } catch(err) {
            console.log(`${tag} unregisterSource fail: sourceId: ${JSON.stringify(sourceId)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        } catch(err) {
          console.log(`${tag} registerSource fail: Notification_Audio_Uri: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (error) {
        console.log(`${tag} registerSource error: ${JSON.stringify(error)}, ${(error as BusinessError).code}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_STATIC_0200
     * @tc.desc   unregisterSource_Ringtone_Uri
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        const data = await AudioHapticManager.registerSource(Ringtone_Audio_Uri, Ringtone_Haptic_Uri);
        try {
          console.log(`${tag} registerSource success: Ringtone_Uri: ${JSON.stringify(Ringtone_Audio_Uri)}, Notificatio_Haptic_Uri:${Ringtone_Haptic_Uri}`);
          let sourceId = data;
          console.log(`${tag} registerSource success: sourceId: ${JSON.stringify(sourceId)}`);
          await AudioHapticManager.unregisterSource(sourceId);
          try {
            console.log(`${tag} unregisterSource success: sourceId: ${JSON.stringify(sourceId)}`);
            expect(true).assertTrue();
            done()
          } catch(err) {
            console.log(`${tag} unregisterSource fail: sourceId: ${JSON.stringify(sourceId)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        } catch(err) {
          console.log(`${tag} registerSource fail: Ringtone_Uri: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (error) {
        console.log(`${tag} registerSource error: ${JSON.stringify(error)}, ${(error as BusinessError).code}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0100
     * @tc.desc   Notification_setAudioLatencyMode_AUDIO_LATENCY_MODE_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
        AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
        console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setAudioLatencyMode fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0200
     * @tc.desc   Notification_setAudioLatencyMode_AUDIO_LATENCY_MODE_FAST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
        AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
        console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setAudioLatencyMode fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0300
     * @tc.desc   Ringtone_setAudioLatencyMode_AUDIO_LATENCY_MODE_NORMAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
        AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
        console.log(`${tag} setAudioLatencyMode success: sourceId: ${JSON.stringify(AudioLatencyMode)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setAudioLatencyMode fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0400
     * @tc.desc   Ringtone_setAudioLatencyMode_AUDIO_LATENCY_MODE_FAST
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
        AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
        console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setAudioLatencyMode fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0100
     * @tc.desc   setStreamUsage_STREAM_USAGE_MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_MUSIC;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success: ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0200
     * @tc.desc   setStreamUsage_STREAM_USAGE_UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_UNKNOWN;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success: ${JSON.stringify(setStreamUsage)}`);
        expect(false).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0400
     * @tc.desc   setStreamUsage_STREAM_USAGE_VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success: ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0500
     * @tc.desc   setStreamUsage_STREAM_USAGE_VOICE_ASSISTANT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT;
      console.log(`${tag} setStreamUsage STREAM_USAGE_VOICE_ASSISTANT success`);
      try {
        (AudioHapticManager as audioHaptic.AudioHapticManager).setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success: ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0600
     * @tc.desc   setStreamUsage_STREAM_USAGE_ALARM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_ALARM;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success: ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0700
     * @tc.desc   setStreamUsage_STREAM_USAGE_VOICE_MESSAGE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success: ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0800
     * @tc.desc   setStreamUsage_STREAM_USAGE_RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_RINGTONE;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success: ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0900
     * @tc.desc   setStreamUsage_STREAM_USAGE_NOTIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_NOTIFICATION;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success:  ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1000
     * @tc.desc   setStreamUsage_STREAM_USAGE_ACCESSIBILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success: ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1100
     * @tc.desc   setStreamUsage_STREAM_USAGE_MOVIE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_MOVIE;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success:  ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1200
     * @tc.desc   setStreamUsage_STREAM_USAGE_GAME
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_GAME;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success:  ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1300
     * @tc.desc   setStreamUsage_STREAM_USAGE_AUDIOBOOK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_AUDIOBOOK;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success:  ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1400
     * @tc.desc   setStreamUsage_STREAM_USAGE_NAVIGATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_STATIC_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_NAVIGATION;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success: ${JSON.stringify(setStreamUsage)}`);
        expect(true).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_STATIC_0100
     * @tc.desc   Notification_createPlayer_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        const AudioHapticPlayer: audioHaptic.AudioHapticPlayer | null= await AudioHapticManager.createPlayer(sourceId_Notification, audioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        console.log(`${tag} AudioHapticPlayer release 1`);
        await AudioHapticPlayer!.release();
        console.log(`${tag} AudioHapticPlayer release success`);
        expect(true).assertTrue();
        done();
      } catch(err) {
        err = err as BusinessError;
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${(err as BusinessError).code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_STATIC_0200
     * @tc.desc   Notification_createPlayer_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      let flag: boolean = false;
      try {
        const AudioHapticPlayer: audioHaptic.AudioHapticPlayer | null= await AudioHapticManager.createPlayer(sourceId_Notification);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        console.log(`${tag} AudioHapticPlayer release 1`);
        await AudioHapticPlayer!.release();
        console.log(`${tag} AudioHapticPlayer release success`);
        flag = true;
        expect(flag).assertTrue();
        done();
      } catch(err) {
        if (err instanceof Error) {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        } else {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${(err as BusinessError).code}`);
          expect(false).assertTrue();
          done()
        }
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0100
     * @tc.desc   Notification_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_Muted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_AUDIO;
      let audioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        const player = await AudioHapticManager.createPlayer(sourceId_Notification, audioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(player)}`);
        await sleep(100);
        try {
          let isMute: boolean = player!.isMuted(type);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(isMute)}`);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (isMute)}`);
          expect(isMute).assertEqual(true);
          await sleep(100);
          let releasePlayer : Promise<void> = player!.release();
          await releasePlayer;
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag} isMuted fail222222: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done();
        }
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      };
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0200
     * @tc.desc   Notification_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_UnMuted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_AUDIO;
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: false,
        muteHaptics: true
      }
      try {
        const player = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(player)}`);
        await sleep(100);
        try {
          let isMute: boolean = player!.isMuted(type);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(isMute)}`);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (isMute)}`);
          expect(isMute).assertEqual(false);
          await sleep(100);
          let playerRelease : Promise<void> = player!.release();
          await playerRelease;
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      };

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0300
     * @tc.desc   Notification_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_Muted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_HAPTIC;
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        const player = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(player)}`);
        await sleep(100);
        try {
          let isMute: boolean = player!.isMuted(type);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(isMute)}`);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (isMute)}`);
          expect(isMute).assertEqual(true);
          await sleep(100);
          let playerRelease : Promise<void> = player!.release();
          await playerRelease;
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      };
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0400
     * @tc.desc   Notification_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_UnMuted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_HAPTIC;
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: false
      }
      try {
        const player = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(player)}`);
        await sleep(100);
        try {
          let isMute: boolean = player!.isMuted(type);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(isMute)}`);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (isMute)}`);
          expect(isMute).assertEqual(false);
          await sleep(100);
          let playerRelease : Promise<void> = player!.release();
          await playerRelease;
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0500
     * @tc.desc   Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_Muted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_AUDIO;
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        const player = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(player)}`);
        await sleep(100);
        try {
          let isMute: boolean = player!.isMuted(type);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(isMute)}`);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (isMute)}`);
          expect(isMute).assertEqual(true);
          await sleep(100);
          let playerRelease : Promise<void> = player!.release();
          await playerRelease;
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0600
     * @tc.desc   Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_UnMuted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_AUDIO;
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: false,
        muteHaptics: true
      }
      try {
        const player = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(player)}`);
        await sleep(100);
        try {
          let isMute: boolean = player!.isMuted(type);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(isMute)}`);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (isMute)}`);
          expect(isMute).assertEqual(false);
          await sleep(100);
          let playerRelease : Promise<void> = player!.release();
          await playerRelease;
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      };
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0700
     * @tc.desc   Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_Muted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_HAPTIC;
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        const player = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(player)}`);
        await sleep(100);
        try {
          let isMute: boolean = player!.isMuted(type);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(isMute)}`);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (isMute)}`);
          expect(isMute).assertEqual(true);
          await sleep(100);
          let playerRelease : Promise<void> = player!.release();
          await playerRelease;
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      };
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0800
     * @tc.desc   Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_UnMuted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_STATIC_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_HAPTIC;
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: false
      }
      try {
        const player = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(player)}`);
        await sleep(100);
        try {
          let isMute: boolean = player!.isMuted(type);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(isMute)}`);
          console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (isMute)}`);
          expect(isMute).assertEqual(false);
          await sleep(100);
          let playerRelease : Promise<void> = player!.release();
          await playerRelease;
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      };
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0100
     * @tc.desc   Notification_createPlayer_start_release_normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }

      try {
        const AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        try {
          AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
          console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0200
     * @tc.desc   Notification_createPlayer_start_stop_release_normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setStreamUsage(sourceId_Notification, audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
      console.log(`${tag} setStreamUsage success`);
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        let AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        try {
          AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
          console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          await AudioHapticPlayer!.stop();
          console.log(`${tag} AudioHapticPlayer stop success`);
          await sleep(100);
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0300
     * @tc.desc   Notification_createPlayer_start_release_fast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
      AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
      console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }

      try {
        const AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        try {
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0400
     * @tc.desc   Notification_createPlayer_start_stop_release_fast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
      AudioHapticManager.setStreamUsage(sourceId_Notification, audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
      console.log(`${tag} setStreamUsage success`);
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        let AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        try {
          AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
          console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          await AudioHapticPlayer!.stop();
          console.log(`${tag} AudioHapticPlayer stop success`);
          await sleep(100);
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0500
     * @tc.desc   Ringtone_createPlayer_start_release_normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }

      try {
        let AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        try {
          AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
          console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0600
     * @tc.desc   Ringtone_createPlayer_start_stop_release_normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setStreamUsage(sourceId_Ringtone, audio.StreamUsage.STREAM_USAGE_RINGTONE);
      console.log(`${tag} setStreamUsage success`);
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        let AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        try {
          AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
          console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          await AudioHapticPlayer!.stop();
          console.log(`${tag} AudioHapticPlayer stop success`);
          await sleep(100);
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0700
     * @tc.desc   Notification_createPlayer_start_release_fast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
      AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
      console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }

      try {
        let AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        try {
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0800
     * @tc.desc   Ringtone_createPlayer_start_stop_release_fast
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_STATIC_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
      AudioHapticManager.setStreamUsage(sourceId_Ringtone, audio.StreamUsage.STREAM_USAGE_RINGTONE);
      console.log(`${tag} setStreamUsage success`);
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        let AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        try {
          AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
          console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          await AudioHapticPlayer!.stop();
          console.log(`${tag} AudioHapticPlayer stop success`);
          await sleep(100);
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_ENDOFSTREAM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_ENDOFSTREAM_STATIC_0100
     * @tc.desc   Ringtone_AudioHapticPlayer_on_endofStream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_ENDOFSTREAM_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
      AudioHapticManager.setStreamUsage(sourceId_Ringtone, audio.StreamUsage.STREAM_USAGE_RINGTONE);
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: false,
        muteHaptics: false
      }
      try {
        let AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        try {
          AudioHapticPlayer!.onEndOfStream(() => {
            console.info(`${tag} on endOfStream called `);
          });
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(100);
          await AudioHapticPlayer!.stop();
          console.log(`${tag} AudioHapticPlayer stop success`);
          AudioHapticPlayer!.offEndOfStream();
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_ENDOFSTREAM_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_ENDOFSTREAM_STATIC_0200
     * @tc.desc   Notification_AudioHapticPlayer_on_endofStream
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_ENDOFSTREAM_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
      AudioHapticManager.setStreamUsage(sourceId_Notification, audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: false,
        muteHaptics: false
      }
      let endOfStreamCallBack = () => {
        console.info('Receive the callback of endOfStream');
      }
      try {
        let AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        try {
          AudioHapticPlayer!.onEndOfStream(() => {
            console.info(`${tag} on endOfStream called `);
            console.log(`${tag} AudioHapticPlayer release success`);
          });
          AudioHapticPlayer!.offEndOfStream(endOfStreamCallBack);
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          await AudioHapticPlayer!.stop();
          console.log(`${tag} AudioHapticPlayer stop success`);
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          expect(true).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }

    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_AUDIOINTERRUPT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_AUDIOINTERRUPT_STATIC_0100
     * @tc.desc   AudioHapticPlayer_on_audioInterrupt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_AUDIOINTERRUPT_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
      console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        let AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        try {
          AudioHapticPlayer!.onAudioInterrupt((InterruptEvent) => {
            console.info(`${tag} on audioInterrupt called `);
          });
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          AudioHapticPlayer!.offAudioInterrupt();
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_AUDIOINTERRUPT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_AUDIOINTERRUPT_STATIC_0200
     * @tc.desc   AudioHapticPlayer_on_audioInterrupt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_AUDIOINTERRUPT_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
      console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
      let AudioHapticPlayerOptions: audioHaptic.AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      let audioInterruptCallback = (interruptEvent: audio.InterruptEvent) => {
        console.log(`${tag} off audioInterrupt called`);
      }
      try {
        let AudioHapticPlayer = await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions);
        console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
        await sleep(100);
        try {
          AudioHapticPlayer!.onAudioInterrupt((InterruptEvent) => {
            console.info(`${tag} on audioInterrupt called `);
          });
          await AudioHapticPlayer!.start();
          console.log(`${tag} AudioHapticPlayer start success`);
          await sleep(1000);
          AudioHapticPlayer!.offAudioInterrupt(audioInterruptCallback);
          await AudioHapticPlayer!.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(true).assertTrue();
          done();
        } catch (err) {
          console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        }
      } catch(err) {
        err = err as BusinessError;
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        if (err.code === 5400106) {
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_HAPTIC_REGISTERSOURCEFROMFD_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_HAPTIC_REGISTERSOURCEFROMFD_STATIC_0100
     * @tc.desc   AudioHapticPlayer_on_audioInterrupt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_HAPTIC_REGISTERSOURCEFROMFD_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let id = 0;
      let audioFd: audioHaptic.AudioHapticFileDescriptor = {fd:0, length:0, offset:0}
      let hapticFd: audioHaptic.AudioHapticFileDescriptor = {fd:0, length:0, offset:0}
      let audioHapticManager: audioHaptic.AudioHapticManager = audioHaptic.getAudioHapticManager();
      let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      let rawFdOgg = testContext!.resourceManager.getRawFdSync('notification.ogg');
      audioFd.fd = rawFdOgg.fd;
      audioFd.length = rawFdOgg.length;
      audioFd.offset = rawFdOgg.offset;
      let rawFdJson = testContext!.resourceManager.getRawFdSync('notification.json');
      hapticFd.fd = rawFdJson.fd;
      hapticFd.length = rawFdJson.length;
      hapticFd.offset = rawFdJson.offset;
      await audioHapticManager.registerSourceFromFd(audioFd, hapticFd).then((value: int) => {
        console.info(`Promise returned to indicate that th id of registerSource`);
        id = value;
      }).catch((err: Error) => {
        console.error(`fail to register source`);
        expect(false).assertTrue();
      });
      let latencyMode:audioHaptic.AudioLatencyMode=audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      audioHapticManager.setAudioLatencyMode(id, latencyMode);
      let usage:audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_NOTIFICATION;
      audioHapticManager.setStreamUsage(id, usage);
      let options:audioHaptic.AudioHapticPlayerOptions = {muteAudio:false, muteHaptics:false};
      let audioHapticPlayer:audioHaptic.AudioHapticPlayer;
      await audioHapticManager.createPlayer(id, options).then((value:audioHaptic.AudioHapticPlayer | null) => {
        console.info(`Create Success`);
        audioHapticPlayer = value as audioHaptic.AudioHapticPlayer;
        await audioHapticPlayer.start().then(() => {
          console.info(`Create Success`);
        }).catch((err: Error) => {
          console.error(`fail to start playing, ${err}`);
          expect(false).assertTrue();
        });
        await sleep(1000);
        await audioHapticPlayer.stop().then(()=>{
          console.info(`promise return to indicate stop successfully`);
        }).catch((err: Error) => {
          console.error(`fail to start playing, ${err}`);
          expect(false).assertTrue();
        });
        await audioHapticPlayer.release().then(()=>{
          console.info(`release player successfully`);
        }).catch((err: Error) => {
          console.error(`fail to start playing, ${err}`);
          expect(false).assertTrue();
        });
      }).catch((err: Error) => {
        console.error(`fail to start playing, ${err}`);
        expect(false).assertTrue();
      });
      await audioHapticManager.unregisterSource(id).then(() => {
        console.info(`successfully to unregisterSource playing`);
      }).catch((err: Error) => {
        console.error(`fail to start unregisterSource, ${err}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_HAPTIC_REGISTERSOURCEFROMFD_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_HAPTIC_REGISTERSOURCEFROMFD_STATIC_0200
     * @tc.desc   AudioHapticPlayer_on_audioInterrupt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("SUB_MULTIMEDIA_AUDIO_HAPTIC_REGISTERSOURCEFROMFD_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let id = 0;
      let audioFd:audioHaptic.AudioHapticFileDescriptor = {fd:0, length:0, offset:0}
      let hapticFd:audioHaptic.AudioHapticFileDescriptor = {fd:0, length:0, offset:0}
      let audioHapticManager: audioHaptic.AudioHapticManager = audioHaptic.getAudioHapticManager();
      let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      let rawFdOgg = testContext!.resourceManager.getRawFdSync('notification.ogg');
      audioFd.fd = rawFdOgg.fd;
      audioFd.length = rawFdOgg.length;
      audioFd.offset = rawFdOgg.offset;
      let rawFdJson = testContext!.resourceManager.getRawFdSync('notification.json');
      hapticFd.fd = rawFdJson.fd;
      hapticFd.length = rawFdJson.length;
      hapticFd.offset = rawFdJson.offset;
      await audioHapticManager.registerSourceFromFd(audioFd,hapticFd).then((value:int) => {
        console.info(`Promise returned to indicate that th id of registerSource`);
        id = value;
      }).catch((err: Error) => {
        console.error(`fail to register source`);
        expect(false).assertTrue();
      });
      let latencyMode:audioHaptic.AudioLatencyMode=audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      audioHapticManager.setAudioLatencyMode(id,latencyMode);
      let usage:audio.StreamUsage = audio.StreamUsage.STREAM_USAGE_NOTIFICATION;
      audioHapticManager.setStreamUsage(id,usage);
      let options:audioHaptic.AudioHapticPlayerOptions = {muteAudio:false, muteHaptics:false};
      let audioHapticPlayer:audioHaptic.AudioHapticPlayer;
      await audioHapticManager.createPlayer(id,options).then(async(value:audioHaptic.AudioHapticPlayer | null)=>{
        console.info(`Create Success`);
        audioHapticPlayer = value as audioHaptic.AudioHapticPlayer;
        await audioHapticPlayer.start().then(()=>{
          console.info(`Create Success`);
        }).catch((err: Error) => {
          console.error(`fail to start playing, ${err}`);
          expect(false).assertTrue();
        });
        await sleep(1000);
        await audioHapticPlayer.setVolume(5).then(()=>{
          console.info(`setVolume player successfully`);
        }).catch((err: Error) => {
          console.error(`fail to setVolume playing out of range, ${err.code}`);
          expect(Number(err.code)).assertEqual(5400108);
        });
        await audioHapticPlayer.stop().then(() => {
          console.info(`promise return to indicate stop successfully`);
        }).catch((err: Error) => {
          console.error(`fail to stop playing, ${err}`);
          expect(false).assertTrue();
        });
        await audioHapticPlayer.release().then(() => {
          console.info(`release player successfully`);
        }).catch((err: Error) => {
          console.error(`fail to release playing, ${err}`);
          expect(false).assertTrue();
        });
        await audioHapticPlayer.setVolume(0.50).then(()=>{
          console.info(`setVolume player successfully`);
          expect(false).assertTrue();
        }).catch((err: Error) => {
          console.error(`fail to setVolume playing already release, ${err.code}`);
          expect(Number(err.code)).assertEqual(5400102);
        });
        await audioHapticPlayer.setLoop(true).then(() => {
          console.info(`setVolume player successfully`);
          expect(false).assertTrue();
        }).catch((err: Error) => {
          console.error(`fail to setloop playing, ${err.code}`);
          expect(Number(err.code)).assertEqual(5400102);
        });
      }).catch((err: Error) => {
        console.error(`fail to start playing, ${err}`);
        expect(false).assertTrue();
      });
      done();
    })
  })
}