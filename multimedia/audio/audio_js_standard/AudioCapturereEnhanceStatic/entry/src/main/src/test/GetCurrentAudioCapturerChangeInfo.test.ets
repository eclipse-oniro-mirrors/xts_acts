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
let audioCap: audio.AudioCapturer | null = null;
let g_context: common.UIAbilityContext;

export default function audioCapturerEnhanceTest() {
  describe('getCurrentAudioCapturerChangeInfo', () => {
    let dirPath: string = "";

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
      console.info('TestLog: Start Testing AudioCpaturerEnhanceTest Interfaces');
    })

    beforeEach(async () => {
      console.info(`${Tag} beforeEach: Prerequisites at the test case level`);
      await Utils.msSleep(1000);
    })
    afterEach(async () => {
      if (audioCap != null) {
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

    let getCapturerChangeInfo = (CapturerChangeInfo: audio.AudioCapturerChangeInfo) => {
      let str = ``;
        let Info = CapturerChangeInfo;
        str += `__deviceDescriptors_:\nStreamId:${Info.streamId}, ClientUid:${Info.clientUid}, State:${Info.capturerState}, muted:${Info.muted}, \n Source:${Info.capturerInfo.source}, Flag:${Info.capturerInfo.capturerFlags}\n`;
        let descriptor = Info.deviceDescriptors[0];
        str += ` Id:${descriptor.id}, Type:${descriptor.deviceType}, Role:${descriptor.deviceRole}\n Name:${descriptor.name}, Address:${descriptor.address}, SampleRates:${descriptor.sampleRates[0]}\n ChannelCounts:${descriptor.channelCounts[0]}, ChannelMask:${descriptor.channelMasks}, encodingTypes:${descriptor.encodingTypes?.[0]}\n`;
      return str;
    }

    let recordingFun = async (audioCap: audio.AudioCapturer) => {
      try {
        let audioParamsGet: audio.AudioStreamInfo = await audioCap.getStreamInfo();
        if (audioParamsGet != undefined && audioParamsGet != null) {
          console.info(`${Tag} Capturer getStreamInfo:${JSON.stringify(audioParamsGet as audio.AudioStreamInfo)}`);
        } else {
          console.info(`${Tag} audioParamsGet are incorrect,is :  ${JSON.stringify(audioParamsGet as audio.AudioStreamInfo)}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log(`${Tag} getStreamInfo  :ERROR:  ${JSON.stringify(err.message)} ${JSON.stringify(err.code)}`);
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
      } catch (err) {
        console.log(`${Tag} CapturerInfo :ERROR:  ${JSON.stringify(err.message)} ${JSON.stringify(err.code)}`);
        expect(false).assertTrue();
      }
      try {
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
        console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.info(`${Tag} file fd opened : Append Mode :PASS`);
        } else {
          console.info(`${Tag} file fd Open: Append Mode : FAILED`);
          expect(false).assertTrue();
        }
        let numBuffersToCapture = 45;
        let readDataCallback =  (buffer: ArrayBuffer) => {
          while (numBuffersToCapture) {
            if (numBuffersToCapture % 5 == 0) {
              console.info(`${Tag} ---------READ BUFFER---------`);
            }
            if (numBuffersToCapture % 5 == 0) {
              console.info(`${Tag} ---------WRITE BUFFER---------`);
            }
            let numberValue = fileio.writeSync(fd.fd, buffer);
            if (numBuffersToCapture % 5 == 0) {
              console.info(`${Tag} BufferRecLog: data written:  ${JSON.stringify(numberValue)}`);
              console.info(`${Tag} numBuffersToCapture: ${numBuffersToCapture}`)
            }
            if (numBuffersToCapture == 22) {
              try {
                let CapturerChangeInfo = audioCap.getCurrentAudioCapturerChangeInfo();
                // console.info(`recordingFun getCurrentAudioCapturerChangeInfo:SUCCESS,
                //      ${getCapturerChangeInfo(CapturerChangeInfo)}`)
              } catch (error) {
                console.log(`recordingFun getCurrentAudioCapturerChangeInfo: ERROR ${error.message},${error.code}`);
                expect(false).assertTrue();
              }
            }
            numBuffersToCapture--;
          }
        }
        audioCap.onReadData(readDataCallback);

        console.log(`${Tag} read ok`);

        await audioCap.start();
        console.log(`${Tag} start ok`);
      } catch (err) {
        console.log(`${Tag} start-read err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_STATIC_0100
     * @tc.desc   AudioCapturer - getCurrentAudioCapturerChangeInfo-MIC-STATE_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        let CapturerChangeInfo: audio.AudioCapturerChangeInfo = audioCap!.getCurrentAudioCapturerChangeInfo();
        // console.info(`getCurrentAudioCapturerChangeInfo :SUCCESS\n ${getCapturerChangeInfo(CapturerChangeInfo)}`)
        expect(CapturerChangeInfo.capturerInfo.source).assertEqual(Number(AudioCapturerOptions.capturerInfo.source));
        expect(CapturerChangeInfo.muted).assertEqual(false);
        expect(CapturerChangeInfo.deviceDescriptors[0].id).assertLargerOrEqual(TestConst.OUTPUT_NUMBER_0);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(CapturerChangeInfo.deviceDescriptors[0].encodingTypes?.[0]).assertEqual(TestConst.OUTPUT_NUMBER_0);
        done();
      } catch (error) {
        console.log(`${Tag}getCurrentAudioCapturerChangeInfo : ERROR ${error.message},${error.code}`);
        if (error.code) {
          expect(false).assertTrue();
          done();
        } else {
          done();
        }
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_STATIC_0200
     * @tc.desc   AudioCapturer - getCurrentAudioCapturerChangeInfo-MIC-SOURCE-RECOGNITION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let AudioStreamInfo: audio.AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
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
        await audio.createAudioCapturer(AudioCapturerOptions).then((data: audio.AudioCapturer | null) => {
          audioCap = data;
        }).catch((err: Error) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        await getFd("capture_js-44100-2C-16B.pcm");
        await recordingFun(audioCap!);
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created and start ERROR :  ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        let CapturerChangeInfo: audio.AudioCapturerChangeInfo = audioCap!.getCurrentAudioCapturerChangeInfo();
        // console.info(`getCurrentAudioCapturerChangeInfo :SUCCESS, ${getCapturerChangeInfo(CapturerChangeInfo)}`)
        expect(CapturerChangeInfo.muted).assertEqual(false);
        expect(CapturerChangeInfo.deviceDescriptors[0].id).assertLargerOrEqual(TestConst.OUTPUT_NUMBER_0);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(CapturerChangeInfo.deviceDescriptors[0].encodingTypes?.[0]).assertEqual(TestConst.OUTPUT_NUMBER_0);
        done();
      } catch (error) {
        console.log(`${Tag} getCurrentAudioCapturerChangeInfo : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      await audioCap!.stop();
      console.log(`${Tag} stop ok`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_STATIC_0400
     * @tc.desc   AudioCapturer - getCurrentAudioCapturerChangeInfo-SOURCE_TYPE_SOURCE_TYPE_VOICE_COMMUNICATION_PREPARED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_GETAUDIOCURRENTAUDIOCAPTURERCHANGEINFO_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data: audio.AudioCapturer | null) => {
          audioCap = data;
        }).catch((err: Error) => {
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        let CapturerChangeInfo: audio.AudioCapturerChangeInfo = audioCap!.getCurrentAudioCapturerChangeInfo();
        // console.info(`getCurrentAudioCapturerChangeInfo :SUCCESS\n ${getCapturerChangeInfo(CapturerChangeInfo)}`)
        expect(CapturerChangeInfo.capturerInfo.source).assertEqual(Number(AudioCapturerOptions.capturerInfo.source));
        expect(CapturerChangeInfo.muted).assertEqual(false);
        expect(CapturerChangeInfo.deviceDescriptors[0].id).assertLargerOrEqual(TestConst.OUTPUT_NUMBER_0);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceType).assertEqual(audio.DeviceType.MIC);
        expect(CapturerChangeInfo.deviceDescriptors[0].deviceRole).assertEqual(audio.DeviceRole.INPUT_DEVICE);
        expect(CapturerChangeInfo.deviceDescriptors[0].encodingTypes?.[0]).assertEqual(TestConst.OUTPUT_NUMBER_0);
        done();
      } catch (error) {
        console.log(`${Tag}getCurrentAudioCapturerChangeInfo : ERROR ${error.message},${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

  })
}
