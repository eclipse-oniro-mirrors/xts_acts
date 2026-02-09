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
     * @tc.name   testOhAvPlayerCreate001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_CREATE_0100
     * @tc.desc   test OH_AVPlayer_Create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerCreate001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerCreate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetURLSource001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETURLSOURCE_0100
     * @tc.desc   test OH_AVPlayer_SetURLSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetURLSource001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetURLSourceAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetURLSource003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETURLSOURCE_0300
     * @tc.desc   test OH_AVPlayer_SetURLSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetURLSource003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetURLSourceAbnormalTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetFDSource001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETFDSOURCE_0100
     * @tc.desc   test OH_AVPlayer_SetFDSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetFDSource001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetFDSource();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetFDSource002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETFDSOURCE_0200
     * @tc.desc   test OH_AVPlayer_SetFDSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetFDSource002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetFDSourceAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetFDSource003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETFDSOURCE_0300
     * @tc.desc   test OH_AVPlayer_SetFDSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetFDSource003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetFDSourceAbnormalTwo();
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testOhAvPlayerSetFDSource004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETFDSOURCE_0400
     * @tc.desc   test OH_AVPlayer_SetFDSource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetFDSource004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetFDSourceAbnormalThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetAudioRendererInfo001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETAUDIORENDERERINFO_0100
     * @tc.desc   test OH_AVPlayer_SetAudioRendererInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetAudioRendererInfo001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetAudioRendererInfo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVolumeMode001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETAUDIORENDERERINFO_0100
     * @tc.desc   test OH_AVPlayer_SetVolumeMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVolumeMode001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVolumeMode();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetAudioInterruptMode001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETAUDIOINTERRUPTMODE_0100
     * @tc.desc   test OH_AVPlayer_SetAudioInterruptMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetAudioInterruptMode001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetAudioInterruptMode();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetAudioEffectMode001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETAUDIOEFFECTMODE_0100
     * @tc.desc   test OH_AVPlayer_SetAudioEffectMode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetAudioEffectMode001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetAudioEffectMode();
      expect(result).assertEqual(-1);
      done();
    });
    
    /**
     * @tc.name   testOhAvPlayerPrepare001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PREPARE_0100
     * @tc.desc   test OH_AVPlayer_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPrepare001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepare(1, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPrepare002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PREPARE_0200
     * @tc.desc   test OH_AVPlayer_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPrepare002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepare(0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPrepare003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PREPARE_0300
     * @tc.desc   test OH_AVPlayer_Prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPrepare003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepare(0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPlay001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PLAY_0100
     * @tc.desc   test OH_AVPlayer_Play
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPlay001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPlay(1, 1, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPlay002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PLAY_0200
     * @tc.desc   test OH_AVPlayer_Play
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPlay002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPlay(0, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPlay003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PLAY_0300
     * @tc.desc   test OH_AVPlayer_Play
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPlay003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPlay(1, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testOhAvPlayerPlay004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PLAY_0400
     * @tc.desc   test OH_AVPlayer_Play
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPlay004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPlay(0, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPause001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PAUSE_0100
     * @tc.desc   test OH_AVPlayer_Pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPause001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPause(1, 1, 1, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPause002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PAUSE_0200
     * @tc.desc   test OH_AVPlayer_Pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPause002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPause(0, 0, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPause003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PAUSE_0300
     * @tc.desc   test OH_AVPlayer_Pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPause003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPause(1, 0, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPause004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PAUSE_0400
     * @tc.desc   test OH_AVPlayer_Pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPause004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPause(1, 1, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testOhAvPlayerPause005
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_PAUSE_0500
     * @tc.desc   test OH_AVPlayer_Pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPause005', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerPause(0, 0, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerStop001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_STOP_0100
     * @tc.desc   test OH_AVPlayer_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerStop001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerStop(1, 1, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerStop002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_STOP_0200
     * @tc.desc   test OH_AVPlayer_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerStop002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerStop(0, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerStop003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_STOP_0300
     * @tc.desc   test OH_AVPlayer_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerStop003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerStop(1, 0, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerStop004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_STOP_0400
     * @tc.desc   test OH_AVPlayer_Stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerStop004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerStop(0, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerReset001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_RESET_0100
     * @tc.desc   test OH_AVPlayer_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerReset001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReset(1, 1, 1, 0, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerReset002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_RESET_0200
     * @tc.desc   test OH_AVPlayer_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerReset002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReset(1, 1, 1, 1, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testOhAvPlayerReset003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_RESET_0300
     * @tc.desc   test OH_AVPlayer_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerReset003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReset(1, 1, 1, 0, 1, 1, 1);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testOhAvPlayerReset004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_RESET_0400
     * @tc.desc   test OH_AVPlayer_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerReset004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReset(1, 0, 0, 0, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerReset005
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_RESET_0500
     * @tc.desc   test OH_AVPlayer_Reset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerReset005', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReset(0, 0, 0, 0, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerRelease001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_RELEASE_0100
     * @tc.desc   test OH_AVPlayer_Release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerRelease001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerRelease();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerRelease002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_RELEASE_0200
     * @tc.desc   test OH_AVPlayer_Release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerRelease002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReleaseAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerReleaseSync001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_RELEASESYNC_0100
     * @tc.desc   test OH_AVPlayer_ReleaseSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerReleaseSync001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReleaseSync();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerReleaseSync002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_RELEASESYNC_0200
     * @tc.desc   test OH_AVPlayer_ReleaseSync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerReleaseSync002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerReleaseSyncAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVolume001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETVOLUME_0100
     * @tc.desc   test OH_AVPlayer_SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVolume001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVolume();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVolume002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETVOLUME_0200
     * @tc.desc   test OH_AVPlayer_SetVolume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVolume002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVolumeAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSeek001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SEEK_0100
     * @tc.desc   test OH_AVPlayer_Seek
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSeek001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSeek();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSeek002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SEEK_0200
     * @tc.desc   test OH_AVPlayer_Seek
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSeek002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSeekAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetCurrentTime001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETCURRENTTIME_0100
     * @tc.desc   test OH_AVPlayer_GetCurrentTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetCurrentTime001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetCurrentTime();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetCurrentTime002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETCURRENTTIME_0200
     * @tc.desc   test OH_AVPlayer_GetCurrentTime
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetCurrentTime002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetCurrentTimeAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetVideoWidth001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETVIDEOWIDTH_0100
     * @tc.desc   test OH_AVPlayer_GetVideoWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetVideoWidth001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetVideoWidth();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetVideoWidth002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETVIDEOWIDTH_0200
     * @tc.desc   test OH_AVPlayer_GetVideoWidth
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetVideoWidth002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetVideoWidthAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetVideoHeight001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETVIDEOHEIGHT_0100
     * @tc.desc   test OH_AVPlayer_GetVideoHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetVideoHeight001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetVideoHeight();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetVideoHeight002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETVIDEOHEIGHT_0200
     * @tc.desc   test OH_AVPlayer_GetVideoHeight
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetVideoHeight002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetVideoHeightAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackSpeed001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYBACKSPEED_0100
     * @tc.desc   test OH_AVPlayer_SetPlaybackSpeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackSpeed001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackSpeed();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackSpeed002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYBACKSPEED_0200
     * @tc.desc   test OH_AVPlayer_SetPlaybackSpeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackSpeed002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackSpeedAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackSpeed003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKSPEED_0300
     * @tc.desc   test AvPlayerSetPlaybackSpeedNormalThree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackSpeed003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackSpeedNormalThree();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackSpeed004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKSPEED_0400
     * @tc.desc   test AvPlayerGetPlaybackSpeedAbnormalThree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackSpeed004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetPlaybackSpeedAbnormalThree();
      expect(result).assertEqual(0);
      done();
    });
  
    /**
     * @tc.name   testOhAvPlayerGetPlaybackSpeed001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETPLAYBACKSPEED_0100
     * @tc.desc   test OH_AVPlayer_GetPlaybackSpeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetPlaybackSpeed001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetPlaybackSpeed();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetPlaybackSpeed002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETPLAYBACKSPEED_0200
     * @tc.desc   test OH_AVPlayer_GetPlaybackSpeed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetPlaybackSpeed002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetPlaybackSpeedAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetPlaybackSpeed003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_GETPLAYBACKSPEED_0300
     * @tc.desc   test AvPlayerGetPlaybackSpeedNormalThree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetPlaybackSpeed003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetPlaybackSpeedNormalThree();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetPlaybackSpeed004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_GETPLAYBACKSPEED_0400
     * @tc.desc   test AvPlayerGetPlaybackSpeedAbnormalThree
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetPlaybackSpeed004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetPlaybackSpeedAbnormalThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSelectBitRate001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SELECTBITRATE_0100
     * @tc.desc   test OH_AVPlayer_SelectBitRate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSelectBitRate001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSelectBitRate();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSelectBitRate002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SELECTBITRATE_0200
     * @tc.desc   test OH_AVPlayer_SelectBitRate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSelectBitRate002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSelectBitRateAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVideoSurface001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETVIDEOSURFACE_0100
     * @tc.desc   test OH_AVPlayer_SetVideoSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVideoSurface001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVideoSurface();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVideoSurface002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETVIDEOSURFACE_0200
     * @tc.desc   test OH_AVPlayer_SetVideoSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVideoSurface002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVideoSurfaceAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVideoSurface003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETVIDEOSURFACE_0300
     * @tc.desc   test OH_AVPlayer_SetVideoSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVideoSurface003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVideoSurfaceAbnormalTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetVideoSurface004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETVIDEOSURFACE_0400
     * @tc.desc   test OH_AVPlayer_SetVideoSurface
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetVideoSurface004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetVideoSurfaceAbnormalThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetDuration001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETDURATION_0100
     * @tc.desc   test OH_AVPlayer_GetDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetDuration001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetDuration();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetDuration002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETDURATION_0200
     * @tc.desc   test OH_AVPlayer_GetDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetDuration002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetDurationAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetState001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETSTATE_0100
     * @tc.desc   test OH_AVPlayer_GetState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetState001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetState(1, 1, 1, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetState002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETSTATE_0200
     * @tc.desc   test OH_AVPlayer_GetState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetState002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetState(1, 0, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testOhAvPlayerGetState003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETSTATE_0300
     * @tc.desc   test OH_AVPlayer_GetState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetState003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetState(1, 1, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   testOhAvPlayerGetState004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETSTATE_0400
     * @tc.desc   test OH_AVPlayer_GetState
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetState004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetState(0, 0, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerIsPlaying001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_ISPLAYING_0100
     * @tc.desc   test OH_AVPlayer_IsPlaying
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerIsPlaying001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerIsPlaying();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerIsPlaying002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_ISPLAYING_0200
     * @tc.desc   test OH_AVPlayer_IsPlaying
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerIsPlaying002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerIsPlayingAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerIsLooping001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_ISLOOPING_0100
     * @tc.desc   test OH_AVPlayer_IsLooping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerIsLooping001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerIsLooping();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerIsLooping002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_ISLOOPING_0200
     * @tc.desc   test OH_AVPlayer_IsLooping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerIsLooping002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerIsLoopingAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLooping001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETLOOPING_0100
     * @tc.desc   test OH_AVPlayer_SetLooping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLooping001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetLooping();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLooping002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETLOOPING_0200
     * @tc.desc   test OH_AVPlayer_SetLooping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLooping002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetLoopingAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlayerCallback001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYERCALLBACK_0100
     * @tc.desc   test OH_AVPlayer_SetPlayerCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlayerCallback001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlayerCallback();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlayerCallback002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYERCALLBACK_0200
     * @tc.desc   test OH_AVPlayer_SetPlayerCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlayerCallback002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlayerCallbackAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlayerCallback003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYERCALLBACK_0300
     * @tc.desc   test OH_AVPlayer_SetPlayerCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlayerCallback003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlayerCallbackAbnormalTwo();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlayerCallback004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SETPLAYERCALLBACK_0400
     * @tc.desc   test OH_AVPlayer_SetPlayerCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlayerCallback004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlayerCallbackAbnormalThree();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSelectTrack001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SELECTTRACK_0100
     * @tc.desc   test OH_AVPlayer_SelectTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSelectTrack001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSelectTrack();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSelectTrack002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_SELECTTRACK_0200
     * @tc.desc   test OH_AVPlayer_SelectTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSelectTrack002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSelectTrackAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerDeselectTrack001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_DESELECTTRACK_0100
     * @tc.desc   test OH_AVPlayer_DeselectTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerDeselectTrack001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerDeselectTrack();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerDeselectTrack002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_DESELECTTRACK_0200
     * @tc.desc   test OH_AVPlayer_DeselectTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerDeselectTrack002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerDeselectTrackAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetCurrentTrack001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETCURRENTTRACK_0100
     * @tc.desc   test OH_AVPlayer_GetCurrentTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetCurrentTrack001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetCurrentTrack();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetCurrentTrack002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_NDK_GETCURRENTTRACK_0200
     * @tc.desc   test OH_AVPlayer_GetCurrentTrack
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetCurrentTrack002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerGetCurrentTrackAbnormalOne();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnInfoCallback001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACK_0100
     * @tc.desc   test OH_AVPlayer_SetOnInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnInfoCallback001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallback(1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnInfoCallback002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACK_0200
     * @tc.desc   test OH_AVPlayer_SetOnInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnInfoCallback002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallback(1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnInfoCallback003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACK_0300
     * @tc.desc   test OH_AVPlayer_SetOnInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnInfoCallback003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallback(0, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnInfoCallback004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACK_0400
     * @tc.desc   test OH_AVPlayer_SetOnInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnInfoCallback004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallback(0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnInfoCallbackAbnormal001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKABNORMAL_0100
     * @tc.desc   test OH_AVPlayer_SetOnInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnInfoCallbackAbnormal001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackAbnormal(0, 1, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnInfoCallbackAbnormal002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKABNORMAL_0200
     * @tc.desc   test OH_AVPlayer_SetOnInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnInfoCallbackAbnormal002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackAbnormal(1, 1, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnInfoCallbackAbnormal003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKABNORMAL_0300
     * @tc.desc   test OH_AVPlayer_SetOnInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnInfoCallbackAbnormal003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackAbnormal(1, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnInfoCallbackAbnormal004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKABNORMAL_0400
     * @tc.desc   test OH_AVPlayer_SetOnInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnInfoCallbackAbnormal004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackAbnormal(1, 1, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnInfoCallbackAbnormal005
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKABNORMAL_0500
     * @tc.desc   test OH_AVPlayer_SetOnInfoCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnInfoCallbackAbnormal005', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackAbnormal(1, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnInfoCallbackWithPrepare001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONINFOCALLBACKWITHPREPARE_0100
     * @tc.desc   test OH_AVPlayer_SetOnErrorCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnInfoCallbackWithPrepare001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnInfoCallbackWithPrepare();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnErrorCallback001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACK_0100
     * @tc.desc   test OH_AVPlayer_SetOnErrorCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnErrorCallback001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallback(1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnErrorCallback002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACK_0200
     * @tc.desc   test OH_AVPlayer_SetOnErrorCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnErrorCallback002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallback(1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnErrorCallback003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACK_0300
     * @tc.desc   test OH_AVPlayer_SetOnErrorCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnErrorCallback003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallback(0, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnErrorCallback004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACK_0400
     * @tc.desc   test OH_AVPlayer_SetOnErrorCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnErrorCallback004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallback(0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnErrorCallbackAbnormal001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACKABNORMAL_0100
     * @tc.desc   test OH_AVPlayer_SetOnErrorCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnErrorCallbackAbnormal001', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallbackAbnormal(0, 1, 1, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnErrorCallbackAbnormal002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACKABNORMAL_0200
     * @tc.desc   test OH_AVPlayer_SetOnErrorCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnErrorCallbackAbnormal002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallbackAbnormal(1, 1, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnErrorCallbackAbnormal003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACKABNORMAL_0300
     * @tc.desc   test OH_AVPlayer_SetOnErrorCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnErrorCallbackAbnormal003', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallbackAbnormal(1, 0, 1, 1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnErrorCallbackAbnormal004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACKABNORMAL_0400
     * @tc.desc   test OH_AVPlayer_SetOnErrorCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnErrorCallbackAbnormal004', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallbackAbnormal(1, 1, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetOnErrorCallbackAbnormal005
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_CPI_SETONERRORCALLBACKABNORMAL_0500
     * @tc.desc   test OH_AVPlayer_SetOnErrorCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetOnErrorCallbackAbnormal005', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.AvPlayerSetOnErrorCallbackAbnormal(1, 0, 0, 0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPrepareSetPlaybackRate001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0100
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with rate 0.125
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPrepareSetPlaybackRate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(0.125);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPrepareSetPlaybackRate002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0200
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with rate 0.25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPrepareSetPlaybackRate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(0.25);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPrepareSetPlaybackRate003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0300
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with rate 0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPrepareSetPlaybackRate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(0.5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPrepareSetPlaybackRate004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0400
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with rate 0.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPrepareSetPlaybackRate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(0.75);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPlaySetPlaybackRate001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0500
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during play with rate 1.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPlaySetPlaybackRate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPlaySetPlaybackRate(1.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPlaySetPlaybackRate002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0600
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during play with rate 1.25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPlaySetPlaybackRate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPlaySetPlaybackRate(1.25);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPlaySetPlaybackRate003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0700
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during play with rate 1.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPlaySetPlaybackRate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPlaySetPlaybackRate(1.75);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPlaySetPlaybackRate004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0800
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during play with rate 2.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPlaySetPlaybackRate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPlaySetPlaybackRate(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPauseSetPlaybackRate001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_0900
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during pause with rate 2.25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPauseSetPlaybackRate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPauseSetPlaybackRate(2.25);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPauseSetPlaybackRate002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1000
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during pause with rate 2.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPauseSetPlaybackRate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPauseSetPlaybackRate(2.5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPauseSetPlaybackRate003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1100
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during pause with rate 2.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPauseSetPlaybackRate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPauseSetPlaybackRate(2.75);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerPauseSetPlaybackRate004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1200
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during pause with rate 3.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerPauseSetPlaybackRate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPauseSetPlaybackRate(3.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testAvPlayerCompleteSetPlaybackRate001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1300
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during prepare with rate 3.25
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testAvPlayerCompleteSetPlaybackRate002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1400
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during prepare with rate 3.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testAvPlayerCompleteSetPlaybackRate003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1500
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during prepare with rate 3.75
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testAvPlayerCompleteSetPlaybackRate004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1600
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during prepare with rate 4.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
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
     * @tc.name   testOhAvPlayerSetPlaybackRateBoundaryValue001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1700
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with boundary value 0.126
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateBoundaryValue001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(0.126);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateBoundaryValue002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1800
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with boundary value 3.999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateBoundaryValue002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerPrepareSetPlaybackRate(3.999);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateError001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_1900
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with error value 0.124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateError(0.124);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateError002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2000
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with error value 4.001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateError(4.001);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateError003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2100
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with error value 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateError(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateError004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2200
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with error value -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateError(-1);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateError005
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2300
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate with error value 10000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateError(10000);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateTwice001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2400
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate twice with rates 1.0 and 2.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateTwice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateTwice(1.0, 2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateTwice002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2500
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate twice with rates 2.0 and 0.5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateTwice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateTwice(2.0, 0.5);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateTwice003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2600
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate twice with rates 0.125 and 4.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateTwice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateTwice(0.125, 4.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateTwice004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2700
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate twice with rates 4.0 and 0.125
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateTwice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateTwice(4.0, 0.125);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateAfterSeek001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2800
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate after seek with rate 2.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateAfterSeek001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateAfterSeek(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateBeforeSeek001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_2900
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate before seek with rate 2.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateBeforeSeek001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateBeforeSeek(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerStopSetPlaybackRate
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_3000
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during stop with rate 2.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerStopSetPlaybackRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerStopSetPlaybackRate(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerIdleSetPlaybackRate
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_3100
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during idle with rate 2.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerIdleSetPlaybackRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerIdleSetPlaybackRate(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerInitSetPlaybackRate
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_3200
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during init with rate 2.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerInitSetPlaybackRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerInitSetPlaybackRate(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerReleaseSetPlaybackRate
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_3300
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate during release with rate 2.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerReleaseSetPlaybackRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerReleaseSetPlaybackRate(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetPlaybackRateBeforePause
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETPLAYBACKRATE_3400
     * @tc.desc   test OH_AVPlayer_SetPlaybackRate before pause with rate 2.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetPlaybackRateBeforePause', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.AvPlayerSetPlaybackRateBeforePause(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0100
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0200
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(25.0);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0300
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(-90.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness004
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0400
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(24.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness005
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0500
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(0.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness006
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0600
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(-40.4);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness007
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0700
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(10.8);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness008
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0800
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(24.1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness009
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0900
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(-90.1);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness010
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_1000
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(-100.4);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness011
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_1100
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain(60.2);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness012
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0120
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain1(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerSetLoudness013
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_SETLOUDNESS_0130
     * @tc.desc   test OH_AVPlayer_SetLoudnessGain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerSetLoudness013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.setLoudnessGain2(2.0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetMediaDescription001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_GET_MEDIA_DESCRIPTION001
     * @tc.desc   test OH_AVPlayer_GetMediaDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetMediaDescription001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.getMediaDescription();
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetMediaDescription002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_GET_MEDIA_DESCRIPTION002
     * @tc.desc   test OH_AVPlayer_GetMediaDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetMediaDescription002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.getMediaDescriptionOne();
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetTrackDescription001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_GET_TRACK_DESCRIPTION001
     * @tc.desc   test OH_AVPlayer_GetTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetTrackDescription001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.getTrackDescription(0);
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetTrackDescription002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_GET_TRACK_DESCRIPTION002
     * @tc.desc   test OH_AVPlayer_GetTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetTrackDescription002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.getTrackDescription(10);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAvPlayerGetTrackDescription003
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_GET_TRACK_DESCRIPTION003
     * @tc.desc   test OH_AVPlayer_GetTrackDescription
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOhAvPlayerGetTrackDescription003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let result: number = avplayer.getTrackDescriptionOne(0);
      expect(result).assertEqual(-1);
      done();
    });

    /**
     * @tc.name   testOhAVPlayerGetPlaybackStatisticMetrics001
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_GETPLAYBACKSTATISTICMETRICS_0100
     * @tc.desc   test OH_AVPlayer_GetPlaybackStatisticMetrics
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
     it('testOhAVPlayerGetPlaybackStatisticMetrics001', Level.LEVEL0,async (done: Function) => {
      let context = getContext();
      let fileDescriptor = await context.resourceManager.getRawFd("H264_AAC.mp4");
      let result: Record<string, number> = avplayer.getPlaybackStatisticMetrics(fileDescriptor.fd, fileDescriptor.offset, fileDescriptor.length);
      console.info(`testOhAvPlayerGetPlaybackStatisticMetrics001 result = ${JSON.stringify(result)}`);
      expect(parseInt(result["prepare_duration"].toString())).assertLargerOrEqual(0);
      expect(parseInt(result["resource_connection_duration"].toString())).assertLargerOrEqual(0);
      expect(parseInt(result["first_frame_decapsulation_duration"].toString())).assertLargerOrEqual(0);
      expect(parseInt(result["total_playback_time"].toString())).assertLargerOrEqual(0);
      expect(parseInt(result["loading_requests_count"].toString())).assertLargerOrEqual(0);
      expect(parseInt(result["total_loading_time"].toString())).assertLargerOrEqual(0);
      expect(parseInt(result["total_loading_bytes"].toString())).assertLargerOrEqual(0);
      expect(parseInt(result["stalling_count"].toString())).assertLargerOrEqual(0);
      expect(parseInt(result["total_stalling_time"].toString())).assertLargerOrEqual(0);
      await context.resourceManager.closeRawFd("H264_AAC.mp4");
      done();
    });

    /**
     * @tc.name   testOhAVPlayerGetPlaybackStatisticMetrics002
     * @tc.number SUB_MULTIMEIDA_AVPLAYER_GETPLAYBACKSTATISTICMETRICS_0200
     * @tc.desc   test OH_AVPlayer_GetPlaybackStatisticMetrics, input null avplayer
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testOhAVPlayerGetPlaybackStatisticMetrics002', Level.LEVEL0,async (done: Function) => {
      let result: number = avplayer.getPlaybackStatisticMetricsAbnormal();
      console.info(`testOhAvPlayerGetPlaybackStatisticMetricsAbnormal001 result = ${result}`);
      expect(result).assertEqual(0);
      done();
    });
  })
}
