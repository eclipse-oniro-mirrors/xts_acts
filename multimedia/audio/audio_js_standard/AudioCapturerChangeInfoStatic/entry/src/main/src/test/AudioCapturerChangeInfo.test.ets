/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
let audioCap: audio.AudioCapturer | null;
let g_context: common.UIAbilityContext;

export default function audioCapturerChange() {
  describe('audioCapturerChange', () => {
    let audioStreamManager: audio.AudioStreamManager;
    let audioStreamManagerCB: audio.AudioStreamManager;
    let tag = "AFCapLog";

    const audioManager = audio.getAudioManager();
    console.info(`${tag}: Create AudioManger Object JS Framework`);

    beforeAll(async (): Promise<void> => {
      try {
        console.info(' beforeAll start');
        g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.MICROPHONE')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            console.info(' requestPermissionsFromUser end');
            console.info("request success permissions" + JSON.stringify(data));
            console.info("getPermissionRequestResult err" + JSON.stringify(err));
          });
        let driver = Driver.create();
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000)
        if (permissionButton != null) {
          await permissionButton.click();
        }
      } catch (err) {
        console.error(' beforeAll failed, err: ' + err);
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
      let audioCap: audio.AudioCapturer | null;

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

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray: Array<Readonly<audio.AudioCapturerChangeInfo>>) => {
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

            // console.info(`${Tag}: : SR: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]}`);
            // console.info(`${Tag}: : C: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]}`);
            console.info(`${Tag}: : CM: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks}`);
          }
          if (devDescriptor != null) {
            audioStreamManager.offAudioCapturerChange();
            expect(true).assertTrue();
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

      let audioCap: audio.AudioCapturer | null;
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
          console.info(`${Tag}: ${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
        })
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      }

      audioStreamManagerCB.onAudioCapturerChange((AudioCapturerChangeInfoArray: Array<Readonly<audio.AudioCapturerChangeInfo>>) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-002] ResultFlag for element ${i} is: ${resultFlag}`);
            audioStreamManagerCB.offAudioCapturerChange();
            console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-002] ######### CapturerChange Off is called #########`);

            try {
              await audioCap!.release().then(() => {
                console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
              });
              done();
            } catch (err: BusinessError) {
              console.info(`${Tag}: ${Tag}: Capturer release:ERROR :${err.message}`);
            }
          }
        }
      });

      try {
        await audioCap!.start().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer started :Success `);
        });
      } catch (err: BusinessError) {
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

      let audioCap: audio.AudioCapturer | null;

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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
        }
      });

      await Utils.msSleep(100);

      try {
        await audioCap!.stop().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer stopped : SUCCESS`);
        });
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer stop:ERROR :${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager.offAudioCapturerChange();
      await Utils.msSleep(100);
      console.info(`${Tag}: ${Tag}: [CAPTURER-CHANGE-ON-003] ######### CapturerChange Off is called #########`);

      try {
        await audioCap!.release().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
        });
      } catch (err: BusinessError) {
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
      let audioCap: audio.AudioCapturer | null;

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
      } catch (err: BusinessError) {
        console.log('err :' + JSON.stringify(err));
      }

      try {
        await audioCap!.stop().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer stopped : SUCCESS`);
        })
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer stop:ERROR :${err.message}`);
      }
      await Utils.msSleep(100);

      audioStreamManagerCB.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
        }
      });
      await Utils.msSleep(100);

      try {
        await audioCap!.release().then(() => {
          console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
        })
      } catch (err: BusinessError) {
        console.log('err :' + JSON.stringify(err));
      }

      await Utils.msSleep(100);

      audioStreamManagerCB.offAudioCapturerChange();
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

      let audioCap: audio.AudioCapturer | null;

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioCapturerChangeInfoArray[i].capturerInfo.source == 0 && devDescriptor != null) {
            audioStreamManager.offAudioCapturerChange();
            expect(true).assertTrue();
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

      audioStreamManagerCB.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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

      audioStreamManagerCB.offAudioCapturerChange();
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
      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioCapturerChangeInfoArray[i].streamId != undefined && devDescriptor != null) {
            audioStreamManager.offAudioCapturerChange();
            expect(true).assertTrue();
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
      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let clientUid = AudioCapturerChangeInfoArray[i].clientUid;
          let capFlags = AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags;
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (clientUid != undefined && capFlags == 0 && devDescriptor != null) {
            audioStreamManager.offAudioCapturerChange();
            expect(true).assertTrue();
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
      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
              audioStreamManager.offAudioCapturerChange();
              expect(true).assertTrue();
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

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager.offAudioCapturerChange();
          expect(true).assertTrue();
          done();
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

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager.offAudioCapturerChange();
          expect(true).assertTrue();
          done();
        }
      });
      await Utils.msSleep(100);
      try {
        await audioCap!.release();
        console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: ${Tag}: Capturer release :ERROR :` + JSON.stringify(err));
      }
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

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager.offAudioCapturerChange();
          expect(true).assertTrue();
          done();
        }
      });
      await Utils.msSleep(100);

      try {
        await audioCap!.release();
        console.info(`${Tag}: ${Tag}: Capturer released : SUCCESS`);
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer release:ERROR :${err.message}`);
      }
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

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          // console.info(`${Tag}: ${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager.offAudioCapturerChange();
          expect(true).assertTrue();
          done();
        }
      });
      await Utils.msSleep(100);

      try {
        await audioCap!.release();
        console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
      }
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
      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
              audioStreamManager.offAudioCapturerChange();
              expect(true).assertTrue();
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
      audioStreamManagerCB.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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

          let AudioCapturerChangeInfoArray = audioStreamManagerCB.getCurrentAudioCapturerInfoArraySync()
          console.info(`${Tag}: AFCapturerChangeLog: [GET_CAP_STA_1_PR] **** Get Promise Called ****`);
          if (AudioCapturerChangeInfoArray != null) {
            for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
              // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
              let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
                // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                audioStreamManagerCB.offAudioCapturerChange();
                console.info(`${Tag}: audioCapturerChange off Success `);
                audioCap!.release().then(() => {
                  console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                  expect(true).assertTrue();
                  done();
                })
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
      audioStreamManagerCB.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      try {
        const AudioCapturerChangeInfoArray = await audioStreamManagerCB.getCurrentAudioCapturerInfoArray();
        console.info(`${Tag}: AFCapturerChangeLog: [GET_CAP_STA_1_PR] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManagerCB.offAudioCapturerChange();
              console.info(`${Tag}: audioCapturerChange off Success `);
              try {
                await audioCap!.release();
                console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                expect(true).assertTrue();
                done();
              } catch (err: BusinessError) {
                console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              }
            }
          }
        }
      } catch (err: BusinessError) {
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      try {
        const AudioCapturerChangeInfoArray = await audioStreamManagerCB.getCurrentAudioCapturerInfoArray();
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_2_PROMISE] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManager.offAudioCapturerChange();
              console.info(`${Tag}: audioCapturerChange off Success `);
              try {
                await audioCap!.release();
                console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                expect(true).assertTrue();
                done();
              } catch (err: BusinessError) {
                console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              }
            }
          }
        }
      } catch (err: BusinessError) {
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCap!.start();
        console.info(`${Tag}: ${Tag}: Capturer started :Success `);
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer stop:ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      try {
        const AudioCapturerChangeInfoArray = await audioStreamManagerCB.getCurrentAudioCapturerInfoArray();
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_3_PROMISE] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManager.offAudioCapturerChange();
              try {
                await audioCap!.release();
                console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                expect(true).assertTrue();
                done();
              } catch (err: BusinessError) {
                console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              }
            }
          }
        }
      } catch (err: BusinessError) {
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }
      audioStreamManagerCB.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
        const AudioCapturerChangeInfoArray = await audioStreamManagerCB.getCurrentAudioCapturerInfoArray();
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
                audioStreamManagerCB.offAudioCapturerChange();
                try {
                  await audioCap!.release();
                  console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                  expect(true).assertTrue();
                  done();
                } catch (err: BusinessError) {
                  console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                  expect(false).assertTrue();
                }
              }
            }
          }
        }
      } catch (err: BusinessError) {
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
      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager.getCurrentAudioCapturerInfoArray((err: BusinessError<void> | null, AudioCapturerChangeInfoArray: audio.AudioCapturerChangeInfoArray | undefined) => {
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_1_CALLBACK] **** Get Callback Called ****`);
        await Utils.msSleep(100);
        if (err) {
          console.info(`${Tag}: ${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
        } else {
          if (AudioCapturerChangeInfoArray != null) {
            for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
              // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
              let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
                // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                audioStreamManager.offAudioCapturerChange();
                try {
                  await audioCap!.release();
                  console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                  expect(true).assertTrue();
                  done();
                } catch (err: BusinessError) {
                  console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                  expect(false).assertTrue();
                  done();
                }
              }
            }
          }
        }
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManagerCB.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManagerCB.getCurrentAudioCapturerInfoArray((err: BusinessError<void> | null, AudioCapturerChangeInfoArray: audio.AudioCapturerChangeInfoArray | undefined) => {
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_2_CALLBACK] **** Get Callback Called ****`);
        await Utils.msSleep(100);
        if (err) {
          console.info(`${Tag}: ${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
        } else {
          if (AudioCapturerChangeInfoArray != null) {
            for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
              // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
              let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
                // console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                audioStreamManagerCB.offAudioCapturerChange();
                try {
                  await audioCap!.release();
                  console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                  expect(true).assertTrue();
                  done();
                } catch (err: BusinessError) {
                  console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                  expect(false).assertTrue();
                  done();
                }
              }
            }
          }
        }
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      try {
        await audioCap!.start();
        console.info(`${Tag}: ${Tag}: Capturer started :Success `);
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager.onAudioCapturerChange((AudioCapturerChangeInfoArray) => {
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
      } catch (err: BusinessError) {
        console.info(`${Tag}: ${Tag}: Capturer stop:ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      }

      await Utils.msSleep(100);

      audioStreamManager.getCurrentAudioCapturerInfoArray((err: BusinessError<void> | null, AudioCapturerChangeInfoArray: audio.AudioCapturerChangeInfoArray | undefined) => {
        console.info(`${Tag}: ${Tag}: [GET_CAPTURER_STATE_3_CALLBACK] **** Get Callback Called ****`);
        await Utils.msSleep(100);
        if (err) {
          console.info(`${Tag}: ${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
        } else {
          if (AudioCapturerChangeInfoArray != null) {
            for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
              // console.info(`${Tag}: ${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
              let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
                console.info(`${Tag}: ${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                audioStreamManager.offAudioCapturerChange();
                try {
                  await audioCap!.release();
                  console.info(`${Tag}: ${Tag}: Capturer release : SUCCESS`);
                  done();
                } catch (err: BusinessError) {
                  console.info(`${Tag}: ${Tag}: Capturer release :ERROR :${err.message}`);
                  expect(false).assertTrue();
                  done();
                }
              }
            }
          }
        }
      });
    })
  })
}
