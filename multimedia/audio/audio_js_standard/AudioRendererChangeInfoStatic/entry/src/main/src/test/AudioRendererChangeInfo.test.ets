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
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { Permissions }  from 'permissions';
import { Driver, ON, MatchPattern } from '@ohos.UiTest'
import { AppStorage } from '@ohos.arkui.stateManagement'

let g_context: common.UIAbilityContext;

export default function audioCapturerChange() {
  describe('audioRendererChange', () => {
    let audioStreamManager: audio.AudioStreamManager | undefined;
    let audioStreamManagerCB: audio.AudioStreamManager | undefined;
    let audioRen: audio.AudioRenderer | null = null;
    let Tag = "AFRenLog";
    const AUDIOMANAGER = audio.getAudioManager();
    console.info(`${Tag} : Create AudioManger Object JS Framework`);
    let testAbilityContext: common.UIAbilityContext;
    let domain: int = 0x0000;

    beforeAll(async (): Promise<void> => {
      try {
        console.info('beforeAll start');
        g_context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        let atManager = abilityAccessCtrl.createAtManager();
        let arr: Array<Permissions> = new Array<Permissions>();
        arr.push('ohos.permission.MICROPHONE')
        atManager.requestPermissionsFromUser(g_context, arr,
          (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
            console.info("request success permissions" + JSON.stringify(data));
            console.info("getPermissionRequestResult err" + JSON.stringify(err));
          });
        await Utils.msSleep(1000);
        let driver = Driver.create();
        console.info('driver start');
        await Utils.msSleep(1000);
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000);
        let permissionButton2 = await driver.waitForComponent(ON.text('始终允许', MatchPattern.EQUALS), 500);
        if (permissionButton != null) {
          await permissionButton.click();
          console.info('permissionButton start');
        }
        if (permissionButton2 != null) {
          await permissionButton2.click();
          console.info('permissionButton2 start');
        }
      } catch (err) {
        console.error('beforeAll failed, err: ' + err);
      }
      audioStreamManager = AUDIOMANAGER.getStreamManager();
      audioStreamManagerCB = AUDIOMANAGER.getStreamManager();
    })

    beforeEach(async () => {
      console.info(`${Tag} : beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(1000);
    })

    afterEach(async () => {
      console.info(`${Tag} : afterEach: Prerequisites at the test case level`);
    })

    afterAll(async (): Promise<void> => {
      await Utils.msSleep(1000);
       console.info(`${Tag} : afterEach: Test case-level clearance conditions`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0100
     * @tc.desc   AudioRendererChange - ON_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      audioStreamManagerCB!.onAudioRendererChange((AudioRendererChangeInfoArray) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ##`);
          console.info(`${Tag} : StreamId for ${i}  is: ${AudioRendererChangeInfoArray[i].streamId}`);
          console.info(`${Tag} : ClientUid for ${i}  is: ${AudioRendererChangeInfoArray[i].clientUid}`);
          console.info(`${Tag} : Stream for ${i}  is: ${AudioRendererChangeInfoArray[i].rendererInfo.usage}`);
          console.info(`${Tag} : Flag ${i}  is: ${AudioRendererChangeInfoArray[i].rendererInfo.rendererFlags}`);
          console.info(`${Tag} : State for ${i}  is: ${AudioRendererChangeInfoArray[i].rendererState}`);
          let devDescriptor = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : Id: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].id}`);
            console.info(`${Tag} : Type: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType}`);
            console.info(`${Tag} : Role: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole}`);
            expect(AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType)
              .assertEqual(audio.DeviceType.INVALID);
            expect(AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole)
              .assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
            console.info(`${Tag} : Name: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].name}`);
            console.info(`${Tag} : Addr: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].address}`);
            // console.info(`${Tag} : SR: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]}`);
            // console.info(`${Tag} : C: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]}`);
            console.info(`${Tag} : SR: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates}`);
            console.info(`${Tag} : C: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts}`);
            console.info(`${Tag} : CM: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelMasks}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-001] ResultFlag for ${i}  is: ${resultFlag}`);
          }
        }
      });
      await Utils.msSleep(100);
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR : ${err.message}`);
      }

      await Utils.msSleep(100);
      audioStreamManagerCB!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-001] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR : ${err.message}`);
      }
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0200
     * @tc.desc   AudioRendererChange - ON_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR : ${err.message}`);
      }
      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-002] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS `);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :  ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-002] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.stop();
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer stop:ERROR :  ${err.message}`);
      }

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :  ${err.message}`);
      }
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0300
     * @tc.desc   AudioRendererChange - ON_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS `);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-003] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioRen!.stop();
        console.info(`${Tag} : renderInstant stopped :SUCCESS `);
      } catch (err) {
        console.info(`${Tag} : renderInstant stop :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-003] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0400
     * @tc.desc   AudioRendererChange - ON_STATE_RELEASED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS `);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :  ${err.message}`);
      }

      try {
        await audioRen!.stop();
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer stop:ERROR :  ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ##`);
          // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-004] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-004] ######### RendererChange Off is called #########`);

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0500
     * @tc.desc   AudioRendererChange - ON_STATE_PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS `);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :  ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ##`);
          // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-005] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioRen!.pause();
        console.info(`${Tag} : renderInstant paused :SUCCESS `);
      } catch (err) {
        console.info(`${Tag} : renderInstant pause :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-005] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.stop();
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1200
     * @tc.desc   AudioRendererChange - ON_STREAM_USAGE_UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      audioStreamManagerCB!.onAudioRendererChange((AudioRendererChangeInfoArray) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.usage == 0 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-012] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManagerCB!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-012] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1300
     * @tc.desc   AudioRendererChange - ON_STREAM_USAGE_MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${AudioRendererChangeInfoArray[i]}`);
          let devDescriptor = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.usage == 1 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-013] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-013] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1400
     * @tc.desc   AudioRendererChange - ON_STREAM_USAGE_MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${AudioRendererChangeInfoArray[i]}`);
          let devDescriptor = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.usage == 2 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-014] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-014] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1500
     * @tc.desc   AudioRendererChange - ON_STREAM_USAGE_MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${AudioRendererChangeInfoArray[i]}`);
          let devDescriptor = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.usage == 6 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-015] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);
      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-015] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1600
     * @tc.desc   AudioRendererChange - STREAMID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${AudioRendererChangeInfoArray[i]}`);
          let devDescriptor: audio.AudioDeviceDescriptors = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].streamId != undefined && devDescriptor != null) {
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : [RENDERER-CHANGE-ON-016] StreamId for ${i}  is:  ${AudioRendererChangeInfoArray[i].streamId}`);
            }
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);
      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-015] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1700
     * @tc.desc   AudioRendererChange - CLIENTUID & RENDERERFLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let clientUid: number = AudioRendererChangeInfoArray[i].clientUid;
          let renFlags: number = AudioRendererChangeInfoArray[i].rendererInfo.rendererFlags;
          let devDescriptor: Array<audio.AudioDeviceDescriptor> = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (clientUid != undefined && renFlags == 0 && devDescriptor != null) {
            if (renFlags == 0 && devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : [RENDERER-CHANGE-ON-017] ClientUid for ${i}  is:  ${AudioRendererChangeInfoArray[i].clientUid}`);
              console.info(`${Tag} : [RENDERER-CHANGE-ON-017] Flag ${i}  is:  ${AudioRendererChangeInfoArray[i].rendererInfo.rendererFlags}`);
            }
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);
      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-015] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1800
     * @tc.desc   AudioRendererChange - DEVICE DESCRIPTOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;

      audioStreamManagerCB!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            let Id: number = AudioRendererChangeInfoArray[i].deviceDescriptors[j].id;
            let dType: audio.DeviceType = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType;
            let dRole: audio.DeviceRole = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole;
            let sRate = AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates;
            let cCount = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts;
            let cMask: Array<int> = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelMasks;
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            if (Id > 0 && dType == 2 && dRole == 2 && sRate.length != 0 && cCount.length != 0 && cMask != null) {
              resultFlag = true;
            }
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }
      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManagerCB!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-018] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0100
     * @tc.desc   AudioRendererChange - OFF_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          resultFlag = false;
        }
      });
      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-001] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-001] ResultFlag is:  ${resultFlag}`);

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0200
     * @tc.desc   AudioRendererChange - OFF_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = true;


      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          resultFlag = false;
        }
      });
      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-002] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-002] ResultFlag is:  ${resultFlag}`);

      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0300
     * @tc.desc   AudioRenderer - OFF_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = true;


      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          resultFlag = false;
        }
      });
      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-003] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-003] ResultFlag is:  ${resultFlag}`);

      try {
        await audioRen!.stop();
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0400
     * @tc.desc   AudioRendererChange - OFF_STATE_RELEASED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;


      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.stop();
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : [RENDERER-CHANGE-OFF-004] ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          resultFlag = false;
        }
      });
      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-004] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-004] ResultFlag is:  ${resultFlag}`);

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0500
     * @tc.desc   AudioRendererChange - OFF_STATE_PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManagerCB!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          resultFlag = false;
        }
      });
      await Utils.msSleep(100);

      audioStreamManagerCB!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-005] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-005] ResultFlag is:  ${resultFlag}`);

      try {
        await audioRen!.pause();
        console.info(`${Tag} : renderInstant Pause :SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : renderInstant Pause :ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.stop();
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0600
     * @tc.desc   AudioRendererChange - DEVICE DESCRIPTOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            let Id: number = AudioRendererChangeInfoArray[i].deviceDescriptors[j].id;
            let dType: audio.DeviceType = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType;
            let dRole: audio.DeviceRole = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole;
            let sRate: number = AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
            let cCount: number = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
            let cMask: Array<int> = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelMasks;
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            if (Id > 0 && dType == 2 && dRole == 2 && sRate != null && cCount != null && cMask != null) {
              resultFlag = false;
            }
          }
        }
      });
      await Utils.msSleep(100);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-006] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-006] ResultFlag is:  ${resultFlag}`);

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_CURRENT_AUDIORENDERERINFOTARRAY_SYNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_GET_CURRENT_AUDIORENDERERINFOTARRAY_SYNC_STATIC_0100
     * @tc.desc   getCurrentAudioRendererInfoArraySync - GET_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_CURRENT_AUDIORENDERERINFOTARRAY_SYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioRenderer: audio.AudioRenderer | null = null;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;
      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        let data = await audio.createAudioRenderer(AudioRendererOptions);
        audioRenderer = data;
        console.info(`${Tag}: AudioRenderer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: AudioRenderer Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);
      try {
        let AudioRendererChangeInfoArray = audioStreamManager!.getCurrentAudioRendererInfoArraySync()
        console.info(`${Tag}: [GET_RENDERER_STATE_1_PROMISE] ######### Get Promise is called ##########`);
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            // console.info(`${Tag}: AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag}: ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag}: State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
            }
          }
        }
      } catch (error) {
        console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${error.message}`);
        resultFlag = false;
      }

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag}: [GET_RENDERER_STATE_1_PROMISE] ######### RendererChange Off is called #########`);

      try {
        await audioRenderer!.release();
        console.info(`${Tag}: Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag}: Renderer release :ERROR :   ${err.message}`);
      }
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0100
     * @tc.desc   AudioRendererChange - GET_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let audioRenderer: audio.AudioRenderer | null = null;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;
      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      try {
        await audioStreamManager!.getCurrentAudioRendererInfoArray().then((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
          console.info(`${Tag} : [GET_RENDERER_STATE_1_PROMISE] ######### Get Promise is called ##########`);
          if (AudioRendererChangeInfoArray != null) {
            for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
              // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
              let devDescriptor: Array<audio.AudioDeviceDescriptor> = AudioRendererChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
                // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                resultFlag = true;
                console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
              }
            }
          }
        })
      } catch (error) {
        console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${error.message}`);
        resultFlag = false;
      }

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_1_PROMISE] ######### RendererChange Off is called #########`);

      try {
        await audioRenderer!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : audioRenderer.release :ERROR:   ${error.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0200
     * @tc.desc   AudioRendererChange - GET_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      let audioRenderer: audio.AudioRenderer | null = null;

      try {
        audioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManagerCB!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);
      try {
        await audioRenderer!.start();
        console.info(`${Tag} : Renderer started :SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : audioRenderer.start :ERROR:   ${error.message}`);
      }

      await Utils.msSleep(100);

      try {
        await audioStreamManagerCB!.getCurrentAudioRendererInfoArray().then((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
          console.info(`${Tag} : [GET_RENDERER_STATE_2_PROMISE] ######### Get Promise is called ##########`);
          if (AudioRendererChangeInfoArray != null) {
            for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
              // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
              let devDescriptor: Array<audio.AudioDeviceDescriptor> = AudioRendererChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
                // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                resultFlag = true;
                console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
              }
            }
          }
        });
      } catch (error) {
          console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${error.message}`);
      }

      audioStreamManagerCB!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_2_PROMISE] ######### RendererChange Off is called #########`);

      try {
        await audioRenderer!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (error) {
          console.info(`${Tag} : audioRenderer.release :ERROR:   ${error.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0300
     * @tc.desc   AudioRendererChange - GET_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      let audioRenderer: audio.AudioRenderer | null = null;

      try {
        audioRenderer = await audio.createAudioRenderer(AudioRendererOptions)
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRenderer!.start();
        console.info(`${Tag} : Renderer started :SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : audioRenderer.start :ERROR:   ${error.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioRenderer!.stop();
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : audioRenderer.stop :ERROR:   ${error.message}`);
      }

      await Utils.msSleep(100);

      try {
        await audioStreamManager!.getCurrentAudioRendererInfoArray().then((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
          console.info(`${Tag} : [GET_RENDERER_STATE_3_PROMISE] ######### Get Promise is called ##########`);
          if (AudioRendererChangeInfoArray != null) {
            for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
              // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
              let devDescriptor: Array<audio.AudioDeviceDescriptor> = AudioRendererChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
                // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                resultFlag = true;
                console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
              }
            }
          }
        })
      } catch (error) {
        console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${error.message}`);
        resultFlag = false;
      }
      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_3_PROMISE] ######### RendererChange Off is called #########`);

      try {
        await audioRenderer!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : audioRenderer.release :ERROR:   ${error.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0400
     * @tc.desc   AudioRendererChange - GET_STATE_PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioRen!.pause();
        console.info(`${Tag} : renderInstant Pause :SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : renderInstant Pause :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      try {
        await audioStreamManager!.getCurrentAudioRendererInfoArray().then((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
          console.info(`${Tag} : [GET_RENDERER_STATE_5_PROMISE] ######### Get Promise is called ##########`);
          if (AudioRendererChangeInfoArray != null) {
            for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
              // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
              let devDescriptor: Array<audio.AudioDeviceDescriptor> = AudioRendererChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
                // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                resultFlag = true;
                console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
              }
            }
          }
        })
      } catch (error) {
        console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${error.message}`);
        resultFlag = false;
      }

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_5_PROMISE] ######### RendererChange Off is called #########`);

      try {
        await audioRen!.stop();
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0500
     * @tc.desc   AudioRendererChange - DEVICE DESCRIPTOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioRenderer: audio.AudioRenderer | null = null;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;
      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRenderer = await audio.createAudioRenderer(AudioRendererOptions)
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      try {
        await audioStreamManager!.getCurrentAudioRendererInfoArray().then((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
          console.info(`${Tag} : [GET_RENDERER_DD_PROMISE] ######### Get Promise is called ##########`);
          if (AudioRendererChangeInfoArray != null) {
            for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
              // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
              for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
                let Id: number = AudioRendererChangeInfoArray[i].deviceDescriptors[j].id;
                let dType: audio.DeviceType = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType;
                let dRole: audio.DeviceRole = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole;
                let sRate: Array<int> = AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates;
                let cCount: Array<int> = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts;
                let cMask: Array<int> = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelMasks;
                // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
                if (Id > 0 && dType == 2 && dRole == 2 && sRate.length != 0 && cCount.length != 0 && cMask != null) {
                  resultFlag = true;
                }
              }
            }
          }
        })
      } catch (error) {
        console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${error.message}`);
        resultFlag = false;
      }

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [GET_RENDERER_DD_PROMISE] ######### RendererChange Off is called #########`);

      try {
        await audioRenderer!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : Renderer release :ERROR:   ${error.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0100
     * @tc.desc   AudioRendererChange - GET_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioRenderer: audio.AudioRenderer | null = null;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;
      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${error.message}`);
      }

      await Utils.msSleep(100);

      try {
        let AudioRendererChangeInfoArray = await audioStreamManager!.getCurrentAudioRendererInfoArray();
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor: Array<audio.AudioDeviceDescriptor> = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
            }
          }
        }
      } catch (err) {
        console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err?.message}`);
        resultFlag = false;
      }

      await Utils.msSleep(1000);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_1_CALLBACK] ######### RendererChange Off is called #########`);

      try {
        await audioRenderer!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : Renderer release :ERROR :   ${error.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0200
     * @tc.desc   AudioRendererChange - GET_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {

      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      let audioRenderer: audio.AudioRenderer | null = null;

      try {
        audioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManagerCB!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);
      try {
        await audioRenderer!.start();
        console.info(`${Tag} : Renderer started :SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : Renderer start :ERROR :   ${error.message}`);
      }

      await Utils.msSleep(100);

      try {
        let AudioRendererChangeInfoArray = await audioStreamManagerCB!.getCurrentAudioRendererInfoArray();
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor: Array<audio.AudioDeviceDescriptor> = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
            }
          }
        }
      } catch (err) {
        console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err?.message}`);
        resultFlag = false;
      }

      await Utils.msSleep(1000);

      audioStreamManagerCB!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_2_CALLBACK] ######### RendererChange Off is called #########`);

      try {
        await audioRenderer!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : Renderer release :ERROR :   ${error.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0300
     * @tc.desc   AudioRendererChange - GET_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      let audioRenderer: audio.AudioRenderer | null = null;

      try {
        audioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRenderer!.start();
        console.info(`${Tag} : Renderer started :SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : Renderer start :ERROR :   ${error.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioRenderer!.stop();
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : Renderer stop:ERROR :   ${error.message}`);
      }
      await Utils.msSleep(100);

      try {
        let AudioRendererChangeInfoArray = await audioStreamManager!.getCurrentAudioRendererInfoArray();
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor: Array<audio.AudioDeviceDescriptor> = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
            }
          }
        }
      } catch (err) {
        console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err?.message}`);
        resultFlag = false;
      }

      await Utils.msSleep(1000);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_3_CALLBACK] ######### RendererChange Off is called #########`);

      try {
        await audioRenderer!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : Renderer release :ERROR :   ${error.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0400
     * @tc.desc   AudioRendererChange - GET_STATE_PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.start();
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await Utils.msSleep(100);

      try {
        await audioRen!.pause();
        console.info(`${Tag} : renderInstant Pause :SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : renderInstant Pause :ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      try {
        let AudioRendererChangeInfoArray = await audioStreamManager!.getCurrentAudioRendererInfoArray();
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor: Array<audio.AudioDeviceDescriptor> = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag}AFRenLog: RenSta :   ${AudioRendererChangeInfoArray[i].rendererState}`);
            }
          }
        }
      } catch (err) {
        console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err?.message}`);
        resultFlag = false;
      }

      await Utils.msSleep(1000);

      audioStreamManager!.offAudioRendererChange();
      await Utils.msSleep(100);
      console.info('AFRendLog: [GET_REN_STA_5_CB] ## RenCh Off is called ##');

      try {
        await audioRen!.stop();
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      }

      try {
        await audioRen!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      }

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0500
     * @tc.desc   AudioRendererChange - DEVICE DESCRIPTOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let audioRenderer: audio.AudioRenderer | null = null;
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;
      audioStreamManager!.onAudioRendererChange((AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo>) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          // console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await Utils.msSleep(100);

      try {
        audioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      } catch (err) {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      }

      await Utils.msSleep(100);

      try {
        let AudioRendererChangeInfoArray = await audioStreamManager!.getCurrentAudioRendererInfoArray();
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            // console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              let Id: number = AudioRendererChangeInfoArray[i].deviceDescriptors[j].id;
              let dType: audio.DeviceType = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType;
              let dRole: audio.DeviceRole = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole;
              let sRate: Array<int> = AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates;
              let cCount: Array<int> = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts;
              let cMask: Array<int> = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelMasks;
              // console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
              if (Id > 0 && dType == 2 && dRole == 2 && sRate.length != 0 && cCount.length != 0 && cMask != null) {
                resultFlag = true;
              }
            }
          }
        }
      } catch (err) {
        console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err?.message}`);
        resultFlag = false;
      }

      await Utils.msSleep(1000);
      let audioRendererChangeCallback = (audioRendererChangeInfoArray: audio.AudioRendererChangeInfoArray) => {
        console.info(`Succeeded in using on or off function, AudioRendererChangeInfoArray: ${JSON.stringify(audioRendererChangeInfoArray)}.`);
      };
      audioStreamManager!.offAudioRendererChange(audioRendererChangeCallback);
      await Utils.msSleep(100);
      console.info(`${Tag} : [GET_RENDERER_DD_CALLBACK] ######### RendererChange Off is called #########`);

      try {
        await audioRenderer!.release();
        console.info(`${Tag} : Renderer release : SUCCESS`);
      } catch (error) {
        console.info(`${Tag} : Renderer release :ERROR :   ${error.message}`);
      }
      expect(resultFlag).assertTrue();
      done();
    })

  /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0001
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0001
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_UNKNOWN
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0002
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0002
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_3,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_MONO
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0003
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0003
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_4,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0004
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0004
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_5,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO_DOWNMIX
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0005
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0005
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_6,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0006
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0006
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_7,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0007
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0007
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_8,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_SURROUND
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0008
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0008
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_9,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0009
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0009
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_88200,
        channels: audio.AudioChannel.CHANNEL_10,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT0
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0010
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0010
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_12,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0011
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0011
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_176400,
        channels: audio.AudioChannel.CHANNEL_14,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD_SIDE
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0012
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0012
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT0POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0013
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0013
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_N3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0014
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0014
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_SN3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0015
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0015
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0016
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0016
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0017
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0017
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0_BACK
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0018
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0018
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0019
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0019
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0020
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0020
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0021
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0021
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1_BACK
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0022
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0022
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0023
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0023
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXAGONAL
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0024
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0024
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0025
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0025
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0_FRONT
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0026
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0026
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0027
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0027
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_BACK
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0028
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0028
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_FRONT
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0029
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0029
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0030
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0030
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0_FRONT
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0031
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0031
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0032
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0032
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_OCTAGONAL
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0033
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0033
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0034
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0034
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0035
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0035
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE_BACK
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0036
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0036
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_N3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0037
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0037
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_SN3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0038
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0038
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_FUMA
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0039
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0039
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT4
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0040
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0040
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0041
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0041
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT4
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0042
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0042
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_10POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0043
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0043
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT4
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0044
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0044
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT6
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0045
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0045
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXADECAGONAL
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0046
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0046
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_N3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0047
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0047
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_SN3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0048
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0048
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_FUMA
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0049
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0049
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_FUMA
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0050
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0050
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_INVALID,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_UNKNOWN
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0051
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0051
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_11025,
        channels: audio.AudioChannel.CHANNEL_3,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_MONO
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      let audiorenderer: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0052
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0052
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_12000,
        channels: audio.AudioChannel.CHANNEL_4,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MUSIC,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0053
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0053
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_16000,
        channels: audio.AudioChannel.CHANNEL_5,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_STEREO_DOWNMIX
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0054
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0054
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_22050,
        channels: audio.AudioChannel.CHANNEL_6,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0055
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0055
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_7,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ALARM,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0056
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0056
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_8,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_SURROUND
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_MESSAGE,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      let audiorenderer: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0057
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0057
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_64000,
        channels: audio.AudioChannel.CHANNEL_9,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0058
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0058
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_88200,
        channels: audio.AudioChannel.CHANNEL_10,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT0
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_RINGTONE,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0059
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0059
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_12,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0060
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0060
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_176400,
        channels: audio.AudioChannel.CHANNEL_14,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_QUAD_SIDE
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_ACCESSIBILITY,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0061
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0061
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT0POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_GAME,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0062
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0062
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_N3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_MOVIE,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0063
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0063
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_ACN_SN3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_AUDIOBOOK,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0064
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0064
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_4POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_NAVIGATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0065
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0065
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0066
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0066
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT0_BACK
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0067
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0067
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_2POINT1POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0068
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0068
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT0POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0069
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0069
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0070
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0070
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1_BACK
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0071
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0071
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0072
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0072
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXAGONAL
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0073
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0073
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_3POINT1POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0074
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0074
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT0_FRONT
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0075
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0075
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0076
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0076
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_BACK
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0077
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0077
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_6POINT1_FRONT
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0078
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0078
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0079
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0079
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT0_FRONT
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0080
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0080
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0081
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0081
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_OCTAGONAL
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0082
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0082
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0083
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0083
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0084
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0084
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1_WIDE_BACK
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0085
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0085
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_N3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0086
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0086
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_ACN_SN3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0087
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0087
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER2_FUMA
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0088
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0088
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_5POINT1POINT4
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0089
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0089
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0090
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0090
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_7POINT1POINT4
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0091
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0091
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_10POINT2
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0092
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0092
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT4
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0093
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0093
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_9POINT1POINT6
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0094
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0094
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_HEXADECAGONAL
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0095
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0095
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_N3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0096
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0096
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_ACN_SN3D
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0097
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0097
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_FUMA
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      let audiorenderer: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0098
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0098
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_FUMA
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
      }
      let audiorenderer: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0099
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0099
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_FUMA
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.SYSTEM_GLOBAL
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
      }
      let audiorenderer: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0100
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0100
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER1_FUMA
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.APP_INDIVIDUAL
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo,
      }
      let audiorenderer: audio.AudioRenderer | null = null;
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0101
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0101
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_FUMA
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.APP_INDIVIDUAL
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })

    /**
    * @tc.name   SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0102
    * @tc.number SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0102
    * @tc.desc   CreateAudioRender
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AUDIO_RENDER_PROPERTY_STATIC_0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_192000,
        channels: audio.AudioChannel.CHANNEL_16,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_F32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_INVALID,
        channelLayout: audio.AudioChannelLayout.CH_LAYOUT_AMB_ORDER3_FUMA
      }
      let AudioRendererInfo: audio.AudioRendererInfo = {
        usage: audio.StreamUsage.STREAM_USAGE_VIDEO_COMMUNICATION,
        rendererFlags: 0,
        volumeMode: audio.AudioVolumeMode.SYSTEM_GLOBAL
      }
      let AudioRendererOptions: audio.AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo 
      }
      try {
        audioRen = await audio.createAudioRenderer(AudioRendererOptions);
        audioRen!.start();
        audioRen!.stop();
        audioRen!.release();
      } catch (err) {
        console.info(`${Tag} error code: ${err.code} ,message:${err.message}`);
        expect(Number(err.code)).assertEqual(6800101);
        done();
      }
      done();
    })
    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0100
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0100
     * @tc.desc   on_off_audioInterrupt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let audioStreamInfo:audio.AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo:audio.AudioRendererInfo = {
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }
        let audioRendererOptions:audio.AudioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer:audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);
        let flag: boolean = false;

        try {
            audioRenderer!.offAudioInterrupt();

            let audioInterruptCallback = (interruptEvent: audio.InterruptEvent) => {
                console.log("interruptEvent:" + JSON.stringify(interruptEvent))
                expect(interruptEvent.eventType).assertLargerOrEqual(0);
                expect(interruptEvent.forceType).assertLargerOrEqual(0);
                expect(interruptEvent.hintType).assertLargerOrEqual(0);
            }

            audioRenderer!.onAudioInterrupt(audioInterruptCallback);

            audioRenderer!.offAudioInterrupt(audioInterruptCallback);
            await audioRenderer!.release();
            flag = true;
        } catch(error){
            console.log(`SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0100 error : ${error.message}, Code:${error.code}`);
            expect(false).assertTrue();
        }
        expect(flag).assertTrue();
        done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0200
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0200
     * @tc.desc   on_off_stateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
     it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let audioStreamInfo:audio.AudioStreamInfo = {
            samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
            channels: audio.AudioChannel.CHANNEL_2,
            sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
            encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let audioRendererInfo:audio.AudioRendererInfo = {
            usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
            rendererFlags: 0
        }
        let audioRendererOptions:audio.AudioRendererOptions = {
            streamInfo: audioStreamInfo,
            rendererInfo: audioRendererInfo
        }
        let audioRenderer:audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);
        let flag: boolean = false;
        try {
            audioRenderer!.offStateChange();
            let stateChangeCallback = (state: audio.AudioState) => {
                expect(state.STATE_INVALID).assertEqual(-1);
                expect(state.STATE_NEW).assertEqual(0);
                expect(state.STATE_PREPARED).assertEqual(1);
                expect(state.STATE_RUNNING).assertEqual(2);
                expect(state.STATE_STOPPED).assertEqual(3);
                expect(state.STATE_RELEASED).assertEqual(4);
                expect(state.STATE_PAUSED).assertEqual(5);
            };
            audioRenderer!.onStateChange(stateChangeCallback);
            audioRenderer!.offStateChange(stateChangeCallback);
            await audioRenderer!.release();
            flag = true;
        } catch(error){
            console.log(`SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0200 error : ${error.message}, Code:${error.code}`);
            expect(false).assertTrue();
        }
        expect(flag).assertTrue();
        done();
      })
     /**
      * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0300
      * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0300
      * @tc.desc   on_off_stateChange
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL2
      */
      it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
          let audioStreamInfo:audio.AudioStreamInfo = {
              samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
              channels: audio.AudioChannel.CHANNEL_2,
              sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
              encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          }
          let audioRendererInfo:audio.AudioRendererInfo = {
              usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
              rendererFlags: 0
          }
          let audioRendererOptions:audio.AudioRendererOptions = {
              streamInfo: audioStreamInfo,
              rendererInfo: audioRendererInfo
          }
          let audioRenderer:audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);
          let flag: boolean = false;
          try {
              audioRenderer!.offOutputDeviceChange();
              let outputDeviceChangeCallback = (deviceInfo: audio.AudioDeviceDescriptors) => {
                  console.info(`DeviceInfo id: ${deviceInfo[0].id}`);
                  console.info(`DeviceInfo name: ${deviceInfo[0].name}`);
                  console.info(`DeviceInfo address: ${deviceInfo[0].address}`);
              };
              audioRenderer!.onOutputDeviceChange(outputDeviceChangeCallback);
              audioRenderer!.offOutputDeviceChange(outputDeviceChangeCallback);
              await audioRenderer!.release();
              flag = true;
          } catch(error){
              console.log(`SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0300 error : ${error.message}, Code:${error.code}`);
              expect(false).assertTrue();
          }
          expect(flag).assertTrue();
          done();
      })
      /**
       * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0400
       * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0400
       * @tc.desc   on_off_stateChange
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL2
       */
       it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
          let audioStreamInfo:audio.AudioStreamInfo = {
              samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
              channels: audio.AudioChannel.CHANNEL_2,
              sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
              encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
          }
          let audioRendererInfo:audio.AudioRendererInfo = {
              usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
              rendererFlags: 0
          }
          let audioRendererOptions:audio.AudioRendererOptions = {
              streamInfo: audioStreamInfo,
              rendererInfo: audioRendererInfo
          }
          let audioRenderer:audio.AudioRenderer | null = await audio.createAudioRenderer(audioRendererOptions);
          let flag: boolean = false;
          try {
              audioRenderer!.offOutputDeviceChangeWithInfo();
              let outputDeviceChangeWithInfoCallback = (deviceChangeInfo: audio.AudioStreamDeviceChangeInfo) => {
                  console.info(`DeviceInfo id: ${deviceChangeInfo.devices[0].id}`);
                  console.info(`DeviceInfo name: ${deviceChangeInfo.devices[0].name}`);
                  console.info(`DeviceInfo address: ${deviceChangeInfo.devices[0].address}`);
                  console.info(`Device change reason: ${deviceChangeInfo.changeReason}`);
              };
              audioRenderer!.onOutputDeviceChangeWithInfo(outputDeviceChangeWithInfoCallback);
              audioRenderer!.offOutputDeviceChangeWithInfo(outputDeviceChangeWithInfoCallback);
              await audioRenderer!.release();
              flag = true;
          } catch(error){
              console.log(`SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_STATIC_0400 error : ${error.message}, Code:${error.code}`);
              expect(false).assertTrue();
          }
          expect(flag).assertTrue();
          done();
      })
  })
}
