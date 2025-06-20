/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import featureAbility from '@ohos.ability.featureAbility';
import * as env from './Const';
import uitest, { Driver, MatchPattern, ON } from "@ohos.UiTest";
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import { data } from '@kit.TelephonyKit';

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

interface AudioCapturerInfo {
  source: number,
  capturerFlags: number
}

interface AudioCapturerOptions {
  streamInfo: AudioStreamInfo,
  capturerInfo: AudioCapturerInfo
}

const Tag: string = 'AudioCpaturerEnhanceTest: ';
let audioCap: ESObject;
let testContext: common.UIAbilityContext;

export default function onOffInputDeviceChangeTest() {
  describe('onOffInputDeviceChange', () => {

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
      await getPermission();
      await driveFn();
      console.info('TestLog: Start Testing AudioCpaturerEnhanceTest Interfaces');
    });
    beforeEach(async () => {
      console.info(`${Tag} beforeEach: Prerequisites at the test case level`);
      await sleep(1000);
    })
    afterEach(async () => {
      if (audioCap != null) {
        releaseFun(audioCap);
        audioCap = null;
      }
      console.info(`${Tag} afterEach: Test case-level clearance conditions`);
      await sleep(1000);
    })
    afterAll(() => {
      console.info(`${Tag} afterAll: Test suite-level cleanup condition`);
    })

    let releaseFun = async (audioCap: audio.AudioRenderer) => {
      try {
        await audioCap.release();
        console.log(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release fail,err : ${JSON.stringify(err)}`);
      }
    }

    let getInputDeviceInfo = (inputDeviceInfo: ESObject) => {
      let str = ``;
      let descriptor: ESObject = inputDeviceInfo[0];
      str += `Id:${descriptor.id}, DeviceType:${descriptor.deviceType}, DeviceRole:${descriptor.deviceRole},
              Name:${descriptor.name}, Address:${descriptor.address}, SampleRates:${descriptor.sampleRates[0]},
              ChannelCounts:${descriptor.channelCounts[0]}, ChannelMask:${descriptor.channelMasks}, encodingTypes:${descriptor.encodingTypes}`;
      return str;
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0100
     * @tc.name      : AudioCapturer - on-ERROR-INPUT_NUMDER_PARAMETER
     * @tc.desc      : AudioCapturer - on-ERROR-INPUT_NUMDER_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0100', 2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
        }).catch((err: BusinessError) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        audioCap.on(env.INPUT_PARAMETER_TYPE_NUMBER, (data: ESObject) => {
          console.info(`on-inputDeviceChange Success! test fail!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`on-inputDeviceChange input parameter type -1: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0200
     * @tc.name      : AudioCapturer - on-ERROR-INPUT_STRING_PARAMETER
     * @tc.desc      : AudioCapturer - on-ERROR-INPUT_STRING_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0200', 2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
        }).catch((err: BusinessError) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        audioCap.on(env.INVALID_PARAMETER_STRING, (data: ESObject) => {
          console.info(`${Tag} on-inputDeviceChange Success! test fail!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`on-inputDeviceChange invalid parameter type '123': ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0300
     * @tc.name      : AudioCapturer - on-ERROR-INPUT-NO-PARAMETER
     * @tc.desc      : AudioCapturer - on-ERROR-INPUT-NO-PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_INPUTDEVICECHANGE_0300', 2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
        }).catch((err: BusinessError) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        audioCap.on((data: ESObject) => {
          console.info(`${Tag} on-inputDeviceChange Success! test fail!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`on-inputDeviceChange no input parameter: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0100
     * @tc.name      : AudioCapturer - off-ERROR-INPUT_NUMDER_PARAMETER
     * @tc.desc      : AudioCapturer - off-ERROR-INPUT_NUMDER_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0100', 2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
        }).catch((err: BusinessError) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        audioCap.off(env.INPUT_PARAMETER_TYPE_NUMBER, (data: ESObject) => {
          console.info(` off-inputDeviceChange Success! test fail!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`off-inputDeviceChange input parameter type -1: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0200
     * @tc.name      : AudioCapturer - off-ERROR-INPUT_STRING_PARAMETER
     * @tc.desc      : AudioCapturer - off-ERROR-INPUT_STRING_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0200', 2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
        }).catch((err: BusinessError) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        audioCap.off(env.INVALID_PARAMETER_STRING, (data: ESObject) => {
          console.info(`${Tag} off-inputDeviceChange Success! test fail!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`off-inputDeviceChange invalid parameter type '123': ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0300
     * @tc.name      : AudioCapturer - on-ERROR-INPUT-NO-PARAMETER
     * @tc.desc      : AudioCapturer - on-ERROR-INPUT-NO-PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_INPUTDEVICECHANGE_0300', 2, async (done: Function) => {
      let AudioStreamInfo: AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_8000,
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
        }).catch((err: BusinessError) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        audioCap.off((data: ESObject) => {
          console.info(`${Tag} off-inputDeviceChange Success! test fail!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`off-inputDeviceChange no input parameter: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    })
  })
}