/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
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
import common from '@ohos.app.ability.common';
import { Driver } from '@ohos.UiTest';
import { ON } from '@ohos.UiTest';
import { MatchPattern } from '@ohos.UiTest';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions }  from 'permissions';
import abilityContext from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import { AppStorage } from '@ohos.arkui.stateManagement'

let Tag: string = "AFCapLog";
let delegator = abilityDelegatorRegistry.getAbilityDelegator();
let testAbilityContext: common.UIAbilityContext;
let audioCap: audio.AudioCapturer | null = null;
let g_context: common.UIAbilityContext;

export default function audioCapturerChange() {
  describe('audioCapturerChange', () => {
    let audioStreamManager: audio.AudioStreamManager | undefined;
    let audioStreamManagerCB: audio.AudioStreamManager | undefined;
    let tag = "AFCapLog";

    const audioManager = audio.getAudioManager();
    console.info(`${tag}: Create AudioManger Object JS Framework`);

    beforeAll(async (): Promise<void> => {
      try {
        console.info('beforeAll start');
        let ctx: common.UIAbilityContext | undefined = undefined;
        for (let i = 0; i < 50; i++) {
          ctx = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext | undefined;
          if (ctx != null) {
            console.info(`g_context ready after ${i * 50}ms`);
            break;
          }
          await Utils.msSleep(50);
        }
        if (ctx == null) {
          throw new Error('g_context still null after 2.5s');
        }
        g_context = ctx;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.MICROPHONE')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            console.info('requestPermissionsFromUser end');
            console.info("request success permissions" + JSON.stringify(data));
            console.info("getPermissionRequestResult err" + JSON.stringify(err));
          });
        let driver = Driver.create();
        await Utils.msSleep(1000);
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 2000);
        let permissionButton2 = await driver.waitForComponent(ON.text('始终允许', MatchPattern.EQUALS), 500);
        await Utils.msSleep(1000);
        if (permissionButton != null) {
          await permissionButton.click();
        }
        if (permissionButton2 != null) {
          await permissionButton2.click();
        }
      } catch (err) {
        console.error('beforeAll failed, err: ' + err);
      }
      audioStreamManager = audioManager.getStreamManager();
      audioStreamManagerCB = audioManager.getStreamManager();
      console.info('TestLog: Start Testing AudioFrameworkTest Interfaces');
    })

    beforeEach(async () => {
      console.info(`${Tag}: beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(1000);
    })

    afterEach(async () => {
      console.info(`${Tag}: afterEach: Test case-level clearance conditions`);
    })

    afterAll(async () => {
      await Utils.msSleep(1000);
      console.info(`${Tag}: afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0100
     * @tc.desc   AudioCapturerChange - ON_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let audioCap: audio.AudioCapturer | null = null;

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

      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray: Array<Readonly<audio.AudioCapturerChangeInfo>>) => {
        console.info(`${Tag}: : ## CapChange on is called  ##`);
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: : StreamId for ${i}  is: ${AudioCapturerChangeInfoArray[i].streamId}`);
          console.info(`${Tag}: : ClientUid for ${i}  is: ${AudioCapturerChangeInfoArray[i].clientUid}`);
          console.info(`${Tag}: : Content for ${i}  is: ${AudioCapturerChangeInfoArray[i].capturerInfo.source}`);
          console.info(`${Tag}: : Stream for ${i}  is: ${AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags}`);
          console.info(`${Tag}: : Flag ${i}  is: ${AudioCapturerChangeInfoArray[i].capturerState}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}: : ## deviceDescriptors for called  ##`);
            console.info(`${Tag}: : Id: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id}`);
            console.info(`${Tag}: : Type: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType}`);
            console.info(`${Tag}: : Role: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole}`);
            console.info(`${Tag}: : Name: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name}`);
            console.info(`${Tag}: : Addr: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address}`);
            console.info(`${Tag}: : SR: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates}`);
            console.info(`${Tag}: : C: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts}`);

            console.info(`${Tag}: : CM: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks}`);
          }
          if (devDescriptor != null) {
            audioStreamManager!.offAudioCapturerChange();
            done();
          }
          else {
            console.info(`SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0100 devDescriptor is null: ${devDescriptor}`);
            expect(false).assertTrue();
            done();
          }
        }
      });
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0200
     * @tc.desc   AudioCapturerChange - ON_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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

      let resultFlag = false;

      let audioCap: audio.AudioCapturer | null = null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
          console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
        })
      } catch (err) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      }

      audioStreamManagerCB!.onAudioCapturerChange((AudioCapturerChangeInfoArray: Array<Readonly<audio.AudioCapturerChangeInfo>>) => {
        let valid = false;
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          if (AudioCapturerChangeInfoArray[i].deviceDescriptors != null) {
            valid = true;
            break;
          }
        }
        if (!valid) {
          console.info(`SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0200 devDescriptor is null`);
          expect(false).assertTrue();
          done();
          return;
        }
        resultFlag = true;
        console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-002] ResultFlag is: ${resultFlag}`);
        audioStreamManagerCB!.offAudioCapturerChange();
        console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-002] ######### CapturerChange Off is called #########`);
        audioCap!.release().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
          done();
        }).catch((e: Error) => {
          let err = e as BusinessError;
          console.info(`${Tag}: ${Tag}: Capturer release:ERROR :${err.message}`);
          done();
        });
      });

      try {
        await audioCap!.start().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer started :Success `);
        });
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0300
     * @tc.desc   AudioCapturerChange - ON_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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

      let resultFlag: boolean = false;

      let audioCap: audio.AudioCapturer | null = null;

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
      }

      try {
        await audioCap!.start().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer started :Success `);
        })
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-003] ResultFlag for element ${i} is: ${resultFlag}`);
          }
          else {
            console.info(`SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0300 devDescriptor is null: ${devDescriptor}`);
            expect(false).assertTrue();
            done();
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioCap!.stop().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer stopped : SUCCESS`);
        });
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer stop:ERROR :${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.offAudioCapturerChange();
      await Utils.msSleep(100);
      console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-003] ######### CapturerChange Off is called #########`);

      try {
        await audioCap!.release().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
        });
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0400
     * @tc.desc   AudioCapturerChange - ON_STATE_RELEASED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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

      let resultFlag: boolean = false;

      //let audioCap: audio.AudioStreamManager | ESObject;
      let audioCap: audio.AudioCapturer | null = null;

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
      }

      try {
        await audioCap!.start().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer started :Success `);
        })
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
      }

      try {
        await audioCap!.stop().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer stopped : SUCCESS`);
        })
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer stop:ERROR :${err.message}`);
      }
      await Utils.msSleep(100);

      audioStreamManagerCB!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-004] ResultFlag for element ${i} is: ${resultFlag}`);
          }
          else {
            console.info(`SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0400 devDescriptor is null: ${devDescriptor}`);
            expect(false).assertTrue();
            done();
          }
        }
      });
      await Utils.msSleep(100);

      try {
        await audioCap!.release().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
        })
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
      }

      await Utils.msSleep(100);

      audioStreamManagerCB!.offAudioCapturerChange();
      await Utils.msSleep(100);
      console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-004] ######### CapturerChange Off is called #########`);

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0500
     * @tc.desc   AudioCapturerChange - ON_SOURCE_TYPE_MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
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

      let audioCap: audio.AudioCapturer | null = null;

      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioCapturerChangeInfoArray[i].capturerInfo.source == 0 && devDescriptor != null) {
            audioStreamManager!.offAudioCapturerChange();
            done();
          }
          else {
            console.info(`SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0500 devDescriptor is null: ${devDescriptor}`);
            expect(false).assertTrue();
            done();
          }
        }
      });
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0600
     * @tc.desc   AudioCapturerChange - ON_SOURCE_TYPE_VOICE_COMMUNICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag: boolean = false;

      audioStreamManagerCB!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioCapturerChangeInfoArray[i].capturerInfo.source == 7 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-006] ResultFlag for element ${i} is: ${resultFlag}`);
          }
        }
      });
      await Utils.msSleep(100);

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });
      await Utils.msSleep(100);

      audioStreamManagerCB!.offAudioCapturerChange();
      await Utils.msSleep(100);
      console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-006] ######### CapturerChange Off is called #########`);

      await audioCap!.release().then(() => {
        console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
      }).catch((err: Error) => {
        console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0700
     * @tc.desc   AudioCapturerChange - STREAMID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {

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
      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioCapturerChangeInfoArray[i].streamId != undefined && devDescriptor != null) {
            audioStreamManager!.offAudioCapturerChange();
            done();
          }
          else {
            console.info(`SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0700 devDescriptor is null: ${devDescriptor}`);
            expect(false).assertTrue();
            done();
          }
        }
      });
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0800
     * @tc.desc   AudioCapturerChange - CLIENTUID AND CAPTURERFLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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
      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let clientUid = AudioCapturerChangeInfoArray[i].clientUid;
          let capFlags = AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags;
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (clientUid != undefined && capFlags == 0 && devDescriptor != null) {
            audioStreamManager!.offAudioCapturerChange();
            done();
          }
          else {
            console.info(`SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0800 devDescriptor is null: ${devDescriptor}`);
            expect(false).assertTrue();
            done();
          }
        }
      });
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0900
     * @tc.desc   AudioCapturerChange - DeviceDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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
      audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            let Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
            let dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
            let dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
            let sRate: int;
            if (AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates.length === 0) {
              console.info("sampleRates is empty");
            } else {
              sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
            }
            let cCount: int;
            if (AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts.length === 0) {
              console.info("channelCounts is empty");
            } else {
              cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
            }
            let cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            if (Id > 0 && dType == 15 && dRole == 1 && sRate != null && cCount != null && cMask != null) {
              audioStreamManager!.offAudioCapturerChange();
              done();
            }
          }
        }
      });
      try {
        await audioCap!.start();
        await audioCap!.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0100
     * @tc.desc   AudioCapturerChange - OFF_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

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

      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager!.offAudioCapturerChange();
        }
      });

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0200
     * @tc.desc   AudioCapturerChange - OFF_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

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
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.start();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager!.offAudioCapturerChange();
        }
      });
      await Utils.msSleep(100);
      try {
        await audioCap!.release();
        console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer release :ERROR :` + JSON.stringify(err));
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0300
     * @tc.desc   AudioCapturerChange - OFF_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.start();
        await audioCap!.stop();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager!.offAudioCapturerChange();
        }
      });
      await Utils.msSleep(100);

      try {
        await audioCap!.release();
        console.info(`${Tag}: ${Tag}: Capturer released : SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer release:ERROR :${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0400
     * @tc.desc   AudioCapturerChange - OFF_STATE_RELEASED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.start();
        await audioCap!.stop();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager!.offAudioCapturerChange();
        }
      });
      await Utils.msSleep(100);

      try {
        await audioCap!.release();
        console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0500
     * @tc.desc   AudioCapturerChange - DeviceDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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

      audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            let Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
            let dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
            let dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
            let sRate: int;
            if (AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates.length === 0) {
              console.info("sampleRates is empty");
            } else {
              sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
            }
            let cCount: int;
            if (AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts.length === 0) {
              console.info("channelCounts is empty");
            } else {
              cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
            }
            let cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            if (Id > 0 && dType == 15 && dRole == 1 && sRate != null && cCount != null && cMask != null) {
              audioStreamManager!.offAudioCapturerChange();
              done();
            }
            else {
              console.info(`SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0500 fail`);
              expect(false).assertTrue();
              done();
            }
          }
        }
      });
      try {
        await audioCap!.start();
        await audioCap!.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CURRENT_AUDIOCAPTURERINFOARRAY_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CURRENT_AUDIOCAPTURERINFOARRAY_SYNC_STATIC_0100
     * @tc.desc   getCurrentAudioCapturerInfoArraySync - GET_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CURRENT_AUDIOCAPTURERINFOARRAY_SYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      audioStreamManagerCB!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
          let audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
          await Utils.msSleep(100);

          let AudioCapturerChangeInfoArray = audioStreamManagerCB!.getCurrentAudioCapturerInfoArraySync()
          console.info(`${Tag}: AFCapturerChangeLog: [GET_CAP_STA_1_PR] **** Get Promise Called ****`);
          if (AudioCapturerChangeInfoArray != null) {
            for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
              // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
              let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
                // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                audioStreamManagerCB!.offAudioCapturerChange();
                console.info(`${Tag}: audioCapturerChange off Success `);
                audioCap!.release().then(() => {
                  console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                  done();
                })
              }
              else {
                console.info(`SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0500 devDescriptor is null: ${devDescriptor}`);
                expect(false).assertTrue();
                done();
              }
            }
          }
      } catch (error) {
        console.log('err : ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0100
     * @tc.desc   AudioCapturerChange - GET_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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
      audioStreamManagerCB!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      try {
        const AudioCapturerChangeInfoArray = await audioStreamManagerCB!.getCurrentAudioCapturerInfoArray();
        console.info(`${Tag}: AFCapturerChangeLog: [GET_CAP_STA_1_PR] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManagerCB!.offAudioCapturerChange();
              console.info(`${Tag}: audioCapturerChange off Success `);
              try {
                await audioCap!.release();
                console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                done();
              } catch (err) {
                console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              }
            }
          }
        }
      } catch (err) {
        console.log('err : ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0200
     * @tc.desc   AudioCapturerChange - GET_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);
      try {
        await audioCap!.start();
        console.info(`${Tag}: ${Tag}: Capturer started :Success `);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      try {
        const AudioCapturerChangeInfoArray = await audioStreamManagerCB!.getCurrentAudioCapturerInfoArray();
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_2_PROMISE] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManager!.offAudioCapturerChange();
              console.info(`${Tag}: audioCapturerChange off Success `);
              try {
                await audioCap!.release();
                console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                done();
              } catch (err) {
                console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              }
            }
          }
        }
      } catch (err) {
        console.log('err : ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0300
     * @tc.desc   AudioCapturerChange - GET_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCap!.start();
        console.info(`${Tag}: ${Tag}: Capturer started :Success `);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioCap!.stop();
        console.info(`${Tag}: ${Tag}: Capturer stopped : SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer stop:ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      try {
        const AudioCapturerChangeInfoArray = await audioStreamManagerCB!.getCurrentAudioCapturerInfoArray();
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_3_PROMISE] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManager!.offAudioCapturerChange();
              try {
                await audioCap!.release();
                console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                done();
              } catch (err) {
                console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              }
            }
          }
        }
      } catch (err) {
        console.log('err : ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0400
     * @tc.desc   AudioCapturerChange - DEVICE DESCRIPTOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }
      audioStreamManagerCB!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await Utils.msSleep(100);

      await audioCap!.start();

      await Utils.msSleep(100);

      try {
        const AudioCapturerChangeInfoArray = await audioStreamManagerCB!.getCurrentAudioCapturerInfoArray();
        console.info(`${Tag}: AFCapturerChangeLog: [GET_CAP_DD_PR] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              let Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
              let dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
              let dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
              // let sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
              // let cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
              let sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates;
              let cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts;
              let cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
              // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              if (Id > 0 && dType == 15 && dRole == 1 && sRate != null && cCount != null && cMask != null) {
                audioStreamManagerCB!.offAudioCapturerChange();
                try {
                  await audioCap!.release();
                  console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                  done();
                } catch (err) {
                  console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                  expect(false).assertTrue();
                }
              }
            }
          }
        }
      } catch (err) {
        console.log('err : ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0100
     * @tc.desc   AudioCapturerChange - GET_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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

      let resultFlag: boolean = false;
      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager!.getCurrentAudioCapturerInfoArray((err: BusinessError<void> | null, AudioCapturerChangeInfoArray: audio.AudioCapturerChangeInfoArray | undefined) => {
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_1_CALLBACK] **** Get Callback Called ****`);
        if (err) {
          console.info(`${Tag}: ${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
          done();
          return;
        }
        if (AudioCapturerChangeInfoArray == null) {
          done();
          return;
        }
        let hasValid = false;
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          if (AudioCapturerChangeInfoArray[i].deviceDescriptors != null) {
            hasValid = true;
            break;
          }
        }
        if (!hasValid) {
          done();
          return;
        }
        audioStreamManager!.offAudioCapturerChange();
        audioCap!.release().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
          done();
        }).catch((e: Error) => {
          let err = e as BusinessError;
          console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
          expect(false).assertTrue();
          done();
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0200
     * @tc.desc   AudioCapturerChange - GET_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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

      let resultFlag: boolean = false;

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManagerCB!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);
      try {
        await audioCap!.start();
        console.info(`${Tag}: ${Tag}: Capturer started :Success `);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManagerCB!.getCurrentAudioCapturerInfoArray((err: BusinessError<void> | null, AudioCapturerChangeInfoArray: audio.AudioCapturerChangeInfoArray | undefined) => {
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_2_CALLBACK] **** Get Callback Called ****`);
        if (err) {
          console.info(`${Tag}: ${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
          done();
          return;
        }
        if (AudioCapturerChangeInfoArray == null) {
          done();
          return;
        }
        let hasValid = false;
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          if (AudioCapturerChangeInfoArray[i].deviceDescriptors != null) {
            hasValid = true;
            break;
          }
        }
        if (!hasValid) {
          done();
          return;
        }
        audioStreamManagerCB!.offAudioCapturerChange();
        audioCap!.release().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
          done();
        }).catch((e: Error) => {
          let err = e as BusinessError;
          console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
          expect(false).assertTrue();
          done();
        });
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0300
     * @tc.desc   AudioCapturerChange - GET_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

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

      let resultFlag: boolean = false;

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCap!.start();
        console.info(`${Tag}: ${Tag}: Capturer started :Success `);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioCap!.stop();
        console.info(`${Tag}: ${Tag}: Capturer stopped : SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer stop:ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager!.getCurrentAudioCapturerInfoArray((err: BusinessError<void> | null, AudioCapturerChangeInfoArray: audio.AudioCapturerChangeInfoArray | undefined) => {
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_3_CALLBACK] **** Get Callback Called ****`);
        if (err) {
          console.info(`${Tag}: ${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
          done();
          return;
        }
        if (AudioCapturerChangeInfoArray == null) {
          done();
          return;
        }
        let hasValid = false;
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          if (AudioCapturerChangeInfoArray[i].deviceDescriptors != null) {
            hasValid = true;
            break;
          }
        }
        if (!hasValid) {
          done();
          return;
        }
        audioStreamManager!.offAudioCapturerChange();
        audioCap!.release().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
          done();
        }).catch((e: Error) => {
          let err = e as BusinessError;
          console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
          expect(false).assertTrue();
          done();
        });
      });
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0001
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0001
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_UNKNOWN
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0002
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0002
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_3,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_MONO
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
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0003
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0003
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_4,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0004
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0004
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_5,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO_DOWNMIX
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0005
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0005
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_6,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0006
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0006
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_7,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }
      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0007
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0007
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_8,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_SURROUND
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0008
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0008
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_9,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0009
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0009
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_88200,
        channels: audio.AudioChannel.CHANNEL_10,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0010
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0010
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_12,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0011
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0011
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_176400,
        channels: audio.AudioChannel.CHANNEL_14,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD_SIDE
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0012
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0012
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT0POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0013
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0013
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0014
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0014
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })



    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0015
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0015
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0016
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0016
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0017
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0017
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0018
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0018
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0019
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0019
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0020
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0020
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0021
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0021
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0022
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0022
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0023
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0023
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0024
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0024
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0025
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0025
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0026
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0026
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0027
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0027
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0028
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0028
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0029
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0029
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0030
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0030
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0031
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0031
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0032
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0032
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_OCTAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0033
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0033
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0034
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0034
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0035
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0035
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0036
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0036
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0037
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0037
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0038
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0038
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0039
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0039
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0040
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0040
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0041
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0041
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0042
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0042
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_10POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0043
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0043
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0044
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0044
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT6
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0045
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0045
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXADECAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0046
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0046
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0047
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0047
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0048
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0048
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0049
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0049
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0050
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0050
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_UNKNOWN
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_INVALID,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0051
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0051
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_3,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_MONO
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
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0052
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0052
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_4,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_RECOGNITION,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0053
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0053
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_5,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO_DOWNMIX
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0054
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0054
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_6,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0055
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0055
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_7,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_MESSAGE,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0056
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0056
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_8,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_SURROUND
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_CAMCORDER,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0057
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0057
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_9,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0058
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0058
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_88200,
        channels: audio.AudioChannel.CHANNEL_10,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0059
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0059
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_12,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0060
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0060
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_176400,
        channels: audio.AudioChannel.CHANNEL_14,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD_SIDE
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0061
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0061
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT0POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0062
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0062
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0063
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0063
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })



    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0064
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0064
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0065
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0065
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0066
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0066
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0067
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0067
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0068
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0068
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0069
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0069
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0070
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0070
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0071
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0071
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0072
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0072
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0073
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0073
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0074
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0074
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0075
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0075
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0076
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0076
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0077
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0077
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0078
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0078
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0079
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0079
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0_FRONT
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0080
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0080
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0081
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0081
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_OCTAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0082
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0082
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0083
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0083
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0084
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0084
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE_BACK
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0085
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0085
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0086
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0086
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0087
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0087
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0088
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0088
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0089
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0089
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0090
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0090
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0091
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0091
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_10POINT2
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0092
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0092
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT4
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0093
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0093
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT6
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0094
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0094
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXADECAGONAL
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0095
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0095
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_N3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })


    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0096
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0096
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_SN3D
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0097
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0097
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }

      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0098
    * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0098
    * @tc.desc   CreateAudioCapturer
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_PROPERTY_STATIC_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_FUMA
      }
      let AudioCapturerInfo: audio.AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_UNPROCESSED,
        capturerFlags: 0
      }

      let AudioCapturerOptions: audio.AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap!.release();
      } catch (err) {
        console.log(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800301);
        done();
      }
      done();
    })
  })
}
