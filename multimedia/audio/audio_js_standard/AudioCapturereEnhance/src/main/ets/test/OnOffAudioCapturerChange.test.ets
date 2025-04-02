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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import featureAbility from '@ohos.ability.featureAbility';
import fileio from '@ohos.fileio';
import * as env from './Const';
import uitest from "@ohos.UiTest";

export default function audioCapturerEnhanceTest() {
  describe('onOffAudioCapturerChange', function () {
    let Tag = 'AudioCpaturerEnhanceTest: ';
    let dirPath;
    let audioCap = null;
    let audioManager = null;
    let flag1: boolean = false;
    let flag2: boolean = false;

    function callback1() {
        console.info(`TestLog: audioCapturerChange command callback1 success`);
        flag1 = true;
    }

    function callback2() {
        console.info(`TestLog: audioCapturerChange command callback2 success`);
        flag2 = true;
    }

    function sleep(ms) {
      return new Promise(resolve => setTimeout(resolve, ms));
    }

    beforeAll(async function () {
      console.info("beforeAll case");
      try {
        audioManager = audio.getAudioManager();
        console.log(`get audioManager success!`);
      } catch (error) {
        console.log(`getAudioManager err: ${error.message}, ${error.code}`);
      }
      console.info('TestLog: Start Testing AudioCpaturerEnhanceTest Interfaces');
      sleep(1000);
    });
    beforeEach(async function () {
      console.info(`${Tag} beforeEach: Prerequisites at the test case level`);
    })
    afterEach(async function () {
      try {
        await audioCap.off('audioCapturerChange');
         console.log(`off-audioCapturerChange success`)
      } catch (error) {
        console.log(`off-audioCapturerChange err: ${error.message}, ${error.code}`)
      }
      if (audioCap != null) {
        releaseFun(audioCap);
        audioCap = null;
      }
      audioManager.setMicrophoneMute(false, (err) => {
        if (err) {
          console.log(`audioManager setMicrophoneMute-false err: ${err.message}, ${err.code}`)
          return;
        }
        console.log(`audioManager setMicrophoneMute-false success`)
      });
      console.info(`${Tag} afterEach: Test case-level clearance conditions`);
      await sleep(1000);
    })
    afterAll(async function () {
      console.info(`${Tag} afterAll: Test suite-level cleanup condition`);
    })

    async function getFd(fileName) {
      let context = featureAbility.getContext();
      await context.getFilesDir().then((data) => {
        dirPath = data + '/' + fileName;
        console.info(`${Tag} case2 dirPath is  ${JSON.stringify(dirPath)}`);
      })
    }

    async function recordingFun(audioCap) {
      try {
        let audioParamsGet = await audioCap.getStreamInfo();
        if (audioParamsGet != undefined && audioParamsGet != null) {
          console.info(`${Tag} Capturer getStreamInfo:${JSON.stringify(audioParamsGet)}`);
        } else {
          console.info(`${Tag} audioParamsGet are incorrect,is :  ${JSON.stringify(audioParamsGet)}`);
          expect(false).assertTrue();
        }
      } catch (err) {
        console.log(`${Tag} getStreamInfo  :ERROR:  ${JSON.stringify(err.message)} ${JSON.stringify(err.code)}`);
        expect(false).assertTrue();
      }
      try {
        let audioParamsGet = await audioCap.getCapturerInfo();
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
        console.log(`${Tag} start ok`);
        let bufferSize = await audioCap.getBufferSize();
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
        console.log(`${Tag} fd-re: ${JSON.stringify(fd)}`);
        if (fd !== null) {
          console.info(`${Tag} file fd opened : Append Mode :PASS`);
        }
        else {
          console.info(`${Tag} file fd Open: Append Mode : FAILED`);
          expect(false).assertTrue();
        }
        let numBuffersToCapture = 45;
        while (numBuffersToCapture) {
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} ---------READ BUFFER---------`);
          }
          let buffer = await audioCap.read(bufferSize, true);
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} ---------WRITE BUFFER---------`);
          }
          let number = fileio.writeSync(fd, buffer);
          if (numBuffersToCapture % 5 == 0) {
            console.info(`${Tag} BufferRecLog: data written:  ${JSON.stringify(number)}`);
            console.info(`${Tag} numBuffersToCapture: ${numBuffersToCapture}`)
          }
          numBuffersToCapture--;
        }
        console.log(`${Tag} read ok`);
      } catch (err) {
        console.log(`${Tag} start-read err: ${JSON.stringify(err)}`);
        expect(false).assertTrue();
      }
    }

    async function releaseFun(audioCap) {
      try {
        await audioCap.release();
        console.log(`${Tag} release success`);
      } catch (err) {
        console.log(`${Tag} release fail,err : ${JSON.stringify(err)}`);
      }
    }

    function getCapturerInfo(CapturerChangeInfo) {
      let str = ``;
      let Info = CapturerChangeInfo[0];
      str += `nStreamId:${Info.streamId}, ClientUid:${Info.clientUid}, State:${Info.capturerState}, muted:${Info.muted},
              Source:${Info.capturerInfo.source}, Flag:${Info.capturerInfo.capturerFlags},\n`;
      for (let j = 0; j < Info.deviceDescriptors.length; j++) {
        let descriptor = Info.deviceDescriptors[j];
        str += `__deviceDescriptors_${j}\n`;
        str += `Id:${descriptor.id}, Type:${descriptor.deviceType}, Role:${descriptor.deviceRole},
                Name:${descriptor.name}, Address:${descriptor.address}, SampleRates:${descriptor.sampleRates[0]},
                ChannelCounts:${descriptor.channelCounts[0]}, ChannelMask:${descriptor.channelMasks}, encodingTypes:${descriptor.encodingTypes[0]}\n`;
      }
      return str;
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0300
     * @tc.name      : AudioCapturer - on-ERROR-INPUT_NUMDER_PARAMETER
     * @tc.desc      : AudioCapturer - on-ERROR-INPUT_NUMDER_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0300', 2, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        console.info(`${Tag} on audioCapturerChange in, please change input device to set off it!`);
        await audioCap.on(env.INPUT_PARAMETER_TYPE_NUMBER, (data) => {
          console.error(`on audioCapturerChange error! test fail!`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`${Tag}: on audioCapturerChange input parameter -1 ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0400
     * @tc.name      : AudioCapturer - on-ERROR-INPUT_STRING_PARAMETER
     * @tc.desc      : AudioCapturer - on-ERROR-INPUT_STRING_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0400', 2, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        console.info(`${Tag} on-audioCapturerChange in, please change input device to set off it!`);
        await audioCap.on(env.INVALID_PARAMETER_STRING, (data) => {
          console.info(`audioCapturerChange: Success, test fail !`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`on-audioCapturerChange invalid parameter '123': ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0500
     * @tc.name      : AudioCapturer - on-ERROR-INPUT_NO_PARAMETER
     * @tc.desc      : AudioCapturer - on-ERROR-INPUT_NO_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0500', 2, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCap.on((data) => {
          console.info(`audioCapturerChange: Success! test fail!`)
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        console.error(`on-audioCapturerChange no input parameter: ${error.message}, ${error.code}`);
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0100
     * @tc.name      : AudioCapturer - off-ERROR_INPUT_NUMBER_PARAMETER
     * @tc.desc      : AudioCapturer - off-ERROR_INPUT_NUMBER_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0100', 2, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        console.info(`${Tag}off-audioCapturerChange in, please change input device to set off it!`);
        audioCap.off(env.INPUT_PARAMETER_TYPE_NUMBER, (data) => {
          console.info(`off-audioCapturerChange Success, test fail!`)
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        console.info(`off-audioCapturerChange input parameter type -1: ${error.message}, ${error.code}`)
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0200
     * @tc.name      : AudioCapturer - off-ERROR-INPUT_STRING_PARAMETER
     * @tc.desc      : AudioCapturer - off-ERROR-INPUT_STRING_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0200', 2, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        console.info(`${Tag} off-audioCapturerChange in, please change input device to set off it!`);
        audioCap.off(env.INVALID_PARAMETER_STRING, (data) => {
          console.info(`off-audioCapturerChange: Success, test fail!`)
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        console.info(`off-audioCapturerChange invalid parameter type '123': ${error.message}, ${error.code}`)
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_6800101);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0300
     * @tc.name      : AudioCapturer - off-ERROR-INPUT_NO_PARAMETER
     * @tc.desc      : AudioCapturer - off-ERROR-INPUT_NO_PARAMETER
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_OFF_AUDIOCAPTURERCHANGE_0300', 2, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created : ERROR :  ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done()
      }
      try {
        console.info(`${Tag} off-audioCapturerChange in, please change input device to set off it!`);
        audioCap.off((data) => {
          console.info(`off-audioCapturerChange: Success, test fail!`)
          expect(false).assertTrue();
          done()
        });
      } catch (error) {
        console.info(`off-audioCapturerChange no input parameter: ${error.message}, ${error.code}`)
        expect(Number(error.code)).assertEqual(env.INVALID_INPUT_PARAMETER_401);
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0600
     * @tc.name      : AudioCapturer - on-MULTI_ON
     * @tc.desc      : AudioCapturer - on-MULTI_ON
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0600', 2, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        await getFd("capture_js-44100-2C-16B.pcm");
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created and start ERROR! ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      flag1 = false;
      flag2 = false;
      try {
        await audioCap.on('audioCapturerChange', callback1);
        await audioCap.on('audioCapturerChange', callback2);
        await audioCap.start();
        await sleep(1000);
        console.log(`flag1: ${flag1}, flag2: ${flag2}`)
        if (flag1 && flag2) {
          console.log(`callback1 and callback2 on called`);
          expect(flag1).assertEqual(true);
          expect(flag2).assertEqual(true);
          done();
        }
      } catch (error) {
        console.error(`${Tag}: on-audioCapturerChange Fail: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0700
     * @tc.name      : AudioCapturer - off-MULTI_ON_AND_OFF_ONE
     * @tc.desc      : AudioCapturer - off-MULTI_ON_AND_OFF_ONE
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0700', 2, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        await getFd("capture_js-44100-2C-16B.pcm");
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created and start ERROR! ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCap.on('audioCapturerChange', callback1);
        await audioCap.on('audioCapturerChange', callback2);
        await audioCap.start();
        await sleep(1000);
        await audioCap.off('audioCapturerChange', callback1);
        flag1 = false;
        flag2 = false;
        await audioCap.stop();
        await sleep(1000);
        console.log(`flag1: ${flag1}, flag2: ${flag2}`)
        if (!flag1 && flag2) {
          console.log(`cancel callback1 and callback2 on called`);
          expect(flag1).assertEqual(false);
          expect(flag2).assertEqual(true);
          done();
        }
      } catch (error) {
        console.error(`${Tag}: on-audioCapturerChange Fail: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0800
     * @tc.name      : AudioCapturer - off-MULTI_ON_AND_OFF_ALL
     * @tc.desc      : AudioCapturer - off-MULTI_ON_AND_OFF_ALL
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ON_AUDIOCAPTURERCHANGE_0800', 2, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        await getFd("capture_js-44100-2C-16B.pcm");
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created and start ERROR! ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCap.on('audioCapturerChange', callback1);
        await audioCap.on('audioCapturerChange', callback2);
        await audioCap.start();
        await sleep(1000);
        await audioCap.off('audioCapturerChange');
        flag1 = false;
        flag2 = false;
        await audioCap.stop();
        await sleep(1000);
        console.log(`flag1: ${flag1}, flag2: ${flag2}`)
        if (!flag1 && !flag2) {
          console.log(`cancel callback1 and callback2`);
          expect(flag1).assertEqual(false);
          expect(flag2).assertEqual(false);
          done();
        }
      } catch (error) {
        console.error(`${Tag}: on-audioCapturerChange Fail: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_AUDIO_CAPTURER_ONOFF_AUDIOCAPTURERCHANGE_0100
     * @tc.name      : AudioCapturer - on-off-MIC-muted
     * @tc.desc      : AudioCapturer - on-off-MIC-muted
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_AUDIO_CAPTURER_ONOFF_AUDIOCAPTURERCHANGE_0100', 2, async function (done) {
      let AudioStreamInfo = {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_44100,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      }
      let AudioCapturerInfo = {
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      }
      let AudioCapturerOptions = {
        streamInfo: AudioStreamInfo,
        capturerInfo: AudioCapturerInfo
      }
      try {
        await audio.createAudioCapturer(AudioCapturerOptions).then((data)=>{
          audioCap = data;
        }).catch((err)=>{
          console.info(' AudioCapturer Created catch ERROR' + err.message);
        });
        await getFd("capture_js-44100-2C-16B.pcm");
      } catch (error) {
        console.info(`${Tag} AudioCapturer Created and start ERROR! ${error.message} ${error.code}`);
        expect(false).assertTrue();
        done();
      }
      try {
        await audioCap.on('audioCapturerChange', (data) => {
          if (data == null) {
            console.info(`on audioCapturerChange error!`)
            expect(false).assertTrue();
            done();
          } else {
            console.info(`on audioCapturerChange muted: ${data.muted}`)
            expect(data.muted).assertEqual(true);
            done();
          }
        });
        audioManager.setMicrophoneMute(true, (err) => {
          if (err) {
            console.log(`on audioCapturerChange setMicrophoneMute-ture err: ${err.message}, ${err.code}`)
            return;
          }
          console.log(`on audioCapturerChange setMicrophoneMute-true success`)
        });
      } catch (error) {
        console.error(`${Tag}: on-audioCapturerChange Fail: ${error.message}, ${error.code}`);
        expect(false).assertTrue();
        done();
      }
    })
  })
}