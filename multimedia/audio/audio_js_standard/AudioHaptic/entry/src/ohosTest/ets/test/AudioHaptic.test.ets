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

export default function AudioHapticTest() {
  describe('AudioHapticTest', () => {
    let tag = 'AudioHapticTest:';
    let AudioHapticManager: audioHaptic.AudioHapticManager | ESObject = audioHaptic.getAudioHapticManager();
    let testContext: common.UIAbilityContext;

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
      console.log(`beforeall come in`);
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      await getPermission();
      await driveFn();
      await sleep(1000);
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
      sourceId_Ringtone = await AudioHapticManager.registerSource(Ringtone_Audio_Uri, Ringtone_Haptic_Uri);

    })
    beforeEach(() => {
      console.log(`beforeEach come in`);
    })
    afterEach(async () => {
      if (AudioHapticPlayer != null) {
        await AudioHapticPlayer.release();
      }
      console.log(`afterEach come in`);
    })
    afterAll(() => {
      console.log(`afterAll come in`);
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_0100
     * @tc.name      : registerSource_Ringtone_URI
     * @tc.desc      : registerSource_Ringtone_URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_0100", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await AudioHapticManager.registerSource(Ringtone_Audio_Uri, Ringtone_Haptic_Uri).then((data: ESObject) => {
          console.log(`${tag} registerSource success: Ringtone_Audio_Uri: ${JSON.stringify(Ringtone_Audio_Uri)}, Ringtone_Haptic_Uri:${Ringtone_Haptic_Uri}`);
          console.log(`${tag} registerSource success: sourceId: ${JSON.stringify(data)}`);
          expect(true).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.log(`${tag} registerSource fail: Ringtone_Audio_Uri: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        console.log(`${tag} registerSource error: ${JSON.stringify(error)}, ${error.code}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_0200
     * @tc.name      : registerSource_notification_URI
     * @tc.desc      : registerSource_notification_URI
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_0200", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await AudioHapticManager.registerSource(Notification_Audio_Uri, Notificatio_Haptic_Uri)
          .then((data: ESObject) => {
            console.log(`${tag} registerSource success: Notification_Audio_Uri: ${JSON.stringify(Notification_Audio_Uri)}, Notificatio_Haptic_Uri:${Notificatio_Haptic_Uri}`);
            console.log(`${tag} registerSource success: sourceId: ${JSON.stringify(data)}`);
            expect(true).assertTrue();
            done()
          })
          .catch((err: BusinessError) => {
            console.log(`${tag} registerSource fail: Notification_Audio_Uri: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          });
      } catch (error) {
        console.log(`${tag} registerSource error: ${JSON.stringify(error)}, ${error.code}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_0300
     * @tc.name      : registerSource_number_parameter_401
     * @tc.desc      : registerSource_number_parameter_401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_0300", 2, async (done: Function) => {
      try {
        await AudioHapticManager.registerSource(1, 1).then((data: ESObject) => {
          console.log(`${tag} registerSource success: Notification_Audio_Uri: ${JSON.stringify(Notification_Audio_Uri)}, Notificatio_Haptic_Uri:${Notificatio_Haptic_Uri}`);
          console.log(`${tag} registerSource success: sourceId: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.log(`${tag} registerSource fail: Notification_Audio_Uri: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        });
      } catch (err) {
        console.log(`${tag} registerSource fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_0400
     * @tc.name      : registerSource_null_parameter_401
     * @tc.desc      : registerSource_null_parameter_401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_REGISTERSOURCE_0400", 2, async (done: Function) => {
      try {
        await AudioHapticManager.registerSource().then((data: ESObject) => {
          console.log(`${tag} registerSource success: Notification_Audio_Uri: ${JSON.stringify(Notification_Audio_Uri)}, Notificatio_Haptic_Uri:${Notificatio_Haptic_Uri}`);
          console.log(`${tag} registerSource success: sourceId: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.log(`${tag} registerSource fail: Notification_Audio_Uri: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        });
      } catch (err) {
        console.log(`${tag} registerSource fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_0100
     * @tc.name      : unregisterSource_Notification_Uri
     * @tc.desc      : unregisterSource_Notification_Uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_0100", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await AudioHapticManager.registerSource(Notification_Audio_Uri, Notificatio_Haptic_Uri)
          .then(async (data: ESObject) => {
            console.log(`${tag} registerSource success: Notification_Audio_Uri: ${JSON.stringify(Notification_Audio_Uri)}, Notificatio_Haptic_Uri:${Notificatio_Haptic_Uri}`);
            let sourceId: ESObject = data;
            console.log(`${tag} registerSource success: sourceId: ${JSON.stringify(sourceId)}`);
            await AudioHapticManager.unregisterSource(sourceId).then(() => {
              console.log(`${tag} unregisterSource success: sourceId: ${JSON.stringify(sourceId)}`);
              expect(true).assertTrue();
              done()
            }).catch((err: BusinessError) => {
              console.log(`${tag} unregisterSource fail: sourceId: ${JSON.stringify(sourceId)}, ${err.code}`);
              expect(false).assertTrue();
              done()
            })
          })
          .catch((err: BusinessError) => {
            console.log(`${tag} registerSource fail: Notification_Audio_Uri: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          });
      } catch (error) {
        console.log(`${tag} registerSource error: ${JSON.stringify(error)}, ${error.code}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_0200
     * @tc.name      : unregisterSource_Ringtone_Uri
     * @tc.desc      : unregisterSource_Ringtone_Uri
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_0200", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await AudioHapticManager.registerSource(Ringtone_Audio_Uri, Ringtone_Haptic_Uri)
          .then(async (data: ESObject) => {
            console.log(`${tag} registerSource success: Ringtone_Uri: ${JSON.stringify(Ringtone_Audio_Uri)}, Notificatio_Haptic_Uri:${Ringtone_Haptic_Uri}`);
            let sourceId: ESObject = data;
            console.log(`${tag} registerSource success: sourceId: ${JSON.stringify(sourceId)}`);
            await AudioHapticManager.unregisterSource(sourceId).then(() => {
              console.log(`${tag} unregisterSource success: sourceId: ${JSON.stringify(sourceId)}`);
              expect(true).assertTrue();
              done()
            }).catch((err: BusinessError) => {
              console.log(`${tag} unregisterSource fail: sourceId: ${JSON.stringify(sourceId)}, ${err.code}`);
              expect(false).assertTrue();
              done()
            })
          })
          .catch((err: BusinessError) => {
            console.log(`${tag} registerSource fail: Ringtone_Uri: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          });
      } catch (error) {
        console.log(`${tag} registerSource error: ${JSON.stringify(error)}, ${error.code}`);
        expect(false).assertTrue();
        done()
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_0300
     * @tc.name      : unregisterSource_string_parameter_401
     * @tc.desc      : unregisterSource_string_parameter_401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_0300", 2, async (done: Function) => {
      try {
        let sourceId = '1'
        await AudioHapticManager.unregisterSource(sourceId).then(() => {
          console.log(`${tag} unregisterSource success: sourceId: ${JSON.stringify(sourceId)}`);
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.log(`${tag} unregisterSource fail: sourceId: ${JSON.stringify(sourceId)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        })
      } catch (err) {
        console.log(`${tag} unregisterSource fail:  ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_0400
     * @tc.name      : unregisterSource_null_parameter_401
     * @tc.desc      : unregisterSource_null_parameter_401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_UNREGISTERSOURCE_0400", 2, async (done: Function) => {
      try {
        await AudioHapticManager.unregisterSource().then(() => {
          console.log(`${tag} unregisterSource success`);
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.log(`${tag} unregisterSource fail:  ${err.code}`);
          expect(false).assertTrue();
          done()
        })
      } catch (err) {
        console.log(`${tag} unregisterSource catch fail:  ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0100
     * @tc.name      : Notification_setAudioLatencyMode_AUDIO_LATENCY_MODE_NORMAL
     * @tc.desc      : Notification_setAudioLatencyMode_AUDIO_LATENCY_MODE_NORMAL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0100", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0200
     * @tc.name      : Notification_setAudioLatencyMode_AUDIO_LATENCY_MODE_FAST
     * @tc.desc      : Notification_setAudioLatencyMode_AUDIO_LATENCY_MODE_FAST
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0200", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0300
     * @tc.name      : Ringtone_setAudioLatencyMode_AUDIO_LATENCY_MODE_NORMAL
     * @tc.desc      : Ringtone_setAudioLatencyMode_AUDIO_LATENCY_MODE_NORMAL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0300", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0400
     * @tc.name      : Ringtone_setAudioLatencyMode_AUDIO_LATENCY_MODE_FAST
     * @tc.desc      : Ringtone_setAudioLatencyMode_AUDIO_LATENCY_MODE_FAST
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0400", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0500
     * @tc.name      : setAudioLatencyMode_invalid_number_parameter
     * @tc.desc      : setAudioLatencyMode_invalid_number_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0500", 2, async (done: Function) => {

      let AudioLatencyMode = 4;
      try {
        AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
        console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
        expect(false).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setAudioLatencyMode fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0600
     * @tc.name      : setAudioLatencyMode_invalid_string_parameter
     * @tc.desc      : setAudioLatencyMode_invalid_string_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0600", 2, async (done: Function) => {
      let AudioLatencyMode = '4';
      try {
        AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
        console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
        expect(false).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setAudioLatencyMode fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0700
     * @tc.name      : setAudioLatencyMode_invalid_null_parameter
     * @tc.desc      : setAudioLatencyMode_invalid_null_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETAUDIOLATENCYMODE_0700", 2, async (done: Function) => {
      try {
        AudioHapticManager.setAudioLatencyMode();
        expect(false).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setAudioLatencyMode fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0100
     * @tc.name      : setStreamUsage_STREAM_USAGE_MUSIC
     * @tc.desc      : setStreamUsage_STREAM_USAGE_MUSIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0100", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0200
     * @tc.name      : setStreamUsage_STREAM_USAGE_UNKNOWN
     * @tc.desc      : setStreamUsage_STREAM_USAGE_UNKNOWN
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0200", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0300
     * @tc.name      : setStreamUsage_STREAM_USAGE_MEDIA
     * @tc.desc      : setStreamUsage_STREAM_USAGE_MEDIA
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0300", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_MEDIA;
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0400
     * @tc.name      : setStreamUsage_STREAM_USAGE_VOICE_COMMUNICATION
     * @tc.desc      : setStreamUsage_STREAM_USAGE_VOICE_COMMUNICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0400", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0500
     * @tc.name      : setStreamUsage_STREAM_USAGE_VOICE_ASSISTANT
     * @tc.desc      : setStreamUsage_STREAM_USAGE_VOICE_ASSISTANT
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0500", 2, async (done: Function) => {
      let setStreamUsage = audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT;
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0600
     * @tc.name      : setStreamUsage_STREAM_USAGE_ALARM
     * @tc.desc      : setStreamUsage_STREAM_USAGE_ALARM
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0600", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0700
     * @tc.name      : setStreamUsage_STREAM_USAGE_VOICE_MESSAGE
     * @tc.desc      : setStreamUsage_STREAM_USAGE_VOICE_MESSAGE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0700", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0800
     * @tc.name      : setStreamUsage_STREAM_USAGE_RINGTONE
     * @tc.desc      : setStreamUsage_STREAM_USAGE_RINGTONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0800", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0900
     * @tc.name      : setStreamUsage_STREAM_USAGE_NOTIFICATION
     * @tc.desc      : setStreamUsage_STREAM_USAGE_NOTIFICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_0900", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1000
     * @tc.name      : setStreamUsage_STREAM_USAGE_ACCESSIBILITY
     * @tc.desc      : setStreamUsage_STREAM_USAGE_ACCESSIBILITY
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1000", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1100
     * @tc.name      : setStreamUsage_STREAM_USAGE_MOVIE
     * @tc.desc      : setStreamUsage_STREAM_USAGE_MOVIE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1100", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1200
     * @tc.name      : setStreamUsage_STREAM_USAGE_GAME
     * @tc.desc      : setStreamUsage_STREAM_USAGE_GAME
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1200", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1300
     * @tc.name      : setStreamUsage_STREAM_USAGE_AUDIOBOOK
     * @tc.desc      : setStreamUsage_STREAM_USAGE_AUDIOBOOK
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1300", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1400
     * @tc.name      : setStreamUsage_STREAM_USAGE_NAVIGATION
     * @tc.desc      : setStreamUsage_STREAM_USAGE_NAVIGATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1400", 2, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1500
     * @tc.name      : setStreamUsage_invalid_number_parameter
     * @tc.desc      : setStreamUsage_invalid_number_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1500", 2, async (done: Function) => {
      let setStreamUsage = 20;
      try {
        AudioHapticManager.setStreamUsage(sourceId_Notification, setStreamUsage);
        console.log(`${tag} setStreamUsage success:  ${JSON.stringify(setStreamUsage)}`);
        expect(false).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1600
     * @tc.name      : setStreamUsage_invalid_string_parameter
     * @tc.desc      : setStreamUsage_invalid_string_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1600", 2, async (done: Function) => {
      let setStreamUsage = '20';
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
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1700
     * @tc.name      : setStreamUsage_invalid_null_parameter
     * @tc.desc      : setStreamUsage_invalid_null_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_SETSTREAMUSAGE_1700", 2, async (done: Function) => {
      try {
        AudioHapticManager.setStreamUsage();
        console.log(`${tag} setStreamUsage success`);
        expect(false).assertTrue();
        done()
      } catch (err) {
        console.log(`${tag} setStreamUsage fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_0100
     * @tc.name      : Notification_createPlayer_release
     * @tc.desc      : Notification_createPlayer_release
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_0100", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      try {
        await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
          .then(async (data: ESObject) => {
            let AudioHapticPlayer: ESObject = data;
            console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
            if (err.code === 5400106) {
              expect(true).assertTrue();
              done();
            } else {
              expect(false).assertTrue();
              done();
            }
          });
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(false).assertTrue();
        done()
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_0200
     * @tc.name      : createPlayer_invalid_string_parameter
     * @tc.desc      : createPlayer_invalid_string_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_0200", 2, async (done: Function) => {
      let AudioHapticPlayerOptions = '123'
      try {
        await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
          .then(async (data: ESObject) => {
            let AudioHapticPlayer: ESObject = data;
            console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(false).assertTrue();
            done();
          })
          .catch((err: BusinessError) => {
            console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          });
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_0300
     * @tc.name      : createPlayer_invalid_null_parameter
     * @tc.desc      : createPlayer_invalid_null_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_CREATEPLAYER_0300", 2, async (done: Function) => {
      try {
        await AudioHapticManager.createPlayer().then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          await AudioHapticPlayer.release();
          console.log(`${tag} AudioHapticPlayer release success`);
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          expect(false).assertTrue();
          done()
        });
      } catch (err) {
        console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
        expect(Number(err.code)).assertEqual(401);
        done()
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0100
     * @tc.name      : Notification_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_Muted
     * @tc.desc      : Notification_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_Muted
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0100", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_AUDIO;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted(type);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(ismute).assertEqual(true);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail222222: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done();
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0200
     * @tc.name      : Notification_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_UnMuted
     * @tc.desc      : Notification_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_UnMuted
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0200", 2, async (done: Function) => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_AUDIO;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: false,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted(type);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(ismute).assertEqual(false);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0300
     * @tc.name      : Notification_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_Muted
     * @tc.desc      : Notification_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_Muted
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0300", 2, async (done: Function) => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_HAPTIC;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted(type);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(ismute).assertEqual(true);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()

          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0400
     * @tc.name      : Notification_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_UnMuted
     * @tc.desc      : Notification_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_UnMuted
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0400", 2, async (done: Function) => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_HAPTIC;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: false
      }
      await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted(type);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(ismute).assertEqual(false);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0500
     * @tc.name      : Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_Muted
     * @tc.desc      : Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_Muted
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0500", 2, async (done: Function) => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_AUDIO;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted(type);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(ismute).assertEqual(true);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);

          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0600
     * @tc.name      : Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_UnMuted
     * @tc.desc      : Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_AUDIO_UnMuted
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0600", 2, async (done: Function) => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_AUDIO;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: false,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted(type);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(ismute).assertEqual(false);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0700
     * @tc.name      : Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_Muted
     * @tc.desc      : Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_Muted
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0700", 2, async (done: Function) => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_HAPTIC;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted(type);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(ismute).assertEqual(true);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0800
     * @tc.name      : Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_UnMuted
     * @tc.desc      : Ringtone_createPlayer_AUDIO_HAPTIC_TYPE_HAPTIC_UnMuted
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0800", 2, async (done: Function) => {
      let type = audioHaptic.AudioHapticType.AUDIO_HAPTIC_TYPE_HAPTIC;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: false
      }
      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted(type);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(ismute).assertEqual(false);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0900
     * @tc.name      : isMuted_invalid_number_parameter
     * @tc.desc      : isMuted_invalid_number_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_0900", 2, async (done: Function) => {
      let type = 3;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: false
      }
      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted(type);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(false).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(Number(err.code)).assertEqual(401);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done()
          } else {
            expect(false).assertTrue();
            done()
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_1000
     * @tc.name      : isMuted_invalid_string_parameter
     * @tc.desc      : isMuted_invalid_string_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_1000", 2, async (done: Function) => {
      let type = '3';
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: false
      }
      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted(type);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(false).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(Number(err.code)).assertEqual(401);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done()
          } else {
            expect(false).assertTrue();
            done()
          }
        });

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_1100
     * @tc.name      : isMuted_invalid_null_parameter
     * @tc.desc      : isMuted_invalid_null_parameter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ISMUTE_1100", 2, async (done: Function) => {
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: false
      }
      await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            let ismute: ESObject = AudioHapticPlayer.isMuted();
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${JSON.stringify(ismute)}`);
            console.log(`${tag} AUDIO_HAPTIC_TYPE_AUDIO ismute : ${typeof (ismute)}`);
            expect(false).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag} isMuted fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(Number(err.code)).assertEqual(401);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done()
          } else {
            expect(false).assertTrue();
            done()
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0100
     * @tc.name      : Notification_createPlayer_start_release_normal
     * @tc.desc      : Notification_createPlayer_start_release_normal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0100", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }

      await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
            console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);
            await sleep(1000);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0200
     * @tc.name      : Notification_createPlayer_start_stop_release_normal
     * @tc.desc      : Notification_createPlayer_start_stop_release_normal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0200", 2, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setStreamUsage(sourceId_Notification, audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
      console.log(`${tag} setStreamUsage success`);
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
            console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);
            await sleep(1000);
            await AudioHapticPlayer.stop();
            console.log(`${tag} AudioHapticPlayer stop success`);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0300
     * @tc.name      : Notification_createPlayer_start_release_fast
     * @tc.desc      : Notification_createPlayer_start_release_fast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0300", 2, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
      AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
      console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }

      await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);
            await sleep(1000);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0400
     * @tc.name      : Notification_createPlayer_start_stop_release_fast
     * @tc.desc      : Notification_createPlayer_start_stop_release_fast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0400", 2, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
      AudioHapticManager.setStreamUsage(sourceId_Notification, audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
      console.log(`${tag} setStreamUsage success`);
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          AudioHapticPlayer = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
            console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);
            await sleep(1000);
            await AudioHapticPlayer.stop();
            console.log(`${tag} AudioHapticPlayer stop success`);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0500
     * @tc.name      : Ringtone_createPlayer_start_release_normal
     * @tc.desc      : Ringtone_createPlayer_start_release_normal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0500", 2, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }

      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
            console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);
            await sleep(1000);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0600
     * @tc.name      : Ringtone_createPlayer_start_stop_release_normal
     * @tc.desc      : Ringtone_createPlayer_start_stop_release_normal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0600", 2, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setStreamUsage(sourceId_Ringtone, audio.StreamUsage.STREAM_USAGE_RINGTONE);
      console.log(`${tag} setStreamUsage success`);
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
            console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);
            await sleep(1000);
            await AudioHapticPlayer.stop();
            console.log(`${tag} AudioHapticPlayer stop success`);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0700
     * @tc.name      : Notification_createPlayer_start_release_fast
     * @tc.desc      : Notification_createPlayer_start_release_fast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0700", 2, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
      AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
      console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }

      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          let AudioHapticPlayer: ESObject = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);
            await sleep(1000);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0800
     * @tc.name      : Ringtone_createPlayer_start_stop_release_fast
     * @tc.desc      : Ringtone_createPlayer_start_stop_release_fast
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_PLAY_0800", 2, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_FAST;
      AudioHapticManager.setStreamUsage(sourceId_Ringtone, audio.StreamUsage.STREAM_USAGE_RINGTONE);
      console.log(`${tag} setStreamUsage success`);
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          AudioHapticPlayer = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
            console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);
            await sleep(1000);
            await AudioHapticPlayer.stop();
            console.log(`${tag} AudioHapticPlayer stop success`);
            await sleep(100);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_ENDOFSTREAM_0100
     * @tc.name      : Ringtone_AudioHapticPlayer_on_endofStream
     * @tc.desc      : Ringtone_AudioHapticPlayer_on_endofStream
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_ENDOFSTREAM_0100", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
      AudioHapticManager.setStreamUsage(sourceId_Ringtone, audio.StreamUsage.STREAM_USAGE_RINGTONE);
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: false,
        muteHaptics: false
      }
      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          AudioHapticPlayer = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          try {
            AudioHapticPlayer.on('endOfStream', () => {
              console.info(`${tag} on endOfStream called `);
            });
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);
            await sleep(100);
            await AudioHapticPlayer.stop();
            console.log(`${tag} AudioHapticPlayer stop success`);
            AudioHapticPlayer.off('endOfStream');
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_ENDOFSTREAM_0200
     * @tc.name      : Notification_AudioHapticPlayer_on_endofStream
     * @tc.desc      : Notification_AudioHapticPlayer_on_endofStream
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_ENDOFSTREAM_0200", 2, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setAudioLatencyMode(sourceId_Notification, AudioLatencyMode);
      AudioHapticManager.setStreamUsage(sourceId_Notification, audio.StreamUsage.STREAM_USAGE_NOTIFICATION);
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: false,
        muteHaptics: false
      }
      await AudioHapticManager.createPlayer(sourceId_Notification, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          AudioHapticPlayer = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          try {
            AudioHapticPlayer.on('endOfStream', () => {
              console.info(`${tag} on endOfStream called `);
              console.log(`${tag} AudioHapticPlayer release success`);

            });
            AudioHapticPlayer.off('endOfStream');
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);
            await sleep(1000);
            await AudioHapticPlayer.stop();
            console.log(`${tag} AudioHapticPlayer stop success`);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });

    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_AUDIOINTERRUPT_0100
     * @tc.name      : AudioHapticPlayer_on_audioInterrupt
     * @tc.desc      : AudioHapticPlayer_on_audioInterrupt
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_AUDIO_AUDIOHAPTIC_ON_AUDIOINTERRUPT_0100", TestType.Function | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioLatencyMode = audioHaptic.AudioLatencyMode.AUDIO_LATENCY_MODE_NORMAL;
      AudioHapticManager.setAudioLatencyMode(sourceId_Ringtone, AudioLatencyMode);
      console.log(`${tag} setAudioLatencyMode success: ${JSON.stringify(AudioLatencyMode)}`);
      let AudioHapticPlayerOptions: AudioHapticPlayerOptions = {
        muteAudio: true,
        muteHaptics: true
      }
      await AudioHapticManager.createPlayer(sourceId_Ringtone, AudioHapticPlayerOptions)
        .then(async (data: ESObject) => {
          AudioHapticPlayer = data;
          console.log(`${tag} createPlayer success: ${JSON.stringify(AudioHapticPlayer)}`);
          await sleep(100);
          try {
            AudioHapticPlayer.on('audioInterrupt', (InterruptEvent) => {
              console.info(`${tag} on audioInterrupt called `);
            });
            AudioHapticPlayer.off('audioInterrupt');
            await AudioHapticPlayer.start();
            console.log(`${tag} AudioHapticPlayer start success`);

            await sleep(1000);
            await AudioHapticPlayer.release();
            console.log(`${tag} AudioHapticPlayer release success`);
            expect(true).assertTrue();
            done();
          } catch (err) {
            console.log(`${tag}  fail: ${JSON.stringify(err)}, ${err.code}`);
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError) => {
          console.log(`${tag} createPlayer fail: ${JSON.stringify(err)}, ${err.code}`);
          if (err.code === 5400106) {
            expect(true).assertTrue();
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
    })
  })
}