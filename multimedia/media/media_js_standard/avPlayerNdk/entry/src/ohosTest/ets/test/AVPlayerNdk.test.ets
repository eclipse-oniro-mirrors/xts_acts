/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import avplayer from 'libavplayerndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs'
import { BusinessError } from '@ohos.base';
import Utils from './Utils';

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}
const PATH_DEMO =  "demo_no_audio_10s.mp4"
const g_currentPathId = 0;
async function copyFile(dir: string, filename: string) {
  try {
    let ml_face_model_file = dir + filename;
    getContext().resourceManager.getRawFileContent(filename, (error, model_buffer) => {
      if (error) {
        console.log(
          `[rawfile_copy_to_sandbox] demo.mp4 is
          copy failed:${error.code}, message: ${error.message}.`);
      } else {
        let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
        fs.writeSync(file.fd, model_buffer.buffer);
        fs.closeSync(file);
        console.log("[rawfile_copy_to_sandbox] demo.mp4 is copy success");
      }
    });
  } catch (error) {
    console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
  }
}

export default function AVPlayerNdkTest() {
  describe('AVPlayerTest', () => {

    beforeAll(async () => {
      let context = getContext()
      let dir = context.filesDir + "/";
      try {
        let ml_face_model_file = dir + PATH_DEMO;
        context.resourceManager.getRawFileContent(PATH_DEMO, (error, model_buffer) => {
          if (error) {
            console.log(
              `[rawfile_copy_to_sandbox] demo_no_audio_10s.mp4 is
              copy failed:${error.code}, message: ${error.message}.`);
          } else {
            let file = fs.openSync(ml_face_model_file, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
            fs.writeSync(file.fd, model_buffer.buffer);
            fs.closeSync(file);
            console.log("[rawfile_copy_to_sandbox] demo_no_audio_10s.mp4 is copy success");
          }
        });
      } catch (error) {
        console.info("[rawfile_copy_to_sandbox] getRawFileDescriptor api run failed" + error);
      }

      await copyFile(dir,"No_Support_Format.mov")
      await copyFile(dir,"H264_AAC.mkv")
      await copyFile(dir,"01.mp3")
      await copyFile(dir,"AAC_48000_32_1.aac")
      await copyFile(dir,"vorbis_48000_32_1.wav")
      console.info("[rawfile_copy_to_sandbox] sandbox path:" + dir);
      await Utils.sleep(2000)
    })

    beforeEach(async () => {
      let dir = getContext().filesDir + "/";

      let ml_face_model = dir + PATH_DEMO;
      await fs.stat(ml_face_model).then(async (res) => {
        if (res) {
          console.info("demo_no_audio_10s.mp4 file exists");
          console.info(`demo_no_audio_10s.mp4 size:${res.size}`);
        }
      }).catch((err: BusinessError) => {
        console.info("MindSporeDemo demo_no_audio_10s.mp4 file does not exists! access failed with error message: " +
        err.message + ", error code: " + err.code);
      });
      avplayer.OhAvPlayerSetCurrentPathId(g_currentPathId);
      await Utils.sleep(2000)
    })

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_CREATE_0100
     * @tc.name       : testOhAvPlayerCreate001
     * @tc.desc       : test OH_AVPlayer_Create
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerCreate001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETURLSOURCE_0100
     * @tc.name       : testOhAvPlayerSetURLSource001
     * @tc.desc       : test OH_AVPlayer_SetURLSource
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetURLSource001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetURLSourceAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETURLSOURCE_0300
     * @tc.name       : testOhAvPlayerSetURLSource003
     * @tc.desc       : test OH_AVPlayer_SetURLSource
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetURLSource003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetURLSourceAbnormalTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETFDSOURCE_0100
     * @tc.name       : testOhAvPlayerSetFDSource001
     * @tc.desc       : test OH_AVPlayer_SetFDSource
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetFDSource001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetFDSource();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETFDSOURCE_0200
     * @tc.name       : testOhAvPlayerSetFDSource002
     * @tc.desc       : test OH_AVPlayer_SetFDSource
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetFDSource002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetFDSourceAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETFDSOURCE_0300
     * @tc.name       : testOhAvPlayerSetFDSource003
     * @tc.desc       : test OH_AVPlayer_SetFDSource
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetFDSource003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetFDSourceAbnormalTwo();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETFDSOURCE_0400
     * @tc.name       : testOhAvPlayerSetFDSource004
     * @tc.desc       : test OH_AVPlayer_SetFDSource
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetFDSource004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetFDSourceAbnormalThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETAUDIORENDERERINFO_0100
     * @tc.name       : testOhAvPlayerSetAudioRendererInfo001
     * @tc.desc       : test OH_AVPlayer_SetAudioRendererInfo
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetAudioRendererInfo001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetAudioRendererInfo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETAUDIORENDERERINFO_0100
     * @tc.name       : testOhAvPlayerSetVolumeMode001
     * @tc.desc       : test OH_AVPlayer_SetVolumeMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetVolumeMode001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVolumeMode();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETAUDIOINTERRUPTMODE_0100
     * @tc.name       : testOhAvPlayerSetAudioInterruptMode001
     * @tc.desc       : test OH_AVPlayer_SetAudioInterruptMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetAudioInterruptMode001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetAudioInterruptMode();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETAUDIOEFFECTMODE_0100
     * @tc.name       : testOhAvPlayerSetAudioEffectMode001
     * @tc.desc       : test OH_AVPlayer_SetAudioEffectMode
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetAudioEffectMode001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetAudioEffectMode();
      expect(result).assertEqual(-1);
      done();
    });
    
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PREPARE_0100
     * @tc.name       : testOhAvPlayerPrepare001
     * @tc.desc       : test OH_AVPlayer_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPrepare001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepare(1, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PREPARE_0200
     * @tc.name       : testOhAvPlayerPrepare002
     * @tc.desc       : test OH_AVPlayer_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPrepare002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepare(0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PREPARE_0300
     * @tc.name       : testOhAvPlayerPrepare003
     * @tc.desc       : test OH_AVPlayer_Prepare
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPrepare003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepare(0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PLAY_0100
     * @tc.name       : testOhAvPlayerPlay001
     * @tc.desc       : test OH_AVPlayer_Play
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPlay001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPlay(1, 1, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PLAY_0200
     * @tc.name       : testOhAvPlayerPlay002
     * @tc.desc       : test OH_AVPlayer_Play
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPlay002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPlay(0, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PLAY_0300
     * @tc.name       : testOhAvPlayerPlay003
     * @tc.desc       : test OH_AVPlayer_Play
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPlay003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPlay(1, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PLAY_0400
     * @tc.name       : testOhAvPlayerPlay004
     * @tc.desc       : test OH_AVPlayer_Play
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPlay004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPlay(0, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PAUSE_0100
     * @tc.name       : testOhAvPlayerPause001
     * @tc.desc       : test OH_AVPlayer_Pause
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPause001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPause(1, 1, 1, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PAUSE_0200
     * @tc.name       : testOhAvPlayerPause002
     * @tc.desc       : test OH_AVPlayer_Pause
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPause002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPause(0, 0, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PAUSE_0300
     * @tc.name       : testOhAvPlayerPause003
     * @tc.desc       : test OH_AVPlayer_Pause
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPause003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPause(1, 0, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PAUSE_0400
     * @tc.name       : testOhAvPlayerPause004
     * @tc.desc       : test OH_AVPlayer_Pause
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPause004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPause(1, 1, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_PAUSE_0500
     * @tc.name       : testOhAvPlayerPause005
     * @tc.desc       : test OH_AVPlayer_Pause
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPause005', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPause(0, 0, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_STOP_0100
     * @tc.name       : testOhAvPlayerStop001
     * @tc.desc       : test OH_AVPlayer_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerStop001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerStop(1, 1, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_STOP_0200
     * @tc.name       : testOhAvPlayerStop002
     * @tc.desc       : test OH_AVPlayer_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerStop002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerStop(0, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_STOP_0300
     * @tc.name       : testOhAvPlayerStop003
     * @tc.desc       : test OH_AVPlayer_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerStop003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerStop(1, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_STOP_0400
     * @tc.name       : testOhAvPlayerStop004
     * @tc.desc       : test OH_AVPlayer_Stop
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerStop004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerStop(0, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_RESET_0100
     * @tc.name       : testOhAvPlayerReset001
     * @tc.desc       : test OH_AVPlayer_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerReset001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReset(1, 1, 1, 0, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_RESET_0200
     * @tc.name       : testOhAvPlayerReset002
     * @tc.desc       : test OH_AVPlayer_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerReset002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReset(1, 1, 1, 1, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_RESET_0300
     * @tc.name       : testOhAvPlayerReset003
     * @tc.desc       : test OH_AVPlayer_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerReset003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReset(1, 1, 1, 0, 1, 1, 1);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_RESET_0400
     * @tc.name       : testOhAvPlayerReset004
     * @tc.desc       : test OH_AVPlayer_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvPlayerReset004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReset(1, 0, 0, 0, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_RESET_0500
     * @tc.name       : testOhAvPlayerReset005
     * @tc.desc       : test OH_AVPlayer_Reset
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvPlayerReset005', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReset(0, 0, 0, 0, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_RELEASE_0100
     * @tc.name       : testOhAvPlayerRelease001
     * @tc.desc       : test OH_AVPlayer_Release
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerRelease001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerRelease();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_RELEASE_0200
     * @tc.name       : testOhAvPlayerRelease002
     * @tc.desc       : test OH_AVPlayer_Release
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerRelease002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReleaseAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_RELEASESYNC_0100
     * @tc.name       : testOhAvPlayerReleaseSync001
     * @tc.desc       : test OH_AVPlayer_ReleaseSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerReleaseSync001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReleaseSync();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_RELEASESYNC_0200
     * @tc.name       : testOhAvPlayerReleaseSync002
     * @tc.desc       : test OH_AVPlayer_ReleaseSync
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerReleaseSync002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReleaseSyncAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETVOLUME_0100
     * @tc.name       : testOhAvPlayerSetVolume001
     * @tc.desc       : test OH_AVPlayer_SetVolume
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetVolume001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVolume();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETVOLUME_0200
     * @tc.name       : testOhAvPlayerSetVolume002
     * @tc.desc       : test OH_AVPlayer_SetVolume
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetVolume002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVolumeAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SEEK_0100
     * @tc.name       : testOhAvPlayerSeek001
     * @tc.desc       : test OH_AVPlayer_Seek
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSeek001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSeek();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SEEK_0200
     * @tc.name       : testOhAvPlayerSeek002
     * @tc.desc       : test OH_AVPlayer_Seek
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSeek002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSeekAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETCURRENTTIME_0100
     * @tc.name       : testOhAvPlayerGetCurrentTime001
     * @tc.desc       : test OH_AVPlayer_GetCurrentTime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetCurrentTime001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetCurrentTime();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETCURRENTTIME_0200
     * @tc.name       : testOhAvPlayerGetCurrentTime002
     * @tc.desc       : test OH_AVPlayer_GetCurrentTime
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetCurrentTime002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetCurrentTimeAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETVIDEOWIDTH_0100
     * @tc.name       : testOhAvPlayerGetVideoWidth001
     * @tc.desc       : test OH_AVPlayer_GetVideoWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetVideoWidth001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetVideoWidth();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETVIDEOWIDTH_0200
     * @tc.name       : testOhAvPlayerGetVideoWidth002
     * @tc.desc       : test OH_AVPlayer_GetVideoWidth
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetVideoWidth002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetVideoWidthAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETVIDEOHEIGHT_0100
     * @tc.name       : testOhAvPlayerGetVideoHeight001
     * @tc.desc       : test OH_AVPlayer_GetVideoHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetVideoHeight001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetVideoHeight();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETVIDEOHEIGHT_0200
     * @tc.name       : testOhAvPlayerGetVideoHeight002
     * @tc.desc       : test OH_AVPlayer_GetVideoHeight
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetVideoHeight002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetVideoHeightAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYBACKSPEED_0100
     * @tc.name       : testOhAvPlayerSetPlaybackSpeed001
     * @tc.desc       : test OH_AVPlayer_SetPlaybackSpeed
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackSpeed001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackSpeed();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYBACKSPEED_0200
     * @tc.name       : testOhAvPlayerSetPlaybackSpeed002
     * @tc.desc       : test OH_AVPlayer_SetPlaybackSpeed
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackSpeed002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackSpeedAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /* *
        * @tc.number    : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKSPEED_0300
        * @tc.name      : testOhAvPlayerSetPlaybackSpeed003
        * @tc.desc      : test AvPlayerSetPlaybackSpeedNormalThree
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('testOhAvPlayerSetPlaybackSpeed003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackSpeedNormalThree();
      expect(result).assertEqual(-1);
      done();
    });

    /* *
        * @tc.number    : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKSPEED_0400
        * @tc.name      : testOhAvPlayerSetPlaybackSpeed004
        * @tc.desc      : test AvPlayerGetPlaybackSpeedAbnormalThree
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('testOhAvPlayerSetPlaybackSpeed004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetPlaybackSpeedAbnormalThree();
      expect(result).assertEqual(0);
      done();
    });
  
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETPLAYBACKSPEED_0100
     * @tc.name       : testOhAvPlayerGetPlaybackSpeed001
     * @tc.desc       : test OH_AVPlayer_GetPlaybackSpeed
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetPlaybackSpeed001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETPLAYBACKSPEED_0200
     * @tc.name       : testOhAvPlayerGetPlaybackSpeed002
     * @tc.desc       : test OH_AVPlayer_GetPlaybackSpeed
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetPlaybackSpeed002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetPlaybackSpeedAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /* *
        * @tc.number    : SUB_MULTIMEIDA_AVPLAYER_GETPLAYBACKSPEED_0300
        * @tc.name      : testOhAvPlayerGetPlaybackSpeed003
        * @tc.desc      : test AvPlayerGetPlaybackSpeedNormalThree
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('testOhAvPlayerGetPlaybackSpeed003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetPlaybackSpeedNormalThree();
      expect(result).assertEqual(-1);
      done();
    });

    /* *
        * @tc.number    : SUB_MULTIMEIDA_AVPLAYER_GETPLAYBACKSPEED_0400
        * @tc.name      : testOhAvPlayerGetPlaybackSpeed004
        * @tc.desc      : test AvPlayerGetPlaybackSpeedAbnormalThree
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level 0
    */
    it('testOhAvPlayerGetPlaybackSpeed004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetPlaybackSpeedAbnormalThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SELECTBITRATE_0100
     * @tc.name       : testOhAvPlayerSelectBitRate001
     * @tc.desc       : test OH_AVPlayer_SelectBitRate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSelectBitRate001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSelectBitRate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SELECTBITRATE_0200
     * @tc.name       : testOhAvPlayerSelectBitRate002
     * @tc.desc       : test OH_AVPlayer_SelectBitRate
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSelectBitRate002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSelectBitRateAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETVIDEOSURFACE_0100
     * @tc.name       : testOhAvPlayerSetVideoSurface001
     * @tc.desc       : test OH_AVPlayer_SetVideoSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetVideoSurface001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVideoSurface();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETVIDEOSURFACE_0200
     * @tc.name       : testOhAvPlayerSetVideoSurface002
     * @tc.desc       : test OH_AVPlayer_SetVideoSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetVideoSurface002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVideoSurfaceAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETVIDEOSURFACE_0300
     * @tc.name       : testOhAvPlayerSetVideoSurface003
     * @tc.desc       : test OH_AVPlayer_SetVideoSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetVideoSurface003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVideoSurfaceAbnormalTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETVIDEOSURFACE_0400
     * @tc.name       : testOhAvPlayerSetVideoSurface004
     * @tc.desc       : test OH_AVPlayer_SetVideoSurface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetVideoSurface004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVideoSurfaceAbnormalThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETDURATION_0100
     * @tc.name       : testOhAvPlayerGetDuration001
     * @tc.desc       : test OH_AVPlayer_GetDuration
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetDuration001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetDuration();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETDURATION_0200
     * @tc.name       : testOhAvPlayerGetDuration002
     * @tc.desc       : test OH_AVPlayer_GetDuration
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetDuration002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetDurationAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETSTATE_0100
     * @tc.name       : testOhAvPlayerGetState001
     * @tc.desc       : test OH_AVPlayer_GetState
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvPlayerGetState001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetState(1, 1, 1, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETSTATE_0200
     * @tc.name       : testOhAvPlayerGetState002
     * @tc.desc       : test OH_AVPlayer_GetState
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvPlayerGetState002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetState(1, 0, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETSTATE_0300
     * @tc.name       : testOhAvPlayerGetState003
     * @tc.desc       : test OH_AVPlayer_GetState
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvPlayerGetState003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetState(1, 1, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETSTATE_0400
     * @tc.name       : testOhAvPlayerGetState004
     * @tc.desc       : test OH_AVPlayer_GetState
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOhAvPlayerGetState004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetState(0, 0, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_ISPLAYING_0100
     * @tc.name       : testOhAvPlayerIsPlaying001
     * @tc.desc       : test OH_AVPlayer_IsPlaying
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerIsPlaying001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerIsPlaying();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_ISPLAYING_0200
     * @tc.name       : testOhAvPlayerIsPlaying002
     * @tc.desc       : test OH_AVPlayer_IsPlaying
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerIsPlaying002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerIsPlayingAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_ISLOOPING_0100
     * @tc.name       : testOhAvPlayerIsLooping001
     * @tc.desc       : test OH_AVPlayer_IsLooping
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerIsLooping001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerIsLooping();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_ISLOOPING_0200
     * @tc.name       : testOhAvPlayerIsLooping002
     * @tc.desc       : test OH_AVPlayer_IsLooping
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerIsLooping002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerIsLoopingAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETLOOPING_0100
     * @tc.name       : testOhAvPlayerSetLooping001
     * @tc.desc       : test OH_AVPlayer_SetLooping
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetLooping001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetLooping();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETLOOPING_0200
     * @tc.name       : testOhAvPlayerSetLooping002
     * @tc.desc       : test OH_AVPlayer_SetLooping
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetLooping002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetLoopingAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYERCALLBACK_0100
     * @tc.name       : testOhAvPlayerSetPlayerCallback001
     * @tc.desc       : test OH_AVPlayer_SetPlayerCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlayerCallback001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlayerCallback();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYERCALLBACK_0200
     * @tc.name       : testOhAvPlayerSetPlayerCallback002
     * @tc.desc       : test OH_AVPlayer_SetPlayerCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlayerCallback002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlayerCallbackAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYERCALLBACK_0300
     * @tc.name       : testOhAvPlayerSetPlayerCallback003
     * @tc.desc       : test OH_AVPlayer_SetPlayerCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlayerCallback003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlayerCallbackAbnormalTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYERCALLBACK_0400
     * @tc.name       : testOhAvPlayerSetPlayerCallback004
     * @tc.desc       : test OH_AVPlayer_SetPlayerCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlayerCallback004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlayerCallbackAbnormalThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SELECTTRACK_0100
     * @tc.name       : testOhAvPlayerSelectTrack001
     * @tc.desc       : test OH_AVPlayer_SelectTrack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSelectTrack001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSelectTrack();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_SELECTTRACK_0200
     * @tc.name       : testOhAvPlayerSelectTrack002
     * @tc.desc       : test OH_AVPlayer_SelectTrack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSelectTrack002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSelectTrackAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_DESELECTTRACK_0100
     * @tc.name       : testOhAvPlayerDeselectTrack001
     * @tc.desc       : test OH_AVPlayer_DeselectTrack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerDeselectTrack001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerDeselectTrack();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_DESELECTTRACK_0200
     * @tc.name       : testOhAvPlayerDeselectTrack002
     * @tc.desc       : test OH_AVPlayer_DeselectTrack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerDeselectTrack002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerDeselectTrackAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETCURRENTTRACK_0100
     * @tc.name       : testOhAvPlayerGetCurrentTrack001
     * @tc.desc       : test OH_AVPlayer_GetCurrentTrack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetCurrentTrack001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetCurrentTrack();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_NDK_GETCURRENTTRACK_0200
     * @tc.name       : testOhAvPlayerGetCurrentTrack002
     * @tc.desc       : test OH_AVPlayer_GetCurrentTrack
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerGetCurrentTrack002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetCurrentTrackAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACK_0100
     * @tc.name       : testOhAvPlayerSetOnInfoCallback001
     * @tc.desc       : test OH_AVPlayer_SetOnInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnInfoCallback001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallback(1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACK_0200
     * @tc.name       : testOhAvPlayerSetOnInfoCallback002
     * @tc.desc       : test OH_AVPlayer_SetOnInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnInfoCallback002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallback(1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACK_0300
     * @tc.name       : testOhAvPlayerSetOnInfoCallback003
     * @tc.desc       : test OH_AVPlayer_SetOnInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnInfoCallback003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallback(0, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACK_0400
     * @tc.name       : testOhAvPlayerSetOnInfoCallback004
     * @tc.desc       : test OH_AVPlayer_SetOnInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnInfoCallback004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallback(0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKABNORMAL_0100
     * @tc.name       : testOhAvPlayerSetOnInfoCallbackAbnormal001
     * @tc.desc       : test OH_AVPlayer_SetOnInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnInfoCallbackAbnormal001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackAbnormal(0, 1, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKABNORMAL_0200
     * @tc.name       : testOhAvPlayerSetOnInfoCallbackAbnormal002
     * @tc.desc       : test OH_AVPlayer_SetOnInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnInfoCallbackAbnormal002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackAbnormal(1, 1, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKABNORMAL_0300
     * @tc.name       : testOhAvPlayerSetOnInfoCallbackAbnormal003
     * @tc.desc       : test OH_AVPlayer_SetOnInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnInfoCallbackAbnormal003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackAbnormal(1, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKABNORMAL_0400
     * @tc.name       : testOhAvPlayerSetOnInfoCallbackAbnormal004
     * @tc.desc       : test OH_AVPlayer_SetOnInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnInfoCallbackAbnormal004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackAbnormal(1, 1, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKABNORMAL_0500
     * @tc.name       : testOhAvPlayerSetOnInfoCallbackAbnormal005
     * @tc.desc       : test OH_AVPlayer_SetOnInfoCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnInfoCallbackAbnormal005', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackAbnormal(1, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKWITHPREPARE_0100
     * @tc.name       : testOhAvPlayerSetOnInfoCallbackWithPrepare001
     * @tc.desc       : test OH_AVPlayer_SetOnErrorCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnInfoCallbackWithPrepare001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackWithPrepare();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACK_0100
     * @tc.name       : testOhAvPlayerSetOnErrorCallback001
     * @tc.desc       : test OH_AVPlayer_SetOnErrorCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnErrorCallback001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallback(1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACK_0200
     * @tc.name       : testOhAvPlayerSetOnErrorCallback002
     * @tc.desc       : test OH_AVPlayer_SetOnErrorCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnErrorCallback002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallback(1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACK_0300
     * @tc.name       : testOhAvPlayerSetOnErrorCallback003
     * @tc.desc       : test OH_AVPlayer_SetOnErrorCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnErrorCallback003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallback(0, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACK_0400
     * @tc.name       : testOhAvPlayerSetOnErrorCallback004
     * @tc.desc       : test OH_AVPlayer_SetOnErrorCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnErrorCallback004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallback(0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACKABNORMAL_0100
     * @tc.name       : testOhAvPlayerSetOnErrorCallbackAbnormal001
     * @tc.desc       : test OH_AVPlayer_SetOnErrorCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnErrorCallbackAbnormal001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallbackAbnormal(0, 1, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACKABNORMAL_0200
     * @tc.name       : testOhAvPlayerSetOnErrorCallbackAbnormal002
     * @tc.desc       : test OH_AVPlayer_SetOnErrorCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnErrorCallbackAbnormal002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallbackAbnormal(1, 1, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACKABNORMAL_0300
     * @tc.name       : testOhAvPlayerSetOnErrorCallbackAbnormal003
     * @tc.desc       : test OH_AVPlayer_SetOnErrorCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnErrorCallbackAbnormal003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallbackAbnormal(1, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACKABNORMAL_0400
     * @tc.name       : testOhAvPlayerSetOnErrorCallbackAbnormal004
     * @tc.desc       : test OH_AVPlayer_SetOnErrorCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnErrorCallbackAbnormal004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallbackAbnormal(1, 1, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACKABNORMAL_0500
     * @tc.name       : testOhAvPlayerSetOnErrorCallbackAbnormal005
     * @tc.desc       : test OH_AVPlayer_SetOnErrorCallback
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetOnErrorCallbackAbnormal005', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallbackAbnormal(1, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0100
     * @tc.name       : testOhAvPlayerPrepareSetPlaybackRate001
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with rate 0.125
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPrepareSetPlaybackRate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(0.125);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0200
     * @tc.name       : testOhAvPlayerPrepareSetPlaybackRate002
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with rate 0.25
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPrepareSetPlaybackRate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(0.25);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0300
     * @tc.name       : testOhAvPlayerPrepareSetPlaybackRate003
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with rate 0.5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPrepareSetPlaybackRate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(0.5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0400
     * @tc.name       : testOhAvPlayerPrepareSetPlaybackRate004
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with rate 0.75
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPrepareSetPlaybackRate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(0.75);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0500
     * @tc.name       : testOhAvPlayerPlaySetPlaybackRate001
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during play with rate 1.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPlaySetPlaybackRate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPlaySetPlaybackRate(1.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0600
     * @tc.name       : testOhAvPlayerPlaySetPlaybackRate002
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during play with rate 1.25
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPlaySetPlaybackRate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPlaySetPlaybackRate(1.25);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0700
     * @tc.name       : testOhAvPlayerPlaySetPlaybackRate003
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during play with rate 1.75
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPlaySetPlaybackRate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPlaySetPlaybackRate(1.75);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0800
     * @tc.name       : testOhAvPlayerPlaySetPlaybackRate004
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during play with rate 2.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPlaySetPlaybackRate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPlaySetPlaybackRate(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0900
     * @tc.name       : testOhAvPlayerPauseSetPlaybackRate001
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during pause with rate 2.25
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPauseSetPlaybackRate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPauseSetPlaybackRate(2.25);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1000
     * @tc.name       : testOhAvPlayerPauseSetPlaybackRate002
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during pause with rate 2.5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPauseSetPlaybackRate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPauseSetPlaybackRate(2.5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1100
     * @tc.name       : testOhAvPlayerPauseSetPlaybackRate003
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during pause with rate 2.75
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPauseSetPlaybackRate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPauseSetPlaybackRate(2.75);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1200
     * @tc.name       : testOhAvPlayerPauseSetPlaybackRate004
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during pause with rate 3.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerPauseSetPlaybackRate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPauseSetPlaybackRate(3.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1300
     * @tc.name       : testOhAvPlayerPauseSetPlaybackRate005
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during prepare with rate 3.25
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAvPlayerCompleteSetPlaybackRate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let user: avplayer.NdkUser = avplayer.AvPlayerCompleteSetPlaybackRate(3.25);
      let result = -1;
      while (result != 0) {
        await Utils.sleep(1000);
        result = avplayer.CheckAvPlayerPlaybackRate(user);
      }
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1400
     * @tc.name       : testOhAvPlayerPauseSetPlaybackRate006
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during prepare with rate 3.5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAvPlayerCompleteSetPlaybackRate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let user: avplayer.NdkUser = avplayer.AvPlayerCompleteSetPlaybackRate(3.5);
      let result = -1;
      while (result != 0) {
        await Utils.sleep(1000);
        result = avplayer.CheckAvPlayerPlaybackRate(user);
      }
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1500
     * @tc.name       : testOhAvPlayerPauseSetPlaybackRate007
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during prepare with rate 3.75
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAvPlayerCompleteSetPlaybackRate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let user: avplayer.NdkUser = avplayer.AvPlayerCompleteSetPlaybackRate(3.75);
      let result = -1;
      while (result != 0) {
        await Utils.sleep(1000);
        result = avplayer.CheckAvPlayerPlaybackRate(user);
      }
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1600
     * @tc.name       : testOhAvPlayerPauseSetPlaybackRate008
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during prepare with rate 4.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testAvPlayerCompleteSetPlaybackRate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let user: avplayer.NdkUser = avplayer.AvPlayerCompleteSetPlaybackRate(4.0);
      let result = -1;
      while (result != 0) {
        await Utils.sleep(1000);
        result = avplayer.CheckAvPlayerPlaybackRate(user);
      }
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1700
     * @tc.name       : testOhAvPlayerSetPlaybackRateBoundaryValue001
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with boundary value 0.126
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateBoundaryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(0.126);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1800
     * @tc.name       : testOhAvPlayerSetPlaybackRateBoundaryValue002
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with boundary value 3.999
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateBoundaryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(3.999);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1900
     * @tc.name       : testOhAvPlayerSetPlaybackRateError001
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with error value 0.124
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateError(0.124);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2000
     * @tc.name       : testOhAvPlayerSetPlaybackRateError002
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with error value 4.001
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateError(4.001);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2100
     * @tc.name       : testOhAvPlayerSetPlaybackRateError003
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with error value 0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateError(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2200
     * @tc.name       : testOhAvPlayerSetPlaybackRateError004
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with error value -1
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateError(-1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2300
     * @tc.name       : testOhAvPlayerSetPlaybackRateError005
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate with error value 10000
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateError(10000);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2400
     * @tc.name       : testOhAvPlayerSetPlaybackRateTwice001
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate twice with rates 1.0 and 2.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateTwice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateTwice(1.0, 2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2500
     * @tc.name       : testOhAvPlayerSetPlaybackRateTwice002
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate twice with rates 2.0 and 0.5
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateTwice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateTwice(2.0, 0.5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2600
     * @tc.name       : testOhAvPlayerSetPlaybackRateTwice003
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate twice with rates 0.125 and 4.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateTwice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateTwice(0.125, 4.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2700
     * @tc.name       : testOhAvPlayerSetPlaybackRateTwice004
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate twice with rates 4.0 and 0.125
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateTwice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateTwice(4.0, 0.125);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2800
     * @tc.name       : testOhAvPlayerSetPlaybackRateAfterSeek001
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate after seek with rate 2.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateAfterSeek001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateAfterSeek(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2900
     * @tc.name       : testOhAvPlayerSetPlaybackRateBeforeSeek001
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate before seek with rate 2.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateBeforeSeek001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateBeforeSeek(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_3000
     * @tc.name       : testOhAvPlayerStopSetPlaybackRate
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during stop with rate 2.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerStopSetPlaybackRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerStopSetPlaybackRate(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_3100
     * @tc.name       : testOhAvPlayerIdleSetPlaybackRate
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during idle with rate 2.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerIdleSetPlaybackRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerIdleSetPlaybackRate(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_3200
     * @tc.name       : testOhAvPlayerInitSetPlaybackRate
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during init with rate 2.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerInitSetPlaybackRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerInitSetPlaybackRate(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_3300
     * @tc.name       : testOhAvPlayerReleaseSetPlaybackRate
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate during release with rate 2.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerReleaseSetPlaybackRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerReleaseSetPlaybackRate(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.number     : SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_3400
     * @tc.name       : testOhAvPlayerSetPlaybackRateBeforeSeek001
     * @tc.desc       : test OH_AVPlayer_SetPlaybackRate before pause with rate 2.0
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('testOhAvPlayerSetPlaybackRateBeforePause', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateBeforePause(2.0);
      expect(result).assertEqual(0);
      done();
    });
  })
}
