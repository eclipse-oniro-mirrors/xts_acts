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
import fileio from '@ohos.fileio';
import * as env from './Const';
import uitest, { Driver, MatchPattern, ON } from "@ohos.UiTest";
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';
import { BusinessError } from '@ohos.base';
import { PermissionRequestResult } from '@ohos.abilityAccessCtrl';

const Tag: string = 'AudioCpaturerEnhanceTest: ';
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

let audioCap: ESObject;
let testContext: common.UIAbilityContext;

export default function getCurrentInputDevicesTest() {
  describe('getCurrentInputDevices', () => {
    let dirPath: string;

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

    let getFd = (fileName: string) => {
      let appContext = testContext.getApplicationContext();
      dirPath = appContext.filesDir + '/' + fileName;
      console.info(`${Tag} case2 dirPath is  ${JSON.stringify(dirPath)}`);
    }

    let releaseFun = async (audioCap: ESObject) => {
      try {
        await audioCap.release();
        console.log(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release fail,err : ${JSON.stringify(err)}`);
      }
    }

    let recordingFun = async (audioCap: ESObject) => {
      try {
        let audioParamsGet: audio.AudioRenderer = await audioCap.getStreamInfo();
        if (audioParamsGet != undefined && audioParamsGet != null) {
          console.info(`${Tag} Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
        } else {
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log(`${Tag} getStreamInfo  :ERROR:  ${JSON.stringify(err.message)} ,code:${JSON.stringify(err.code)}`);
        expect(false).assertTrue();
      }
      try {
        let audioParamsGet: audio.AudioRenderer = await audioCap.getCapturerInfo();
        if (audioParamsGet != undefined) {
          console.info(`${Tag} Capturer CapturerInfo: ${JSON.stringify(audioParamsGet)}`);
        } else {
          console.info(`${Tag} audioParamsGet are incorrect , is :  ${JSON.stringify(audioParamsGet)}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log(`${Tag} CapturerInfo :ERROR:  ${JSON.stringify(err.message)} ${JSON.stringify(err.code)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCap.start();
        let bufferSize: audio.AudioRenderer = await audioCap.getBufferSize();
        console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
        let fd = fileio.openSync(dirPath, 0o102, 0o777);
        console.log(`${Tag} fd: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.info(`${Tag} file fd created`);
        } else {
          console.info(`${Tag} Capturer start : ERROR `);
          expect(false).assertTrue();
        }
        fd = fileio.openSync(dirPath, 0o2002, 0o666);
        if (fd !== null) {
          console.info(`${Tag} file fd opened : Append Mode :PASS`);
        } else {
          console.info(`${Tag} file fd Open: Append Mode : FAILED`);
          expect(false).assertTrue();
        }
        let numBuffersToCapture = 45;
        while (numBuffersToCapture) {
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} ---------READ BUFFER---------`);
          }
          let buffer: ESObject = await audioCap.read(bufferSize, true);
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} ---------WRITE BUFFER---------`);
          }
          let number = fileio.writeSync(fd, buffer);
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} BufferRecLog: data written:  ${JSON.stringify(number)}`);
            console.info(`${Tag} numBuffersToCapture: ${numBuffersToCapture}`)
          }
          if (numBuffersToCapture == 22) {
            try {
              let data: audio.AudioRenderer = await audioCap.getCurrentInputDevices();
              console.info(`recordingFun getCurrentInputDevices: SUCCESS ${getInputDeviceInfo(data)}`)
            } catch (error) {
              console.log(`recordingFun getCurrentInputDevices: ERROR ${error.message},${error.code}`);
              expect(false).assertTrue();
            }
          }
          numBuffersToCapture--;
        }
      } catch (err) {
        console.log(`${Tag} start-read err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
    }

    let getInputDeviceInfo = (inputDeviceInfo: ESObject) => {
      let str = ``;
      let descriptor: ESObject = inputDeviceInfo[0];
      str += `Id:${descriptor.id}, DeviceType:${descriptor.deviceType}, DeviceRole:${descriptor.deviceRole},
              Name:${descriptor.name}, Address:${descriptor.address}, SampleRates:${descriptor.sampleRates[0]},
              ChannelCounts:${descriptor.channelCounts[0]}, ChannelMask:${descriptor.channelMasks}, encodingTypes:${descriptor.encodingTypes}\n`;
      return str;
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0100
     * @tc.desc   AudioCapturer - getCurrentInputDevices-Mic-SOURCE_TYPE_MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
        }).catch((err: BusinessError) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        console.info(`${Tag} Create audio capturer success\n`);
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        let InputDeviceInfo: audio.AudioCapturer = audioCap.getCurrentInputDevices();
        console.info(`getCurrentInputDevices :SUCCESS ${getInputDeviceInfo(InputDeviceInfo)}`)
        expect(InputDeviceInfo[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(InputDeviceInfo[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(InputDeviceInfo[0].encodingTypes[0]).assertEqual(env.OUTPUT_NUMBER_0);
        done();
      } catch (error) {
        console.log(`${Tag}: getCurrentInputDevices : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0200
     * @tc.desc   AudioCapturer - getCurrentInputDevices-mic-STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
          audioCap = data;
        }).catch((err: BusinessError) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        await getFd("capture_js-44100-2C-16B.pcm");
        await recordingFun(audioCap);
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let InputDeviceInfo: ESObject = audioCap.getCurrentInputDevices();
        console.info(`getCurrentInputDevices :SUCCESS ${getInputDeviceInfo(InputDeviceInfo)}`)
        expect(InputDeviceInfo[0].id).assertLargerOrEqual(env.OUTPUT_NUMBER_0);
        expect(InputDeviceInfo[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(InputDeviceInfo[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(InputDeviceInfo[0].encodingTypes[0]).assertEqual(env.OUTPUT_NUMBER_0);
        done();
      } catch (error) {
        console.log(`${Tag}: getCurrentInputDevices : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      await audioCap.stop();
      console.log(`${Tag} stop ok`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0300
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0300
     * @tc.desc   AudioCapturer - getCurrentInputDevices-ALL-SourceType
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let index: ESObject;
      let sourceType: ESObject = audio.SourceType;
      const keysArray = [...Object.keys(sourceType)];
      for (index of keysArray) {
        let AudioStreamInfo: AudioStreamInfo = {
          samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
          channels: audio.AudioChannel.CHANNEL_2,
          sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
          encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
        }
        let AudioCapturerInfo: AudioCapturerInfo = {
          source: Number(keysArray[index]),
          capturerFlags: 0
        }
        let AudioCapturerOptions: AudioCapturerOptions = {
          streamInfo: AudioStreamInfo,
          capturerInfo: AudioCapturerInfo
        }
        try {
          if (Number(audio.SourceType[index]) == audio.SourceType.SOURCE_TYPE_INVALID) {
            console.info(`SourceType ${index}:${audio.SourceType[index]}, change to MIC`)
            AudioCapturerOptions.capturerInfo.source = Number(audio.SourceType.SOURCE_TYPE_MIC);
          }
          await audio.createAudioCapturer(AudioCapturerOptions).then((data) => {
            audioCap = data;
          }).catch((err: BusinessError) => {
            console.info(' AudioCapturer Created catch ERROR' + err.message);
          });
        } catch (error) {
          console.info(`${Tag} AudioCapturer Created ERROR!  ${error.message} ${error.code}\n`);
          expect(false).assertTrue();
          done();
        }
        try {
          let InputDeviceInfo: audio.AudioCapturer = await audioCap.getCurrentInputDevices();
          console.info(`getCurrentInputDevices :SUCCESS ${getInputDeviceInfo(InputDeviceInfo)}`)
          expect(InputDeviceInfo[0].deviceType).assertEqual(audio.DeviceType.MIC);
          expect(InputDeviceInfo[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
          expect(InputDeviceInfo[0].encodingTypes[0]).assertEqual(env.OUTPUT_NUMBER_0);
        } catch (error) {
          console.log(`${Tag}: getCurrentInputDevices : ERROR11111 ${error.message},${error.code}`);
          expect(false).assertTrue();
          done();
        }
        sleep(20);
        await releaseFun(audioCap);
        audioCap = null;
      }
      done();
    })
  })
}