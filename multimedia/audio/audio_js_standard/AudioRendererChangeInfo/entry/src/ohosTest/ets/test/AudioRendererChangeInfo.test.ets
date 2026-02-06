/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import audio from '@ohos.multimedia.audio';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import uitest, { Driver, MatchPattern, ON } from "@ohos.UiTest";
import common from '@ohos.app.ability.common';

let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

interface AudioStreamInfo {
  samplingRate: number,
  channels: number,
  sampleFormat: number,
  encodingType: number
}

interface AudioRendererInfo {
  content: number,
  usage: number,
  rendererFlags: 0
}

interface AudioRendererOptions {
  streamInfo: AudioStreamInfo,
  rendererInfo: AudioRendererInfo
}

let testContext: common.UIAbilityContext;

export default function audioRendererChange() {
  describe('audioRendererChange', () => {

    let audioStreamManager: audio.AudioManager | ESObject;
    let audioStreamManagerCB: audio.AudioManager | ESObject;
    let audioRen: audio.AudioRenderer | ESObject;
    let Tag = 'AFRenLog';
    const AUDIOMANAGER = audio.getAudioManager();
    console.info(`${Tag} : Create AudioManger Object JS Framework`);
    let sleepForPermissions = async () => {
      console.info('getPermission sleep start: 10000ms')
      await sleep(10000)
      console.info('getPermission sleep end: 10000ms')
    }

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
      testContext = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      audioStreamManager =await  AUDIOMANAGER.getStreamManager();
      audioStreamManagerCB =await  AUDIOMANAGER.getStreamManager();
      await sleep(1000);
      console.info(`${Tag} : beforeAll: Prerequisites at the test suite level`);
    })

    beforeEach(async () => {
      console.info(`${Tag} : beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
    })

    afterEach(() => {
      console.info(`${Tag} : afterEach: Test case-level clearance conditions`);
    })

    afterAll(() => {
      console.info(`${Tag} : afterAll: Test suite-level cleanup condition`);
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0100
     * @tc.desc   AudioRendererChange - ON_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;
      let audioManager = audio.getAudioManager();
      let outputDeviceDescription = await audioManager.getDevices(audio.DeviceFlag.OUTPUT_DEVICES_FLAG);
      let dpDevice: boolean = false;
      console.info(`CHANGE_0100 outputDeviceDescription is ${JSON.stringify(outputDeviceDescription)}`);
      dpDevice = outputDeviceDescription.some(device => device.deviceType === audio.DeviceType.DISPLAY_PORT);
      try {
        audioStreamManagerCB.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            console.info(`${Tag} : ## RendererChange on is called for ${i}  ##`);
            console.info(`${Tag} : StreamId for ${i}  is: ${AudioRendererChangeInfoArray[i].streamId}`);
            console.info(`${Tag} : ClientUid for ${i}  is: ${AudioRendererChangeInfoArray[i].clientUid}`);
            console.info(`${Tag} : Content for ${i}  is: ${AudioRendererChangeInfoArray[i].rendererInfo.content}`);
            console.info(`${Tag} : Stream for ${i}  is: ${AudioRendererChangeInfoArray[i].rendererInfo.usage}`);
            console.info(`${Tag} : Flag ${i}  is: ${AudioRendererChangeInfoArray[i].rendererInfo.rendererFlags}`);
            console.info(`${Tag} : State for ${i}  is: ${AudioRendererChangeInfoArray[i].rendererState}`);
            let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag} : Id: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].id}`);
              console.info(`${Tag} : Type: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType}`);
              console.info(`${Tag} : Role: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole}`);
              if (dpDevice) {
                expect(AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType)
                  .assertEqual(audio.DeviceType.DISPLAY_PORT);
              } else {
                expect(AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType)
                  .assertEqual(audio.DeviceType.INVALID);
              }
              expect(AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole)
                .assertEqual(audio.DeviceRole.OUTPUT_DEVICE);
              console.info(`${Tag} : Name: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].name}`);
              console.info(`${Tag} : Addr: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].address}`);
              console.info(`${Tag} : SR: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]}`);
              console.info(`${Tag} : C: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]}`);
              console.info(`${Tag} : CM: ${i}  ${AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelMasks}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : [RENDERER-CHANGE-ON-001] ResultFlag for ${i}  is: ${resultFlag}`);
            }
          }
        });
      } catch (error) {
        console.log(`${Tag} : audioRendererChange_0100 :ERROR:   ${error.message}`);
        resultFlag = false;
      }
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR : ${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-001] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR : ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0200
     * @tc.desc   AudioRendererChange - ON_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;


      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);
      try {
        audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : [RENDERER-CHANGE-ON-002] ResultFlag for ${i}  is:  ${resultFlag}`);
            }
          }
        });
      } catch (error) {
        console.log(`${Tag} : audioRendererChange_0200 :ERROR: ${error.message}`);
        resultFlag = false;
      }

      await sleep(100);

      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS `);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :  ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-002] ######### RendererChange Off is called #########`);


      await audioRen.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :  ${err.message}`);
      });

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :  ${err.message}`);
      });
      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0300
     * @tc.desc   AudioRendererChange - ON_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_24000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S24LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;


      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS `);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-003] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });

      await sleep(100);

      await audioRen.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :  ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-003] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0400
     * @tc.desc   AudioRendererChange - ON_STATE_RELEASED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;


      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :  ${err.message}`);
      });

      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS }`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :  ${err.message}`);
      });

      await audioRen.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS}`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :  ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ##}`);
          console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-004] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });

      await sleep(100);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-004] ######### RendererChange Off is called #########`);

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0500
     * @tc.desc   AudioRendererChange - ON_STATE_PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;


      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ##}`);
          console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-005] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });

      await sleep(100);

      await audioRen.pause().then(() => {
        console.info(`${Tag} : renderInstant Pause :SUCCESS `);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant Pause :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-005] ######### RendererChange Off is called #########`);

      await audioRen.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      });

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0600
     * @tc.desc   AudioRendererChange - ON_CONTENT_TYPE_RINGTONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManagerCB.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.content == 5 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-006] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);
      audioStreamManagerCB.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-006] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0700
     * @tc.desc   AudioRendererChange - ON_CONTENT_TYPE_UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.content == 0 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-007] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);
      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-007] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0800
     * @tc.desc   AudioRendererChange - ON_CONTENT_TYPE_SPEECH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.content == 1 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-008] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);
      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-008] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0900
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0900
     * @tc.desc   AudioRendererChange - ON_CONTENT_TYPE_MUSIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.content == 2 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-009] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);
      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-009] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1000
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1000
     * @tc.desc   AudioRendererChange - ON_CONTENT_TYPE_MOVIES
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.content == 3 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-010] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-010] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1100
     * @tc.desc   AudioRendererChange - ON_CONTENT_TYPE_SONIFICATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.content == 4 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-011] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-011] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1200
     * @tc.desc   AudioRendererChange - ON_STREAM_USAGE_UNKNOWN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_UNKNOWN,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManagerCB.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.usage == 0 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-012] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-012] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1300
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1300
     * @tc.desc   AudioRendererChange - ON_STREAM_USAGE_MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MUSIC,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.usage == 1 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-013] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-013] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1400
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1400
     * @tc.desc   AudioRendererChange - ON_STREAM_USAGE_MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_MOVIE,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_COMMUNICATION,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.usage == 2 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-014] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-014] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1500
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1500
     * @tc.desc   AudioRendererChange - ON_STREAM_USAGE_MEDIA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].rendererInfo.usage == 6 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-015] ResultFlag for ${i}  is:  ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);
      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-015] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1600
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1600
     * @tc.desc   AudioRendererChange - STREAMID
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioRendererChangeInfoArray[i].streamId != undefined && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-016] StreamId for ${i}  is:  ${AudioRendererChangeInfoArray[i].streamId}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);
      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-015] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1700
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1700
     * @tc.desc   AudioRendererChange - CLIENTUID & RENDERERFLAG
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SONIFICATION,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          let clientUid: ESObject = AudioRendererChangeInfoArray[i].clientUid;
          let renFlags: ESObject = AudioRendererChangeInfoArray[i].rendererInfo.rendererFlags;
          let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (clientUid != undefined && renFlags == 0 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag} : [RENDERER-CHANGE-ON-017] ClientUid for ${i}  is:  ${AudioRendererChangeInfoArray[i].clientUid}`);
            console.info(`${Tag} : [RENDERER-CHANGE-ON-017] Flag ${i}  is:  ${AudioRendererChangeInfoArray[i].rendererInfo.rendererFlags}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);
      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-015] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1800
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1800
     * @tc.desc   AudioRendererChange - DEVICE DESCRIPTOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_RENDERER_CHANGE_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = false;


      audioStreamManagerCB.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            let Id: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].id;
            let dType: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType;
            let dRole: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole;
            let sRate: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
            let cCount: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
            let cMask: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelMasks;
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            if (Id > 0 && dRole == 2 && sRate != null && cCount != null && cMask != null) {
              resultFlag = true;
            }
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });
      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      });


      await sleep(100);

      audioStreamManagerCB.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-ON-018] ######### RendererChange Off is called #########`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0100
     * @tc.desc   AudioRendererChange - OFF_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          resultFlag = false;
        }
      });
      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-001] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-001] ResultFlag is:  ${resultFlag}`);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0200
     * @tc.desc   AudioRendererChange - OFF_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_96000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_SPEECH,
        usage: audio.StreamUsage.STREAM_USAGE_VOICE_ASSISTANT,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = true;


      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          resultFlag = false;
        }
      });
      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-002] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-002] ResultFlag is:  ${resultFlag}`);

      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      });

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0300
     * @tc.desc   AudioRenderer - OFF_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }
      let resultFlag = true;


      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          resultFlag = false;
        }
      });
      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-003] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-003] ResultFlag is:  ${resultFlag}`);

      await audioRen.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      });

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0400
     * @tc.desc   AudioRendererChange - OFF_STATE_RELEASED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;


      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      });

      await audioRen.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : [RENDERER-CHANGE-OFF-004] ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          resultFlag = false;
        }
      });
      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-004] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-004] ResultFlag is:  ${resultFlag}`);

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0500
     * @tc.desc   AudioRendererChange - OFF_STATE_PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_UNKNOWN,
        usage: audio.StreamUsage.STREAM_USAGE_MEDIA,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;


      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          resultFlag = false;
        }
      });
      await sleep(100);

      audioStreamManagerCB.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-005] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-005] ResultFlag is:  ${resultFlag}`);

      await audioRen.pause().then(() => {
        console.info(`${Tag} : renderInstant Pause :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant Pause :ERROR :   ${err.message}`);
      });

      await audioRen.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      });

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0600
     * @tc.desc   AudioRendererChange - DEVICE DESCRIPTOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_RENDERER_CHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_32000,
        channels: audio.AudioChannel.CHANNEL_1,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_U8,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = true;


      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            let Id: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].id;
            let dType: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType;
            let dRole: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole;
            let sRate: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
            let cCount: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
            let cMask: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelMasks;
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            if (Id > 0 && dRole == 2 && sRate != null && cCount != null && cMask != null) {
              resultFlag = false;
            }
          }
        }
      });
      await sleep(100);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-006] ######### RendererChange Off is called #########`);
      console.info(`${Tag} : [RENDERER-CHANGE-OFF-006] ResultFlag is:  ${resultFlag}`);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_GET_CURRENT_AUDIORENDERERINFOTARRAY_SYNC_0100
     * @tc.number SUB_MULTIMEDIA_GET_CURRENT_AUDIORENDERERINFOTARRAY_SYNC_0100
     * @tc.desc   getCurrentAudioRendererInfoArraySync - GET_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_GET_CURRENT_AUDIORENDERERINFOTARRAY_SYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioCap: ESObject;
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;
      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      });

      await sleep(100);
      try {
        let AudioRendererChangeInfoArray: ESObject = audioStreamManager.getCurrentAudioRendererInfoArraySync()
        console.info(`${Tag} : [GET_RENDERER_STATE_1_PROMISE] ######### Get Promise is called ##########`);
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
            }
          }
        }
      } catch (error) {
        console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${error.message}`);
        resultFlag = false;
      }


      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_1_PROMISE] ######### RendererChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0100
     * @tc.desc   AudioRendererChange - GET_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioCap: ESObject;
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;
      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      await audioStreamManager.getCurrentAudioRendererInfoArray().then((AudioRendererChangeInfoArray: ESObject) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_1_PROMISE] ######### Get Promise is called ##########`);
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
            }
          }
        }
      }).catch((err: BusinessError) => {
        console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err.message}`);
        resultFlag = false;
      });

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_1_PROMISE] ######### RendererChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0200
     * @tc.desc   AudioRendererChange - GET_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      let audioCap: ESObject;

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await sleep(100);
      await audioCap.start().then(() => {
        console.info(`${Tag} : Renderer started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer start :ERROR :   ${err.message}`);
      });

      await sleep(100);

      await audioStreamManagerCB.getCurrentAudioRendererInfoArray().then((AudioRendererChangeInfoArray: ESObject) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_2_PROMISE] ######### Get Promise is called ##########`);
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
            }
          }
        }
      }).catch((err: BusinessError) => {
        console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err.message}`);
        resultFlag = false;
      });

      audioStreamManagerCB.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_2_PROMISE] ######### RendererChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0300
     * @tc.desc   AudioRendererChange - GET_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      let audioCap: ESObject;

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      });

      await audioCap.start().then(() => {
        console.info(`${Tag} : Renderer started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer start :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await sleep(100);

      await audioCap.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      });

      await sleep(100);

      await audioStreamManager.getCurrentAudioRendererInfoArray().then((AudioRendererChangeInfoArray: ESObject) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_3_PROMISE] ######### Get Promise is called ##########`);
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
            }
          }
        }
      }).catch((err: BusinessError) => {
        console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err.message}`);
        resultFlag = false;
      });

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_3_PROMISE] ######### RendererChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0400
     * @tc.desc   AudioRendererChange - GET_STATE_PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;


      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await sleep(100);

      await audioRen.pause().then(() => {
        console.info(`${Tag} : renderInstant Pause :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant Pause :ERROR :   ${err.message}`);
      });

      await sleep(100);

      await audioStreamManager.getCurrentAudioRendererInfoArray().then((AudioRendererChangeInfoArray: ESObject) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_5_PROMISE] ######### Get Promise is called ##########`);
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              resultFlag = true;
              console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
            }
          }
        }
      }).catch((err: BusinessError) => {
        console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err.message}`);
        resultFlag = false;
      });

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_5_PROMISE] ######### RendererChange Off is called #########`);

      await audioRen.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      });

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0500
     * @tc.desc   AudioRendererChange - DEVICE DESCRIPTOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioCap: ESObject;
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;
      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      await audioStreamManager.getCurrentAudioRendererInfoArray().then((AudioRendererChangeInfoArray: ESObject) => {
        console.info(`${Tag} : [GET_RENDERER_DD_PROMISE] ######### Get Promise is called ##########`);
        if (AudioRendererChangeInfoArray != null) {
          for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
            console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
            for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
              let Id: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].id;
              let dType: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType;
              let dRole: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole;
              let sRate: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
              let cCount: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
              let cMask: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelMasks;
              console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
              if (Id > 0 && dRole == 2 && sRate != null && cCount != null && cMask != null) {
                resultFlag = true;
              }
            }
          }
        }
      }).catch((err: BusinessError) => {
        console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err.message}`);
        resultFlag = false;
      });

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [GET_RENDERER_DD_PROMISE] ######### RendererChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0100
     * @tc.desc   AudioRendererChange - GET_STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioCap: ESObject;
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;
      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.getCurrentAudioRendererInfoArray(async (err: BusinessError,
        AudioRendererChangeInfoArray: ESObject) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_1_CALLBACK] **** Get Callback Called ****`);
        await sleep(100);
        if (err) {
          console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err.message}`);
          resultFlag = false;
        } else {
          if (AudioRendererChangeInfoArray != null) {
            for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
              console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
              let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
                console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                resultFlag = true;
                console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
              }
            }
          }
        }
      });

      await sleep(1000);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_1_CALLBACK] ######### RendererChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0200
     * @tc.desc   AudioRendererChange - GET_STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      let audioCap: ESObject;

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await sleep(100);
      await audioCap.start().then(() => {
        console.info(`${Tag} : Renderer started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer start :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.getCurrentAudioRendererInfoArray(async (err: BusinessError,
        AudioRendererChangeInfoArray: ESObject) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_2_CALLBACK] **** Get Callback Called ****`);
        await sleep(100);
        if (err) {
          console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err.message}`);
          resultFlag = false;
        } else {
          if (AudioRendererChangeInfoArray != null) {
            for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
              console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
              let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
                console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                resultFlag = true;
                console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
              }
            }
          }
        }
      });

      await sleep(1000);

      audioStreamManagerCB.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_2_CALLBACK] ######### RendererChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0300
     * @tc.desc   AudioRendererChange - GET_STATE_STOPPED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      let audioCap: ESObject;

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      });

      await audioCap.start().then(() => {
        console.info(`${Tag} : Renderer started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer start :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await sleep(100);

      await audioCap.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.getCurrentAudioRendererInfoArray(async (err: BusinessError,
        AudioRendererChangeInfoArray: ESObject) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_3_CALLBACK] **** Get Callback Called ****`);
        await sleep(100);
        if (err) {
          console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err.message}`);
          resultFlag = false;
        } else {
          if (AudioRendererChangeInfoArray != null) {
            for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
              console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
              let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
                console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                resultFlag = true;
                console.info(`${Tag} : State :   ${AudioRendererChangeInfoArray[i].rendererState}`);
              }
            }
          }
        }
      });

      await sleep(1000);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [GET_RENDERER_STATE_3_CALLBACK] ######### RendererChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0400
     * @tc.desc   AudioRendererChange - GET_STATE_PAUSED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S32LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioRen = data;
        console.info(`${Tag} : AudioRender Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRender Created : ERROR :   ${err.message}`);
      });

      await audioRen.start().then(() => {
        console.info(`${Tag} : renderInstant started :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant start :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await sleep(100);

      await audioRen.pause().then(() => {
        console.info(`${Tag} : renderInstant Pause :SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : renderInstant Pause :ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.getCurrentAudioRendererInfoArray(async (err: BusinessError,
        AudioRendererChangeInfoArray: ESObject) => {
        console.info(`${Tag} : [GET_RENDERER_STATE_5_CALLBACK] **** Get Callback Called ****`);
        await sleep(100);
        if (err) {
          console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err.message}`);
          resultFlag = false;
        } else {
          if (AudioRendererChangeInfoArray != null) {
            for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
              console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
              let devDescriptor: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
                console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                resultFlag = true;
                console.info(`AFRenLog: RenSta :   ${AudioRendererChangeInfoArray[i].rendererState}`);
              }
            }
          }
        }
      });

      await sleep(1000);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info('AFRendLog: [GET_REN_STA_5_CB] ## RenCh Off is called ##');

      await audioRen.stop().then(() => {
        console.info(`${Tag} : Renderer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer stop:ERROR :   ${err.message}`);
      });

      await audioRen.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0500
     * @tc.desc   AudioRendererChange - DEVICE DESCRIPTOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_RENDERER_CHANGE_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let audioCap: ESObject;
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let resultFlag = false;
      audioStreamManager.on('audioRendererChange', (AudioRendererChangeInfoArray: ESObject) => {
        for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## RendererChange on is called for ${i}  ## ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
          for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioRenderer(AudioRendererOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag} : AudioRenderer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : AudioRenderer Created : ERROR :   ${err.message}`);
      });

      await sleep(100);

      audioStreamManager.getCurrentAudioRendererInfoArray(async (err: BusinessError,
        AudioRendererChangeInfoArray: ESObject) => {
        console.info(`${Tag} : [GET_RENDERER_DD_CALLBACK] **** Get Callback Called ****`);
        await sleep(100);
        if (err) {
          console.log(`${Tag} : getCurrentAudioRendererInfoArray :ERROR:   ${err.message}`);
          resultFlag = false;
        } else {
          if (AudioRendererChangeInfoArray != null) {
            for (let i = 0; i < AudioRendererChangeInfoArray.length; i++) {
              console.info(`${Tag} : AudioRendererChangeInfo for ${i}  is:  ${JSON.stringify(AudioRendererChangeInfoArray[i])}`);
              for (let j = 0; j < AudioRendererChangeInfoArray[i].deviceDescriptors.length; j++) {
                let Id: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].id;
                let dType: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceType;
                let dRole: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].deviceRole;
                let sRate: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
                let cCount: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
                let cMask: ESObject = AudioRendererChangeInfoArray[i].deviceDescriptors[j].channelMasks;
                console.info(`${Tag} : ${i}  ${JSON.stringify(AudioRendererChangeInfoArray[i].deviceDescriptors[j])}`);
                if (Id > 0 && dRole == 2 && sRate != null && cCount != null && cMask != null) {
                  resultFlag = true;
                }
              }
            }
          }
        }
      });

      await sleep(1000);

      audioStreamManager.off('audioRendererChange');
      await sleep(100);
      console.info(`${Tag} : [GET_RENDERER_DD_CALLBACK] ######### RendererChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag} : Renderer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag} : Renderer release :ERROR :   ${err.message}`);
      });
      expect(resultFlag).assertTrue();
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_AUDIORENDERCHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_AUDIORENDERCHANGE_0100
     * @tc.desc   AudioRendererChange - ON_AUDIORENDERCHANGE 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_AUDIORENDERCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`-------SUB_MULTIMEDIA_AUDIO_ON_AUDIORENDERCHANGE_0100------begin`)
      let flag: boolean = false;
      try {
        audioStreamManager.on('audioRendererChange');
      }
      catch(error) {
        console.error(`${Tag}: on_audioRendererChange ERROR: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      console.info(`-------SUB_MULTIMEDIA_AUDIO_ON_AUDIORENDERCHANGE_0100------end`)
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_AUDIORENDERCHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_AUDIORENDERCHANGE_0200
     * @tc.desc   AudioRendererChange - ON_AUDIORENDERCHANGE 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_AUDIORENDERCHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info(`-------SUB_MULTIMEDIA_AUDIO_ON_AUDIORENDERCHANGE_0200------begin`)
      let flag = false;
      try {
        audioStreamManager.on('', (return_para: Number) => {
          console.info(`${Tag}: on_audioRendererChange and return_para is Number`);
          return_para.toString();
          return 0;
        });
      }
      catch(error) {
        console.error(`${Tag}: on_audioRendererChange ERROR: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      console.info(`-------SUB_MULTIMEDIA_AUDIO_ON_AUDIORENDERCHANGE_0200------end`)
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_AUDIORENDERCHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_AUDIORENDERCHANGE_0100
     * @tc.desc   OFF_AUDIORENDERCHANGE 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_AUDIORENDERCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(`-------SUB_MULTIMEDIA_AUDIO_OFF_AUDIORENDERCHANGE_0100------begin`)
      let flag = false;
      let off_para: ESObject = 1;
      audioStreamManager.on('audioRendererChange', (return_vaule: audio.AudioRendererChangeInfoArray) => {
        console.info(`on_audioRendererChange SUCCESS`);
      });
      try {
        audioStreamManager.off(off_para);
      }
      catch(error) {
        console.error(`${Tag}: on_audioRendererChange ERROR: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      console.info(`-------SUB_MULTIMEDIA_AUDIO_OFF_AUDIORENDERCHANGE_0100------end`)
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_AUDIORENDERCHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_AUDIORENDERCHANGE_0200
     * @tc.desc   OFF_AUDIORENDERCHANGE 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_AUDIORENDERCHANGE_0200', 2, (done: Function) => {
      console.info(`-------SUB_MULTIMEDIA_AUDIO_OFF_AUDIORENDERCHANGE_0200------begin`)
      let flag = false;
      audioStreamManager.on('audioRendererChange', (return_vaule: audio.AudioRendererChangeInfoArray) => {
        console.info(`on_audioRendererChange SUCCESS`);
      });
      try {
        audioStreamManager.off('');
      }
      catch(error) {
        console.error(`${Tag}: on_audioRendererChange ERROR: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      console.info(`-------SUB_MULTIMEDIA_AUDIO_OFF_AUDIORENDERCHANGE_0200------end`)
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_AUDIOCAPTURERCHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_AUDIOCAPTURECHANGE_0100
     * @tc.desc   AudioRendererChange - ON_AUDIOCAPTURERCHANGE 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_AUDIOCAPTURERCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(`-------SUB_MULTIMEDIA_AUDIO_ON_AUDIOCAPTURERCHANGE_0100------begin`)
      let flag: boolean = false;
      try {
        audioStreamManager.on('audioCapturerChange');
      }
      catch(error) {
        console.error(`${Tag}: on_audioCapturerChange ERROR: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      console.info(`-------SUB_MULTIMEDIA_AUDIO_ON_AUDIOCAPTURERCHANGE_0100------end`)
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_ON_AUDIOCAPTURERCHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_ON_AUDIOCAPTURERCHANGE_0200
     * @tc.desc   AudioRendererChange - ON_AUDIOCAPTURERCHANGE 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_AUDIOCAPTURERCHANGE_0200', 2, (done: Function) => {
      console.info(`-------SUB_MULTIMEDIA_AUDIO_ON_AUDIOCAPTURERCHANGE_0200------begin`)
      let flag = false;
      try {
        audioStreamManager.on('', (return_para: Number) => {
          console.info(`${Tag}: on_audioRendererChange and return_para is Number`);
          return_para.toString();
          return 0;
        });
      }
      catch(error) {
        console.error(`${Tag}: on_audioCapturerChange ERROR: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      console.info(`-------SUB_MULTIMEDIA_AUDIO_ON_AUDIOCAPTURERCHANGE_0200------end`)
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_AUDIOCAPTURECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_AUDIOCAPTURERCHANGE_0100
     * @tc.desc   OFF_AUDIOCAPTURERCHANGE 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_AUDIOCAPTURECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      console.info(`-------SUB_MULTIMEDIA_AUDIO_OFF_AUDIOCAPTURECHANGE_0100------begin`)
      let flag = false;
      let off_para: ESObject = 1;
      audioStreamManager.on('audioCapturerChange', (return_vaule: audio.AudioCapturerChangeInfoArray) => {
        console.info(`on_audioCapturerChange SUCCESS`);
      });
      try {
        audioStreamManager.off(off_para);
      }
      catch(error) {
        console.error(`${Tag}: on_audioCapturerChange ERROR: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(401);
        flag = true;
      }
      expect(flag).assertTrue();
      console.info(`-------SUB_MULTIMEDIA_AUDIO_OFF_AUDIOCAPTURERCHANGE_0100------end`)
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_OFF_AUDIOCAPTURERCHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_OFF_AUDIOCAPTURERCHANGE_0200
     * @tc.desc   OFF_AUDIORENDERCHANGE 6800101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  [CORRECT ME] INVALID TCLEVEL.
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_AUDIOCAPTURERCHANGE_0200', 2, (done: Function) => {
      console.info(`-------SUB_MULTIMEDIA_AUDIO_OFF_AUDIOCAPTURERCHANGE_0200------begin`)
      let flag = false;
      audioStreamManager.on('audioCapturerChange', (return_vaule: audio.AudioCapturerChangeInfoArray) => {
        console.info(`on_audioCapturerChange SUCCESS`);
      });
      try {
        audioStreamManager.off('');
      }
      catch(error) {
        console.error(`${Tag}: on_audioCapturerChange ERROR: ${error.code}, ${error.message}`);
        expect(Number(error.code)).assertEqual(6800101);
        flag = true;
      }
      expect(flag).assertTrue();
      console.info(`-------SUB_MULTIMEDIA_AUDIO_OFF_AUDIOCAPTURECHANGE_0200------end`)
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_AUDIORENDERECHANGE_AUDIODEVICEDESCRIPTOR_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_AUDIORENDERECHANGE_AUDIODEVICEDESCRIPTOR_0100
     * @tc.desc   AUDIODEVICEDESCRIPTOR
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AUDIO_AUDIORENDERECHANGE_AUDIODEVICEDESCRIPTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
      audioRenderer.getCurrentOutputDevices((err: BusinessError, deviceInfo: audio.AudioDeviceDescriptors) => {
        if (err) {
          console.error(`getCurrentOutputDevices Fail: ${err}`);
          expect().assertFail();
        } else {
          for (let i = 0; i < deviceInfo.length; i++) {
            console.info(`DeviceInfo id: ${deviceInfo[i].id}`);
            expect(deviceInfo[i].id).assertLargerOrEqual(0);
            console.info(`DeviceInfo type: ${deviceInfo[i].deviceType}`);
            expect(deviceInfo[i].deviceType).assertLargerOrEqual(0);
            console.info(`DeviceInfo role: ${deviceInfo[i].deviceRole}`);
            expect(deviceInfo[i].deviceRole).assertLargerOrEqual(0);
            console.info(`DeviceInfo name: ${deviceInfo[i].name}`);
            expect(deviceInfo[i].name).assertInstanceOf('String');
            console.info(`DeviceInfo address: ${deviceInfo[i].address}`);
            expect(deviceInfo[i].address).assertInstanceOf('String');
            console.info(`DeviceInfo samplerate: ${deviceInfo[i].sampleRates[0]}`);
            expect(deviceInfo[i].sampleRates[0]).assertLargerOrEqual(0);
            console.info(`DeviceInfo channelcount: ${deviceInfo[i].channelCounts[0]}`);
            expect(deviceInfo[i].channelCounts[0]).assertLargerOrEqual(0);
            console.info(`DeviceInfo channelMasks: ${deviceInfo[i].channelMasks[0]}`);
            expect(deviceInfo[i].channelMasks[0]).assertLargerOrEqual(0);
            console.info(`DeviceInfo displayName: ${deviceInfo[i].displayName}`);
            expect(deviceInfo[i].displayName).assertInstanceOf('String');
            // console.info(`DeviceInfo channelmask: ${deviceInfo[i].encodingTypes[0]}`);
            console.info(`DeviceInfo spatializationSupported: ${deviceInfo[i].spatializationSupported}`);
            expect(deviceInfo[i].spatializationSupported).assertInstanceOf('Boolean');
          }
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0100
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0100
     * @tc.desc   on_audioInterrupt 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      try {
        let para: ESObject = '1';
        audioRenderer.on('audioInterrupt', para);
      } catch(error){
        console.log(`error : ${error.message},Code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0200
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0200
     * @tc.desc   off_audioInterrupt 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
      audioRenderer.on('audioInterrupt', (eventAction: audio.InterruptEvent) => {
        console.log("eventAction:" + JSON.stringify(eventAction))
      })

      try {
        let para: ESObject = '1';
        audioRenderer.off('audioInterrupt', para);
      } catch(error){
        console.log(`error : ${error.message},Code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0300
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0300
     * @tc.desc   off_audioInterrupt 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
      audioRenderer.on('stateChange', (eventState: audio.AudioState) => {
        console.log("eventState:" + JSON.stringify(eventState))
      })

      try {
        let para: ESObject = '1';
        audioRenderer.off('stateChange', para);
      } catch(error){
        console.log(`error : ${error.message},Code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0400
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0400
     * @tc.desc   on_outputDeviceChange 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      try {
        let para: ESObject = '1';
        audioRenderer.on('outputDeviceChange', para);
      } catch(error){
        console.log(`error : ${error.message},Code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0500
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0500
     * @tc.desc   off_outputDeviceChange 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
      audioRenderer.on('outputDeviceChange', (eventAudioDeviceDescriptors: audio.AudioDeviceDescriptors) => {
        console.log("eventAudioDeviceDescriptors:" + JSON.stringify(eventAudioDeviceDescriptors))
      })

      try {
        let para: ESObject = '1';
        audioRenderer.off('outputDeviceChange', para);
      } catch(error){
        console.log(`error : ${error.message},Code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0600
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0600
     * @tc.desc   on_outputDeviceChange 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      try {
        let para: ESObject = '1';
        audioRenderer.on('outputDeviceChangeWithInfo', para);
      } catch(error){
        console.log(`error : ${error.message},Code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0700
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0700
     * @tc.desc   off_outputDeviceChangeWithInfo 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
      audioRenderer.on('outputDeviceChangeWithInfo', (eventAudioStreamDeviceChangeInfo: audio.AudioStreamDeviceChangeInfo) => {
        console.log("eventAudioStreamDeviceChangeInfo:" + JSON.stringify(eventAudioStreamDeviceChangeInfo))
      })

      try {
        let para: ESObject = '1';
        audioRenderer.off('outputDeviceChangeWithInfo', para);
      } catch(error){
        console.log(`error : ${error.message},Code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0800
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0800
     * @tc.desc   on_writeData 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);

      try {
        let para: ESObject = '1';
        audioRenderer.on('writeData', para);
      } catch(error){
        console.log(`error : ${error.message},Code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0900
     * @tc.number SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0900
     * @tc.desc   off_outputDeviceChangeWithInfo 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_AUDIO_AUDIORENDERE_ON_OFF_EVENT_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioRendererInfo: AudioRendererInfo = {
        content: audio.ContentType.CONTENT_TYPE_RINGTONE,
        usage: audio.StreamUsage.STREAM_USAGE_NOTIFICATION_RINGTONE,
        rendererFlags: 0
      }

      let AudioRendererOptions: AudioRendererOptions = {
        streamInfo: AudioStreamInfo,
        rendererInfo: AudioRendererInfo
      }

      let audioRenderer: audio.AudioRenderer = await audio.createAudioRenderer(AudioRendererOptions);
      audioRenderer.on('writeData', (eventAudioDataCallbackResult: ArrayBuffer) => {
        console.log("eventAudioDataCallbackResult:" + 'SUCCESS')
      })

      try {
        let para: ESObject = '1';
        audioRenderer.off('writeData', para);
      } catch(error){
        console.log(`error : ${error.message},Code:${error.code}`);
        expect(Number(error.code)).assertEqual(401);
      }
      done();
    })

  })
}