/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import audio from '@ohos.multimedia.audio';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll, Level, TestType, Size } from "../../../hypium/index";
import Utils from './Util.test';
import { Driver, MatchPattern, ON } from "@ohos.UiTest";
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions }  from 'permissions';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

const Tag: string = 'AudioCpaturerEnhanceTest: ';
let tag: string = 'AudioCpaturerEnhanceTest';
let g_context: common.UIAbilityContext;
let audioCap: audio.AudioCapturer | null = null;


export default function onOffAudioCapturerChangeTest() {
  describe('onOffAudioCapturerChange', () => {
    let dirPath: string;
    let audioCap: audio.AudioCapturer | null = null;
    let audioManager: audio.AudioManager;
    let flag1: boolean = false;
    let flag2: boolean = false;

    let callback1 = () => {
      console.info(`TestLog: audioCapturerChange command callback1 success`);
      flag1 = true;
    }

    let callback2 = () => {
      console.info(`TestLog: audioCapturerChange command callback2 success`);
      flag2 = true;
    }

    let releaseFun = async (audioCap: audio.AudioCapturer) => {
      try {
        await audioCap.release();
        console.log(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release fail,err : ${JSON.stringify(err)}`);
      }
    }

    beforeAll(async (): Promise<void> => {
      try {
        console.info("beforeAll start");
        g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.MICROPHONE')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            console.info("request success permissions" + JSON.stringify(data));
            console.info("getPermissionRequestResult err" + JSON.stringify(err));
          });
        let driver = Driver.create();
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000);
        if (permissionButton != null) {
          await permissionButton.click();
        }
      } catch (err) {
        console.error('beforeAll failed, err: ' + err);
      }
      console.info("beforeAll case");
      try {
        audioManager = audio.getAudioManager();
        console.log(`get audioManager success!`);
      } catch (error) {
        console.log(`getAudioManager err: ${error.message}, ${error.code}`);
      }
      console.info('TestLog: Start Testing AudioCpaturerEnhanceTest Interfaces');
      Utils.msSleep(1000);
    })

    beforeEach(async () => {
      console.info(`${Tag} beforeEach: Prerequisites at the test case level`);
    })
    afterEach(async () => {
      if (audioCap != null) {
        releaseFun(audioCap!);
      }
      console.info(`${Tag} afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(1000);
    })
    afterAll(async () => {
      console.info(`${Tag} afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_STATIC_0600
     * @tc.desc   AudioCapturer - on-MULTI_ON
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data: audio.AudioCapturer | null) => {
          audioCap = data;
        }).catch((err: Error) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created and start ERROR! ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      flag1 = false;
      flag2 = false;
      try {
        audioCap!.onAudioCapturerChange(callback1);
        audioCap!.onAudioCapturerChange(callback2);
        await audioCap!.start();
        await Utils.msSleep(1000);
        console.log(`flag1: ${flag1}, flag2: ${flag2}`)
        if (flag1 && flag2) {
          console.log(`callback1 and callback2 on called`);
          expect(flag1).assertEqual(true);
          expect(flag2).assertEqual(true);
          done();
        }
      } catch (error) {
        console.error(`${Tag}: on-audioCapturerChange Fail: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_STATIC_0700
     * @tc.desc   AudioCapturer - off-MULTI_ON_AND_OFF_ONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data: audio.AudioCapturer | null) => {
          audioCap = data;
        }).catch((err: Error) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created and start ERROR! ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        audioCap!.onAudioCapturerChange(callback1);
        audioCap!.onAudioCapturerChange(callback2);
        await audioCap!.start();
        await Utils.msSleep(1000);
        audioCap!.offAudioCapturerChange(callback1);
        flag1 = false;
        flag2 = false;
        await audioCap!.stop();
        await Utils.msSleep(1000);
        console.log(`flag1: ${flag1}, flag2: ${flag2}`)
        if (!flag1 && flag2) {
          console.log(`cancel callback1 and callback2 on called`);
          expect(flag1).assertEqual(false);
          expect(flag2).assertEqual(true);
          done();
        }
      } catch (error) {
        console.error(`${Tag}: on-audioCapturerChange Fail: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_STATIC_0800
     * @tc.desc   AudioCapturer - off-MULTI_ON_AND_OFF_ALL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data: audio.AudioCapturer | null) => {
          audioCap = data;
        }).catch((err: Error) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created and start ERROR! ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        audioCap!.onAudioCapturerChange(callback1);
        audioCap!.onAudioCapturerChange(callback2);
        await audioCap!.start();
        await Utils.msSleep(1000);
        audioCap!.offAudioCapturerChange();
        flag1 = false;
        flag2 = false;
        await audioCap!.stop();
        await Utils.msSleep(1000);
        console.log(`flag1: ${flag1}, flag2: ${flag2}`)
        if (!flag1 && !flag2) {
          console.log(`cancel callback1 and callback2`);
          expect(flag1).assertEqual(false);
          expect(flag2).assertEqual(false);
          done();
        }
      } catch (error) {
        console.error(`${Tag}: on-audioCapturerChange Fail: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
