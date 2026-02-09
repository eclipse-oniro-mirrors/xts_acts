/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import fileio from '@ohos.file.fs';
import { TestConst } from './Const.test';
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
let g_context: common.UIAbilityContext;
let audioCap: audio.AudioCapturer | null;

export default function getCurrentInputDevicesTest() {
  describe('getCurrentInputDevices', () => {
    let dirPath: string;

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
        let permissionButton = await driver.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 1000)
        if (permissionButton != null) {
          await permissionButton.click();
        }
      } catch (err) {
        console.error(' beforeAll failed, err: ' + err);
      }
      console.info('TestLog: Start Testing AudioCpaturerEnhanceTest Interfaces');
    })
    beforeEach(async () => {
      console.info(`${Tag} beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(1000);
    })
    afterEach(async () => {
      if (audioCap! != null) {
        releaseFun(audioCap!);
      }
      console.info(`${Tag} afterEach: Test case-level clearance conditions`);
      await Utils.msSleep(1000);
    })
    afterAll(() => {
      console.info(`${Tag} afterAll: Test suite-level cleanup condition`);
    })

    let getFd = async (fileName: string) => {
      let testContext = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      dirPath = testContext.filesDir + '/' + fileName
      console.info(`${Tag} case2 dirPath is  ${JSON.stringify(dirPath)}`);
    }

    let getInputDeviceInfo = (inputDeviceInfo: audio.AudioDeviceDescriptors) => {
      let str = ``;
      let descriptor = inputDeviceInfo[0];
      str += `Id:${descriptor.id}, DeviceType:${descriptor.deviceType}, DeviceRole:${descriptor.deviceRole},
              Name:${descriptor.name}, Address:${descriptor.address}, SampleRates:${descriptor.sampleRates[0]},
              ChannelCounts:${descriptor.channelCounts[0]}, ChannelMask:${descriptor.channelMasks}, encodingTypes:${descriptor.encodingTypes}\n`;
      return str;
    }

    let recordingFun = async (audioCap: audio.AudioCapturer) => {
      try {
        let audioParamsGet: audio.AudioStreamInfo = await audioCap.getStreamInfo();
        if (audioParamsGet != undefined && audioParamsGet != null) {
          console.info(`${Tag} Capturer getStreamInfo:${JSON.stringify(audioParamsGet as audio.AudioStreamInfo)}`);
        } else {
          expect(false).assertTrue();
        }
      } catch (err: BusinessError) {
        console.log(`${Tag} getStreamInfo  :ERROR:  ${JSON.stringify(err.message)} ,code:${JSON.stringify(err.code)}`);
        expect(false).assertTrue();
      }
      try {
        let audioParamsGet: audio.AudioCapturerInfo = await audioCap.getCapturerInfo();
        if (audioParamsGet != undefined) {
          console.info(`${Tag} Capturer CapturerInfo: ${JSON.stringify(audioParamsGet as audio.AudioCapturerInfo)}`);
        } else {
          console.info(`${Tag} audioParamsGet are incorrect , is :  ${JSON.stringify(audioParamsGet as audio.AudioCapturerInfo)}`);
          expect(false).assertTrue();
        }
      } catch (err: BusinessError) {
        console.log(`${Tag} CapturerInfo :ERROR:  ${JSON.stringify(err.message)} ${JSON.stringify(err.code)}`);
        expect(false).assertTrue();
      }
      try {
        await audioCap.start();
        let bufferSize = await audioCap.getBufferSize();
        console.log(`${Tag} bufferSize: ${JSON.stringify(bufferSize)} , dirPath: ${JSON.stringify(dirPath)}`);
        let fd = fileio.openSync(dirPath, 0o102);
        console.log(`${Tag} fd: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.info(`${Tag} file fd created`);
        } else {
          console.info(`${Tag} Capturer start : ERROR `);
          expect(false).assertTrue();
        }
        fd = fileio.openSync(dirPath, 0o2002);
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
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} ---------WRITE BUFFER---------`);
          }
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} numBuffersToCapture: ${numBuffersToCapture}`)
          }
          if (numBuffersToCapture == 22) {
            try {
              let data = audioCap.getCurrentInputDevices();
              console.info(`recordingFun getCurrentInputDevices: SUCCESS ${getInputDeviceInfo(data)}`)
            } catch (error: BusinessError) {
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

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_STATIC_0100
     * @tc.desc   AudioCapturer - getCurrentInputDevices-Mic-SOURCE_TYPE_MIC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
        console.info(`${Tag} Create audio capturer success\n`);
      } catch (error: BusinessError) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        let InputDeviceInfo: audio.AudioDeviceDescriptors = audioCap!.getCurrentInputDevices();
        // console.info(`getCurrentInputDevices :SUCCESS ${getInputDeviceInfo(InputDeviceInfo)}`)
        expect(InputDeviceInfo[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(InputDeviceInfo[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(InputDeviceInfo[0].id).assertEqual(TestConst.INPUT_DEVICE_MIC_ID);
        expect(InputDeviceInfo[0].encodingTypes?.[0]).assertEqual(TestConst.OUTPUT_NUMBER_0);
        done();
      } catch (error: BusinessError) {
        console.log(`${Tag}: getCurrentInputDevices : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_STATIC_0200
     * @tc.desc   AudioCapturer - getCurrentInputDevices-mic-STATE_RUNNING
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETCURRENTINPUTDEVICES_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
        await getFd("capture_js-44100-2C-16B.pcm");
        await recordingFun(audioCap!);
      } catch (error: BusinessError) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }

      try {
        let InputDeviceInfo: audio.AudioDeviceDescriptors = audioCap!.getCurrentInputDevices();
        // console.info(`getCurrentInputDevices :SUCCESS ${getInputDeviceInfo(InputDeviceInfo)}`)
        expect(InputDeviceInfo[0].id).assertLargerOrEqual(TestConst.OUTPUT_NUMBER_0);
        expect(InputDeviceInfo[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(InputDeviceInfo[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(InputDeviceInfo[0].encodingTypes?.[0]).assertEqual(TestConst.OUTPUT_NUMBER_0);
        done();
      } catch (error: BusinessError) {
        console.log(`${Tag}: getCurrentInputDevices : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      await audioCap!.stop();
      console.log(`${Tag} stop ok`);
    })
  })
}

