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
        let driver = Driver.create();
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000);
        if (permissionButton != null) {
          await permissionButton.click();
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

    afterAll(() => {
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

      audioStreamManager!.getCurrentAudioRendererInfoArray((err: BusinessError<void> | null,
        AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo> | undefined) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_1_CALLBACK] **** Get Callback Called ****`);
        await Utils.msSleep(100);
        if (err) {
          console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err?.message}`);
          resultFlag = false;
        } else {
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
        }
      });

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

      audioStreamManagerCB!.getCurrentAudioRendererInfoArray((err: BusinessError<void> | null,
        AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo> | undefined) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_2_CALLBACK] **** Get Callback Called ****`);
        await Utils.msSleep(100);
        if (err) {
          console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err?.message}`);
          resultFlag = false;
        } else {
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
        }
      });

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

      audioStreamManager!.getCurrentAudioRendererInfoArray((err: BusinessError<void> | null,
        AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo> | undefined) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_3_CALLBACK] **** Get Callback Called ****`);
        await Utils.msSleep(100);
        if (err) {
          console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err?.message}`);
          resultFlag = false;
        } else {
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
        }
      });

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

      audioStreamManager!.getCurrentAudioRendererInfoArray((err: BusinessError<void> | null,
        AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo> | undefined) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_5_CALLBACK] **** Get Callback Called ****`);
        await Utils.msSleep(100);
        if (err) {
          console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err?.message}`);
          resultFlag = false;
        } else {
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
        }
      });

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

      audioStreamManager!.getCurrentAudioRendererInfoArray((err: BusinessError<void> | null,
        AudioRendererChangeInfoArray: Array<audio.AudioRendererChangeInfo> | undefined) => {
        console.info(`${Tag} : [GET_RENDERER_DD_CALLBACK] **** Get Callback Called ****`);
        await Utils.msSleep(100);
        if (err) {
          console.info(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err?.message}`);
          resultFlag = false;
        } else {
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
        }
      });

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
  })
}
