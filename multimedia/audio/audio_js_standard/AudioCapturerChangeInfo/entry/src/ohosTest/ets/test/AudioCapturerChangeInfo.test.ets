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
import featureAbility from '@ohos.ability.featureAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import abilityAccessCtrl, { PermissionRequestResult, Permissions } from '@ohos.abilityAccessCtrl';

let sleep = (delay: number): Promise<void> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, delay)
  })
}

interface AudioStreamInfo {
  samplingRate: number,
  channels: number,
  sampleFormat: number,
  encodingType: number
}

interface AudioCapturerInfo {
  source: number,
  capturerFlags: number
}

interface AudioCapturerOptions {
  streamInfo: AudioStreamInfo,
  capturerInfo: AudioCapturerInfo
}


let Tag: string = "AFCapLog";
let delegator = abilityDelegatorRegistry.getAbilityDelegator();
let testContext: common.UIAbilityContext;
let audioCap: audio.AudioStreamManager | ESObject;

export default function audioCapturerChange() {

  describe('audioCapturerChange', () => {
    let audioStreamManager: audio.AudioStreamManager;
    let audioStreamManagerCB: audio.AudioStreamManager;
    let Tag = "AFCapLog";

    const audioManager = audio.getAudioManager();
    console.info(`${Tag}: Create AudioManger Object JS Framework`);

    let driveFn = async () => {
      let dr = Driver.create();
      await sleep(1000);
      let power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
      await sleep(1000);
      await power?.click();
    }

    let getPermission = () => {
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
      await getPermission();
      await driveFn();
      audioStreamManager = audioManager.getStreamManager();
      audioStreamManagerCB = audioManager.getStreamManager();
      console.info('TestLog: Start Testing AudioFrameworkTest Interfaces');
    })

    beforeEach(async () => {
      console.info(`${Tag}:  beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
    })

    afterEach(async () => {
      console.info(`${Tag}:  afterEach: Test case-level clearance conditions`);
    })

    afterAll(async () => {
      await sleep(1000);
      console.info(`${Tag}:  afterAll: Test suite-level cleanup condition`);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0100
     * @tc.name      : AudioCapturerChange - ON_STATE_PREPARED
     * @tc.desc      : AudioCapturerChange - ON_STATE_PREPARED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: ESObject) => {
      let audioCap: audio.AudioStreamManager | ESObject;
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      audioStreamManager.on('audioCapturerChange', async (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag} : ## CapChange on is called for element ${i}  ##`);
          console.info(`${Tag} : StreamId for ${i}  is: ${AudioCapturerChangeInfoArray[i].streamId}`);
          console.info(`${Tag} : ClientUid for ${i}  is: ${AudioCapturerChangeInfoArray[i].clientUid}`);
          console.info(`${Tag} : Content for ${i}  is: ${AudioCapturerChangeInfoArray[i].capturerInfo.source}`);
          console.info(`${Tag} : Stream for ${i}  is: ${AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags}`);
          console.info(`${Tag} : Flag ${i}  is: ${AudioCapturerChangeInfoArray[i].capturerState}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag} : Id: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id}`);
            console.info(`${Tag} : Type: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType}`);
            console.info(`${Tag} : Role: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole}`);
            console.info(`${Tag} : Name: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].name}`);
            console.info(`${Tag} : Addr: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].address}`);
            console.info(`${Tag} : SR: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0]}`);
            console.info(`${Tag} : C: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0]}`);
            console.info(`${Tag} : CM: ${i}  ${AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks}`);
          }
          if (devDescriptor != null) {
            audioStreamManager.off('audioCapturerChange');
            await audioCap.release();
            expect(true).assertTrue();
            done();
          }
        }
      });
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0200
     * @tc.name      : AudioCapturerChange - ON_STATE_RUNNING
     * @tc.desc      : AudioCapturerChange - ON_STATE_RUNNING
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ESObject) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag = false;

      let audioCap: audio.AudioStreamManager | ESObject;

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });

      audioStreamManagerCB.on('audioCapturerChange', async (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag}: [CAPTURER-CHANGE-ON-002] ResultFlag for element ${i} is: ${resultFlag}`);
            audioStreamManagerCB.off('audioCapturerChange');
            console.info(`${Tag}: [CAPTURER-CHANGE-ON-002] ######### CapturerChange Off is called #########`);

            await audioCap.release().then(() => {
              console.info(`${Tag}: Capturer release : SUCCESS`);
              done();
            }).catch((err: BusinessError) => {
              console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
            });
          }
        }
      });

      await audioCap.start().then(() => {
        console.info(`${Tag}: Capturer started :Success `);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer start :ERROR :${err.message}`);
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0300
     * @tc.name      : AudioCapturerChange - ON_STATE_STOPPED
     * @tc.desc      : AudioCapturerChange - ON_STATE_STOPPED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ESObject) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag: boolean = false;

      let audioCap: audio.AudioStreamManager | ESObject;

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });

      await audioCap.start().then(() => {
        console.info(`${Tag}: Capturer started :Success `);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer start :ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag}: [CAPTURER-CHANGE-ON-003] ResultFlag for element ${i} is: ${resultFlag}`);
          }
        }
      });

      await sleep(100);

      await audioCap.stop().then(() => {
        console.info(`${Tag}: Capturer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer stop:ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManager.off('audioCapturerChange');
      await sleep(100);
      console.info(`${Tag}: [CAPTURER-CHANGE-ON-003] ######### CapturerChange Off is called #########`);

      await audioCap.release().then(() => {
        console.info(`${Tag}: Capturer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0400
     * @tc.name      : AudioCapturerChange - ON_STATE_RELEASED
     * @tc.desc      : AudioCapturerChange - ON_STATE_RELEASED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: ESObject) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag: boolean = false;

      let audioCap: audio.AudioStreamManager | ESObject;

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });

      await audioCap.start().then(() => {
        console.info(`${Tag}: Capturer started :Success `);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer start :ERROR :${err.message}`);
      });

      await audioCap.stop().then(() => {
        console.info(`${Tag}: Capturer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer stop:ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag}: [CAPTURER-CHANGE-ON-004] ResultFlag for element ${i} is: ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audioCap.release().then(() => {
        console.info(`${Tag}: Capturer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.off('audioCapturerChange');
      await sleep(100);
      console.info(`${Tag}: [CAPTURER-CHANGE-ON-004] ######### CapturerChange Off is called #########`);

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0500
     * @tc.name      : AudioCapturerChange - ON_SOURCE_TYPE_MIC
     * @tc.desc      : AudioCapturerChange - ON_SOURCE_TYPE_MIC
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ESObject) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let audioCap: audio.AudioStreamManager | ESObject;

      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioCapturerChangeInfoArray[i].capturerInfo.source == 0 && devDescriptor != null) {
            audioStreamManager.off('audioCapturerChange');
            expect(true).assertTrue();
            done();
          }
        }
      });
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0600
     * @tc.name      : AudioCapturerChange - ON_SOURCE_TYPE_VOICE_COMMUNICATION
     * @tc.desc      : AudioCapturerChange - ON_SOURCE_TYPE_VOICE_COMMUNICATION
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ESObject) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_VOICE_COMMUNICATION,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag: boolean = false;


      audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioCapturerChangeInfoArray[i].capturerInfo.source == 7 && devDescriptor != null) {
            resultFlag = true;
            console.info(`${Tag}: [CAPTURER-CHANGE-ON-006] ResultFlag for element ${i} is: ${resultFlag}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.off('audioCapturerChange');
      await sleep(100);
      console.info(`${Tag}: [CAPTURER-CHANGE-ON-006] ######### CapturerChange Off is called #########`);


      await audioCap.release().then(() => {
        console.info(`${Tag}: Capturer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
      });

      expect(resultFlag).assertTrue();
      done();

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0700
     * @tc.name      : AudioCapturerChange - STREAMID
     * @tc.desc      : AudioCapturerChange - STREAMID
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: ESObject) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (AudioCapturerChangeInfoArray[i].streamId != undefined && devDescriptor != null) {
            audioStreamManager.off('audioCapturerChange');
            expect(true).assertTrue();
            done();
          }
        }
      });
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0800
     * @tc.name      : AudioCapturerChange - CLIENTUID AND CAPTURERFLAG
     * @tc.desc      : AudioCapturerChange - CLIENTUID AND CAPTURERFLAG
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          let clientUid = AudioCapturerChangeInfoArray[i].clientUid;
          let capFlags = AudioCapturerChangeInfoArray[i].capturerInfo.capturerFlags;
          let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          if (clientUid != undefined && capFlags == 0 && devDescriptor != null) {
            audioStreamManager.off('audioCapturerChange');
            expect(true).assertTrue();
            done();
          }
        }
      });
      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0900
     * @tc.name      : AudioCapturerChange - DeviceDescriptor
     * @tc.desc      : AudioCapturerChange - DeviceDescriptor
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_ON_CAPTURER_CHANGE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            let Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
            let dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
            let dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
            let sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
            let cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
            let cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            if (Id > 0 && dType == 15 && dRole == 1 && sRate != null && cCount != null && cMask != null) {
              audioStreamManager.off('audioCapturerChange');
              expect(true).assertTrue();
              done();
            }
          }
        }
      });
      try {
        await audioCap.start();
        await audioCap.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0100
     * @tc.name      : AudioCapturerChange - OFF_STATE_PREPARED
     * @tc.desc      : AudioCapturerChange - OFF_STATE_PREPARED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager.off('audioCapturerChange');
          expect(true).assertTrue();
          done();
        }
      });

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0200
     * @tc.name      : AudioCapturerChange - OFF_STATE_RUNNING
     * @tc.desc      : AudioCapturerChange - OFF_STATE_RUNNING
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap.start();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager.off('audioCapturerChange');
          expect(true).assertTrue();
          done();
        }
      });
      await sleep(100);
      await audioCap.release().then(() => {
        console.info(`${Tag}: Capturer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0300
     * @tc.name      : AudioCapturerChange - OFF_STATE_STOPPED
     * @tc.desc      : AudioCapturerChange - OFF_STATE_STOPPED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap.start();
        await audioCap.stop();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager.off('audioCapturerChange');
          expect(true).assertTrue();
          done();
        }
      });
      await sleep(100);

      await audioCap.release().then(() => {
        console.info(`${Tag}: Capturer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0400
     * @tc.name      : AudioCapturerChange - OFF_STATE_RELEASED
     * @tc.desc      : AudioCapturerChange - OFF_STATE_RELEASED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      try {
        audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
        await audioCap.start();
        await audioCap.stop();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
          audioStreamManager.off('audioCapturerChange');
          expect(true).assertTrue();
          done();
        }
      });
      await sleep(100);

      await audioCap.release().then(() => {
        console.info(`${Tag}: Capturer release : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0500
     * @tc.name      : AudioCapturerChange - DeviceDescriptor
     * @tc.desc      : AudioCapturerChange - DeviceDescriptor
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_OFF_CAPTURER_CHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      audioCap = await audio.createAudioCapturer(AudioCapturerOptions);
      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            let Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
            let dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
            let dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
            let sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
            let cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
            let cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            if (Id > 0 && dType == 15 && dRole == 1 && sRate != null && cCount != null && cMask != null) {
              audioStreamManager.off('audioCapturerChange');
              expect(true).assertTrue();
              done();
            }
          }
        }
      });
      try {
        await audioCap.start();
        await audioCap.release();
      } catch (err) {
        console.log('err :' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_CURRENT_AUDIOCAPTURERINFOARRAY_SYNC_0100
     * @tc.name      : getCurrentAudioCapturerInfoArraySync - GET_STATE_PREPARED
     * @tc.desc      : getCurrentAudioCapturerInfoArraySync - GET_STATE_PREPARED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CURRENT_AUDIOCAPTURERINFOARRAY_SYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      });

      await sleep(100);
      try {
        let AudioCapturerChangeInfoArray = audioStreamManagerCB.getCurrentAudioCapturerInfoArraySync()
        console.info(`AFCapturerChangeLog: [GET_CAP_STA_1_PR] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManagerCB.off('audioCapturerChange');
              console.info(`audioCapturerChange off Success `);
              await audioCap.release().then(() => {
                console.info(`${Tag}: Capturer release : SUCCESS`);
                expect(true).assertTrue();
                done();
              }).catch((err: BusinessError) => {
                console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              });

            }
          }
        }
      } catch (error) {
        console.info('err : ' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }


    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_0100
     * @tc.name      : AudioCapturerChange - GET_STATE_PREPARED
     * @tc.desc      : AudioCapturerChange - GET_STATE_PREPARED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      });

      await sleep(100);

      await audioStreamManagerCB.getCurrentAudioCapturerInfoArray().then(async (AudioCapturerChangeInfoArray) => {
        console.info(`AFCapturerChangeLog: [GET_CAP_STA_1_PR] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManagerCB.off('audioCapturerChange');
              console.info(`audioCapturerChange off Success `);
              await audioCap.release().then(() => {
                console.info(`${Tag}: Capturer release : SUCCESS`);
                expect(true).assertTrue();
                done();
              }).catch((err: BusinessError) => {
                console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              });

            }
          }
        }
      }).catch((err: BusinessError) => {
        console.info('err : ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      });


    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_0200
     * @tc.name      : AudioCapturerChange - GET_STATE_RUNNING
     * @tc.desc      : AudioCapturerChange - GET_STATE_RUNNING
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await sleep(100);
      await audioCap.start().then(() => {
        console.info(`${Tag}: Capturer started :Success `);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer start :ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      });

      await sleep(100);

      await audioStreamManager.getCurrentAudioCapturerInfoArray().then(async (AudioCapturerChangeInfoArray) => {
        console.info(`${Tag}: [GET_CAPTURER_STATE_2_PROMISE] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManager.off('audioCapturerChange');
              await audioCap.release().then(() => {
                console.info(`${Tag}: Capturer release : SUCCESS`);
                expect(true).assertTrue();
                done();
              }).catch((err: BusinessError) => {
                console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              });

            }
          }
        }
      }).catch((err: BusinessError) => {
        console.info('err : ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      });


    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_0300
     * @tc.name      : AudioCapturerChange - GET_STATE_STOPPED
     * @tc.desc      : AudioCapturerChange - GET_STATE_STOPPED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });

      await audioCap.start().then(() => {
        console.info(`${Tag}: Capturer started :Success `);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer start :ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await sleep(100);

      await audioCap.stop().then(() => {
        console.info(`${Tag}: Capturer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer stop:ERROR :${err.message}`);
      });

      await sleep(100);

      await audioStreamManager.getCurrentAudioCapturerInfoArray().then(async (AudioCapturerChangeInfoArray) => {
        console.info(`${Tag}: [GET_CAPTURER_STATE_3_PROMISE] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
            }
            if (devDescriptor != null) {
              audioStreamManager.off('audioCapturerChange');
              await audioCap.release().then(() => {
                console.info(`${Tag}: Capturer release : SUCCESS`);
                expect(true).assertTrue();
                done();
              }).catch((err: BusinessError) => {
                console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
                expect(false).assertTrue();
                done();
              });

            }
          }
        }
      }).catch((err: BusinessError) => {
        console.info('err : ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      });


    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_0400
     * @tc.name      : AudioCapturerChange - DEVICE DESCRIPTOR
     * @tc.desc      : AudioCapturerChange - DEVICE DESCRIPTOR
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });
      audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await sleep(100);

      await audioCap.start();

      await sleep(100);

      await audioStreamManagerCB.getCurrentAudioCapturerInfoArray().then(async (AudioCapturerChangeInfoArray) => {
        console.info(`AFCapturerChangeLog: [GET_CAP_DD_PR] **** Get Promise Called ****`);
        if (AudioCapturerChangeInfoArray != null) {
          for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
            console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
            for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
              let Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
              let dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
              let dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
              let sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
              let cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
              let cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
              console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              if (Id > 0 && dType == 15 && dRole == 1 && sRate != null && cCount != null && cMask != null) {
                audioStreamManagerCB.off('audioCapturerChange');
                await audioCap.release().then(() => {
                  console.info(`${Tag}: Capturer release : SUCCESS`);
                  expect(true).assertTrue();
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
                  expect(false).assertTrue();
                  done();
                });

              }
            }
          }
        }
      }).catch((err: BusinessError) => {
        console.log(`${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
        expect(false).assertTrue();
        done();
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_0100
     * @tc.name      : AudioCapturerChange - GET_STATE_PREPARED
     * @tc.desc      : AudioCapturerChange - GET_STATE_PREPARED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag: boolean = false;
      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManager.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
        console.info(`${Tag}: [GET_CAPTURER_STATE_1_CALLBACK] **** Get Callback Called ****`);
        await sleep(100);
        if (err) {
          console.log(`${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
        } else {
          if (AudioCapturerChangeInfoArray != null) {
            for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
              console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
              let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
                console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                audioStreamManager.off('audioCapturerChange');
                await audioCap.release().then(() => {
                  console.info(`${Tag}: Capturer release : SUCCESS`);
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
                  expect(false).assertTrue();
                  done();
                });
              }
            }
          }
        }
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_0200
     * @tc.name      : AudioCapturerChange - GET_STATE_RUNNING
     * @tc.desc      : AudioCapturerChange - GET_STATE_RUNNING
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag: boolean = false;

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await sleep(100);
      await audioCap.start().then(() => {
        console.info(`${Tag}: Capturer started :Success `);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer start :ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManagerCB.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
        console.info(`${Tag}: [GET_CAPTURER_STATE_2_CALLBACK] **** Get Callback Called ****`);
        await sleep(100);
        if (err) {
          console.log(`${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
        } else {
          if (AudioCapturerChangeInfoArray != null) {
            for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
              console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
              let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
                console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                audioStreamManagerCB.off('audioCapturerChange');
                await audioCap.release().then(() => {
                  console.info(`${Tag}: Capturer release : SUCCESS`);
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
                  expect(false).assertTrue();
                  done();
                });
              }
            }
          }
        }
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_0300
     * @tc.name      : AudioCapturerChange - GET_STATE_STOPPED
     * @tc.desc      : AudioCapturerChange - GET_STATE_STOPPED
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }

      let resultFlag: boolean = false;

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
      });

      await audioCap.start().then(() => {
        console.info(`${Tag}: Capturer started :Success `);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer start :ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });

      await sleep(100);

      await audioCap.stop().then(() => {
        console.info(`${Tag}: Capturer stopped : SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: Capturer stop:ERROR :${err.message}`);
      });

      await sleep(100);

      audioStreamManager.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
        console.info(`${Tag}: [GET_CAPTURER_STATE_3_CALLBACK] **** Get Callback Called ****`);
        await sleep(100);
        if (err) {
          console.log(`${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
        } else {
          if (AudioCapturerChangeInfoArray != null) {
            for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
              console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
              let devDescriptor = AudioCapturerChangeInfoArray[i].deviceDescriptors;
              for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
                console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
              }
              if (devDescriptor != null) {
                audioStreamManager.off('audioCapturerChange');
                await audioCap.release().then(() => {
                  console.info(`${Tag}: Capturer release : SUCCESS`);
                  done();
                }).catch((err: BusinessError) => {
                  console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
                  expect(false).assertTrue();
                  done();
                });
              }
            }
          }
        }
      });
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_0400
     * @tc.name      : AudioCapturerChange - DEVICE DESCRIPTOR
     * @tc.desc      : AudioCapturerChange - DEVICE DESCRIPTOR
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_GET_CAPTURER_CHANGE_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {

      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }

      let AudioCapturerInfo: AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }

      let AudioCapturerOptions: AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      let resultFlag: boolean = false;

      audioStreamManager.on('audioCapturerChange', (AudioCapturerChangeInfoArray) => {
        for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
          console.info(`${Tag}: CapChange on is called for element ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
          for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
            console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
          }
        }
      });
      await sleep(100);

      await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
        audioCap = data;
        console.info(`${Tag}: AudioCapturer Created : Success : Stream Type: SUCCESS`);
      }).catch((err: BusinessError) => {
        console.info(`${Tag}: AudioCapturer Created : ERROR :${err.message}`);
        expect(false).assertTrue();
        done();
      });

      await sleep(100);

      audioStreamManager.getCurrentAudioCapturerInfoArray(async (err, AudioCapturerChangeInfoArray) => {
        console.info(`${Tag}: [GET_CAPTURER_DD_CALLBACK] **** Get Callback Called ****`);
        await sleep(100);
        if (err) {
          console.log(`${Tag}: getCurrentAudioCapturerInfoArray :ERROR:${err.message}`);
          resultFlag = false;
        } else {
          if (AudioCapturerChangeInfoArray != null) {
            for (let i = 0; i < AudioCapturerChangeInfoArray.length; i++) {
              console.info(`${Tag}: ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i])}`);
              for (let j = 0; j < AudioCapturerChangeInfoArray[i].deviceDescriptors.length; j++) {
                let Id = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].id;
                let dType = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceType;
                let dRole = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].deviceRole;
                let sRate = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].sampleRates[0];
                let cCount = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelCounts[0];
                let cMask = AudioCapturerChangeInfoArray[i].deviceDescriptors[j].channelMasks;
                console.info(`${Tag}:deviceDescriptors ${i} : ${JSON.stringify(AudioCapturerChangeInfoArray[i].deviceDescriptors[j])}`);
                if (Id > 0 && dType == 15 && dRole == 1 && sRate != null && cCount != null && cMask != null) {
                  audioStreamManager.off('audioCapturerChange');
                  await audioCap.release().then(() => {
                    console.info(`${Tag}: Capturer release : SUCCESS`);
                    done();
                  }).catch((err: BusinessError) => {
                    console.info(`${Tag}: Capturer release :ERROR :${err.message}`);
                    expect(false).assertTrue();
                    done();
                  });
                }
              }
            }
          }
        }
      });
    })
  })
}